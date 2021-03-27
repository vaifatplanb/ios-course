//
//  SampleTableViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 3/27/21.
//

import UIKit

class SampleTableViewController: UITableViewController {
    
    var list = [
        "WELCOME", "TO", "MY", "COURSE", "PLAN-B", "2021"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize & register cells (MUST)
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c")
    }
    
    // Configure table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return list.count
        }else {
            return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "SECTION I"
        }else {
            return "SECTION II"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = list[indexPath.row]
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            
            cell.title.text = item
            cell.date.text = "01/02/2021"
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "c", for: indexPath)
            cell.textLabel?.text = item
            cell.accessoryType = .checkmark
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 100 }
        else { return 120 }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAP on \(indexPath.row)")
    }
}
