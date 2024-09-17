//: [Previous](@previous)

import Foundation
//let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
//
//concurrentQueue.async {
//    print("Task 1")
//    sleep(2)  // Simulating a long-running task
//    print("Task 1 completed")
//}
//
//concurrentQueue.async {
//    print("Task 2")
//    sleep(1)  // Simulating a shorter task
//    print("Task 2 completed")
//}

// Both tasks run concurrently, so "Task 2" may complete before "Task 1"

//class Vehicle {
//    // Static property
//    static var staticProperty: String = "Vehicle Static Property"
//
//    // Static method
//    static func staticMethod() {
//        print("Vehicle static method.")
//        // Accessing static property
//        print("Static property: \(staticProperty)")
//        // Accessing class method (requires class name)
//        // classMethod() // Error: Cannot call classMethod() directly in static context
//        Vehicle.classMethod() // Correct: Must use class name
//    }
//    
//    // Class property
//    class var classProperty: String {
//        return "Vehicle Class Property"
//    }
//    
//    // Class method
//    class func classMethod() {
//        print("Vehicle class method.")
//        // Accessing static property and method directly
//        print("Static property: \(staticProperty)")
//        staticMethod() // This is allowed
//    }
//}
//
//class Car: Vehicle {
//    // Static property
//    static var staticProperty: String = "Car Static Property"
//    
//    // Static method
//    static func staticMethod() {
//        print("Car static method.")
//        // Accessing static property
//        print("Static property: \(staticProperty)")
//        // Accessing class method (requires class name)
//        // classMethod() // Error: Cannot call classMethod() directly in static context
//        Car.classMethod() // Correct: Must use class name
//    }
//    
//    // Class property
//    override class var classProperty: String {
//        return "Car Class Property"
//    }
//    
//    // Class method
//    override class func classMethod() {
//        print("Car class method.")
//        // Accessing static property and method directly
//        print("Static property: \(staticProperty)")
//        staticMethod() // This is allowed
//    }
//}
//
//// Using Vehicle class
//Vehicle.staticMethod()
//// Output:
//// Vehicle static method.
//// Static property: Vehicle Static Property
//// Vehicle class method.
//// Static property: Vehicle Static Property
//
//Vehicle.classMethod()
//// Output:
//// Vehicle class method.
//// Static property: Vehicle Static Property
//// Vehicle static method.
//
//print(Vehicle.classProperty) // Output: Vehicle Class Property
//
//// Using Car class
//Car.staticMethod()
//// Output:
//// Car static method.
//// Static property: Car Static Property
//// Car class method.
//// Static property: Car Static Property
//
//Car.classMethod()
//// Output:
//// Car class method.
//// Static property: Car Static Property
//// Car static method.
//
//print(Car.classProperty) // Output: Car Class Property
let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
//
//func rotateMatrix(_ matrix: [[Int]]) -> [[Int]] {
//    let n = matrix.count
//    var rotatedMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)
//    for i in 0..<n {
//        for j in 0..<n {
//            rotatedMatrix[j][n - 1 - i] = matrix[i][j]
//        }
//    }
//    
//    return rotatedMatrix
//}
//let rotated = rotateMatrix(matrix)
//print(rotated)
//rotateMatrix(rotated)
//print(rotateMatrix(rotated))
//for i in stride(from: 3, through: 50, by: 2) {
//    print(i)
//}
//
//print(Array(repeating: 1, count: 5))
//
//for i in 0..<3 {
//    for j in 0..<3 {
//        print(matrix[i][j])
//    }
//}

//func isPrime(num: Int) -> Bool {
//    if num == 1 {
//        return false
//    }
//    if num == 2 {
//        return true
//    }
//    if num % 2 == 0 {
//        return false
//    }
//    if num >= 3 {
//        let maxNumber = Int(Double(num).squareRoot())
//        for i in stride(from: 3, through: maxNumber, by: 2) {
//            if num % i == 0 {
//                return false
//            }
//        }
//    }
//    return true
//}
//
//for i in 1...50 {
//    if isPrime(num: i) {
//        print(i)
//    }
//}
//
//func findIndices(from: [Int], target: Int) -> [Int] {
//    var dict: [Int: Int] = [:]
//    for (index,num) in from.enumerated() {
//        let complement = target - num
//        if let complementindex = dict[complement] {
//            return [complementindex, index]
//        }
//        dict[num] = index
//    }
//    return []
//}
//
//print(findIndices(from: [1,1,1,3,3], target: 6))
//
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    var charSet = Set<Character>()   // A set to store characters in the current window
//    var left = 0                     // Left pointer of the sliding window
//    var maxLength = 0                // Store the maximum length of substring
//
//    let characters = Array(s)        // Convert string to array of characters for easy access
//
//    for right in 0..<characters.count {
//        // If we encounter a duplicate character, shrink the window from the left
//        while charSet.contains(characters[right]) {
//            charSet.remove(characters[left])
//            left += 1
//        }
//        
//        // Add the current character to the set and update maxLength
//        charSet.insert(characters[right])
//        maxLength = max(maxLength, right - left + 1)
//    }
//
//    return maxLength
//}
//
//// Example usage:
//let input = "abcabcbb"
//let result = lengthOfLongestSubstring(input)
//print("The length of the longest substring without repeating characters is: \(result)")
//
//func maxSubArray(_ nums: [Int]) -> Int {
//    if nums.isEmpty {
//        return 0
//    }
//    
//    var maxCurrent = nums[0]
//    var maxGlobal = nums[0]
//    
//    for i in 1..<nums.count {
//        maxCurrent = max(nums[i], maxCurrent + nums[i])
//        maxGlobal = max(maxGlobal, maxCurrent)
//    }
//    
//    return maxGlobal
//}
//let nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
//print(maxSubArray(nums))  // Output: 6 (subarray: [4, -1, 2, 1])

