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

print("=== TWO RECURSIVE SUM TESTING ===")
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

print("=== TWO SUM NOT OPTIMIZED TESTING ===")
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

print("=== TWO SUM NUMBER WITH DICTIONARY TESTING ===")
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

print("=== BALANCED PARENTHESES TESTING ===")
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

print("=== OPTIMIZED PARENTHESES TESTING ===")
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

print("=== MAXIMUM SUBARRAY TESTING ===")
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

print("=== MAXIMUM SUBARRAY SUM TESTING (ULTRA OPTIMIZED) ===")
print("Max sum from [-2, 1, -3, 4, -1, 2, 1, -5, 4]: \(maximumSubArraySum([-2, 1, -3, 4, -1, 2, 1, -5, 4]))")
print("Max sum from [1, -2, 3, 4]: \(maximumSubArraySum([1, -2, 3, 4]))")
print("Max sum from [-1, -2, -3]: \(maximumSubArraySum([-1, -2, -3]))")
print("Max sum from [5]: \(maximumSubArraySum([5]))")
print("Max sum from []: \(maximumSubArraySum([]))")
