# 🚀 Swift Algorithms Playground

Welcome to my nerdy little corner of the internet where I practice algorithms in Swift! This playground is my personal algorithm dojo where I try to make sense of all those fancy computer science concepts that make my brain hurt (in a good way).

## 🧠 What's Inside This Digital Brain Dump?

### 🔍 Binary Search - The "Divide and Conquer" Ninja
**Time Complexity:** O(log n) - Because we're not savages who check every single element!  
**Space Complexity:** O(1) - We're memory efficient, like a minimalist who only owns one pair of socks.

```swift
let myList = [1, 3, 5, 7, 9]
binarySearch(arr: myList, item: 5) // Returns 2 (because math)
```

**How it works:** Think of it like finding a word in a dictionary. You don't start from page 1 like some kind of maniac - you open it in the middle and eliminate half the possibilities each time. It's like playing "higher or lower" but with numbers and way less fun.

### ➕ Recursive Sum - The "Call Me Maybe" Function
**Time Complexity:** O(n) - We gotta touch every number, no shortcuts here  
**Space Complexity:** O(n) - Stack frames galore! (Don't try this with a million numbers unless you want a stack overflow party)

```swift
let myNums = [2, 4, 6]
recursiveSum(myNums) // Returns 12 (because 2 + 4 + 6 = 12, duh)
```

**How it works:** This function is like that friend who keeps asking "what's the sum of the first number plus the sum of everything else?" until there's nothing else. It's recursion, baby! Each call breaks down the problem until we hit the base case (empty array = 0).

### 🎯 Two Sum - The "Find My Soulmate" Algorithm
I've got TWO versions because I'm fancy like that:

#### Version 1: The Brute Force Approach (O(n²))
**Time Complexity:** O(n²) - We're checking every possible pair like a desperate person at a speed dating event  
**Space Complexity:** O(1) - At least we're not wasting memory on our desperation

```swift
twoSumV1([2, 7, 11, 15], 9) // Returns (0, 1) because 2 + 7 = 9
```

**How it works:** Two nested loops checking every possible combination. It's like trying to find two people whose heights add up to exactly 6 feet by measuring everyone against everyone else. Inefficient but straightforward!

#### Version 2: The Smart Dictionary Approach (O(n))
**Time Complexity:** O(n) - We're smart now! Only one pass through the array  
**Space Complexity:** O(n) - We trade memory for speed, like upgrading from a bicycle to a sports car

```swift
twoSumV2([2, 7, 11, 15], 9) // Returns (0, 1) but way faster
```

**How it works:** We use a dictionary to remember what we've seen. For each number, we check if its "complement" (target - current_number) exists in our memory. It's like having a photographic memory for numbers - you see a 2, you remember you need a 7 to make 9, and boom! Match found.

### 🧱 Balanced Parentheses - The "Stack Master" Algorithm
**Time Complexity:** O(n) - One pass through the string, no shortcuts here  
**Space Complexity:** O(n) - Worst case when everything is an opening bracket (like a never-ending sentence)

I've got TWO versions because I'm fancy like that (again):

#### Version 1: The Basic Stack Approach
```swift
isBalanced("{[()]}") // Returns true (because math and brackets)
isBalanced("(]{}")   // Returns false (because chaos)
```

**How it works:** We use a stack (like a stack of plates) to keep track of opening brackets. When we see a closing bracket, we check if it matches the top of our stack. It's like making sure every opening parenthesis has a proper closing buddy.

#### Version 2: The OPTIMIZED Stack Approach (O(n) with early termination)
```swift
isBalancedOptimized("({[]})") // Returns true
isBalancedOptimized("({[}])") // Returns false
```

**How it works:** Same stack magic, but with smart early termination! We check for obvious failures first:
- Odd-length strings? Nope, can't be balanced
- Empty string? Sure, that's balanced (philosophically speaking)
- Starts with a closing bracket? That's like starting a sentence with a period - just wrong
- Non-bracket characters? We're strict about our bracket-only policy

**Why it's optimal:** We catch invalid cases early and avoid unnecessary processing. It's like checking if your car keys are in your pocket before starting the engine.

### 📈 Maximum Subarray - The "Kadane's Algorithm" (But I Call It "The Profit Maximizer")
**Time Complexity:** O(n) - One pass through the array, because we're not savages who check every possible subarray!  
**Space Complexity:** O(1) - We're memory efficient, like a minimalist who only tracks what matters

```swift
let subarray = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
maximumSubArray(subarray) // Returns [4, -1, 2, 1] (sum = 6)
```

**How it works:** This is Kadane's Algorithm in disguise! We keep track of the current sum and the maximum sum we've seen so far. If adding the current number makes our sum worse than just starting fresh with that number, we start a new subarray. It's like being a smart investor - if your current portfolio is losing money, sometimes it's better to start fresh with a new investment.

**The magic:** We use two pointers (`bestStart` and `bestEnd`) to remember where our best subarray begins and ends. It's like marking the best part of a movie so you can skip to it later.

**Real-world analogy:** Imagine you're a day trader looking for the best consecutive days to buy and sell stocks. You want to find the contiguous sequence of days that gives you the maximum profit. This algorithm finds exactly that!

## 🎮 How to Use This Playground

1. Open `algo.playground` in Xcode
2. Run the playground (⌘ + R)
3. Watch the console output as algorithms do their thing
4. Feel smart because you understand what's happening

## 🧪 Want to Test Your Own Cases?

Just modify the test arrays and targets in the playground:

```swift
let myList = [1, 3, 5, 7, 9]
print(binarySearch(arr: myList, item: 3)) // Find 3 in the array

let myNums = [1, 2, 3, 4, 5]
print("Recursive sum: \(recursiveSum(myNums))") // Sum all numbers

print("Two sum target: \(twoSumV1([1, 2, 3, 4, 5], 7))") // Find pairs that sum to 7

// Test your parentheses balancing skills
print("Balanced: \(isBalancedOptimized("{[()]}"))")        // true
print("Balanced: \(isBalancedOptimized("({[}])"))")        // false
print("Balanced: \(isBalancedOptimized("()[]{}"))")        // true
print("Balanced: \(isBalancedOptimized("((("))")           // false

// Test your maximum subarray skills
let subarray = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print("Max subarray: \(maximumSubArray(subarray))")        // [4, -1, 2, 1]
print("Max subarray: \(maximumSubArray([1, -2, 3, 4]))")   // [3, 4]
```

## 🤓 Why Did I Make This?

Because algorithms are cool, Swift is awesome, and I needed a place to practice without cluttering my actual projects. Plus, writing about algorithms helps me understand them better. It's like explaining a joke - if you can't explain it, you probably don't get it.

## 🚨 Disclaimer

I'm not a computer science professor, I'm just a developer who likes to understand how things work. If you find any mistakes, feel free to point them out (politely, please). We're all learning here!

---

*Made with ❤️ and ☕ in Swift. Because life is too short for slow algorithms.*
