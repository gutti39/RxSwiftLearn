#  <#Title#>


var object = "cars"
let closure = { (thing:String) -> () in
 print("I like \(thing)")
}
object = "airplanes"
closure(object)

var scores = [45,33,76,99,23,45]

var tempMax = scores.first
for i in 0..<scores.count {
    if scores[i] < tempMax! {
        tempMax = scores[i]
    }
}

print("Max: \(tempMax)")

var temp: Int
for i in 0..<scores.count {
    for j in i+1..<scores.count {
        if scores[i] < scores[j] {
            temp = scores[i]
            scores[i] = scores[j]
            scores[j] = temp
        }
    }
}

print(scores)

print(scores.sorted(by: {$0<$1}))

var name = "BYTE MARK INDIA"
var tempStr = ""
for i in name {
    tempStr = String(i) + tempStr
}

print(tempStr)
var tempStr1: String = ""
for i in 0...10 {
    for j in 0..<i {
        tempStr1 = tempStr1 + String(j)
    }
    print(tempStr1)
    tempStr1 = ""
}


var age = [23,11,2,45,65,33,23,9,90,76,62]
var tempAge: Int
for i in 0..<age.count {
    for j in i+1..<age.count {
        if age[i] > age[j] {
            tempAge = age[i]
            age[i] = age[j]
            age[j] = tempAge
        }
    }
}

print(age)

let ages = [4,56,8,33,90,12,34,56,12,89]

var max = ages[0]

for i in 0..<ages.count {
    if max < ages[i] {
        max = ages[i]
    }
}
print(max)

var thing = "cars"
let closure1 = { [thing] in
 print("I like \(thing)")
}
thing = "airplanes"
closure1()

////======

for i in 1...10 {
    print ("In \(i)")
    defer { print ("Deferred \(i)") }
    print ("Out \(i)")
}

import Foundation

class MyClass {
    static let shared = MyClass()
}

import Foundation

//// Serial Queue
let serialQueue = DispatchQueue(label: "com.example.serial")

for i in 0..<5 {
    serialQueue.async {
        print("Serial Queue: Task \(i)")
    }
}

//// Concurrent Queue
let concurrentQueue1 = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)

for i in 0..<5 {
    concurrentQueue1.async {
        print("Concurrent Queue: Task \(i)")
    }
}

import Foundation

// Create a concurrent queue
let concurrentQueue2 = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)

//// Enqueue multiple tasks to the concurrent queue
for i in 0..<5 {
    concurrentQueue2.async {
        print("Task \(i) is running on thread \(Thread.current)")
    }
}

import Foundation

//// Synchronous execution
func syncExample() {
    print("Sync Example: Start")
    
    DispatchQueue.global().sync {
        for i in 1...3 {
            print("Sync Example: Task \(i)")
        }
    }
    
    print("Sync Example: End")
}

//// Asynchronous execution
func asyncExample() {
    print("Async Example: Start")
    
    DispatchQueue.global().async {
        for i in 1...3 {
            print("Async Example: Task \(i)")
        }
    }
    
    print("Async Example: End")
}

syncExample()
asyncExample()

DispatchQueue.main.sync {
    print("abcd")
}

let serialQueue1 = DispatchQueue(label: "com.queue.serial")
serialQueue1.async {
print("serialQueue Task 1 started")
//// Do your work..
print("serialQueue Task 1 finished")
}
serialQueue.async {
print("serialQueue Task 2 started")
// Do your work..
print("serialQueue Task 2 finished")
}

let concurrentQueue3 = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
concurrentQueue3.async {
    print("concurrentQueue Task 1 started")
    sleep(1)
    print("concurrentQueue Task 1 finished")
}
concurrentQueue3.async {
    print("concurrentQueue Task 2 started")
    sleep(2)
    print("concurrentQueue Task 2 finished")
}

private let concurrentQueue = DispatchQueue(label: "com.dispatchBarrier", attributes: .concurrent)
concurrentQueue.async {
    for value in 1...5 {
        print(" TASK I — async \(value)")
    }
}
concurrentQueue.async {
    for value in 6...10 {
        print("TASK II — sync \(value)")
    }
}
for value in 11...15 {
    concurrentQueue.sync(flags: .barrier) {
        print("TASK III — barrier \(value)")
        sleep(2)
    }
}
concurrentQueue.async{
    for value in 16...20 {
        print("TASK VI — async \(value)")
    }
}

class MyAsyncOperation: Operation {
    override func main() {
        DispatchQueue.global().async {
            // Perform asynchronous work
            DispatchQueue.main.async {
                self.finish() // Call method to indicate that the operation has finished
            }
        }
    }

