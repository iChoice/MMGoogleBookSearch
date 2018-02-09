//
//  BookDetailViewController.swift
//  GoogleBookSearch
//
//  Created by Michael on 2/6/18.
//  Copyright © 2018 MM. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var viewModel = BookDetailViewModel()
    var book = Book()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book Details"
        self.view.backgroundColor = UIColor.white
        
        GetBooksServicesAPI().getImageFromURL(urlStr: self.book.thumbnailImageURL) { (imageData, error) in
            if let bookImage = imageData {
                DispatchQueue.main.async {
                    let bookCoverImage = UIImageView.init(image: UIImage(data:bookImage))
                    bookCoverImage.frame = CGRect(x: 50, y: 100, width: self.view.frame.width - 100, height: self.view.frame.height - 300)
                    bookCoverImage.contentMode = UIViewContentMode.scaleAspectFit
                    self.view.addSubview(bookCoverImage)
                }
            }
        }
        
        let bookTitle = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 50 ))
        bookTitle.text = book.title
        bookTitle.font = UIFont.boldSystemFont(ofSize: 20)
        bookTitle.textAlignment = NSTextAlignment.center
        bookTitle.numberOfLines = 0
        self.view.addSubview(bookTitle)
        
        let bookDescriptionView = UITextView(frame:  CGRect(x: 20, y: self.view.frame.height - 150, width: self.view.frame.width-40, height: 200 ))
        bookDescriptionView.text = book.bookDescription
        bookDescriptionView.textAlignment = .center
        self.view.addSubview(bookDescriptionView)
    }
}
