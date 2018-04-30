//
//  eventsViewController.swift
//  Vvit
//
//  Created by hemanth kumar on 4/14/18.
//  Copyright © 2018 hemanth kumar. All rights reserved.
//

import UIKit

class eventsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    let events = ["GD/PI on 14th April"]
    @IBOutlet weak var eventsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Events"
        eventsTable.dataSource = self
        eventsTable.delegate = self
        eventsTable.tableFooterView = UIView()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.events.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (eventsTable.dequeueReusableCell(withIdentifier:"EventsCell") as UITableViewCell?)!
        
        cell.textLabel?.text = self.events[indexPath.section]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "eventsFinalPage", sender: nil)
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

