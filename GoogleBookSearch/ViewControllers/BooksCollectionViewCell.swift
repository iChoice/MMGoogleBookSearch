//
//  BooksCollectionViewCell.swift
//  BookSearch
//
//  Created by Michael on 12/15/17.
//  Copyright © 2017 MM. All rights reserved.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authors: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var book = Book()
    var smallThumbnailURL = ""
    
}
