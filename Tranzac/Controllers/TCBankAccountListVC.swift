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
    private var serviceManager = ServiceManager()

    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadLocationData()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: cellID, bundle: nil)
        accountTableView.register(nib, forCellReuseIdentifier: cellID)
        accountTableView.backgroundColor = .white
//        accountTableView.register(AccountListTVCell.self, forCellReuseIdentifier: cellID)
//        accountTableView.sectionHeaderHeight = self.view.frame.height/2.3
    }
    
    // MARK:- Fetch Given cities weather condition
    private func loadLocationData() {
        serviceManager.delegate = self
        serviceManager.fetchData(url: Constants.accounts)
    }
    
    // MARK:- Alerts
    private func showAlert(_ msg: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            Alert.showAlert(message: msg)
        }
    }
}
//MARK: - WeatherManagerDelegate

extension TCBankAccountListVC: ServiceManagerProtocol {
    func didUpdateAccountList(account: AccountListModel) {
        accountList = account.accounts
        DispatchQueue.main.async {
            self.accountTableView.reloadData()
        }
    }
    
    func didFailWithError(error: String) {
        showAlert(error)
    }
}

extension TCBankAccountListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let model = accountList, model.count > 0 {
            return model.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! AccountListTVCell
        if let model = accountList, model.count > 0 {
            cell.updateCell(model: model[indexPath.row])
        }
        return cell
    }
}

