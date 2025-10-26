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
**Space Complexity:** O(n) for array version, O(1) for sum-only version

I've got TWO versions because I'm fancy like that (again, again):

#### Version 1: The Optimized Array Approach (O(n) space)
```swift
let subarray = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
maximumSubArray(subarray) // Returns [4, -1, 2, 1] (sum = 6)
```

**How it works:** This is Kadane's Algorithm with edge case handling! We keep track of the current sum and the maximum sum we've seen so far. If our current sum becomes negative, we start fresh with the current number. It's like being a smart investor - if your current portfolio is losing money, sometimes it's better to start fresh with a new investment.

**The magic:** We use two pointers (`bestStart` and `bestEnd`) to remember where our best subarray begins and ends. It's like marking the best part of a movie so you can skip to it later.

#### Version 2: The ULTRA OPTIMIZED Sum-Only Approach (O(1) space)
```swift
maximumSubArraySum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) // Returns 6 (just the sum)
```

**How it works:** Same Kadane's magic, but we only care about the sum! We use `max()` functions to keep the code clean and minimal. It's like asking "what's the maximum profit?" without caring about which specific days you traded.

**Why it's ultra-optimized:** No array slicing, minimal variables, and O(1) space complexity. Perfect for when you only need the answer, not the actual subarray.

**Real-world analogy:** Imagine you're a day trader looking for the best consecutive days to buy and sell stocks. Version 1 tells you exactly which days to trade, Version 2 just tells you the maximum profit you can make.

### 🔤 Palindrome String Validation - The "Mirror Mirror" Algorithm
**Time Complexity:** O(n) - We gotta check every character, no shortcuts here  
**Space Complexity:** O(n) - We create a cleaned string, but it's worth it for readability

```swift
isPalindrome("A man, a plan, a canal: Panama") // Returns true (because it's a palindrome!)
isPalindrome("race a car")                     // Returns false (because it's not!)
```

**How it works:** We clean the string by removing all non-alphanumeric characters and converting to lowercase. Then we use two pointers (left and right) that move towards each other, comparing characters. It's like checking if a word reads the same forwards and backwards, but we're smart enough to ignore spaces and punctuation.

**The magic:** We filter out all the noise (spaces, punctuation, case differences) and just focus on the actual letters and numbers. It's like having a conversation with someone who mumbles - you filter out the "umms" and "ahhs" and just listen to the important parts.

### 🔗 Reverse Linked List - The "U-Turn" Algorithm
**Time Complexity:** O(n) - One pass through the list, because we're not savages who traverse it multiple times!  
**Space Complexity:** O(1) - We only use a few pointers, like a minimalist who only owns what they need

```swift
let head = createLinkedList([1, 2, 3, 4, 5])
let reversed = reverseList(head)
linkedListToArray(reversed) // Returns [5, 4, 3, 2, 1]
```

**How it works:** We use three pointers: `prev`, `current`, and `next`. We traverse the list once, reversing the links as we go. It's like flipping a chain of paper clips - you go through each one and reverse its direction.

**The magic:** We don't create a new list, we just flip the existing links! It's like turning a one-way street into a two-way street by just changing the direction signs. We use `prev` to remember where we came from, `current` for where we are, and `next` to remember where we're going.

**Real-world analogy:** Imagine you have a chain of people holding hands, and you want to reverse the order. You go through each person, have them let go of the person in front and grab the person behind them instead. By the end, the chain is completely reversed!

### 🔄 Cycle Detection in Linked List - The "Tortoise and Hare" Algorithm
**Time Complexity:** O(n) - We'll find the cycle in at most one full traversal, because math is cool like that  
**Space Complexity:** O(1) - We only use two pointers, like a minimalist who only owns what they need

```swift
let nodeA = ListNode(1)
let nodeB = ListNode(2)
let nodeC = ListNode(3)
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeB  // Creates cycle: 1→2→3→2→3→2...
hasCycle(nodeA) // Returns true (because there's a cycle!)
```

**How it works:** We use two pointers: a "slow" pointer (tortoise) that moves one step at a time, and a "fast" pointer (hare) that moves two steps at a time. If there's a cycle, the fast pointer will eventually catch up to the slow pointer. It's like having two people run around a circular track - the faster one will eventually lap the slower one!

**The magic:** If there's no cycle, the fast pointer will reach the end and we return false. If there's a cycle, the fast pointer will eventually meet the slow pointer inside the cycle, and we return true. It's like a detective story where the hare always catches the tortoise if they're running in circles!

