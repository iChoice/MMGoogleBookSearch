//
//  Book.swift
//  BookSearch
//
//  Created by Michael on 12/15/17.
//  Copyright © 2017 MM. All rights reserved.
//

import Foundation

class Book {
    var title = ""
    var authors = [String]()
    var bookDescription = ""
    var smallThumbnailImageURL = ""
    var thumbnailImageURL = ""
    
    convenience init() {
        self.init(title: "", authors: [], smallThumbnailImageURL: "", thumbnailImageURL: "", description: "")
    }
    
    init (title: String,
               authors: [String],
               smallThumbnailImageURL:String,
               thumbnailImageURL:String,
               description:String) {
        
        self.title = title
        self.authors = authors
        self.smallThumbnailImageURL = smallThumbnailImageURL
        self.thumbnailImageURL = thumbnailImageURL
        self.bookDescription = description
        
    }
    

    
}

