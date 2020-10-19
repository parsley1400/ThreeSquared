//
//  RankingViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/19.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RankingViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    var userArray: [String:NSDictionary] = [:]
    var tableCount: Int = 0
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        getData()
        
        table.dataSource = self
    }
    
    func getData() {
//        let userID = Auth.auth().currentUser?.uid
        
//        let defaultPlace = ref.child("user")
//        defaultPlace.observe(.value ) {
//          (snap: DataSnapshot) in
//          self.users = snap.value! as! [[String]]
//          print(self.users)
//        }
        
        ref.child("user").observeSingleEvent(of: .value) { (snap,error) in
                let snapData = snap.value as? [String:NSDictionary]
                if snapData == nil {
                    return
                }
                for (_,user) in snapData! {
                    if let _ = user["userid"] as? String {
                    }
                    if let _ = user["username"] as? String {
                    }
                    if let _ = user["highscore"] as? String {
                    }
            
                }
            print(snapData ?? " ")
            self.tableCount = snapData?.count as! Int
            
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Int(tableCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
