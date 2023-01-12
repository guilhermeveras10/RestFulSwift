//
//  HomePresenter.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import Foundation

protocol HomePresenterProtocol {
    func presentGetListSuccess(response: HomeModel?)
    func presentGetListError(error: ErrorHttps)
}

class HomePresenter: HomePresenterProtocol {
    
    let view: HomeTableViewControllerProtocol

    init(view: HomeTableViewControllerProtocol) {
        self.view = view
    }
    
    func presentGetListSuccess(response: HomeModel?) {
        self.view.getHomeSuccess(response: response)
    }
    
    func presentGetListError(error: ErrorHttps) {
        self.view.getHomeError(error: error)
    }
}
