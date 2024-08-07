//
//  Movie.swift
//  MoraView
//
//  Created by Mislina Akça on 6.08.2024.
//

import UIKit

struct Movie {
    let title: String
    let image: UIImage
    let rating: Double
    
}
//  #imageLiteral(resourceName: "Avengers")
let movies: [Movie] = [
    Movie(title: "Spider-man", image:  #imageLiteral(resourceName: "Spider-man"), rating: 4.3),
    Movie(title: "Avengers Endgame", image: #imageLiteral(resourceName: "Avengers "), rating: 6.2)
    
]


