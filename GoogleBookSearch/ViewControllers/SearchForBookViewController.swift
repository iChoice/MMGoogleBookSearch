//
//  SearchForBookViewController.swift
//  BookSearch
//
//  Created by Michael on 12/13/17.
//  Copyright © 2017 MM. All rights reserved.
//

import UIKit

class SearchForBookViewController: UIViewController {

    var searchForBookVM = SearchForBookViewModel()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var bookTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.bookTitle.text = ""
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
       
        // Got tired of typing in the title during dev...
//        if self.bookTitle.text == "" {
//            self.bookTitle.text =  "Star Wars"
//        }
        
        
        self.showActivityIndicatory(uiView: self.view)
        self.searchForBookVM.search(self.bookTitle.text!) { (error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.performSegue(withIdentifier: "Show Books", sender: self)
                }
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Books" {
            let destVC = segue.destination as! BooksCollectionViewController
            destVC.bookCollectionViewModel = BookCollectionViewModel()
            destVC.bookCollectionViewModel.books = searchForBookVM.books
        }

    }
    
    func showActivityIndicatory(uiView: UIView) {
        self.activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        self.activityIndicator.activityIndicatorViewStyle = .gray
        self.activityIndicator.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2);
        self.activityIndicator.startAnimating()
    }
}



func hexStringToUIColor (hex:String, alpha:Double) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgb:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgb)
    
    return UIColor(
        red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgb & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}
