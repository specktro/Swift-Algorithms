//
//  QuickFind.swift
//
//
//  Created by specktro on 12/10/25.
//

import Foundation

// MARK: - QuickFind Data Structure
/// A Union-Find (Disjoint Set) data structure implementation using the Quick-Find approach.
/// This data structure efficiently tracks connectivity between elements in a set.
///
/// **Time Complexity:**
/// - Union: O(n) - requires updating all elements with the same component ID
/// - Find/Connected: O(1) - direct array access
///
/// **Space Complexity:** O(n) - stores one integer per element
///
/// **Use cases:** Dynamic connectivity, percolation problems, Kruskal's MST algorithm
public struct QuickFind {

    // MARK: - Properties
    /// Internal array where data[i] represents the component ID of element i
    /// Elements with the same component ID are connected
    private var data: [Int]

    // MARK: - Initialization
    /// Creates a new QuickFind structure with the specified size
    /// - Parameter size: Number of elements in the disjoint set
    /// - Note: Initially, each element is in its own component (data[i] = i)
    public init(size: Int) {
        data = Array(0..<size)
    }

    // MARK: - Union Operations
    /// Connects two elements by merging their components
    /// - Parameters:
    ///   - p: First element to connect
    ///   - q: Second element to connect
    /// - Note: After union(p,q), connected(p,q) will return true
    /// - Complexity: O(n) - must update all elements in p's component
    public mutating func union(p: Int, q: Int) {
        let pId = data[p]
        let qId = data[q]

        // Merge components: change all elements with pId to qId
        for i in 0..<data.count {
            if data[i] == pId {
                data[i] = qId
            }
        }
    }

    // MARK: - Query Operations
    /// Checks if two elements are connected (in the same component)
    /// - Parameters:
    ///   - p: First element to check
    ///   - q: Second element to check
    /// - Returns: true if elements are connected, false otherwise
    /// - Complexity: O(1) - direct array access
    public func connected(p: Int, q: Int) -> Bool {
        return data[p] == data[q]
    }
}
