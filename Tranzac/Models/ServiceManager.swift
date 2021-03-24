//
//  ServiceManager.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

protocol ServiceManagerProtocol {
    func didUpdateAccountList(account: AccountListModel)
    func didFailWithError(error: String)
}

class ServiceManager {
    
    var delegate: ServiceManagerProtocol?
    var activityView: UIActivityIndicatorView?

    // MARK:- API call
    func fetchData(url: String) {
        showActivityIndicator()
        let urlString = "\(Constants.baseURL)" + url
        if Reachability.isConnectedToNetwork(){
            performRequest(with: urlString)
        } else {
            hideActivityIndicator()
            delegate?.didFailWithError(error: Errors.noInternet)
        }
    }

    // MARK:- URLSession Task
    private func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {[weak self] (data, response, error) in
                if error != nil {
                    self?.hideActivityIndicator()
                    self?.delegate?.didFailWithError(error: Errors.serverError)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(AccountListModel.self, from: safeData)
                        self?.delegate?.didUpdateAccountList(account: decodedData)
                        self?.hideActivityIndicator()
                    } catch let error {
                        print(error.localizedDescription)
                        self?.hideActivityIndicator()
                        self?.delegate?.didFailWithError(error: Errors.serverError)
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK:-  Activity Indicator
    private func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.color = .darkGray
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.activityView!.center = UIApplication.scene.view.center
            UIApplication.scene.view.addSubview(self.activityView!)
            self.activityView!.startAnimating()
        }
    }
    
    private func hideActivityIndicator() {
        if (activityView != nil) {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.activityView?.stopAnimating()
            }
        }
    }
}
