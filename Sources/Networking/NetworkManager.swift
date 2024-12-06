//
//  NetworkManager.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.

import Foundation

public protocol NetworkingManagerProtocol {
    public func fetchData<T:Decodable>(url: String, modelType: T.Type) async throws -> T
}

public class NetworkManager{
    public let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: NetworkingManagerProtocol {
    public func fetchData<T>(url: String, modelType: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        do{
            let (data, response) = try await self.urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard (200...299).contains(response.statusCode) else {
                throw NetworkError.invalidHTTPStatusCode
            }
            
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
            
        }catch{
            print(error.localizedDescription)
            throw error
        }
        
    }
    
    
}
