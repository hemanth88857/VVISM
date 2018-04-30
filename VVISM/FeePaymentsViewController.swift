//
//  FeePaymentsViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class FeePaymentsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
   
    
    
    // MARK: Outlets
    
    @IBOutlet weak var BtnSelectGroup: UIButton!
    
    @IBOutlet weak var btnSelectYear: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectYearTxtField: UITextField!
    
    @IBOutlet weak var hallTicket: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var mobileNumber: UITextField!
    
    
    
    
    
    let selectGroup:NSMutableArray = ["MBA","PGDMA","MCA (2 Years)","MCA (3 Years)"]
    let selectYear:NSMutableArray = ["1st Year","2nd Year","3rd Year"]
    var tableArr = NSMutableArray()
    var pickerView = UIPickerView()
    var isGroupSelected = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Fee Payments"
        // MARK: delegates for group
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.isHidden = true
        
        hallTicket.text = "12345678900"
        name.text = "12ramu"
        amount.text = "1234"
        mobileNumber.text = "8885643432"
    }
    
    
    // MARK: Actions for year and Group
    @IBAction func btnSelectGroupClick(_ sender: Any) {
        
        isGroupSelected = true
        tableArr.removeAllObjects()
        tableArr.addObjects(from: selectGroup as! [Any])
        tableView.isHidden = false
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: BtnSelectGroup.frame.origin.y + 30, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
    }
    @IBAction func btnSelectYearClick(_ sender: Any) {
        isGroupSelected = false
        tableArr.removeAllObjects()
        tableArr.addObjects(from: selectYear as! [Any])
        tableView.isHidden = false
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: btnSelectYear.frame.origin.y + 30, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
    }
    
//    let vc = FinalPaymentViewController(nibName: "FinalPaymentViewController", bundle: nil)

    // MARK: Action For MakePayment
    @IBAction func makePayment(_ sender: Any) {
        guard let hallTicketTxt = hallTicket.text, hallTicketTxt.count == 11 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter your  Hall Ticket Number")
            
            return
        }
        guard let  nameTxt = name.text, nameTxt.count > 2  else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter your Name")
            
            return
        }
        guard let  amountTxt = amount.text, amountTxt.count > 2 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter amount")
            
            return
        }
        guard let  mobileNumberTxt = mobileNumber.text, mobileNumberTxt.count == 10 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter your Mobile Number")
            
            return
        }
//        self.navigationController?.pushViewController(self.vc, animated: true)
        self.performSegue(withIdentifier: "finalPayment", sender: nil)

    }
    
    // MARK: Tableview protocols for Group
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "groupCell") as UITableViewCell?)!
        
        cell.textLabel?.text = self.tableArr[indexPath.row] as? String
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 && row == 4 {
            return 150.0
        }
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedGroup = tableArr.object(at: indexPath.row) as? NSString
        if isGroupSelected == true {
            BtnSelectGroup.setTitle(selectedGroup! as String, for: UIControlState.normal)
        }
        else {
            btnSelectYear.setTitle(selectedGroup! as String, for: UIControlState.normal)
        }
        
        tableView.isHidden = true
    }
    
    
    
    
    
    
    /*
     // MARK: Tableview protocols for Group and year
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     if tableView == self.tableView {
     return selectGroup.count
     } else {
     if tableView == self.yearTableView {
     return selectYear.count
     }
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     if tableView == self.tableView {
     let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as UITableViewCell!
     
     cell.textLabel?.text = self.selectGroup[indexPath.row] as? String
     
     return cell
     } else {
     if tableView == self.yearTableView {
     let cell:UITableViewCell = yearTableView.dequeueReusableCell(withIdentifier: "yearCell") as UITableViewCell!
     
     cell.textLabel?.text = self.selectYear[indexPath.row] as? String
     
     return cell
     }
     }
     
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
     
     
     if tableView == self.tableView {
     let selectedGroup = selectGroup.object(at: indexPath.row) as? NSString
     BtnSelectGroup.setTitle(selectedGroup! as String, for: UIControlState.normal)
     tableView.isHidden = true
     } else {
     if tableView == self.yearTableView {
     let selectedYear = selectYear.object(at: indexPath.row) as? NSString
     BtnSelectGroup.setTitle(selectedYear! as String, for: UIControlState.normal)
     yearTableView.isHidden = true
     }
     
     
     
     }
     */
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
