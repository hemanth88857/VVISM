//
//  SignUpViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {
    
    //MARK:Outlets
    
    @IBOutlet weak var SignupUserName: UITextField!
    @IBOutlet weak var SignupGmail: UITextField!
    @IBOutlet weak var SignupPassword: UITextField!
    
    @IBOutlet weak var SignuoReEnterPassword: UITextField!
    
    @IBOutlet weak var hallTicket: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
      //  SignupUserName.text = "abc"
        hallTicket.text = "21261608416"
        SignupGmail.text = "123@gmail.com"
        SignupPassword.text = "123456789"
        SignuoReEnterPassword.text = "123456789"
        
        
        SignupUserName.delegate = self

    }
    
    //MARK:REGISTERATION FOR USERS
    
    @IBAction func registerationForUser(_ sender: Any) {
            guard let  signUPtxtUsername = SignupUserName.text, signUPtxtUsername.count != 0 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter Username")
            return
        }
        
        if let  signUPtxtGmail = SignupGmail.text, signUPtxtGmail.count != 0 {
            if !isValidEmailAddress(emailAddressString: signUPtxtGmail){
                showAlertWithTitleAndMessage(title: "Alert", message: "Please enter a Valid Gmail")
                return
            }
        }
        else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter email")
            return
        }
        guard let  hallTicketTxt  = hallTicket.text, hallTicketTxt.count > 11 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter a valid Hall-Ticket Number")
            
            return
        }
        guard let  signUptxtpassword = SignupPassword.text, signUptxtpassword.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter Password")

            return
        }
        guard let  signUptxtRepassword = SignuoReEnterPassword.text, signUptxtRepassword.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please Re-enter Password")

            return
        }
        
        if SignupPassword.text != SignuoReEnterPassword.text {
            showAlertWithTitleAndMessage(title: "Alert", message: "Password Does not Match")
            return
        }
        showAlertWithTitleAndMessageWithAction(title: "Alert", message: "User has been Created Successfully")
        

        //        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     //MARK:  functions for Email Validation
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
    //MARK:  functions for Alerts
    func showAlertWithTitleAndMessage(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTitleAndMessageWithAction(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ action in
            switch action.style{
            case .default:
                self.navigationController?.popViewController(animated: true)
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK : function for alphabets validation
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == SignupUserName {
            let characterSet = CharacterSet.letters
            
            if string.rangeOfCharacter(from: .whitespaces) != nil {
                return true
            }
            
            if  string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
