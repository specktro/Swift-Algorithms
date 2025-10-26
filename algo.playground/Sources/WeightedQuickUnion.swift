//
//  WeightedQuickUnion.swift
//
//
//  Created by specktro on 14/10/25.
//

import Foundation

// MARK: - WeightedQuickUnion Data Structure
/// A Union-Find (Disjoint Set) data structure implementation using Weighted Quick-Union with Path Compression.
/// This highly optimized version combines weighting (smaller tree to larger) with path compression for near-optimal performance.
///
/// **Time Complexity:**
/// - Union: O(α(n)) - inverse Ackermann function, practically constant
/// - Find/Connected: O(α(n)) - amortized nearly constant time due to path compression
///
/// **Space Complexity:** O(n) - stores parent pointers and tree sizes
///
/// **Use cases:** Dynamic connectivity, percolation problems, Kruskal's MST algorithm
/// **Advantages:** Near-optimal performance combining weighted union + path compression optimizations
public struct WeightedQuickUnion {

    // MARK: - Properties
    /// Internal array where data[i] represents the parent of element i
    /// If data[i] == i, then i is the root of its tree (component representative)
    private var data: [Int]

    /// Size array where sz[i] represents the number of elements in the tree rooted at i
    /// Only meaningful when i is a root; used to determine which tree is smaller during union
    private var sz: [Int]

    // MARK: - Initialization
    /// Creates a new WeightedQuickUnion structure with the specified size
    /// - Parameter size: Number of elements in the disjoint set
    /// - Note: Initially, each element is its own parent with tree size 1
    public init(size: Int) {
        self.data = Array(0..<size)
        self.sz = Array(repeating: 1, count: size)
    }

    // MARK: - Private Helper Methods
    /// Finds the root of the tree containing the given item with path compression optimization
    /// - Parameter item: The element to find the root for
    /// - Returns: The root (component representative) of the tree containing the item
    /// - Complexity: O(α(n)) - amortized inverse Ackermann due to path compression
    /// - Note: Implements path compression by making each node point to its grandparent, flattening the tree
    private mutating func root(of item: Int) -> Int {
        var i = item
        while i != data[i] {
            data[i] = data[data[i]]  // Path compression: skip one level up
            i = data[i]
        }

        return i
    }

    // MARK: - Query Operations
    /// Checks if two elements are connected (in the same component)
    /// - Parameters:
    ///   - p: First element to check
    ///   - q: Second element to check
    /// - Returns: true if elements have the same root, false otherwise
    /// - Complexity: O(α(n)) - amortized nearly constant due to path compression
    public mutating func connected(p: Int, q: Int) -> Bool {
        return root(of: p) == root(of: q)
    }

    // MARK: - Union Operations
    /// Connects two elements by merging their tree components using weighted union with path compression
    /// - Parameters:
    ///   - p: First element to connect
    ///   - q: Second element to connect
    /// - Note: Always connects the smaller tree to the larger tree to maintain balance
    /// - Complexity: O(α(n)) - amortized due to path compression during root finding
    public mutating func union(p: Int, q: Int) {
        let pRoot = root(of: p)
        let qRoot = root(of: q)

        // Early return if already connected
        if pRoot == qRoot {
            return
        }

        // Weighted union: connect smaller tree to larger tree
        if sz[pRoot] < sz[qRoot] {
            data[pRoot] = qRoot
            sz[qRoot] += sz[pRoot]
        } else {
            data[qRoot] = pRoot
            sz[pRoot] += sz[qRoot]
        }
    }
}
