//
//  ListUserViewController.swift
//  Atv2Apps
//
//  Created by Marcelo Simim on 20/09/21.
//

import UIKit
import Firebase

class ListUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        tableView.dataSource = self
    }
    
    func loadUsers(){
        db.collection("users").getDocuments { querySnapshot, error in
            if let e = error{
                print(e)
            }else{
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            let data = doc.data()
                            self.users.append(User(name: data["name"] as! String, email: data["email"] as! String, imageIndex: data["image"] as! Int))
                            self.tableView.reloadData()
                        }
                    }
                
            }
        }
    }
}

extension ListUserViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        cell.textLabel?.text = "\(users[indexPath.row].name) : \(users[indexPath.row].email)"
        cell.imageView?.image = users[indexPath.row].getImage()
            return cell
    }
    
    
}
