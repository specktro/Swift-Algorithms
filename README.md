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
```

## 🤓 Why Did I Make This?

Because algorithms are cool, Swift is awesome, and I needed a place to practice without cluttering my actual projects. Plus, writing about algorithms helps me understand them better. It's like explaining a joke - if you can't explain it, you probably don't get it.

## 🚨 Disclaimer

I'm not a computer science professor, I'm just a developer who likes to understand how things work. If you find any mistakes, feel free to point them out (politely, please). We're all learning here!

---

*Made with ❤️ and ☕ in Swift. Because life is too short for slow algorithms.*
