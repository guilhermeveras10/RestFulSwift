//
//  HomeWorker.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import Foundation

protocol HomeWorkerProtocol {
    func getHomeList(onSuccess: @escaping (HomeModel) -> (), onError:  @escaping (ErrorHttps) -> ())
}

class HomeWorker: HomeWorkerProtocol {
    func getHomeList(onSuccess: @escaping (HomeModel) -> (), onError: @escaping (ErrorHttps) -> ()) {
        HttpRepository.shared.getHomeList(onSuccess: { response in
            onSuccess(response)
        }, onError: { error in
            onError(error)
        })
    }
}
