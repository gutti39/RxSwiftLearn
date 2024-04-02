
import Foundation

//1. Find the missing number in the array
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

//2. Determine if the sum of two integers is equal to the given value
//Given an array of integers and a value, determine if there are any two integers in the array whose sum is equal to the given value. Return true if the sum exists and return false if it does not. Consider this array and the target sums:

func hasTwoSum(_ nums: [Int], _ target: Int) -> Bool {
    var complements = Set<Int>()
    
    for num in nums {
        let complement = target - num
        if complements.contains(complement) {
            return true
        }
        complements.insert(num)
    }
    
    return false
}

// Example usage
let nums = [2, 7, 11, 15]
let target1 = 9 // There are numbers 2 and 7 that sum up to 9
let target2 = 10 // There are no numbers that sum up to 10

print(hasTwoSum(nums, target1)) // Output: true
print(hasTwoSum(nums, target2)) // Output: false

//
