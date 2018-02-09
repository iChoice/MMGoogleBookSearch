//
//  SearchForBookViewModel.swift
//  BookSearch
//
//  Created by Michael on 12/14/17.
//  Copyright © 2017 MM. All rights reserved.
//

import Foundation

class SearchForBookViewModel {
    
    lazy var getBooksApi = GetBooksServicesAPI()
    var books = Books()
    
    func search (_ title:String, completionHandler: @escaping (NSError?) -> Void) {
   
        self.books = Books() // Clear out the books from the last search
        self.getBooksApi.bookSearchFromGoogleBooks(title: title, completion: { (responseData,error)  in
                if let v = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments) as AnyObject {
                    if let booksFoundAtGoogle = v["items"] as? [[String:AnyObject]] {
                        for bookImported in booksFoundAtGoogle {
                            let volumeInfo = bookImported["volumeInfo"]!
                            print("volume Info: \(volumeInfo)")
                            
                            var imageLinks = ["":""]
                            var smallThumbnailURL = ""
                            if let imageURLs = volumeInfo["imageLinks"] as? [String:String] {
                                imageLinks = imageURLs
                                smallThumbnailURL = imageLinks["smallThumbnail"]!
                            }
                            
                            let description = volumeInfo["description"] as? String ?? "" 
                            
                            let thumbnailImageURL =  imageLinks["thumbnail"]!
                            var authors = [""] // Make sure their are authors listed
                            if let a = volumeInfo["authors"] as? [String] {
                                authors = a
                            }
                            let book = Book(title:volumeInfo["title"] as! String,
                                            authors: authors ,
                                            smallThumbnailImageURL:smallThumbnailURL,
                                            thumbnailImageURL:thumbnailImageURL,
                                            description:description)
                            
                            self.books.booksFound.append(book)
                        }
                    }
                    completionHandler(nil)
                }
        })
    }
}
