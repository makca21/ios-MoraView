//
//  Movie.swift
//  MoraView
//
//  Created by Mislina Akça on 6.08.2024.
//

import UIKit

struct Movie{
    let title: String
    let image: UIImage
    let vote_average: Double
    let id: Int
}

struct MovieData :Codable{
    let id: Int
    let title: String
    let vote_average: Double
    
}

struct Response: Codable {
    let results: [MovieData]
}




//  #imageLiteral(resourceName: "Avengers")
let movies: [Movie] = [
    Movie(title: "Spider-man", image:  #imageLiteral(resourceName: "Spider-man"), vote_average: 4.3, id: 0),
    Movie(title: "Avengers Endgame", image: #imageLiteral(resourceName: "Avengers "), vote_average: 6.2, id: 1)
    
]




