//
//  ViewController.swift
//  task
//
//  Created by khaled nazlawy on 2/6/18.
//  Copyright © 2018 khaled nazlawy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url = "https://api.github.com/users/apple/repos"
    var ReporsitoryArr = [Repository]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadurl()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadurl (){
        let AppURL=URL(string: url)!
        let data = try! Data(contentsOf: AppURL)
        let json = try! JSONSerialization.jsonObject(with: data) as! NSArray
        for item in json{
            let itemRep = item as! [String:Any]
            //print(itemRep["name"]!)
            let name : String = itemRep["name"] as! String
            let descrption : String = itemRep["description"] as? String ?? ""
            let language : String = itemRep["language"] as! String
            let last_update : String = itemRep["updated_at"] as! String
            let NumberofForks : Int = itemRep["forks_count"] as! Int
            let stragersCount : Int = itemRep["stragersCount"] as? Int ?? 0
            let url:String = itemRep["html_url"] as! String
            let stargazer_url :String = itemRep["stargazers_url"] as! String
            print(name)
            print(descrption)
            print(language)
            print(last_update)
            print(NumberofForks)
            print(stragersCount)
            print(stargazer_url)
            self.ReporsitoryArr.append(Repository(nameOfRep: name, descrption: descrption, programmingLang: language, last_update: last_update, numberOfForks: NumberofForks, stragersCount: stragersCount, html_url: url, stargazers_url: stargazer_url))
            
 //          self.tableView.reloadData()
            
        }
        self.tableView.reloadData()
        
    }
    

  

}
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReporsitoryArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryCell
        cell.labelNameOfRep.text = ReporsitoryArr[indexPath.row].nameOfRep
        cell.labelDescrption.text = ReporsitoryArr[indexPath.row].descrption
        cell.labelNumberOfForks.text = "Stargazers count: \(String(describing: ReporsitoryArr[indexPath.row].numberOfForks!))"
        cell.labelLast_update.text = ReporsitoryArr[indexPath.row].last_update
        cell.labelProgrammingLang.text = ReporsitoryArr[indexPath.row].programmingLang
        cell.LabelStragersCount.text = "number of forks: \(String(describing: ReporsitoryArr[indexPath.row].stragersCount!))"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: ReporsitoryArr[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dis=segue.destination as?  WebViewController{
            
            if  let repository=sender as? Repository {
                dis.UrlAPI = repository
            }
        }
   
}

}
