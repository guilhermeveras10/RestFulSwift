//
//  HttpRepository.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import Foundation
import Alamofire

public class HttpRepository: NSObject {
    static let shared: HttpRepository = HttpRepository()
    func getHomeList(onSuccess: @escaping (HomeModel)  -> (), onError: @escaping (ErrorHttps) -> ()) {
        Alamofire.request(Strings.baseURL + Strings.PATH, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseHomeModel { (response) in
         
            if let error = response.error {
                onError(ErrorHttps(code: 500, description: error.localizedDescription))
                return
            }
            if let response = response.result.value {
                onSuccess(response)
                return
            }
        }
    }
    
}
// MARK: - ResponseError
struct ErrorHttps: Codable {
    var code: Int
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
    init(code: Int, description: String) {
        self.code = code
        self.message = description
    }
}
