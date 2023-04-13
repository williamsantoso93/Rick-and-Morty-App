//
//  Networking.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 10/04/23.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

class Networking {
    static func sendRequest<T: Decodable>(url: String, parameters: [String: String]? = nil) async -> Result<T, RequestError> {
        var urlComponents = URLComponents(string: url)
        
        if let parameters = parameters,
           !parameters.isEmpty {
            var queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            urlComponents?.queryItems = queryItems
        }
        
        guard let url = urlComponents?.url else {
            return .failure(.invalidURL)
        }
        
        print("Endpoint : ", url )
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            print("Response :\n", String(data: data, encoding: .utf8) ?? "")
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedResponse)
                } catch {
                    print(error)
                    return .failure(.decode)
                }
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}

class Fetcher {
    static func getCharacterList(url: String = "https://rickandmortyapi.com/api/character", name: String? = nil, status: Status? = nil, species: String? = nil, gender: Gender? = nil) async throws -> BaseList<Character> {
        var params: [String: String] = [:]
        if let name = name {
            params["name"] = name.lowercased()
        }
        if let status = status {
            params["status"] = status.rawValue.lowercased()
        }
        if let species = species {
            params["species"] = species.lowercased()
        }
        if let gender = gender {
            params["gender"] = gender.rawValue.lowercased()
        }
        
        let result: Result<BaseList<Character>, RequestError> = await Networking.sendRequest(url: url, parameters: params)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    static func getCharacterDetail(url: String) async throws -> Character {
        let result: Result<Character, RequestError> = await Networking.sendRequest(url: url)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    static func getLocationList(url: String = "https://rickandmortyapi.com/api/location", name: String? = nil) async throws -> BaseList<Location> {
        var params: [String: String] = [:]
        if let name = name {
            params["name"] = name
        }
        
        let result: Result<BaseList<Location>, RequestError> = await Networking.sendRequest(url: url, parameters: params)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    static func getLocationDetail(url: String) async throws -> Location {
        let result: Result<Location, RequestError> = await Networking.sendRequest(url: url)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    static func getEpisodeList(url: String = "https://rickandmortyapi.com/api/episode", name: String? = nil) async throws -> BaseList<Episode> {
        var params: [String: String] = [:]
        if let name = name {
            params["name"] = name
        }
        
        let result: Result<BaseList<Episode>, RequestError> = await Networking.sendRequest(url: url, parameters: params)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    static func getEpisodeDetail(url: String) async throws -> Episode {
        let result: Result<Episode, RequestError> = await Networking.sendRequest(url: url)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
