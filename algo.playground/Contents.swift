import Foundation

/// A simple binary search implementation
func binarySearch(arr: [Int] ,item: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = arr[mid]
        
        if guess == item {
            print("Found at index \(mid)")
            return mid
        } else if guess < item {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return -1
}

let myList = [1, 3, 5, 7, 9]
print("=== BINARY SEARCH TESTING ===")
print(binarySearch(arr: myList, item: 5))
print(binarySearch(arr: myList, item: -1))

/// Sum recursive function
func recursiveSum(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    } else {
        return nums.first! + recursiveSum(Array(nums.dropFirst()))
    }
}

print("\n=== TWO RECURSIVE SUM TESTING ===")
print("Recursive sum: \(recursiveSum([2, 4, 6]))")

/// Two sum together
func twoSumV1(_ nums: [Int], _ target: Int) -> (Int, Int) {
    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            if nums[i] + nums[j] == target {
                return (i, j)
            }
        }
    }
    return (-1, -1)
}

print("\n=== TWO SUM NOT OPTIMIZED TESTING ===")
print("Two numbers sum target: \(twoSumV1([2, 7, 11, 15], 9))")

/// Two sum with dictionary
func twoSumV2(_ nums: [Int], _ target: Int) -> (Int, Int) {
    var map: [Int: Int] = [:]
    
    for i in 0..<nums.count {
        let complement = target - nums[i]
        if let j = map[complement] {
            return (j, i)
        }
        
        map[nums[i]] = i
    }
    
    return (-1, -1)
}

print("\n=== TWO SUM NUMBER WITH DICTIONARY TESTING ===")
print("Two numbers sum target with dictionary: \(twoSumV2([2, 7, 11, 15], 9))") //

/// Balanced parenthesis
func isBalanced(_ s: String) -> Bool {
    var stack: [Character] = []
    let pairs: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]
    
    for char in s {
        if let match = pairs[char] {
            if stack.isEmpty || stack.removeLast() != match {
                return false
            }
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}

print("\n=== BALANCED PARENTHESES TESTING ===")
print("Is balanced: \(isBalanced("{[()]}"))")   // true
print("Is balanced: \(isBalanced("()"))")       // true
print("Is balanced: \(isBalanced("()[]{}"))")   // true
print("Is balanced: \(isBalanced("(]{}"))")     // false

/// Balanced parenthesis - OPTIMIZED VERSION
func isBalancedOptimized(_ s: String) -> Bool {
    var stack: [Character] = []
    
    // Early termination for odd-length strings
    if s.count % 2 != 0 {
        return false
    }
    
    // Early termination for empty string
    if s.isEmpty {
        return true
    }
    
    // Early termination if first character is closing bracket
    if s.first == ")" || s.first == "]" || s.first == "}" {
        return false
    }
    
    let pairs: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]
    
    for char in s {
        if let match = pairs[char] {
            // If we encounter a closing bracket but stack is empty, it's invalid
            if stack.isEmpty {
                return false
            }
            // If the top of stack doesn't match the closing bracket, it's invalid
            if stack.removeLast() != match {
                return false
            }
        } else {
            // Only push opening brackets
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                // If it's not a bracket, we can ignore it or return false depending on requirements
                // For strict bracket-only validation, return false
                return false
            }
        }
    }
    
    return stack.isEmpty
}

print("\n=== OPTIMIZED PARENTHESES TESTING ===")
print("Is balanced: \(isBalancedOptimized("{[()]}"))")      // true
print("Is balanced: \(isBalancedOptimized("()"))")          // true
print("Is balanced: \(isBalancedOptimized("()[]{}"))")      // true
print("Is balanced: \(isBalancedOptimized("(]{}"))")        // false
print("Is balanced: \(isBalancedOptimized(""))")            // true
print("Is balanced: \(isBalancedOptimized("("))")           // false
print("Is balanced: \(isBalancedOptimized(")"))")           // false
print("Is balanced: \(isBalancedOptimized("((("))")         // false
print("Is balanced: \(isBalancedOptimized(")))"))")         // false
print("Is balanced: \(isBalancedOptimized("({[]})"))")      // true
print("Is balanced: \(isBalancedOptimized("({[}])"))")      // false


