//
//  HomeInteractorTests.swift
//  RestfulNewsSwiftTests
//
//  Created by Guilherme Duarte on 12/01/23.
//

import XCTest
@testable import RestfulNewsSwift

class HomeInteractorTests: XCTestCase {
    
    class HomePresenterSpy: HomePresenterProtocol {
        
        var presentGetListSuccessCalled = false
        var presentGetListErrorCalled = false
        
        func presentGetListSuccess(response: HomeModel?) {
            presentGetListSuccessCalled = true
        }
        
        func presentGetListError(error: ErrorHttps) {
            presentGetListErrorCalled = true
        }
        
        
    }
    
    class HomeWorkerSpy: HomeWorkerProtocol{
        
        var getReportListCalled = false
        
        func getHomeList(onSuccess: @escaping (HomeModel) -> (), onError:  @escaping (ErrorHttps) -> ()) {
            getReportListCalled = true
        }
        
    }
    
    func test_getHomeList_calls_workerGetReportList(){
        let presenterSpy = HomePresenterSpy()
        let workerSpy = HomeWorkerSpy()
        let interactor = HomeInteractor(presenter: presenterSpy)
        interactor.worker = workerSpy
        interactor.getHomeList()
        XCTAssert(workerSpy.getReportListCalled)
    }
}
