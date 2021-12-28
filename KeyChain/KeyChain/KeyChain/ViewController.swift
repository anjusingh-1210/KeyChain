//
//  ViewController.swift
//  KeyChain
//
//  Created by Anju on 09/10/21.
//

import UIKit
import Security

struct Credentials {
    var emailID: String
    var password: String
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
let server = "www.abc.com"
class ViewController: UIViewController, UITextFieldDelegate {
    var username: String?
    var password: String?
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailIdTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGes)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
  
    @IBAction func SaveSecurely(_ sender: Any) {
        guard let emailId =  emailIdTextField.text, emailId.validateEmail(emailString: emailIdTextField.text ?? "")
        else {
            return print("email is not valid")
        }
        guard let password =  passwordTextField.text, password.count > 5
        else {
            return print("password is not valid")
        }
        let credentials = Credentials(emailID: emailId, password: password)
        let account  = credentials.emailID
        let securedPW =  password
        
        saveCredentialsInKeychain(account: account, securedPw: securedPW)
       
        
    }
    
    func saveCredentialsInKeychain(account: String, securedPw: String) {
        let securedpW = securedPw.data(using: .utf8)!
        let keyChainAttributes: [String: Any] = [kSecClass as       String:kSecClassInternetPassword, kSecAttrAccount as String: account,
                                              kSecValueData as String: securedpW,
                                                 kSecAttrServer as String: server]
        
        
        
        if SecItemAdd(keyChainAttributes as CFDictionary, nil) == noErr {
            print("Credentials added in Keychain")
        } else {
            print("some error occured")
        }
    
}
    
    static func UpdatePassword(password: Data, service: String, account: String) throws {
       
        let query: [String: Any] = [
                // kSecAttrService,  kSecAttrAccount, and kSecClass
                // uniquely identify the item to update in Keychain
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecClass as String: kSecClassGenericPassword
            ]
        let attribute: [String :Any ] = [kSecValueData as String: password ]
        let status  = SecItemUpdate(query as CFDictionary, attribute as CFDictionary)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.noPassword
        }
    }
}
extension String {
    func validateEmail (emailString : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailString)
    }

}
