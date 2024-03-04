//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by VEERA GUTTI on 04/03/24.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    
    func getdata() {
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
}
