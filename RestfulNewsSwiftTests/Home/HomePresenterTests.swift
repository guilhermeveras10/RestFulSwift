//
//  HomePresenter.swift
//  RestfulNewsSwiftTests
//
//  Created by Guilherme Duarte on 12/01/23.
//

import XCTest
@testable import RestfulNewsSwift

class HomePresenterTests: XCTestCase {
    
    class HomeTableViewControllerSpy: HomeTableViewControllerProtocol {
        
        var getListHomeSuccessCalled = false
        var getListErrorCalled = false
        
        func getHomeSuccess(response: HomeModel?) {
            getListHomeSuccessCalled = true
        }
        
        func getHomeError(error: ErrorHttps) {
            getListErrorCalled = true
        }
    }
    
    func test_getListReportSuccesPresenter(){
        let vc = HomeTableViewControllerSpy()
        let presenter  = HomePresenter(view: vc)
        presenter.presentGetListSuccess(response: nil)
        XCTAssertTrue(vc.getListHomeSuccessCalled)
        
    }
    
    func test_getListReportErrorPresenter(){
        let vc = HomeTableViewControllerSpy()
        let presenter  = HomePresenter(view: vc)
        presenter.presentGetListError(error: ErrorHttps(code: 500, description: ""))
        XCTAssertTrue(vc.getListErrorCalled)
        
    }
}
