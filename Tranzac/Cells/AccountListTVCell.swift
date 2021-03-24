//
//  AccountListTVCell.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

class AccountListTVCell: UITableViewCell {
    @IBOutlet weak var accountTitleLabel: UILabel!
    @IBOutlet weak var accountSpendingLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    override func awakeFromNib() {
        backgroundColor = .white
        super.awakeFromNib()
    }
}

