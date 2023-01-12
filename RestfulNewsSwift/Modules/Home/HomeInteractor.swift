//
//  HomeInteractor.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import Foundation

protocol HomeInteractorProtocol{
    func getHomeList()
}

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol?
    var worker: HomeWorkerProtocol!
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        self.worker = HomeWorker()
    }
    
    func getHomeList() {
        self.worker.getHomeList (onSuccess: { response in self.presenter?.presentGetListSuccess(response: response)
            self.presenter?.presentGetListSuccess(response: response)
        }, onError: { error in self.presenter?.presentGetListError(error: error)
            self.presenter?.presentGetListError(error: error)
        })
    }
}
