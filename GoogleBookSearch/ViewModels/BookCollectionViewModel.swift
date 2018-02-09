//
//  BookTableViewModel.swift
//  BookSearch
//
//  Created by Michael on 12/14/17.
//  Copyright © 2017 MM. All rights reserved.
//

import Foundation

class BookCollectionViewModel {
    var books = Books()
    
    func returnAuthorsString(book:Book) -> String {
        var authorsStr = ""
        for author in book.authors {
            authorsStr += "\(author)\n"
        }
        return authorsStr
    }

    
    
}