**Why it's brilliant:** We don't need extra memory to store visited nodes. We just use the mathematical property that if there's a cycle, the fast pointer will eventually meet the slow pointer. It's like solving a puzzle without writing anything down - pure brain power!

**Real-world analogy:** Imagine you're following someone in a car, and they're driving in circles. If you drive twice as fast as them, you'll eventually catch up to them. But if they're driving in a straight line, you'll never catch up because you'll reach the end first. That's exactly how this algorithm works!

### 🔗 Quick Union-Find Algorithm - The "Dynamic Connectivity" Solver
**Time Complexity:** Union: O(n), Connected: O(1) - Because we're trading union speed for query speed!
**Space Complexity:** O(n) - We store one integer per element, like a minimalist ID system

```swift
var quickFind = QuickFind(size: 10)
quickFind.union(p: 4, q: 3)  // Connect elements 4 and 3
quickFind.union(p: 3, q: 8)  // Connect elements 3 and 8 (now 4, 3, 8 are all connected)
quickFind.connected(p: 8, q: 4) // Returns true (because they're connected through 3)
```

**How it works:** This is a Union-Find (Disjoint Set) data structure that tracks connectivity between elements. Each element starts in its own component, and we can merge components using `union()`. The Quick-Find approach stores the component ID for each element directly in an array, making queries super fast but unions slower.

**The magic:** We maintain an array where `data[i]` represents the component ID of element `i`. When we union two elements, we change all elements in one component to match the other component's ID. It's like having a group chat where everyone gets the same group name!

**Why it's useful:** Perfect for problems where you need to quickly check if two elements are connected, like:
- Social network connectivity (are two people connected through friends?)
- Percolation problems (does water flow from top to bottom?)
- Image processing (connected component labeling)
- Network connectivity analysis

**Real-world analogy:** Imagine you have a bunch of islands, and you build bridges between them. The Union-Find structure helps you quickly answer questions like "Can I travel from Island A to Island B?" The Quick-Find approach is like giving every connected group of islands the same postal code - you can instantly tell if two islands share mail service, but updating the postal codes when you build a new bridge takes time.

### 🌳 Quick Union Algorithm - The "Tree-Building" Connectivity Solver
**Time Complexity:** Union: O(tree height), Connected: O(tree height) - Better union performance than Quick-Find!
**Space Complexity:** O(n) - We store one parent pointer per element, like a family tree registry

```swift
var quickUnion = QuickUnion(size: 10)
quickUnion.union(p: 4, q: 3)  // Connect 4 and 3 (3 becomes parent of 4's tree)
quickUnion.union(p: 3, q: 8)  // Connect 3 and 8 (8 becomes parent of the merged tree)
quickUnion.connected(p: 4, q: 8) // Returns true (both have same root: 8)
```

**How it works:** This is the tree-based approach to Union-Find! Instead of storing component IDs directly, we store parent pointers to form trees. Each element points to its parent, and the root of each tree represents the component. To check connectivity, we climb up to the roots and see if they're the same.

**The magic:** We maintain a forest of trees where `data[i]` represents the parent of element `i`. If `data[i] == i`, then `i` is a root. When we union two elements, we make the root of one tree point to the root of the other tree. It's like merging family trees - you connect the patriarchs/matriarchs!

**Why it's better than Quick-Find:** Union operations are much faster because we only change one parent pointer instead of updating all elements in a component. However, queries might be slower if the trees become tall and skinny.

**The trade-off:**
- **Quick-Find:** Fast queries O(1), slow unions O(n) - like having a phone directory where everyone's listed by group, but reorganizing when groups merge takes forever
- **Quick-Union:** Potentially faster unions O(log n average), queries depend on tree height - like having a corporate hierarchy where you follow the chain of command to find the CEO

**Real-world analogy:** Imagine a corporate merger scenario. In Quick-Find, when two companies merge, everyone immediately gets new business cards with the same company logo. In Quick-Union, people keep their current boss, but the CEOs establish who reports to whom - it's faster to merge, but finding the ultimate boss might require following the chain of command up several levels.

### 🔍 Breadth-First Search (BFS) - The "Level-by-Level Explorer" Algorithm
**Time Complexity:** O(V + E) - Where V is vertices and E is edges, because we visit every node and edge once!
**Space Complexity:** O(V) - We need a queue and a visited set, like keeping a guest list and a waiting line at a party

```swift
var graph = [String: [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]

let condition: (String) -> Bool = { name in
    name.last == "m"
}

simpleBFS(node: "you", in: graph, where: condition) // Returns true, finds "thom"
```

