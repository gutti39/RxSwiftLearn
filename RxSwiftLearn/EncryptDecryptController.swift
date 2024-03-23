//
//  EncryptDecryptController.swift
//  RxSwiftLearn
//
//  Created by VEERA GUTTI on 23/03/24.
//

import Foundation
import UIKit
import Security
import CommonCrypto

class EncryptDecryptController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Usage
        if let (publicKey, _) = generateRSAKeyPair() {
            let plaintext = "Hello, World 456!"
            if let encryptedData = encryptStringWithRSA(string: plaintext, publicKey: publicKey) {
                print("Encrypted data: \(encryptedData.base64EncodedString())")
            }
        }
        
        let encryptedKey = "fOz/SHDgTUsyR7THfBNdHpXvPvKKY3Wyoewmh8/PI2gQFD0efNyKYWP/arc0Hi5a9aqCFAHiKESY1IMPTLf6HWvUeIiTgCDHPSlSeMSoCmCTrBbo38HGMr82P1DQUsNgHXJ+muxqoIbLA+qQCtaGS1u7Bz71rfA4fGfueWLMzLhHG7udCD6P3Xgqe8L+WiBLfCDwLnrFMThGDvaYUH4XNpaObqoKtvMnyA2sbIkZMomFy7/kv2ftVbx6uS7aTZgjtapeBn58adufeuV7CI0CesAyDWo5LJtVNeL5Q3DzSftIbPgJdQujeoC0OoqvUHgBxH9Zjh/QFWwZGLzHe7Nlkg=="
        // Usage
        if let (_, privateKey) = generateRSAKeyPair() {
            let encryptedData = Data(base64Encoded: encryptedKey) // Replace "<Encrypted Data>" with the actual base64-encoded encrypted data
            if let encryptedData = encryptedData {
                if let decryptedString = decryptDataWithRSA(encryptedData: encryptedData, privateKey: retrievePrivateKeyFromKeychain()!) {
                    print("Decrypted string: \(decryptedString)")
                }
            } else {
                print("Failed to decode base64-encoded encrypted data")
            }
        }
        
    }
    // Function to generate RSA public and private keys
    func generateRSAKeyPair() -> (SecKey, SecKey)? {
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: 2048
        ]
        var publicKey, privateKey: SecKey?
        let status = SecKeyGeneratePair(attributes as CFDictionary, &publicKey, &privateKey)
        guard status == errSecSuccess else {
            print("Failed to generate RSA key pair")
            return nil
        }
        savePrivateKeyToKeychain(privateKey: privateKey!)
        return (publicKey!, privateKey!)
    }
    
    // Function to encrypt string using RSA public key and SHA256 hashing
    func encryptStringWithRSA(string: String, publicKey: SecKey) -> Data? {
        guard let stringData = string.data(using: .utf8) else {
            print("Failed to convert string to data")
            return nil
        }
        
        var error: Unmanaged<CFError>?
        guard let encryptedData = SecKeyCreateEncryptedData(publicKey, .rsaEncryptionOAEPSHA256, stringData as CFData, &error) as Data? else {
            print("Encryption failed: \(error.debugDescription)")
            return nil
        }
        
        return encryptedData
    }
    
    func savePrivateKeyToKeychain(privateKey: SecKey) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: "com.veera.privatekey",
            kSecValueRef as String: privateKey,
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecReturnPersistentRef as String: true
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            print("Private key saved to Keychain")
            return true
        } else {
            print("Failed to save private key to Keychain")
            return false
        }
    }
    
    func retrievePrivateKeyFromKeychain() -> SecKey? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: "com.example.privatekey",
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecReturnRef as String: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        if status == errSecSuccess {
            return item as! SecKey
        } else {
            print("Failed to retrieve private key from Keychain")
            return nil
        }
    }
    
    //// Function to decrypt data using RSA private key
    func decryptDataWithRSA(encryptedData: Data, privateKey: SecKey) -> String? {
        var error: Unmanaged<CFError>?
        guard let decryptedData = SecKeyCreateDecryptedData(privateKey, .rsaEncryptionOAEPSHA256, encryptedData as CFData, &error) as Data? else {
            print("Decryption failed: \(error.debugDescription)")
            return nil
        }
        
        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            print("Failed to convert decrypted data to string")
            return nil
        }
        
        return decryptedString
    }
    
}
