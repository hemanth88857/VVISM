//
//  CardCellTableViewCell.swift
//  VVISM
//
//  Created by hemanth kumar on 5/2/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

protocol CardCellDelegate {
    
     func buttonTapped ()
}

class CardCellTableViewCell: UITableViewCell {

    var CardCellDelegate:CardCellDelegate?
    
    @IBOutlet weak var cardNumber: UITextField!
    
    @IBOutlet weak var nameOnCard: UITextField!
    
    @IBOutlet weak var month: UITextField!
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var CVV: UITextField!
    
    @IBAction func CardCellAction(_ sender: UIButton) {
        if  ((CardCellDelegate?.buttonTapped()) != nil) {
            CardCellDelegate?.buttonTapped()
        }
        
        
        
        guard let  cardNumberTxt  = cardNumber.text, cardNumberTxt.count > 11 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter a valid 16 Digits Number")
            
            return
        }
        guard let  nameOnCardTxt = nameOnCard.text, nameOnCardTxt.count > 8 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter Valid Name")
            
            return
        }
        guard let  monthTxt = month.text, monthTxt.count == 2 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter Valid Month")
            
            return
        }
        
        guard let  yearTxt = year.text, yearTxt.count == 2 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter Valid Year")
            
            return
        }
        guard let  CVVTxt = CVV.text, CVVTxt.count == 3 else {
            showAlertWithTitleAndMessage(title: "Alert", message: "Please enter CVV")
            
            return
        }
       // showAlertWithTitleAndMessageWithAction(title: "Alert", message: "Proceed To Payment ")

        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func showAlertWithTitleAndMessage(title:String, message:String) {
       /*
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
 */
    }
}


/*

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
    present(alert, animated: true, completion: nil)
}

 */

