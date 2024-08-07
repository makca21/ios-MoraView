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
   
    let poster_path : String
    
    let vote_average: Double
   
    
}

struct MovieResponse: Codable {
    let results: [MovieData]
}


//  #imageLiteral(resourceName: "Avengers")
let movies: [Movie] = [
    Movie(title: "Spider-man", image:  #imageLiteral(resourceName: "Spider-man"), vote_average: 4.3, id: 0),
    Movie(title: "Avengers Endgame", image: #imageLiteral(resourceName: "Avengers "), vote_average: 6.2, id: 1)
    
]


/* call response for reference
 popular
 "backdrop_path": "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
"id": 533535,
"title": "Deadpool & Wolverine",
"original_title": "Deadpool & Wolverine",
"overview": "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
"poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
"media_type": "movie",
"adult": false,
"original_language": "en",
"genre_ids": [
    28,
    35,
    878
],
"popularity": 12303.037,
"release_date": "2024-07-24",
"video": false,
"vote_average": 7.906,
"vote_count": 1551
}
 
 
 ---
 
 now playing
 "results": [
         {
             "adult": false,
             "backdrop_path": "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
             "genre_ids": [
                 28,
                 35,
                 878
             ],
             "id": 533535,
             "original_language": "en",
             "original_title": "Deadpool & Wolverine",
             "overview": "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
             "popularity": 12303.037,
             "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
             "release_date": "2024-07-24",
             "title": "Deadpool & Wolverine",
             "video": false,
             "vote_average": 7.9,
             "vote_count": 1542
         },
*/

