//
//  data.swift
//  MoraView
//
//  Created by Mislina Akça on 1.08.2024.
//

import Foundation

struct movieData {
    let sectionType : String
        let movies: [String] // passing an array of movie names these all will be replaced by the api calls later
}

var data = [movieData(sectionType: "Action", movies: ["Avengers Endgame", "Spider-man"])]

