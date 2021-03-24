//
//  TCBankAccountListVC.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

class TCBankAccountListVC: UIViewController {
    
    @IBOutlet weak var accountTableView: UITableView!
    private let cellID = "AccountListTVCell"
    var accountList: [Accounts]?
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: cellID, bundle: nil)
        accountTableView.register(nib, forCellReuseIdentifier: cellID)
        accountTableView.backgroundColor = .white
//        accountTableView.register(AccountListTVCell.self, forCellReuseIdentifier: cellID)
//        accountTableView.sectionHeaderHeight = self.view.frame.height/2.3
    }
}

extension TCBankAccountListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let model = accountList, model.count > 0 {
//            return model.count
//        }
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! AccountListTVCell
//        if let model = accountList, model.count > 0 {
//            cell.updateCell(with: model[indexPath.row])
//        }
        return cell
    }
}