//func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
//    // If there are no intervals, return an empty list
//    guard !intervals.isEmpty else { return [] }
//
//    // Sort intervals by the start time
//    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
//    print(sortedIntervals)
//    // This will store the merged intervals
//    var mergedIntervals: [[Int]] = []
//    
//    // Initialize with the first interval
//    mergedIntervals.append(sortedIntervals[0])
//    
//    // Iterate over the sorted intervals starting from the second interval
//    for i in 1..<sortedIntervals.count {
//        // Get the last interval in the merged list
//        var lastInterval = mergedIntervals.last!
//        
//        // If the current interval overlaps with the last merged interval, merge them
//        if sortedIntervals[i][0] <= lastInterval[1] {
//            // Update the end of the last interval to the maximum end time
//            lastInterval[1] = max(lastInterval[1], sortedIntervals[i][1])
//            // Update the last interval in the merged list
//            mergedIntervals[mergedIntervals.count - 1] = lastInterval
//        } else {
//            // If no overlap, add the current interval to the merged list
//            mergedIntervals.append(sortedIntervals[i])
//        }
//    }
//    
//    return mergedIntervals
//}
//
//let intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
//print(mergeIntervals(intervals))  // Output: [[1, 6], [8, 10], [15, 18]]

//let fullarray = intervals.flatMap{$0}
//print(intervals.reduce([], +))

//func isValidSudoku(_ board: [[Character]]) -> Bool {
//    var rows = Array(repeating: Set<Character>(), count: 9)
//    var cols = Array(repeating: Set<Character>(), count: 9)
//    var boxes = Array(repeating: Set<Character>(), count: 9)
//
//    for i in 0..<9 {
//        for j in 0..<9 {
//            let char = board[i][j]
//            if char == "." {
//                continue
//            }
//            
//            // Check row
//            if rows[i].contains(char) {
//                return false
//            }
//            rows[i].insert(char)
//            
//            // Check column
//            if cols[j].contains(char) {
//                return false
//            }
//            cols[j].insert(char)
//            
//            // Check 3x3 sub-box
//            let boxIndex = (i / 3) * 3 + j / 3
//            if boxes[boxIndex].contains(char) {
//                return false
//            }
//            boxes[boxIndex].insert(char)
//        }
//    }
//    
//    return true
//}
//
//var board: [[Character]] = [
//    ["5","3",".",".","7",".",".",".","."],
//    ["6",".",".","1","9","5",".",".","."],
//    [".","9","8",".",".",".",".","6","."],
//    ["8",".",".",".","6",".",".",".","3"],
//    ["4",".",".","8",".","3",".",".","1"],
//    ["7",".",".",".","2",".",".",".","6"],
//    [".","6",".",".",".",".","2","8","."],
//    [".",".",".","4","1","9",".",".","5"],
//    [".",".",".",".","8",".",".","7","9"]
//]
//
//print(isValidSudoku(board))
//
//private func solve(_ board: inout [[Character]]) -> Bool {
//    for i in 0..<9 {
//        for j in 0..<9 {
//            if board[i][j] == "." {
//                for num in "123456789" {
//                    if isValid(board, i, j, num) {
//                        board[i][j] = num
//                        
//                        // Recursively try to solve the board with this number
//                        if solve(&board) {
//                            return true
//                        }
//                        
//                        // If it doesn't lead to a solution, backtrack
//                        board[i][j] = "."
//                    }
//                }
//                // If no number fits in this cell, return false
//                return false
//            }
//        }
//    }
//    // If all cells are filled correctly, return true
//    return true
//}
//
//private func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ char: Character) -> Bool {
//    for i in 0..<9 {
//        // Check the row
//        if board[row][i] == char { return false }
//        // Check the column
//        if board[i][col] == char { return false }
//        // Check the 3x3 sub-box
//        if board[(row / 3) * 3 + i / 3][(col / 3) * 3 + i % 3] == char { return false }
//    }
//    return true
//}
//
//func solveSudoku(_ board: inout [[Character]]) {
//    solve(&board)
//    print(board)
//}
//solveSudoku(&board)

func bfs(start: String, graph: [String: [String]]) {
    var visited = Set<String>()
    var queue = [start]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if !visited.contains(node) {
            print(node) // Process the node
            visited.insert(node)
            queue.append(contentsOf: graph[node] ?? [])
        }
    }
}

// Example graph
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["D", "E"],
    "C": ["F"],
    "D": [],
    "E": [],
    "F": []
]

bfs(start: "A", graph: graph)
// Output: A, B, C, D, E, F

func dfs(start: String, graph: [String: [String]]) {
    var visited = Set<String>()
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        
        if !visited.contains(node) {
            print(node) // Process the node
            visited.insert(node)
            stack.append(contentsOf: graph[node] ?? [])
        }
    }
}

dfs(start: "A", graph: graph)
// Output: A, B, D, E, C, F
