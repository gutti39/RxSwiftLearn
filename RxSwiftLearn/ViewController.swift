//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by VEERA GUTTI on 04/03/24.
//

import Foundation
import UIKit

class ViewController: UIViewController, URLSessionDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*getdata*/()
        
        let message = "Hello, world!"
        guard let messageData = message.data(using: .utf8) else {
            fatalError("Failed to convert message to data")
        }
        print(message)
        validate()
    }
    
    
    func getdata() {
        
        let session = URLSession(configuration: .ephemeral, delegate: self, delegateQueue: nil)
        let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!){data,response,error in
            if let err = error {
                print(err.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse, (400...499).contains(response.statusCode) {
                print("Invalid response")
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(json)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func validate() {
        if let url = NSURL(string: "https://jsonplaceholder.typicode.com/posts") {

            let session = URLSession(
                    configuration: URLSessionConfiguration.ephemeral,
                    delegate: self,
                    delegateQueue: nil)


            let task = session.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print("error: \(error!.localizedDescription): \(error!)")
                } else if data != nil {
                    if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                        print("Received data:\n\(str)")
                    } else {
                        print("Unable to convert data to text")
                    }
                }
            })

            task.resume()
        } else {
            print("Unable to create NSURL")
        }

    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
                
                if(isServerTrusted) {
                    if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                        let serverCertificateData = SecCertificateCopyData(serverCertificate)
                        let data = CFDataGetBytePtr(serverCertificateData);
                        print(data)
                        let size = CFDataGetLength(serverCertificateData);
                        let cert1 = NSData(bytes: data, length: size)
                        let file_der = Bundle.main.path(forResource: "certificateFile", ofType: "der")
                        
                        if let file = file_der {
                            if let cert2 = NSData(contentsOfFile: file) {
                                if cert1.isEqual(to: cert2 as Data) {
                                    completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust:serverTrust))
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Pinning failed
        completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
    }
    
}


//protocol DataSource {
//    func fetchData(completion: @escaping ([String]) -> Void)
//}
//
//class DataManager: DataSource {
//    func fetchData(completion: @escaping ([String]) -> Void) {
//        // Fetch data from some source, such as a network request
//        let data = ["Data 1", "Data 2", "Data 3"]
//        completion(data)
//    }
//}
//
//class MockDataSource: DataSource {
//    func fetchData(completion: @escaping ([String]) -> Void) {
//        let mockData = ["Mock Data 1", "Mock Data 2", "Mock Data 3"]
//        completion(mockData)
//    }
//}
//
//class ViewController: UIViewController {
//    var dataSource: DataSource?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        dataSource = DataManager()
//        dataSource?.fetchData { data in
//            print(data)
//        }
//    }
//}
//


//// Model
//struct Task {
//    var title: String
//    var completed: Bool
//}
//
//// View
//protocol TaskView: AnyObject {
//    func showTasks(_ tasks: [Task])
//}
//
//// Presenter
//class TaskPresenter {
//    weak var view: TaskView?
//
//    func fetchTasks() {
//        let tasks = [
//            Task(title: "Complete MVP example", completed: false),
//            Task(title: "Implement MVP architecture", completed: true)
//        ]
//        view?.showTasks(tasks)
//    }
//}
//
//// ViewController
//import Foundation
//import CommonCrypto
//
//class SessionDelegate : NSObject, URLSessionDelegate {
//
//private static let rsa2048Asn1Header:[UInt8] = [
//    0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
//    0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
//];
//
//private static let google_com_pubkey = ["4xVxzbEegwDBoyoGoJlKcwGM7hyquoFg4l+9um5oPOI="];
//private static let google_com_full = ["KjLxfxajzmBH0fTH1/oujb6R5fqBiLxl0zrl2xyFT2E="];
//
//func urlSession(_ session: URLSession,
//                didReceive challenge: URLAuthenticationChallenge,
//                completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//    guard let serverTrust = challenge.protectionSpace.serverTrust else {
//        completionHandler(.cancelAuthenticationChallenge, nil);
//        return;
//    }
//
//    // Set SSL policies for domain name check
//    let policies = NSMutableArray();
//    policies.add(SecPolicyCreateSSL(true, (challenge.protectionSpace.host as CFString)));
//    SecTrustSetPolicies(serverTrust, policies);
//
//    var isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil);
//
//    if(isServerTrusted && challenge.protectionSpace.host == "www.google.com") {
//        let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0);
//        //Compare public key
//        if #available(iOS 10.0, *) {
//            let policy = SecPolicyCreateBasicX509();
//            let cfCertificates = [certificate] as CFArray;
//
//            var trust: SecTrust?
//            SecTrustCreateWithCertificates(cfCertificates, policy, &trust);
//
//            guard trust != nil, let pubKey = SecTrustCopyPublicKey(trust!) else {
//                completionHandler(.cancelAuthenticationChallenge, nil);
//                return;
//            }
//
//            var error:Unmanaged<CFError>?
//            if let pubKeyData = SecKeyCopyExternalRepresentation(pubKey, &error) {
//                var keyWithHeader = Data(bytes: SessionDelegate.rsa2048Asn1Header);
//                keyWithHeader.append(pubKeyData as Data);
//                let sha256Key = sha256(keyWithHeader);
//                if(!SessionDelegate.google_com_pubkey.contains(sha256Key)) {
//                    isServerTrusted = false;
//                }
//            } else {
//                isServerTrusted = false;
//            }
//        } else { //Compare full certificate
//            let remoteCertificateData = SecCertificateCopyData(certificate!) as Data;
//            let sha256Data = sha256(remoteCertificateData);
//            if(!SessionDelegate.google_com_full.contains(sha256Data)) {
//                isServerTrusted = false;
//            }
//        }
//    }
//
//    if(isServerTrusted) {
//        let credential = URLCredential(trust: serverTrust);
//        completionHandler(.useCredential, credential);
//    } else {
//        completionHandler(.cancelAuthenticationChallenge, nil);
//    }
//
//}
//
//func sha256(_ data : Data) -> String {
//    var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
//    data.withUnsafeBytes {
//        _ = CC_SHA256($0, CC_LONG(data.count), &hash)
//    }
//    return Data(bytes: hash).base64EncodedString();
//}
//
//}
