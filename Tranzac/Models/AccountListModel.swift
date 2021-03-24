//
//  AccountListModel.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

struct AccountListModel: Codable {
    let accountList: [Accounts]
}

struct Accounts: Codable {
    let id: Int
    let currentBalance: Double
    let availableBalance: Double
    let productName: String
}
