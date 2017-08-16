//
//  BellScheduleViewController.swift
//  Westview App
//
//  Created by Ronak Shah on 6/10/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class ScheduleViewController: LightVC, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayNavigator: UISegmentedControl!
    
    var currentDay: String = "Monday"
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        navigationController?.navigationBar.tintColor = commonColors.darkGold
        navigationController?.navigationBar.barTintColor = commonColors.coolBlack
        
        // Do any additional setup after loading the view.
        getCurrentDay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCurrentDay()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentDay() {
        let day = Date().dayOfWeek()!
        let index = days.index(of: day)
        if ((index) != nil) {
            self.dayNavigator.selectedSegmentIndex = index!
            self.currentDay = day
        }
    }
    @IBAction func dayChanged(_ sender: UISegmentedControl) {
        self.currentDay = days[sender.selectedSegmentIndex]
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ScheduleTableViewCell
        let data = schedules.getSchedule(for: self.currentDay)
        if indexPath.row == 0 {
            cell.setTitle()
        }
        else {
            cell.setContent()
        }
        cell.left.text! = data[indexPath.row].0
        cell.mid.text! = data[indexPath.row].1
        cell.right.text! = data[indexPath.row].2
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentDay {
        case "Monday", "Friday":
            return 6
        case "Tuesday", "Thursday":
            return 7
        case "Wednesday", "Friday":
            return 6
        case "Finals": //to be implemented
            return 4
        default:
            return 0
        }
    }
}
