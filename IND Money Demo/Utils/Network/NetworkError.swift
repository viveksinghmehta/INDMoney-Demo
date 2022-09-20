//
//  NetworkError.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//

import Foundation

enum NetworkError: Error {
    // Internet is available
    case noInternet

}

extension NetworkError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .noInternet:
            return "You are not connected to the internet"
        }
    }
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternet:
            return NSLocalizedString(
                "You are not connected to the internet",
                comment: "noInternet"
            )
        }
    }
}
