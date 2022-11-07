import Foundation
import CoreData
import UIKit

final class CoreDataManager {

    init() {}

    public func fetchAllFavorites() -> [FavoriteSport] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Error while reaching the AppDelegate")
            return []
        }
        var allFavoriteSports: [FavoriteSport] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FavoriteSport>(entityName: "FavoriteSport")

        do {
            allFavoriteSports = try managedContext.fetch(fetchRequest)
        } catch {
            print(error)
        }

        return allFavoriteSports
    }

    public func addFavoriteSport(sport: Sport) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Error while reaching the AppDelegate")
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteSport", in: managedContext)!
        let favoriteSport = NSManagedObject(entity: entity, insertInto: managedContext)
        favoriteSport.setValuesForKeys([
            "idSport": sport.idSport,
            "strFormat": sport.strFormat.rawValue,
            "strSport": sport.strSport,
            "strSportThumb": sport.strSportThumb,
            "strSportDescription": sport.strSportDescription,
            "strSportIconGreen": sport.strSportIconGreen
        ])

        do {
            try managedContext.save()
        } catch {
            print(error)
        }

    }

    public func deleteAllFavoriteSports() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FavoriteSport")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }

    public func deleteAFavoriteSport(_ sport: Sport) {
        guard let appDelete = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let allFavoriteSports = self.fetchAllFavorites()
        let managedContext = appDelete.persistentContainer.viewContext
        for index in allFavoriteSports where sport.idSport == index.idSport {
            managedContext.delete(index)
        }

        do {
            try managedContext.save()
        } catch {
            print(error)
        }
    }

}