**How it works:** BFS explores a graph level by level, like ripples spreading in a pond! We use a queue (FIFO - First In, First Out) to keep track of nodes to visit, and a visited set to avoid cycles. We start from a node, check its neighbors, then check their neighbors, and so on. It's the shortest path finder's best friend!

**The magic:** We check if the starting node matches first (early termination!), then add its neighbors to our queue. For each node we visit, we:
1. Skip if already visited (no infinite loops!)
2. Mark as visited immediately
3. Check if it matches our condition
4. Add its unvisited neighbors to the queue

**Why it's brilliant:** BFS guarantees finding the shortest path in an unweighted graph! If you're looking for the nearest mango seller in your social network, BFS will find the one with the fewest connections away from you. It's like finding the closest coffee shop - you check your street first, then the next street over, then the one after that.

**Real-world uses:**
- Social networks (find shortest connection between people)
- GPS navigation (shortest path in road networks)
- Web crawlers (explore websites level by level)
- Puzzle solvers (find shortest solution path)
- Network broadcasting (send data to all connected nodes)

**The key insight:** Unlike DFS (Depth-First Search) which goes deep like a cave explorer, BFS goes wide like a wave spreading outward. It's perfect when you care about finding the closest solution, not just any solution!

### ⚖️ Weighted Quick Union with Path Compression - The "Ultimate" Connectivity Solver
**Time Complexity:** Union: O(α(n)), Connected: O(α(n)) - Inverse Ackermann function, practically constant!
**Space Complexity:** O(n) - We store parent pointers plus tree sizes, like a corporate org chart with headcount data

```swift
var weightedQuickUnion = WeightedQuickUnion(size: 10)
weightedQuickUnion.union(p: 4, q: 3)  // Weighted merge + path compression
weightedQuickUnion.union(p: 3, q: 8)  // Trees stay flat due to path compression
weightedQuickUnion.connected(p: 4, q: 8) // Returns true with nearly O(1) performance
```

**How it works:** This is the ultimate Union-Find implementation combining TWO powerful optimizations: weighted union (prevents tall trees) AND path compression (flattens trees during traversal). The result is near-optimal performance that's practically constant time for all operations!

**The magic:** We maintain two arrays: `data[]` for parent pointers and `sz[]` for tree sizes. During union, we use weighted strategy (smaller tree under larger). But here's the killer feature: during root finding, we implement path compression by making each node point to its grandparent, progressively flattening the tree!

**Path Compression in Action:** Every time we call `root()`, we do `data[i] = data[data[i]]` which makes each node skip one level up, effectively flattening the tree. After several operations, most nodes point directly to the root, making future operations nearly instantaneous.

**Why it's the ultimate solution:** Combining weighted union with path compression gives us the best of both worlds - we prevent tall trees from forming AND we flatten existing trees over time. It's like having a self-organizing corporate structure that automatically promotes people closer to the CEO while ensuring departments stay balanced!

**Performance comparison:**
- **Quick-Find:** Union O(n), Connected O(1) - Fast queries, slow unions
- **Quick-Union:** Union O(tree height), Connected O(tree height) - Could degenerate to O(n) in worst case
- **Weighted Quick-Union:** Union O(log n), Connected O(log n) - Guaranteed logarithmic performance
- **Weighted Quick-Union + Path Compression:** Union O(α(n)), Connected O(α(n)) - ULTIMATE: practically constant time!

**Real-world analogy:** Think of military command structures during wartime mergers. Quick-Union might randomly assign who reports to whom, potentially creating inefficient 10-level chains of command. Weighted Quick-Union is like smart military planning - you merge smaller units into larger ones, ensuring balanced hierarchies. But Weighted Quick-Union with Path Compression is like having a self-improving organization where every time someone asks "who's my ultimate commander?", the chain of command automatically gets shorter for everyone involved. It's organizational efficiency that gets better with use!

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

// Test the ultra-optimized sum-only version
print("Max sum: \(maximumSubArraySum(subarray))")          // 6
print("Max sum: \(maximumSubArraySum([-1, -2, -3]))")      // -1

// Test your palindrome skills
print("Palindrome: \(isPalindrome("A man, a plan, a canal: Panama"))") // true
print("Palindrome: \(isPalindrome("race a car"))")                     // false
print("Palindrome: \(isPalindrome(""))")                               // true

// Test your linked list reversal skills
let head = createLinkedList([1, 2, 3, 4, 5])
let reversed = reverseList(head)
print("Reversed: \(linkedListToArray(reversed))")          // [5, 4, 3, 2, 1]

