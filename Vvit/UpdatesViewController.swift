//
//  UpdatesViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class UpdatesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    

    let Updates = ["Interviews for Mca","Interviews for MBA","Results of MCA final yr Will be update soon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Updates"
        updatesTableView.delegate = self
        updatesTableView.dataSource = self
        updatesTableView.tableFooterView = UIView()
    }
   
    @IBOutlet weak var updatesTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.Updates.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = updatesTableView.dequeueReusableCell(withIdentifier: "updatesCell") as UITableViewCell!
        
        cell.textLabel?.text = self.Updates[indexPath.section]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "selectedUpdates", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
