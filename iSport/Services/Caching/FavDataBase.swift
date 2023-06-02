//
//  DataBase.swift
//  iSport
//
//  Created by Hadia Yehia on 01/06/2023.
//

import Foundation
import CoreData
import UIKit

class FavDatabase {
    
   static func saveTeamToDataBase(team:FavTeamData){
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: context)
        let dbTeam = NSManagedObject(entity: entity!, insertInto: context)
        dbTeam.setValue(team.key, forKey: "key")
        dbTeam.setValue(team.img, forKey: "image")
        dbTeam.setValue(team.name, forKey: "name")
        do{
            try context.save()
            print("data added successfully")
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    static func fetchTeamsFromDataBase()->[FavTeamData]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var array = Array<FavTeamData>()
        var teams = Array<NSManagedObject>()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Favourites")
        do{
             teams = try context.fetch(fetchReq)
            for i in 0..<teams.count{
                var obj = FavTeamData(img:"",name: "",key: 0)
                obj.key =  teams[i].value(forKey: "key") as! Int
                obj.img = teams[i].value(forKey: "image") as! String
                obj.name = teams[i].value(forKey: "name") as! String
                array.append(obj)
            }
    
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return array
    }
    static func deleteTeam(key : Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var teams = Array<NSManagedObject>()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Favourites")
        do{
             teams = try context.fetch(fetchReq)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        for i in 0..<teams.count{
            if teams[i].value(forKey: "key") as! Int == key{
                do{
                    context.delete(teams[i])
                    try context.save()
                    print("data deleted successfully")
                    
                }catch let error as NSError{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
}
