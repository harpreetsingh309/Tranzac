//
//  AccountListModel.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

struct AccountListModel: Codable {
    let accounts: [Accounts]
}

struct Accounts: Codable {
    let id: String
    let currentBalance: String
    let availableBalance: String
    let productName: String
}
