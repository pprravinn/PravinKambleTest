//
//  CoreDataManager.swift
//  PravinKambleTest
//
//  Created by Pravin Kamble on 16/04/18.
//  Copyright © 2018 Pravin Kamble. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    func insertUserData(username:String,email:String,password:String) -> Bool{
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let user = User(context: managedObjectContext)
        user.username = username
        user.email = email
        user.password = password
        
        managedObjectContext.insert(user)
        
        appDelegate.saveContext()
        
        return true
    }
    
    func searchData(username: String, password: String) -> Bool{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        fetchRequest.predicate = NSPredicate(format: "username CONTAINS[cd] %@ OR email CONTAINS[cd] %@ AND password contains[c] %@", username, username, password)
        do {
            
            let results = try managedObjectContext.fetch(fetchRequest)
            print(results)
            if (results.count > 0) {
                
                let users = results as! [User]
                for user in users {
                    
                    print(user.username!)
                    print(user.email!)
                    print(user.password!)
                }
            }
            else{
                
                return false
            }
        } catch {
            
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return true
    }
    
}
