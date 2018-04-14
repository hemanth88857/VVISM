//
//  ViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/6/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:OUTLETS
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userName.text = "avu@gmail.com"
        password.text = "123456789"
        self.title = "VVISM"
        label.isHidden = true
    }
  
    //MARK:login Action
    @IBAction func login(_ sender: Any) {
        /*
        label.isHidden = true
        guard let  txtUsername = userName.text, userName.text?.characters.count != 0 else {
            label.isHidden = false
            label.text = "plz enter your email"
            return
        }

        if isValidEmail(emailID: txtUsername) == false {

            label.isHidden = false
            label.text = "plz enter Valid  password"
        }
        
        guard let  txtpassword = password.text, password.text?.characters.count != 0 else {
            label.isHidden = false
            label.text = "plz enter your password"
            return
        }
 */
        
        
        if let textUserName = userName.text, textUserName.count != 0 {
            if isValidEmailAddress(emailAddressString: textUserName) {
                if let  txtpassword = password.text, txtpassword.count > 8 {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                else {
                    showAlertWithTitleAndMessage(title: "ABC", message: "Please enter password manimum of 8 characters")
                }
            }
            else {
                showAlertWithTitleAndMessage(title: "ABC", message: "Please enter a valid email!")
            }
        }
        else {
            showAlertWithTitleAndMessage(title: "ABC", message: "Please enter email!")
        }
        
        
        

    }
    //MARK: aboutus
    @IBAction func aboutUs(_ sender: Any) {
        guard let url = URL(string: "http://www.vishwavishwani.ac.in/TheInstitution.php") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }

    }
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    func showAlertWithTitleAndMessage(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

 
