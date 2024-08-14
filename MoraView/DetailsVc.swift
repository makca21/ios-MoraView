//
//  DetailsVc.swift
//  MoraView
//
//  Created by Mislina Akça on 12.08.2024.
//

import UIKit

class DetailsVc : UIViewController {
    
    var received: MovieData?
    let poster_api = "https://image.tmdb.org/t/p/w1280"

    @IBOutlet weak var imgView: UIImageView!
    
   
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    
    let genreDictionary: [Int: String] = [
        28: "Action",
        12: "Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751: "Family",
        14: "Fantasy",
        36: "History",
        27: "Horror",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = received {
                    nameLbl.text = data.title
                    ratingLbl.text = String(data.adult)
                    let api = poster_api + data.poster_path
                    fetchImage(api: api)
                    scoreLbl.text = String(roundNumber(num: data.vote_average))
                    languageLbl.text = data.original_language
                    detailsLbl.text = data.overview
                    categoryLbl.text = getGenreNames(from: data.genre_ids)
                
                }
        else {
            print("no data received")
        }
        
    }
 
    func roundNumber(num : Double) -> Double{
        let roundedValue = (num * 10).rounded() / 10
        return roundedValue
    }


    func fetchImage(api : String) {
        
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
                        self.imgView.image = image
                    }
                } else {
                    print("Failed to convert data to UIImage")
                }
            }
            
            // Start the data task
            task.resume()
        }
    
    func getGenreNames(from codes: [Int]) -> String {
        let genreNames = codes.compactMap { genreDictionary[$0] }
        return genreNames.joined(separator: ", ")
    }

    
    
}


    
    
    