    private func finish() {
        // Update execution state and notify observers
        willChangeValue(forKey: "isFinished")
        willChangeValue(forKey: "isExecuting")
        // Update execution state
        // ...
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
}

import Foundation

// Define a subclass of NSOperation
class MyOperation: Operation {
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    override func main() {
        // Simulate some work
        for i in 0..<5 {
            print("Operation \(number) - Task \(i)")
            sleep(1)
        }
    }
}

// Create instances of MyOperation
let operation1 = MyOperation(number: 1)
let operation2 = MyOperation(number: 2)

// Create an OperationQueue
let queue = OperationQueue()

// Add operations to the queue
queue.addOperations([operation1, operation2], waitUntilFinished: true)

// Optionally, wait for the operations to finish
queue.waitUntilAllOperationsAreFinished()

print("All operations finished")

actor BankAccount {
    private var balance: Double = 0.0

    // Method to deposit money into the account
    func deposit(amount: Double) {
        balance += amount
        print("Deposited \(amount), new balance: \(balance)")
    }

    // Method to withdraw money from the account
    func withdraw(amount: Double) -> Double {
        if amount <= balance {
            balance -= amount
            print("Withdrawn \(amount), new balance: \(balance)")
            return amount
        } else {
            print("Insufficient funds")
            return 0.0
        }
    }
}

// Create an instance of the BankAccount actor
let account = BankAccount()

// Concurrent tasks depositing and withdrawing money
Task {
    await account.deposit(amount: 100.0)
}

Task {
    let withdrawnAmount = await account.withdraw(amount: 50.0)
    print("Amount withdrawn: \(withdrawnAmount)")
}

Task {
    let withdrawnAmount = await account.withdraw(amount: 70.0)
    print("Amount withdrawn: \(withdrawnAmount)")
}

@propertyWrapper
struct Capitalized {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
    
    init(wrappedValue: String) {
        print("sent : \(wrappedValue)")
        self.wrappedValue = wrappedValue
    }
}

struct TextContainer {
    @Capitalized
    var text: String
}

// Usage
var container = TextContainer(text: "hello, world!")
print(container.text) // Output: Hello, World!

container.text = "swift is awesome"
print(container.text) // Output: Swift Is Awesome


var array: Array<Int> = Array(1...10)
for i in array {
    print(i)
}
let quotation = """
 sldfjlsdf
"sdfsfsd"
sdfsdf
sd
f
"""
print(quotation)

/// # is to ommit the namespaces and print as it is
///
func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false } // 1 and numbers less than or equal to 1 are not prime
    if number <= 3 { return true } // 2 and 3 are prime
    
    // Check if the number is divisible by any integer from 2 to its square root
    let sqrtNumber = Int(Double(number).squareRoot())
    print(sqrtNumber)
    for i in 2...sqrtNumber {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func primeNumbers(upTo limit: Int) -> [Int] {
    var primes: [Int] = []
    for i in 2...limit {
        if isPrime(i) {
            primes.append(i)
        }
    }
    return primes
}

// Example usage:
let limit = 1000 // Limit for prime numbers
let primes = primeNumbers(upTo: limit)
print("Prime numbers up to \(limit):")
print(primes)

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"


print(#"Write an interpolated string in Swift using \(multiplier)."#)
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

print(threeDoubleQuotationMarks)

print(#"Line 1\#nLine 2"#)
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let enclosedEAcute: Character = "\u{20DD}"

let str = "veera gutti"

str[str.index(before: str.endIndex)]

func evaluate(condition: @autoclosure () -> Bool) {
    if condition() {
        print("Condition is true")
    } else {
        print("Condition is false")
    }
}

// Without autoclosure
func simpleCondition() -> Bool {
    print("Evaluating condition")
    return true
}

// With autoclosure
evaluate(condition: true)
evaluate(condition: simpleCondition())

var name1 = "veera"

var chars = Set(name1)
print(chars)
print(String(chars))

var marks = [23,24,25,21,19]
var setmarks = Set(marks)
print(setmarks)

import Foundation

class CustomOperation: Operation {
    // KVO-compliant property to observe the operation's isExecuting state
    @objc dynamic private var customIsExecuting: Bool = false
    
    override var isExecuting: Bool {
        get {
            return customIsExecuting
        }
        set {
            willChangeValue(forKey: "isExecuting")
            customIsExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override func start() {
        if isCancelled {
            // If the operation is cancelled, mark it as finished immediately
            finish()
            return
        }
        
        // Perform the main operation logic here
        
        // Set isExecuting to true to indicate that the operation is currently running
        isExecuting = true
        
        // Simulate some work
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // After completing the work, mark the operation as finished
            self.finish()
        }
    }
    
    func finish() {
        // Set isExecuting to false to indicate that the operation has finished
        isExecuting = false
        
        // Mark the operation as finished
        willChangeValue(forKey: "isFinished")
        willChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
        didChangeValue(forKey: "isExecuting")
    }
}

// Example usage
let operation = CustomOperation()

// Observer for isExecuting property
let observation = operation.observe(\.isExecuting, options: [.new]) { operation, change in
    print("isExecuting changed to: \(change.newValue ?? false)")
}

// Start the operation
operation.start()

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 10
// Output:
// About to set totalSteps to 10
// Added 10 steps

stepCounter.totalSteps = 20
// Output:
// About to set totalSteps to 20
// Added 10 steps

protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension String: Addable {}
extension Int: Addable {}
extension Double: Addable {}

func  add<T: Addable>(first: T, second: T) -> T {
    return first + second
}
print(add(first: 3.4, second: 5.6))
print(add(first: 78, second: 2))
print(add(first: "Veera", second: "Gutti"))

