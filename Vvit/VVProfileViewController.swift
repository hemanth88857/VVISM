//
//  VVProfileViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/9/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class VVProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
