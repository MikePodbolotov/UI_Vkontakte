//
//  FriendsTableViewController.swift
//  UI_Vkontakte
//
//  Created by Михаил Подболотов on 01.01.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends = [
        "Иванов Иван",
        "Петров Петр",
        "Кузнецов Артем",
        "Сидоров Денис",
        "Медведь Майкл",
        "Лиса Лариса",
        "Белка Стрелка"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsTableViewCell {
//            cell.friendLabel.text = "Друг \(indexPath.row)"
            cell.friendLabel.text = friends[indexPath.row]
            cell.friendImage.image = UIImage(named: "img_friends")
            cell.friendImage.layer.cornerRadius = cell.friendImage.frame.width / 2
            cell.friendImage.layer.shadowColor = UIColor.black.cgColor
            cell.friendImage.layer.shadowOpacity = 0.5
            cell.friendImage.layer.shadowRadius = 8
            cell.friendImage.layer.shadowOffset = CGSize.zero
            
            return cell
        }
        
        return UITableViewCell()
    }

}
