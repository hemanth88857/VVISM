//
//  VVProfileViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/9/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class VVProfileViewController: UIViewController {
 @IBOutlet weak var profilePhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profilePhoto.layer.borderWidth=1.0
        profilePhoto.layer.masksToBounds = false
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.height/2
        profilePhoto.clipsToBounds = true
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ACTIONS
    @IBAction func logoutAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
