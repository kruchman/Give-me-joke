//
//  APIRequestManager.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 26/7/23.
//

import UIKit

struct APIRequestManager {
    
    private let urlString = "https://official-joke-api.appspot.com/random_joke"
    
    func fetchJoke(completion: @escaping (Result<JokeModel, NetwokErrors>) -> Void)  {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidData))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedData = try parseJSON(data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.unknownError))
            }
        }
        .resume()
    }
}
private func parseJSON(_ jokeData: Data) throws -> JokeModel {
    
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(JokeData.self, from: jokeData)
        let setup = decodedData.setup
        let punchline = decodedData.punchline
        
        let joke = JokeModel(setup: setup, punchline: punchline)
        return joke
    } catch {
        throw NetwokErrors.errorParsingData
    }
    
}


    
   
    

