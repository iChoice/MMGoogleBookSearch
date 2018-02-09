//
//  BooksCollectionViewController.swift
//  BookSearch
//
//  Created by Michael on 12/13/17.
//  Copyright © 2017 MM. All rights reserved.
//

import UIKit

class BooksCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    lazy var bookCollectionViewModel = BookCollectionViewModel()
    
    //MARK: View Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.title = "Books"
        self.collectionView.reloadData()
        
    }
    
    // MARK: - Table view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return self.bookCollectionViewModel.books.booksFound.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BooksCollectionViewCell
        
        let book = self.bookCollectionViewModel.books.booksFound[indexPath.row] as Book
        cell.book = book
        
        let currentCellsmallThumbnailImageURL = book.smallThumbnailImageURL // Store this to make sure we are on the same cell when the image finally downloads (isn't reused).
        cell.smallThumbnailURL = book.smallThumbnailImageURL
        cell.title.text = book.title
        cell.authors.text = self.bookCollectionViewModel.returnAuthorsString(book: book)

        GetBooksServicesAPI().getImageFromURL(urlStr: book.smallThumbnailImageURL) { (imageData, error) in
            if let bookImage = imageData {
                DispatchQueue.main.async {
                    if cell.smallThumbnailURL == currentCellsmallThumbnailImageURL { // Make sure we are on the same cell when the image finally downloads (cell didn't get reused).
                        cell.imageView.image = UIImage(data:bookImage)
                        cell.layoutSubviews()
                    }
                }
            }
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookDetailsVC = BookDetailViewController()
        let selectedCell = collectionView.cellForItem(at: indexPath) as! BooksCollectionViewCell
        bookDetailsVC.book = selectedCell.book
        self.navigationController?.pushViewController(bookDetailsVC, animated: true)
    }
    
}