/// Maximum sub array - OPTIMIZED VERSION
func maximumSubArray(_ nums: [Int]) -> [Int] {
    // Edge case: empty array
    guard !nums.isEmpty else { return [] }
    
    // Edge case: single element
    guard nums.count > 1 else { return nums }
    
    var currentSum = nums[0]
    var maxSum = nums[0]
    var start = 0
    var bestStart = 0
    var bestEnd = 0
    
    for i in 1..<nums.count {
        // Simplified condition: if currentSum < 0, start fresh
        if currentSum < 0 {
            currentSum = nums[i]
            start = i
        } else {
            currentSum += nums[i]
        }
        
        // Update best subarray if we found a better one
        if currentSum > maxSum {
            maxSum = currentSum
            bestStart = start
            bestEnd = i
        }
    }
    
    return Array(nums[bestStart...bestEnd])
}

print("\n=== MAXIMUM SUBARRAY TESTING ===")
var subarray = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print("Maximum subarray from \(subarray): \(maximumSubArray(subarray))")
subarray = [1, -2, 3, 4]
print("Maximum subarray from \(subarray): \(maximumSubArray(subarray))")

/// Maximum sub array - ULTRA OPTIMIZED (returns just the sum, not the array)
func maximumSubArraySum(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var currentSum = nums[0]
    var maxSum = nums[0]
    
    for i in 1..<nums.count {
        currentSum = max(nums[i], currentSum + nums[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}

print("\n=== MAXIMUM SUBARRAY SUM TESTING (ULTRA OPTIMIZED) ===")
print("Max sum from [-2, 1, -3, 4, -1, 2, 1, -5, 4]: \(maximumSubArraySum([-2, 1, -3, 4, -1, 2, 1, -5, 4]))")
print("Max sum from [1, -2, 3, 4]: \(maximumSubArraySum([1, -2, 3, 4]))")
print("Max sum from [-1, -2, -3]: \(maximumSubArraySum([-1, -2, -3]))")
print("Max sum from [5]: \(maximumSubArraySum([5]))")
print("Max sum from []: \(maximumSubArraySum([]))")

/// Palindrome string validation
func isPalindrome(_ s: String) -> Bool {
    let cleaned = s.lowercased().filter { $0.isLetter || $0.isNumber }
    let chars = Array(cleaned)
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        
        left += 1
        right -= 1
    }
    
    return true
}

print("\n=== PALINDROME STRING VALIDATION TESTING ===")
print(isPalindrome("A man, a plan, a canal: Panama"))   // true
print(isPalindrome("race a car"))                       // false
print(isPalindrome(""))                                 // true
print(isPalindrome("a"))                                // true

/// Reverse linked list algorithm
// Node definition
final class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var current = head
    
    while current != nil {
        let next = current!.next
        current!.next = prev
        prev = current
        current = next
    }
    
    return prev  // prev is now the new head!
}

// Helper function to create a linked list from array
func createLinkedList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    
    let head = ListNode(values[0])
    var current = head
    
    for i in 1..<values.count {
        current.next = ListNode(values[i])
        current = current.next!
    }
    
    return head
}

// Helper function to convert linked list back to array for easy testing
func linkedListToArray(_ head: ListNode?) -> [Int] {
    var result: [Int] = []
    var current = head
    
    while current != nil {
        result.append(current!.val)
        current = current!.next
    }
    
    return result
}

// Helper function to print linked list
func printLinkedList(_ head: ListNode?) {
    var current = head
    var result: [String] = []
    
    while current != nil {
        result.append("\(current!.val)")
        current = current!.next
    }
    
    print(result.joined(separator: " → ") + " → nil")
}

print("\n=== REVERSE LINKED LIST TESTING ===\n")
// Test 1: Normal case
print("Test 1: Normal case [1, 2, 3, 4, 5]")
let list1 = createLinkedList([1, 2, 3, 4, 5])
print("Original: ", terminator: "")
printLinkedList(list1)
let reversed1 = reverseList(list1)
print("Reversed: ", terminator: "")
printLinkedList(reversed1)
print("Expected: 5 → 4 → 3 → 2 → 1 → nil")
print("Result: \(linkedListToArray(reversed1))")
print()
// Test 2: Two elements
print("Test 2: Two elements [1, 2]")
let list2 = createLinkedList([1, 2])
print("Original: ", terminator: "")
printLinkedList(list2)
let reversed2 = reverseList(list2)
print("Reversed: ", terminator: "")
printLinkedList(reversed2)
print("Expected: [2, 1]")
print("Result: \(linkedListToArray(reversed2))")
print()

