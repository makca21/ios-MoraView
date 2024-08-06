//
//  TableViewCell.swift
//  MoraView
//
//  Created by Mislina Akça on 31.07.2024.
// use this for the one on below

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    
    var data = [movieData(sectionType: "Action", movies: ["Spider-man", "Avengers Endgame"])]

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionView_2: UICollectionView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


extension TableViewCell { // bir kısım reduce edildi recheck et  min: 14.21
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[collectionView.tag].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
               // table views
               cell.images.image = UIImage(named: data[collectionView.tag].movies[indexPath.row])
               return cell
     }
    
    
}
