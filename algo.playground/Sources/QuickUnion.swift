//
//  QuickUnion.swift
//
//
//  Created by specktro on 13/10/25.
//

import Foundation

// MARK: - QuickUnion Data Structure
/// A Union-Find (Disjoint Set) data structure implementation using the Quick-Union approach.
/// This data structure efficiently tracks connectivity between elements using a tree-based representation.
///
/// **Time Complexity:**
/// - Union: O(tree height) - average case O(log n), worst case O(n) for unbalanced trees
/// - Find/Connected: O(tree height) - requires traversing up to the root
///
/// **Space Complexity:** O(n) - stores one parent pointer per element
///
/// **Use cases:** Dynamic connectivity, percolation problems, Kruskal's MST algorithm
/// **Advantage over QuickFind:** Faster union operations for most cases
public struct QuickUnion {

    // MARK: - Properties
    /// Internal array where data[i] represents the parent of element i
    /// If data[i] == i, then i is the root of its tree (component representative)
    private var data: [Int]

    // MARK: - Initialization
    /// Creates a new QuickUnion structure with the specified size
    /// - Parameter size: Number of elements in the disjoint set
    /// - Note: Initially, each element is its own parent (data[i] = i), forming singleton trees
    public init(size: Int) {
        self.data = Array(0..<size)
    }

    // MARK: - Private Helper Methods
    /// Finds the root of the tree containing the given item
    /// - Parameter item: The element to find the root for
    /// - Returns: The root (component representative) of the tree containing the item
    /// - Complexity: O(tree height) - follows parent pointers up to the root
    private func root(of item: Int) -> Int {
        var i = item
        while i != data[i] {
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
    /// - Complexity: O(tree height) - requires finding both roots
    public func connected(p: Int, q: Int) -> Bool {
        return root(of: p) == root(of: q)
    }

    // MARK: - Union Operations
    /// Connects two elements by merging their tree components
    /// - Parameters:
    ///   - p: First element to connect
    ///   - q: Second element to connect
    /// - Note: Makes the root of p's tree point to the root of q's tree
    /// - Complexity: O(tree height) - requires finding both roots
    public mutating func union(p: Int, q: Int) {
        let pRoot = root(of: p)
        let qRoot = root(of: q)

        if pRoot != qRoot {
            data[pRoot] = qRoot
        }
    }
}
