import RxSwift

//let sequence1 = Observable.of(1, 2, 3)
//let sequence2 = Observable.of(4, 5, 6)
//
//let mergedSequence = Observable.merge(sequence1, sequence2)
//
//mergedSequence.subscribe(onNext: { value in
//    print(value)
//}, onCompleted: {
//    print("All sequences completed")
//})

//let helloSequence = Observable.from(["H","e","l","l","o"])
//let subscription = helloSequence.subscribe { event in
//  switch event {
//      case .next(let value):
//          print(value)
//      case .error(let error):
//          print(error)
//      case .completed:
//          print("completed")
//  }
//}

//let bag = DisposeBag()
//// Creating an Observable Sequence that emits a String value
//let observable = Observable.just("Hello Rx!")
//// Creating a subscription just for next events
//let subscription = observable.subscribe (onNext:{
//    print($0)
//})
//// Adding the Subscription to a Dispose Bag
//subscription.disposed(by: bag)

//import RxSwift
//
//// Create a BehaviorSubject with an initial value
//let subject = BehaviorSubject<Int>(value: 0)
//
//// Subscribe to the subject
//let subscription = subject.subscribe(onNext: { value in
//    print("Received value:", value)
//})
//
//// Emit some values
//subject.onNext(1)
//subject.onNext(2)
//
//// Subscribe again
//let subscription2 = subject.subscribe(onNext: { value in
//    print("Received value from second subscriber:", value)
//})
//
//// Emit another value
//subject.onNext(3)

//import RxSwift
//
//// Create a ReplaySubject with a buffer size of 2
//let subject = ReplaySubject<Int>.create(bufferSize: 3)
//
//// Emit values to the subject
//subject.onNext(1)
//subject.onNext(2)
//subject.onNext(3)
//subject.onNext(4)
//// Subscribe to the subject
//subject.subscribe(onNext: { value in
//    print("Subscriber 1 received:", value)
//}).disposed(by: DisposeBag())
//
//// Subscribe again after emitting some values
//subject.subscribe(onNext: { value in
//    print("Subscriber 2 received:", value)
//}).disposed(by: DisposeBag())

//Observable.of(1,2,3,4,5).do(onNext: {
//    $0 * 10 // This has no effect on the actual subscription
//}).subscribe(onNext:{
//    print($0)
//})

//import Alamofire
//
//struct Post: Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}
//
//class ApiService {
//    static let shared = ApiService()
//    
//    private let baseURL = "https://jsonplaceholder.typicode.com"
//    
//    func getPosts() -> Observable<[Post]> {
//        return Observable.create { observer in
//            AF.request("\(self.baseURL)/posts")
//                .validate()
//                .responseDecodable(of: [Post].self) { response in
//                    switch response.result {
//                    case .success(let posts):
//                        observer.onNext(posts)
//                        observer.onCompleted()
//                    case .failure(let error):
//                        observer.onError(error)
//                    }
//                }
//            return Disposables.create()
//        }
//    }
//}
//
//// Example usage:
//let disposeBag = DisposeBag()
//
//ApiService.shared.getPosts()
//    .subscribe(onNext: { posts in
//        // Handle received posts
//        print(posts)
//    }, onError: { error in
//        // Handle error
//        print("Error: \(error.localizedDescription)")
//    })
//    .disposed(by: disposeBag)
//
//let task = URLSession.shared.dataTask(with: URL(string: "")!) {data, response, error in
//    guard let dfd = error else { return }
//    if let data = data {
//        
//    }
//    if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode){
//        
//    }
//}
//task.resume()


