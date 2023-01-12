//
//  ServiceConfig.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//
import Alamofire

// MARK: - Alamofire response handlers
extension DataRequest {
    func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            //--Pode remover é apenas um log --
            print("API - \((self.request?.url?.description) ?? " - ")")
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))}
            print(json)
            //-- final do log --
            
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
}
