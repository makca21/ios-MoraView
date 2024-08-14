//
//  CollectionViewCell.swift
//  MoraView
//
//  Created by Mislina Akça on 31.07.2024.
//

import UIKit
// use this one for the upper one
// all the things inside the cell should go here 

protocol MyCollectionViewCellDelegate: AnyObject {
    func didTapButton(in cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
   let poster_api = "https://image.tmdb.org/t/p/w1280"
   weak var delegate: MyCollectionViewCellDelegate?

    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    
    
   

    @IBAction func buttonTapped(_ sender: UIButton) {
            delegate?.didTapButton(in: self)
            print("Details button from now playing is tapped.")
        }

    
    func setUp(with movie: MovieData) {
        movieNameLbl.text = movie.title
        ratingLbl.text = String(roundNumber(num: movie.vote_average))
        fetchImage(posterPath: movie.poster_path)
    }
    
    func roundNumber(num : Double) -> Double{
        let roundedValue = (num * 10).rounded() / 10
        return roundedValue
    }
    
    
    func fetchImage(posterPath : String) {
            // URL of the API that returns an image
        let api = poster_api + posterPath
            guard let url = URL(string: api) else {
                print("Invalid URL")
                return
            }
            
            // Create a URLSession data task
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                // Check for errors
                if let error = error {
                    print("Error fetching image: \(error.localizedDescription)")
                    return
                }
                
                // Check if data is received
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                // Convert data to UIImage
                if let image = UIImage(data: data) {
                    // Update the UIImageView on the main thread
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                } else {
                    print("Failed to convert data to UIImage")
                }
            }
            
            // Start the data task
            task.resume()
        }
    
}
