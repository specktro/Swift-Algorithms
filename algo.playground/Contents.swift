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
print(binarySearch(arr: myList, item: 5))
print(binarySearch(arr: myList, item: -1))
