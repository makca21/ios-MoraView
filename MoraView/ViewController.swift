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
    
    @IBOutlet weak var collectionView: UICollectionView! // this might not be true
    @IBOutlet weak var seeMoreActionTop: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self

     }


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
/*extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178 // i do the exact height but dont know if its neccessary or not
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count // this is for different stacks of movie types, it should not be used for the first part
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].sectionType
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // creates 1 row for each function
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.collectionView.tag = indexPath.section
        return cell
    }

//    using the identifier of table cell
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .lightGray
    }
    
 
} */

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
