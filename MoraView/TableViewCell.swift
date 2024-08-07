//
//  TableViewCell.swift
//  MoraView
//
//  Created by Mislina Akça on 31.07.2024.
// use this for the one on below

import UIKit

class TableViewCell : UITableViewCell{
    
    @IBOutlet weak var tableImg: UIImageView!
    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tableRating: UILabel!
    let poster_api = "https://image.tmdb.org/t/p/w1280"

    
    func setUp(with movie: MovieData) {
         tableTitle.text = movie.title
        tableRating.text = String(roundNumber(num: movie.vote_average))
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
                        self.tableImg.image = image
                    }
                } else {
                    print("Failed to convert data to UIImage")
                }
            }
            
            // Start the data task
            task.resume()
        }
    
}
