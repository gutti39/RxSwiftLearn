
import Foundation

func findMissingNumber(_ nums: [Int]) -> Int? {
    // Calculate the sum of numbers from 1 to n
    let n = nums.count + 1
    let expectedSum = n * (n + 1) / 2
    
    // Calculate the sum of array elements
    let actualSum = nums.reduce(0, +)
    
    // The difference is the missing number
    return expectedSum - actualSum
}

// Example usage
let array = [1, 2, 4, 5, 6] // Missing number: 3
if let missingNumber = findMissingNumber(array) {
    print("The missing number is: \(missingNumber)") // Output: The missing number is: 3
} else {
    print("No missing number found")
}

