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

import CommonCrypto

func sha256(string: String) -> String {
    if let data = string.data(using: .utf8) {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes { bufferPointer in
            _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02x", $0) }
        return hexBytes.joined()
    }
    return ""
}

// Example usage:
let password = "sdfghjklkjhgfdsdswedrtyuio8765456789o87654edfvbnmjkjhytr4e35678ijhgfdfghfghjkiuytr434567890-=-0987654567uik"
let hashedPassword = sha256(string: password)
print("Hashed Password: \(hashedPassword)")
"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855".count
