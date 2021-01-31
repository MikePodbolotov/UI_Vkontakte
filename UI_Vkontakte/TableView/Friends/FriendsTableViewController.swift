//
//  FriendsTableViewController.swift
//  UI_Vkontakte
//
//  Created by Михаил Подболотов on 01.01.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends = [
        Friend(name: "Иван", lastName: "Иванов", age: 38, avatar: "avatar_1"),
        Friend(name: "Денис", lastName: "Иванов", age: 16, avatar: ""),
        Friend(name: "Мария", lastName: "Иванова", age: 8, avatar: ""),
        Friend(name: "Елена", lastName: "Иванова", age: 38, avatar: ""),
        Friend(name: "Петр", lastName: "Петров", age: 30, avatar: "avatar_2"),
        Friend(name: "Дмитрий", lastName: "Петухов", age: 20, avatar: ""),
        Friend(name: "Евгений", lastName: "Попов", age: 40, avatar: ""),
        Friend(name: "Евгений", lastName: "Павлов", age: 35, avatar: ""),
        Friend(name: "Дон", lastName: "Пончик", age: 30, avatar: ""),
        Friend(name: "Артем", lastName: "Кузнецов", age: 35, avatar: "avatar_4"),
        Friend(name: "Денис", lastName: "Сидоров", age: 36, avatar: ""),
        Friend(name: "Оксана", lastName: "Сидорова", age: 26, avatar: ""),
        Friend(name: "Денис", lastName: "Смирнов", age: 46, avatar: ""),
        Friend(name: "Ольга", lastName: "Смирнова", age: 46, avatar: ""),
        Friend(name: "Майкл", lastName: "Медведь", age: 36, avatar: ""),
        Friend(name: "Лариса", lastName: "Лиса", age: 27, avatar: "avatar_3")
    ]
    var sections = [String]()
    var chosenFriend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for friend in friends {
            let char = friend.lastName.prefix(1)
            if sections.contains(String(char)) { continue }
            sections.append(String(char))
        }
        sections.sort(by: <)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toFriend" {
                if let destination = segue.destination as? FriendCollectionViewController {
                    destination.friend = chosenFriend
                }
                else if segue.identifier == "toFriend" {
                    
                }
            }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var tempArr = [Friend]()
        for friend in friends {
            if friend.lastName.prefix(1) == sections[section] {
                tempArr.append(friend)
                }
        }
        return tempArr.count
        
//        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsTableViewCell {
            var tempArr = [Friend]()
            for friend in friends {
                if friend.lastName.prefix(1) == sections[indexPath.section] {
                    tempArr.append(friend)
                }
            }
            cell.friendLabel.text = "\(tempArr[indexPath.row].lastName) \(tempArr[indexPath.row].name)"
            cell.friendStatusLabel.text = "Online"
            let avatar = tempArr[indexPath.row].avatar != "" ? tempArr[indexPath.row].avatar : "img_friends"
            cell.friendImage.image = UIImage(named: avatar)
            cell.friendImage.layer.cornerRadius = cell.friendImage.frame.width / 2
            cell.friendImage.layer.masksToBounds = true
            
            //                cell.friendLabel.text = "\(friends[indexPath.row].lastName) \(friends[indexPath.row].name)"
            //                cell.friendStatusLabel.text = "Online"
            //                let avatar = friends[indexPath.row].avatar != "" ? friends[indexPath.row].avatar : "img_friends"
            //                cell.friendImage.image = UIImage(named: avatar)
            //                cell.friendImage.layer.cornerRadius = cell.friendImage.frame.width / 2
            //                cell.friendImage.layer.masksToBounds = true
            //            Тень не работает %(
            //            cell.friendImage.layer.shadowColor = UIColor.black.cgColor
            //            cell.friendImage.layer.shadowOpacity = 0.5
            //            cell.friendImage.layer.shadowRadius = 8
            //            cell.friendImage.layer.shadowOffset = CGSize.zero
            //            cell.friendImage.layer.masksToBounds = false
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        var tempArr = [Friend]()
        for friend in friends {
            if friend.lastName.prefix(1) == sections[indexPath.section] {
                tempArr.append(friend)
            }
        }
        
        chosenFriend = tempArr[indexPath.row]
        performSegue(withIdentifier: "toFriend", sender: self)
    }

}
