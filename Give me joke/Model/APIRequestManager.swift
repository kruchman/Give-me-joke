//
//  APIRequestManager.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 26/7/23.
//

import UIKit

struct APIRequestManager {
    
    private let urlString = "https://official-joke-api.appspot.com/random_joke"
    
    func fetchJoke(jokePunchLabel: UILabel, jokeSetupLabel: UILabel) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let safeData = data else { return }
            
            if let joke = self.parseJSON(safeData) {
                self.didUpdateJoke(jokePunchLabel: jokePunchLabel, jokeSetupLabel: jokeSetupLabel, joke: joke)
            }
            
            
        }
        .resume()
    }
    
   private func didUpdateJoke(jokePunchLabel: UILabel, jokeSetupLabel: UILabel , joke: JokeModel) {
        
        DispatchQueue.main.async {
            jokePunchLabel.text = joke.punchline
            jokeSetupLabel.text = joke.setup
        }
        
    }
    

    private func parseJSON(_ jokeData: Data) -> JokeModel? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let setup = decodedData.setup
            let punchline = decodedData.punchline
            
            let joke = JokeModel(setup: setup, punchline: punchline)
            return joke
        } catch {
            print(error)
            return nil
        }
        
    }
        
    }
    
   
    

