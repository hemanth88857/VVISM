//
//  EditProfileViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {

    //MARK:Outlets
    
    @IBOutlet weak var ChangePhotoOutlet: UIImageView!
     let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var editName: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       editName.delegate = self
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:imagePicker functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickerImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ChangePhotoOutlet.contentMode = .scaleAspectFit
            ChangePhotoOutlet.image = pickerImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: ChangePhoto
    @IBAction func changePhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: UpdateButton
    @IBAction func updateButton(_ sender: UIButton) {
        guard let  editUserNameTxtUsername = editName.text, editUserNameTxtUsername.count > 2 else {
    
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter a valid Name")
            return
        }
        
       
        showAlertWithTitleAndMessageWithAction(title: "Alert", message: "Name has been Updated Successfully")
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
        
        if textField == editName {
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
