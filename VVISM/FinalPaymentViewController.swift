//
//  FinalPaymentViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/27/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit



class FinalPaymentViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate, NetBankingDelegate {

    
    @IBOutlet weak var finalPaymentTableView: UITableView!
    
    @IBOutlet weak var netBankingPicker: UIPickerView!
    var selectedCellIndex:Int = -1
    var cellType:String = ""
    var selectedBank = "Select Bank"
    
let paymentType = ["Debit/Credit","Net Banking","PhonePe"]
    
    let netBanking = ["Allahabad Bank",
                      "Andhra Bank",
                      "Axis Bank",
                      "Bank of Bahrain and Kuwait",
                      "Bank of Baroda - Corporate Banking",
                      "Bank of Baroda - Retail Banking",
                      "Bank of India",
                      "Bank of Maharashtra",
                      "Canara Bank",
                      "Central Bank of India",
                      "City Union Bank",
                      "Corporation Bank",
                      "Deutsche Bank",
                      "Development Credit Bank",
                      "Dhanlaxmi Bank",
                      "Federal Bank",
                      "ICICI Bank",
                      "IDBI Bank",
                      "Indian Bank",
                      "Indian Overseas Bank",
                      "IndusInd Bank",
                      "ING Vysya Bank",
                      "Jammu and Kashmir Bank",
                      "Karnataka Bank Ltd",
                      "Karur Vysya Bank",
                      "Kotak Bank",
                      "Laxmi Vilas Bank",
                      "Oriental Bank of Commerce",
                      "Punjab National Bank - Corporate Banking",
                      "Punjab National Bank - Retail Banking",
                      "Punjab & Sind Bank",
                      "Shamrao Vitthal Co-operative Bank",
                      "South Indian Bank",
                      "State Bank of Bikaner & Jaipur",
                      "State Bank of Hyderabad",
                      "State Bank of India",
                      "State Bank of Mysore",
                      "State Bank of Patiala",
                      "State Bank of Travancore",
                      "Syndicate Bank",
                      "Tamilnad Mercantile Bank Ltd.",
                      "UCO Bank",
                      "Union Bank of India",
                      "United Bank of India",
                      "Vijaya Bank",
                      "Yes Bank Ltd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalPaymentTableView.delegate = self
        finalPaymentTableView.dataSource = self
        netBankingPicker.dataSource = self
        netBankingPicker.delegate = self
        netBankingPicker.isHidden = true
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
                let cell:NetBankingTableViewCell = (tableView.dequeueReusableCell(withIdentifier : "NetBanking") as! NetBankingTableViewCell?)!
                cell.netBankingDelegate = self
                cell.selectBankButton.setTitle(selectedBank, for: .normal)
                return cell
            }
            else {
                let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier : "PhonePe") as UITableViewCell?)!
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return netBanking.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return netBanking[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBank = netBanking[row]
        finalPaymentTableView.reloadData()
    }
    
    
    
    //MARK: NetBankingDelegate
    func selectBankButtunTapped() {
        
        netBankingPicker.isHidden = false
//        if netBankingPicker.isHidden == false {
//            netBankingPicker.isHidden = true
//            }
//        else {
//            netBankingPicker.isHidden = false
//        }
        
        netBankingPicker.reloadAllComponents()
    }
}