//var name1 = "veera"
//
//var chars = Set(name1)
//print(chars)
//print(String(chars))
//
//var marks = [23,24,25,21,19]
//var setmarks = Set(marks)
//print(setmarks)
//
//protocol MessageSending {
//    func sendMessage(_ msg: String)
//}
//class EMailSender: MessageSending {
//    func sendMessage(_ msg: String) {
//        print(msg)
//    }
//}
//class SMSSender: MessageSending {
//    func sendMessage(_ msg: String) {
//        print(msg)
//    }
//}
//
//class NotificationService {
//    let sender: MessageSending
//    
//    init(sender: MessageSending) {
//        self.sender = sender
//    }
//    
//    func sendNotification(msg: String) {
//        sender.sendMessage(msg)
//    }
//}
//
//let emailSender = EMailSender()
//let smsSender = SMSSender()
//
//let emailNotification = NotificationService(sender: emailSender)
//emailNotification.sendNotification(msg: "EMail")
//
//let smsNotification = NotificationService(sender: smsSender)
//smsNotification.sendNotification(msg: "SMS")

//func fibonacci(_ n: Int) -> Int {
//    if n <= 1 {
//        return n
//    }
//    return fibonacci(n-1) + fibonacci(n-2)
//}
//
//let fibonacciResult = fibonacci(5)
//print(fibonacciResult)

//protocol Addable {
//    static func +(lhs: Self, rhs: Self) -> Self
//}
//
//extension Int: Addable{}
//extension Double: Addable{}
//extension String: Addable{}
//
//func addition<T:Addable>(param1: T, param2: T) -> T {
//    return param1 + param2
//}
//
//print(addition(param1: 1, param2: 2))
//print(addition(param1: 4.5, param2: 2.3))
//print(addition(param1: "Veera", param2: "Gutti"))

//import CommonCrypto
//import CryptoKit
//
//// Function to encrypt data using AES encryption
//func encryptData(data: Data, key: SymmetricKey) throws -> Data {
//    let encryptedData = (try AES.GCM.seal(data, using: key).combined)!
//    return encryptedData
//}
//
//// Function to decrypt data using AES encryption
//func decryptData(encryptedData: Data, key: SymmetricKey) throws -> Data {
//    let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
//    let decryptedData = try AES.GCM.open(sealedBox, using: key)
//    return decryptedData
//}
//
//// Example usage
//let plaintext = "Hello, World!".data(using: .utf8)!
//let key = SymmetricKey(size: .bits256)
//do {
//    let encryptedData = try encryptData(data: plaintext, key: key)
//    print("Encrypted data: \(encryptedData.base64EncodedString())")
//    
//    let decryptedData = try decryptData(encryptedData: encryptedData, key: key)
//    let decryptedText = String(data: decryptedData, encoding: .utf8)!
//    print("Decrypted text: \(decryptedText)")
//} catch {
//    print("Error: \(error)")
//}

//How many ways can you make change with coins and a total amount
//Suppose we have coin denominations of [1, 2, 5] and the total amount is 7. We can make changes in the following 6 ways:
//func changePossibilities(_ amount: Int, _ coins: [Int]) -> Int {
//    var dp = [Int](repeating: 0, count: amount + 1)
//    dp[0] = 1
//    
//    for coin in coins {
//        for i in coin...amount {
//            print(coin, i)
//            dp[i] = dp[i] + dp[i - coin]
//        }
//    }
//    print("###############")
//    for i in 0..<dp.count {
//        print(dp[i])
//    }
//    return dp[amount]
//}
//
//// Example usage
//let coins = [1,5, 6, 9]
//let totalAmount = 8
//
//let possibilities = changePossibilities(totalAmount, coins)
//print("Number of ways to make change: \(possibilities)") // Output: Number of ways to make change: 6

//a function that calculates the minimum number of elements required to sum up to a given total, you can achieve that using dynamic programming. Here's a Swift implementation:

func minNumbersForTotal(total: Int, numbers: [Int]) -> Int? {
    var dp = Array(repeating: Int.max - 1, count: total + 1)
    dp[0] = 0
    
    for i in 1...total {
        for num in numbers {
            if num <= i {
                dp[i] = min(dp[i], dp[i - num] + 1)
            }
        }
    }
    
    return dp[total] == Int.max - 1 ? nil : dp[total]
}

// Example usage:
let numbers = [1, 3, 4]
let total = 7
if let minCount = minNumbersForTotal(total: total, numbers: numbers) {
    print("Minimum number of elements required to sum up to \(total) is \(minCount)")
} else {
    print("It's not possible to form \(total) using the given numbers.")
}
