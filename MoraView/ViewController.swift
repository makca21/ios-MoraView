//
//  ViewController.swift
//  MoraView
//
//  Created by Mislina Akça on 26.07.2024.
//

import UIKit



class ViewController: UIViewController {
    
    var currentMovies : [MovieData] = []
    var popularMovies: [MovieData] = []
    // URLs of the necessary APIs + API key
    let current_url = "https://api.themoviedb.org/3/movie/now_playing?api_key=e1d120dfce09b51437ec52750a0e41a1"
    let popular_url = "https://api.themoviedb.org/3/trending/movie/day?api_key=e1d120dfce09b51437ec52750a0e41a1"
    
    @IBOutlet weak var collectionView: UICollectionView! // this might not be true
    @IBOutlet weak var seeMoreActionTop: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ensure the URL is valid
        guard let url_now = URL(string: current_url) else {
            print("Invalid URL")
            return
            
        }
        
        guard let url_popular = URL(string: popular_url) else {
            print("Invalid URL")
            return
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        
            fetchMovies(from: url_now) { movies in
                
                if let movies = movies {
                    print("these movies are available in cinemas:")
                    for movie in movies {
                        let data = MovieData(id: movie.id, title: movie.title, overview: movie.overview, poster_path: movie.poster_path, adult: movie.adult, original_language: movie.original_language, vote_average: movie.vote_average, genre_ids: movie.genre_ids)
                        self.currentMovies.append(data)
                        print("ID: \(movie.id), Title: \(movie.title), Vote Average: \(movie.vote_average)")
                    }
                    DispatchQueue.main.async {
                               self.collectionView.reloadData()
                           }
                } else {
                    print("Failed to fetch or decode movies.")
                }
            }
        
        fetchMovies(from: url_popular) { movies in
            
            if let movies = movies {
                print("these movies are popular:")
                for movie in movies {
                    let data = MovieData(id: movie.id, title: movie.title, overview: movie.overview, poster_path: movie.poster_path, adult: movie.adult, original_language: movie.original_language, vote_average: movie.vote_average, genre_ids: movie.genre_ids)
                    self.popularMovies.append(data)
                    print("ID: \(movie.id), Title: \(movie.title), Vote Average: \(movie.vote_average)")
                }
                DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
            } else {
                print("Failed to fetch or decode movies.")
            }
        }
        
    } // the end of view didload
    
    
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
                   let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                   completion(response.results)
               } catch {
                   print("Error decoding JSON: \(error)")
                   completion(nil)
               }
           }
           task.resume()

}
    
        


//  extension for the view functionalities
// MARK: - extended methods
extension ViewController: UITableViewDataSource, UITableViewDelegate, MyTableViewCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.popularMovies.count // display all  of movies for the section (no sections all at once)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setUp(with: self.popularMovies[indexPath.row])
        cell.delegate = self

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  165 // Setting the desired height here
    }
    
    func didTapButton(in cell: TableViewCell) {
           // Find the index path of the tapped cell
           if let indexPath = tableView.indexPath(for: cell) {
               let selectedData = self.popularMovies[indexPath.row]
               performSegue(withIdentifier: "ToDetailsVc2", sender: selectedData)
           }
       }
    
       
}

extension ViewController : UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, MyCollectionViewCellDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setUp(with: self.currentMovies[indexPath.row])
        cell.delegate = self // setting the delegate
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 211, height: 282)
//        adding this part solved everything, ask this part
    }
    
    
    func didTapButton(in cell: CollectionViewCell) {
           // Find the index path of the tapped cell
           if let indexPath = collectionView.indexPath(for: cell) {
               let selectedData = self.currentMovies[indexPath.row]
               performSegue(withIdentifier: "ToDetailsVc1", sender: selectedData)
           }
       }

       
    
    
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailsVc1" {
            if let destinationVC = segue.destination as? DetailsVc,
               let dataToPass = sender as? MovieData {
                // Configure destinationVC for the first button
                destinationVC.received = dataToPass
//                destinationVC.source = "Button1"
            }
        } else if segue.identifier == "ToDetailsVc2" {
            if let destinationVC = segue.destination as? DetailsVc,
               let dataToPass = sender as? MovieData {
                // Configure destinationVC for the second button
                destinationVC.received = dataToPass
//                destinationVC.source = "Button2"
            }
        }
    }
    
}
 
 


