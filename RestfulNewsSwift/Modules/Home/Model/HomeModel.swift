//
//  HomeModel.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import Foundation
import Alamofire

struct HomeModel: Codable {
    var articles: [ArticlesModel]?
    var status: String?
    var totalResults: Int?
}

struct ArticlesModel: Codable {
    var author: String?
    var source: SourceModel?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct SourceModel: Codable {
    var id: String?
    var name: String?
}


// MARK: - Alamofire response handlers
extension DataRequest {
    @discardableResult
    func responseHomeModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<HomeModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
