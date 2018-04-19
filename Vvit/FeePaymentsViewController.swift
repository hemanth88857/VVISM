//
//  FeePaymentsViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class FeePaymentsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource ,UIPickerViewDelegate,UIPickerViewDataSource {
   
    
    
    // MARK: Outlets
    
    @IBOutlet weak var BtnSelectGroup: UIButton!
    
    @IBOutlet weak var btnSelectYear: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var yearTableView: UITableView!
    
    @IBOutlet weak var selectYearTxtField: UITextField!
    
    
    let selectGroup:NSMutableArray = ["MBA","PGDMA","MCA (2 Years)","MCA (3 Years)"]
    let selectYear:NSMutableArray = ["1st Year","2nd Year","3rd Year"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Fee Payments"
        // MARK: delegates for group
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.isHidden = true
        
        // MARK: delegates for year
        yearTableView.delegate = self
        yearTableView.dataSource = self
        yearTableView.tableFooterView = UIView()
        yearTableView.isHidden = true
        
        // MARK: pickerview with textfield
        pickerView.delegate = self
        pickerView.dataSource = self 
        selectYearTxtField.inputView = pickerView
        
    }
    
    
    // MARK: Actions for year and Group
    @IBAction func btnSelectGroupClick(_ sender: Any) {
        
        if tableView.isHidden == true{
            tableView.isHidden = false
        } else {
            tableView.isHidden = true
        }
    }
    @IBAction func btnSelectYearClick(_ sender: Any) {
        
        if yearTableView.isHidden == true{
            yearTableView.isHidden = false
        } else {
            yearTableView.isHidden = true
        }
    }
    
    
    
    // MARK: Tableview protocols for Group
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as UITableViewCell!
        
        cell.textLabel?.text = self.selectGroup[indexPath.row] as? String
        
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
        let selectedGroup = selectGroup.object(at: indexPath.row) as? NSString
        BtnSelectGroup.setTitle(selectedGroup! as String, for: UIControlState.normal)
        tableView.isHidden = true
    }
    
    
    // MARK: pickerView protocols  for year
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectYear.count
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectYear[row] as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectYearTxtField.text = selectYear[row] as? String
        selectYearTxtField.resignFirstResponder()
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
