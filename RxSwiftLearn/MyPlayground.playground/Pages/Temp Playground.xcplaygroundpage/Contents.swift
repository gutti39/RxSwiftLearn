//: [Previous](@previous)

import Foundation

let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

concurrentQueue.async {
    print("Task 1")
    sleep(2)  // Simulating a long-running task
    print("Task 1 completed")
}

concurrentQueue.async {
    print("Task 2")
    sleep(1)  // Simulating a shorter task
    print("Task 2 completed")
}

// Both tasks run concurrently, so "Task 2" may complete before "Task 1"

