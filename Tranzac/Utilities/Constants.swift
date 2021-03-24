//
//  Constants.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import Foundation

struct Constants {
    static let baseURL = "https://www.ubank.com.au/content/dam/ubank/mobile/coding/"
    static let accounts = "accounts.json"
    static let balance = "Balance: "
    static let currentBalance = "Current Balance: "
}

struct AlertConstant {
    static let alertOK = "OK"
    static let alertCancel = "Cancel"
    static let alertSearch = "Search"
}

struct Errors {
    static let noInternet = "Your Internet connection appears to be offline."
    static let serverError = "Internal Server error occurred, try again after some time"
}
