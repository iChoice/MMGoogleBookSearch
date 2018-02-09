//
//  GetBooksServicesAPI.swift
//  BookSearch
//
//  Created by Michael on 12/14/17.
//  Copyright © 2017 MM. All rights reserved.
//

import Foundation


class GetBooksServicesAPI {
    
    lazy var session = URLSession.shared

    func bookSearchFromGoogleBooks (title: String,
                                    completion: @escaping (_ resultData: Data?, Error?) -> Void ) {

        let BOOKAPIKEY = Keys.GOOGLEBOOKSAPIKEY

        let urlString = "https://www.googleapis.com/books/v1/volumes?q=" + title + "&key=" + BOOKAPIKEY + "&maxResults=40"
        let urlStringSpacesEncoded = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!        // Need to percent encode this for spaces
        let url = URL(string:  urlStringSpacesEncoded)

        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let response = response {
                print(response)
            }
            if let error = error {
                print(error)
            }
            completion(data,error)
        })
        task.resume()
    }
    
    
    func getImageFromURL (urlStr: String,
                   completion: @escaping (_ resultData: Data?, Error?) -> Void ) {
        
        if let url = URL(string:  urlStr) {
            let request =  NSMutableURLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request as URLRequest, completionHandler:
                { (data: Data?, response: URLResponse?, error: Error?) in
                    if let response = response {
                        print(response)
                    }
                    if let error = error {
                        print(error)
                    }
                    completion(data,error)
                })
                task.resume()
        } else {
            completion(nil,nil)
        }
    }
}




