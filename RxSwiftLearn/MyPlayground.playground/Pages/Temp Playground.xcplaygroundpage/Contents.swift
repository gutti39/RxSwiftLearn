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

func isPrime(num: Int) -> Bool {
    if num == 1 {
        return false
    }
    if num == 2 {
        return true
    }
    if num % 2 == 0 {
        return false
    }
    if num >= 3 {
        let maxNumber = Int(Double(num).squareRoot())
        for i in stride(from: 3, through: maxNumber, by: 2) {
            if num % i == 0 {
                return false
            }
        }
    }
    return true
}

for i in 1...50 {
    if isPrime(num: i) {
        print(i)
    }
}

func findIndices(from: [Int], target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for (index,num) in from.enumerated() {
        let complement = target - num
        if let complementindex = dict[complement] {
            return [complementindex, index]
        }
        dict[num] = index
    }
    return []
}

print(findIndices(from: [1,1,1,3,3], target: 6))
