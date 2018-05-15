//
//  NetBankingTableViewCell.swift
//  VVISM
//
//  Created by hemanth kumar on 5/2/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

protocol NetBankingDelegate {
    
    func selectBankButtunTapped()
}

class NetBankingTableViewCell: UITableViewCell {

    var netBankingDelegate:NetBankingDelegate?
    @IBOutlet weak var selectBankButton: UIButton!
    
    @IBAction func selectBankAction(_ sender: Any) {
        if ((netBankingDelegate?.selectBankButtunTapped()) != nil) {
            netBankingDelegate?.selectBankButtunTapped()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
