//
//  StarGazerViewController.swift
//  task
//
//  Created by khaled nazlawy on 2/6/18.
//  Copyright © 2018 khaled nazlawy. All rights reserved.
//

import UIKit

class StarGazerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arrStarGazer = [Users]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        loadurl()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStarGazer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "gazerCell", for: indexPath)
        cell.textLabel?.text = arrStarGazer[indexPath.row].user
        return cell
    }
    
    func loadurl (){
        let AppURL=URL(string: "https://api.github.com/repos/apple/ccs-caldavtester/stargazers")!
        let data = try! Data(contentsOf: AppURL)
        let json = try! JSONSerialization.jsonObject(with: data) as! NSArray
        for item in json{
            let itemRep = item as! [String:Any]
            let users:String = itemRep["login"] as! String
            self.arrStarGazer.append(Users(user: users))
            print(users)
            
        
            
        }
        self.tableView.reloadData()
        
    }


}