// Test 3: Single element
print("Test 3: Single element [42]")
let list3 = createLinkedList([42])
print("Original: ", terminator: "")
printLinkedList(list3)
let reversed3 = reverseList(list3)
print("Reversed: ", terminator: "")
printLinkedList(reversed3)
print("Expected: [42]")
print("Result: \(linkedListToArray(reversed3))")
print()

// Test 4: Empty list
print("Test 4: Empty list []")
let list4 = createLinkedList([])
print("Original: ", terminator: "")
printLinkedList(list4)
let reversed4 = reverseList(list4)
print("Reversed: ", terminator: "")
printLinkedList(reversed4)
print("Expected: []")
print("Result: \(linkedListToArray(reversed4))")
print()

// Test 5: Larger list
print("Test 5: Larger list [10, 20, 30, 40, 50, 60]")
let list5 = createLinkedList([10, 20, 30, 40, 50, 60])
print("Original: ", terminator: "")
printLinkedList(list5)
let reversed5 = reverseList(list5)
print("Reversed: ", terminator: "")
printLinkedList(reversed5)
print("Expected: [60, 50, 40, 30, 20, 10]")
print("Result: \(linkedListToArray(reversed5))")
print()

// Test 6: Manual verification
print("Test 6: Manual step-by-step trace [1, 2, 3]")
let list6 = createLinkedList([1, 2, 3])
print("Original: ", terminator: "")
printLinkedList(list6)

/// Detect cycles in a linked list
func hasCycle(_ head: ListNode?) -> Bool {
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            return true
        }
    }
    
    return false
}

print("\n=== DETECT CYCLE IN LINKED LIST TESTING ===")
// Test 1: No cycle
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
node1.next = node2
node2.next = node3
print(hasCycle(node1))  // false

// Test 2: Has cycle
let nodeA = ListNode(1)
let nodeB = ListNode(2)
let nodeC = ListNode(3)
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeB  // Creates cycle: 1→2→3→2→3→2...
print(hasCycle(nodeA))  // true

// Test 3: Single node cycle
let singleNode = ListNode(1)
singleNode.next = singleNode  // Points to itself
print(hasCycle(singleNode))  // true

// Test 4: Empty list
print(hasCycle(nil))  // false

print("\n=== QUICK-FIND ALGORTIHM TESTING ===")
var quickFind = QuickFind(size: 10)
quickFind.union(p: 4, q: 3)
quickFind.union(p: 3, q: 8)
quickFind.union(p: 6, q: 5)
quickFind.union(p: 9, q: 4)
quickFind.union(p: 1, q: 2)
print(quickFind.connected(p: 8, q: 9)) // true
print(quickFind.connected(p: 5, q: 0)) // false
quickFind.union(p: 5, q: 0)
quickFind.union(p: 7, q: 2)
quickFind.union(p: 6, q: 1)
print(quickFind.connected(p: 9, q: 0)) // false
print(quickFind.connected(p: 2, q: 0)) // true

print("\n=== QUICK-UNION ALGORTIHM TESTING ===")
var quickUnion = QuickUnion(size: 10)
quickUnion.union(p: 4, q: 3)
quickUnion.union(p: 3, q: 8)
quickUnion.union(p: 6, q: 5)
quickUnion.union(p: 9, q: 4)
quickUnion.union(p: 1, q: 2)
print(quickUnion.connected(p: 8, q: 9)) // true
print(quickUnion.connected(p: 5, q: 0)) // false
quickUnion.union(p: 5, q: 0)
quickUnion.union(p: 7, q: 2)
quickUnion.union(p: 6, q: 1)
print(quickUnion.connected(p: 9, q: 0)) // false
print(quickUnion.connected(p: 2, q: 0)) // true
