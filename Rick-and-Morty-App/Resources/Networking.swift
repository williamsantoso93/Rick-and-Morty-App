//
//  Networking.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 10/04/23.
//

import Foundation

/// Error enum for handling networking request errors.
enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

/// A networking class for sending HTTP requests and handling responses.
class Networking {
    /// Sends an HTTP request to the specified URL and decodes the response data into a generic type.
    ///
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - parameters: Optional query parameters to include in the request.
    /// - Returns: A Result object containing either the decoded response data or a RequestError.
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
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
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

/// A fetcher class for making requests to the Rick and Morty API.
class Fetcher {
    /// Retrieves a list of characters.
    ///
    /// - Parameters:
    ///   - url: Optional URL to specify the endpoint. If not provided, the default endpoint will be used.
    ///   - name: Optional name filter for character search.
    ///   - status: Optional status filter for character search.
    ///   - species: Optional species filter for character search.
    ///   - gender: Optional gender filter for character search.
    /// - Returns: A BaseList object containing the list of characters, or throws a RequestError if an error occurs.
    static func getCharacterList(url: String = "", name: String? = nil, status: Status? = nil, species: String? = nil, gender: Gender? = nil) async throws -> BaseList<Character> {
        var url = url
        if url.isEmpty {
            url = "https://rickandmortyapi.com/api/character"
        }
        
        var params: [String: String] = [:]
        if let name = name,
           !name.isEmpty {
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
    
    /// Retrieves a character detail.
    ///
    /// - Parameters:
    ///   - url: The URL of the character detail.
    /// - Returns: A Character object containing the character detail, or throws a RequestError if an error occurs.
    static func getCharacterDetail(url: String) async throws -> Character {
        let result: Result<Character, RequestError> = await Networking.sendRequest(url: url)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    /// Retrieves a list of locations.
    ///
    /// - Parameters:
    ///   - url: Optional URL to specify the endpoint. If not provided, the default endpoint will be used.
    ///   - name: Optional name filter for location search.
    /// - Returns: A BaseList object containing the list of locations, or throws a RequestError if an error occurs.
    static func getLocationList(url: String = "", name: String? = nil) async throws -> BaseList<Location> {
        var url = url
        if url.isEmpty {
            url = "https://rickandmortyapi.com/api/location"
        }
        
        var params: [String: String] = [:]
        if let name = name,
           !name.isEmpty {
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
    
    /// Retrieves a list of locations.
    ///
    /// - Parameters:
    ///   - url: Optional URL to specify the endpoint. If not provided, the default endpoint will be used.
    ///   - name: Optional name filter for location search.
    /// - Returns: A BaseList object containing the list of locations, or throws a RequestError if an error occurs.
    static func getLocationDetail(url: String) async throws -> Location {
        let result: Result<Location, RequestError> = await Networking.sendRequest(url: url)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    /// Retrieves a list of episodes.
    ///
    /// - Parameters:
    ///   - url: Optional URL to specify the endpoint. If not provided, the default endpoint will be used.
    ///   - name: Optional name filter for episode search.
    /// - Returns: A BaseList object containing the list of episodes, or throws a RequestError if an error occurs.
    static func getEpisodeList(url: String = "", name: String? = nil) async throws -> BaseList<Episode> {
        var url = url
        if url.isEmpty {
            url = "https://rickandmortyapi.com/api/episode"
        }
        
        var params: [String: String] = [:]
        if let name = name,
           !name.isEmpty {
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
    
    /// Retrieves an episode detail.
    ///
    /// - Parameters:
    ///   - url: The URL of the episode detail.
    /// - Returns: An Episode object containing the episode detail, or throws a RequestError if an error occurs.
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