// Test your cycle detection skills
let nodeA = ListNode(1)
let nodeB = ListNode(2)
let nodeC = ListNode(3)
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeB  // Creates cycle
print("Has cycle: \(hasCycle(nodeA))")                     // true
print("Has cycle: \(hasCycle(createLinkedList([1, 2, 3])))") // false

// Test your Union-Find (QuickFind) skills
var quickFind = QuickFind(size: 10)
quickFind.union(p: 4, q: 3)
quickFind.union(p: 3, q: 8)
quickFind.union(p: 6, q: 5)
print("Connected 8-4: \(quickFind.connected(p: 8, q: 4))") // true (through 3)
print("Connected 5-0: \(quickFind.connected(p: 5, q: 0))") // false
quickFind.union(p: 5, q: 0)
quickFind.union(p: 7, q: 2)
quickFind.union(p: 6, q: 1)
print("Connected 2-0: \(quickFind.connected(p: 2, q: 0))") // true (through multiple connections)

// Test your Union-Find (QuickUnion) skills
var quickUnion = QuickUnion(size: 10)
quickUnion.union(p: 4, q: 3)  // 4 -> 3
quickUnion.union(p: 3, q: 8)  // 3 -> 8, so 4 -> 3 -> 8
quickUnion.union(p: 6, q: 5)  // 6 -> 5
quickUnion.union(p: 9, q: 4)  // 9 -> 4 -> 3 -> 8
print("Connected 8-9: \(quickUnion.connected(p: 8, q: 9))") // true (same root: 8)
print("Connected 5-0: \(quickUnion.connected(p: 5, q: 0))") // false
quickUnion.union(p: 5, q: 0)  // 5 -> 0
quickUnion.union(p: 7, q: 2)  // 7 -> 2
quickUnion.union(p: 6, q: 1)  // Find root of 6 (which is 0), connect to root of 1 (which is 1)
print("Connected 9-0: \(quickUnion.connected(p: 9, q: 0))") // false (different roots)
print("Connected 2-0: \(quickUnion.connected(p: 2, q: 0))") // true (connected through tree)

// Test your Union-Find (WeightedQuickUnion + Path Compression) skills - The ULTIMATE version!
var weightedQuickUnion = WeightedQuickUnion(size: 10)
weightedQuickUnion.union(p: 4, q: 3)  // Weighted merge + path compression magic
weightedQuickUnion.union(p: 3, q: 8)  // Trees self-flatten during operations
weightedQuickUnion.union(p: 6, q: 5)  // Near-constant time performance
weightedQuickUnion.union(p: 9, q: 4)  // Path compression keeps trees super flat
print("Connected 8-9: \(weightedQuickUnion.connected(p: 8, q: 9))") // true (practically O(1))
print("Connected 5-0: \(weightedQuickUnion.connected(p: 5, q: 0))") // false
weightedQuickUnion.union(p: 5, q: 0)  // Ultimate optimization in action
weightedQuickUnion.union(p: 7, q: 2)  // Self-improving data structure
weightedQuickUnion.union(p: 6, q: 1)  // Gets faster with more operations
print("Connected 9-0: \(weightedQuickUnion.connected(p: 9, q: 0))") // false (lightning fast!)
print("Connected 2-0: \(weightedQuickUnion.connected(p: 2, q: 0))") // true (inverse Ackermann time!)

// Test your BFS (Breadth-First Search) skills - Level-by-level exploration!
var graph = [String: [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

// Find someone whose name ends with 'm'
let condition: (String) -> Bool = { name in name.last == "m" }
print("Found match: \(simpleBFS(node: "you", in: graph, where: condition))") // true (finds "thom")

// Find someone whose name starts with 'p'
let startsWithP: (String) -> Bool = { name in name.first == "p" }
print("Found match: \(simpleBFS(node: "you", in: graph, where: startsWithP))") // true (finds "peggy")

// Try to find someone named "carlos" (doesn't exist)
let isCarlos: (String) -> Bool = { name in name == "carlos" }
print("Found match: \(simpleBFS(node: "you", in: graph, where: isCarlos))") // false
```

## 🤓 Why Did I Make This?

Because algorithms are cool, Swift is awesome, and I needed a place to practice without cluttering my actual projects. Plus, writing about algorithms helps me understand them better. It's like explaining a joke - if you can't explain it, you probably don't get it.

## 🚨 Disclaimer

I'm not a computer science professor, I'm just a developer who likes to understand how things work. If you find any mistakes, feel free to point them out (politely, please). We're all learning here!

---

*Made with ❤️ and ☕ in Swift. Because life is too short for slow algorithms.*
