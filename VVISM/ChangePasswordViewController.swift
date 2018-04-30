//
//  ChangePasswordViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/16/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPassword: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var reEnterPassword: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passwordUpdate(_ sender: Any) {
        guard let  oldTxtpassword = oldPassword.text, oldTxtpassword.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please Enter  Old Password")
            
            return
        }
        guard let  newTxtRepassword = newPassword.text, newTxtRepassword.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please Enter New Password")
            
            return
        }
        guard let  reEnterNewTxtRepassword = reEnterPassword.text, reEnterNewTxtRepassword.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please Enter New Password")
            
            return
        }
        
        if newPassword.text != reEnterPassword.text {
            showAlertWithTitleAndMessage(title: "Alert", message: "Password Does not Match")
            return
        }
        showAlertWithTitleAndMessageWithAction(title: "Alert", message: "Password  has been Changed Successfully")
        
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
//                self.navigationController?.pushViewController(self.vc, animated: true)
          //   self.navigationController.pushViewController(HomepageViewController, animated: true)
                self.navigationController?.popViewController(animated: true)
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
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
