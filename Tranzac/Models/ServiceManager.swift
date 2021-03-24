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
                }
            }
            task.resume()
        }
    }
    
    // MARK:-  Activity Indicator
    private func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.color = .white
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
//            self.activityView!.center = UIApplication.scene.view.center
//            UIApplication.scene.view.addSubview(self.activityView!)
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
