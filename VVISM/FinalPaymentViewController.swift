//
//  FinalPaymentViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/27/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit



class FinalPaymentViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
 
    @IBOutlet weak var finalPaymentTableView: UITableView!
    
    var selectedCellIndex:Int = -1
    var cellType:String = ""
    
let paymentType = ["Debit/Credit","Net Banking","PhonePay"]
    override func viewDidLoad() {
        super.viewDidLoad()

        finalPaymentTableView.delegate = self
        finalPaymentTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return paymentType.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedCellIndex == section {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "finalPaymentCell") as UITableViewCell?)!
            
            cell.textLabel?.text = self.paymentType[indexPath.section]
            return cell
        }
        else {
            if selectedCellIndex == 0 {
                let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "cardCell") as UITableViewCell?)!
                return cell
            }
            else if selectedCellIndex == 1 {
                let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "NetBanking") as UITableViewCell?)!
                return cell
            }
            else {
                let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "cardCell") as UITableViewCell?)!
                return cell
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.section
        cellType = self.paymentType[indexPath.section]
        self.finalPaymentTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        }
        else {
            if selectedCellIndex == 0 {
                return 161
            }
            else if selectedCellIndex == 1 {
                return 161
            }
            else {
                return 161
            }
        }
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
