//
//  Movie.swift
//  TheMovieDB
//
//  Created by Jason on 1/11/15.
//

import UIKit
import CoreData

@objc(Movie)

class Movie : NSManagedObject {
    
    struct Keys {
        static let Title = "title"
        static let PosterPath = "poster_path"
        static let ReleaseDate = "release_date"
        static let ID = "id"
    }
    
    @NSManaged var title: String
    @NSManaged var id: Int
    @NSManaged var posterPath: String?
    @NSManaged var releaseDate: NSDate?
    // @NSManaged var actor: Person
    @NSManaged var actor: Person
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    convenience init(context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    /*
    // Step 6: Override  the two argument init method
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    // Step 7: Create the convenience init that accepts a context and a dictionary
    convenience init(context: NSManagedObjectContext, dictionary: [String : AnyObject]) {
        
        let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        title = dictionary[Keys.Title] as! String
        id = dictionary[Keys.ID] as! Int
        
        posterPath = dictionary[Keys.PosterPath] as? String
        releaseDate = dictionary[Keys.ReleaseDate] as? NSDate
        
        
    }
    */
    /*
    init(dictionary: [String : AnyObject]) {
        
        // Dictionary
        title = dictionary[Keys.Title] as! String
        id = dictionary[TheMovieDB.Keys.ID] as! Int
        posterPath = dictionary[Keys.PosterPath] as? String
        
        if let dateString = dictionary[Keys.ReleaseDate] as? String {
            if let date = TheMovieDB.sharedDateFormatter.dateFromString(dateString) {
                releaseDate = date
            }
        }
    }
    */
    
    var posterImage: UIImage? {
        
        get {
            return TheMovieDB.Caches.imageCache.imageWithIdentifier(posterPath)
        }
        
        set {
            TheMovieDB.Caches.imageCache.storeImage(newValue, withIdentifier: posterPath!)
        }
    }
}



