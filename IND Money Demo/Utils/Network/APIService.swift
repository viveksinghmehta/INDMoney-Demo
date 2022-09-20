//
//  APIService.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import Alamofire
import Foundation
import Reachability


enum AppPaths: String, CaseIterable {
    case users = "all"
}


enum ApiRouter {
    
    case users

     var method: HTTPMethod {
        switch self {
        case .users:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .users:
            return AppURL.baseURl + AppPaths.users.rawValue
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .users:
            return nil

        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .users:
            return JSONEncoding.default
        }
    }
    
    
}

class APIService {

    static let shared = APIService()
    private let reachability = try! Reachability()
    
    private init() {}
    
    func networkRequest<T: Codable>(router: ApiRouter, model: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        if reachability.connection == .wifi || reachability.connection == .cellular {
            AF.request(router.path, method: router.method, parameters: router.parameters, encoding: JSONEncoding.default, headers: nil).responseData { [weak self] (response) in
                guard let weakself = self else { return }
                switch response.result {
                case .success(let jsonData):
                    weakself.decodeTheModel(responseData: jsonData, completion: completion)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(NetworkError.noInternet))
        }
    }
    
    private func decodeTheModel<T: Codable>(responseData: Data, completion: @escaping(Result<T, Error>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let value = try decoder.decode(T.self, from: responseData)
            completion(.success(value))
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}

