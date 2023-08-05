//
//  CoreDataManager.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 4/8/23.
//

import UIKit
import CoreData

class CoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveJoke(setup: String, punchline: String) {
        
        let newJoke = SavedJokes(context: context)
        newJoke.setup = setup
        newJoke.punchline = punchline
        saveContext()
        
    }
    
    func loadLikedJokes() -> [SavedJokes] {
        
        let request: NSFetchRequest<SavedJokes> = SavedJokes.fetchRequest()
        do {
            let likedJokes = try context.fetch(request)
            return likedJokes
        } catch {
            print("Error fetching request \(error)")
            return []
        }
        
    }
    
    func saveContext() {
        
        do {
            try context.save()
        } catch {
            print("Error saving \(error)")
        }
        
    }
    
}
