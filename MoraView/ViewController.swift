//
//  ViewController.swift
//  MoraView
//
//  Created by Mislina Akça on 26.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [movieData(sectionType: "Action", movies: ["Avengers Endgame", "Spider-man"])]
    let section = ["action", "drama"] // delete later
    
    // URL of the API + API key
    let apiUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=e1d120dfce09b51437ec52750a0e41a1"
    
    @IBOutlet weak var collectionView: UICollectionView! // this might not be true
    @IBOutlet weak var seeMoreActionTop: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ensure the URL is valid
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        
     
        fetchMovies(from: url) { movies in
            if let movies = movies {
                for movie in movies {
                    print("ID: \(movie.id), Title: \(movie.title), Vote Average: \(movie.vote_average)")
                }
            } else {
                print("Failed to fetch or decode movies.")
            }
        }
    }
    
   
       
    
}
       
       
       func fetchMovies(from url: URL, completion: @escaping ([MovieData]?) -> Void) {
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   print("Error fetching data: \(error)")
                   completion(nil)
                   return
               }
               
               guard let data = data else {
                   print("No data received")
                   completion(nil)
                   return
               }
               
               do {
                   let response = try JSONDecoder().decode(Response.self, from: data)
                   completion(response.results)
               } catch {
                   print("Error decoding JSON: \(error)")
                   completion(nil)
               }
           }
           task.resume()

}


// new extension for the extra functionalities
// MARK: - extended methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count // display same amount of movies for each section
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
         cell.setUp(with: movies[indexPath.row])
         
        return cell
    }
}


// added for the first portion later
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setUp(with: movies[indexPath.row])
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 211, height: 282)
//        adding this part solved everything, ask this part
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title)
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  165// Setting the desired height here
    }
    
}
