//
//  CollectionViewCell.swift
//  MoraView
//
//  Created by Mislina Akça on 31.07.2024.
//

import UIKit
// use this one for the upper one
// all the things inside the cell should go here 
class CollectionViewCell: UICollectionViewCell {
   

//    for the first half
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    func setUp(with movie: Movie) {
        movieImageView.image = movie.image
        movieNameLbl.text = movie.title
        ratingLbl.text = String(movie.rating)
        
    }
    
}
