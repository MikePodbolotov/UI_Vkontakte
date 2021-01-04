//
//  FriendCollectionViewController.swift
//  UI_Vkontakte
//
//  Created by Михаил Подболотов on 01.01.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FriendCollectionViewCell {
            cell.nameFriendLabel.text = "Друг \(indexPath.row)"
            cell.friendImage.image = UIImage(systemName: "sun.max")
            return cell
        }
    
        // Configure the cell
    
        return UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate


}
