//
//  NetworkError.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//
//Without conforming, you would not be able to use the throw statement with your custom error.
//Error is a protocol provided by Swift to represent errors that can be thrown and caught.
//Any type conforming to Error can be used with Swift's error handling mechanism (throw, do-catch, etc.).


import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidJSON
    case invalidHTTPStatusCode
    case parsingError
    case dataNotFound
}
