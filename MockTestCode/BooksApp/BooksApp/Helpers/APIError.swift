//
//  APIError.swift
//  BooksApp
//
//  Created by Pubudu Mihiranga on 2025-11-15.
//

/*
 Disclaimer: This solution contains sample code for the given specification.
 There is room for improvement in this code;
 however, you may refer to it when preparing for the in-class test
 */

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please check the endpoint."
        case .invalidResponse:
            return "Server returned an invalid response."
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
}
