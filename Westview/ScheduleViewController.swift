//
//  ScheduleViewController.swift
//  Westview App
//
//  Created by Ronak Shah on 6/10/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class ScheduleViewController: LightVC, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayNavigator: UISegmentedControl!
    
    @IBOutlet weak var navBar: UINavigationBar!
    var currentDay: String = "Monday"
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.separatorStyle = .singleLine
       
//        navigationController?.navigationBar.tintColor = commonColors.darkGold
//        navigationController?.navigationBar.barTintColor = commonColors.coolBlack
        
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
        if Date().isFinals() != -1 {
            self.currentDay = "finals \(Date().isFinals())"
            self.dayNavigator.selectedSegmentIndex = UISegmentedControlNoSegment
            self.navBar.topItem?.title! = "Finals Bell Schedule"
        }
        else if ((index) != nil) {
            self.dayNavigator.selectedSegmentIndex = index!
            self.currentDay = day
            self.navBar.topItem?.title! = "Bell Schedule"
        }
    }
    @IBAction func dayChanged(_ sender: UISegmentedControl) {
        self.currentDay = days[sender.selectedSegmentIndex]
        self.navBar.topItem?.title! = "Bell Schedule"
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ScheduleTableViewCell
        let data = schedules.getSchedule(for: self.currentDay)
        if indexPath.row == 0 {
            cell.setTitle()
           // print("setting title")
        }
        else {
            cell.setContent()
           // print("setting content")
        }
        cell.left.text! = data[indexPath.row].0
        cell.mid.text! = data[indexPath.row].1
        cell.right.text! = data[indexPath.row].2
        

       

        return cell
    }
    

// return number is number of rows for the schedule
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentDay {
        case "Monday", "Thursday":
            return 7
        case "Tuesday", "Wednesday":
            return 7
        case "Friday":
            return 6
        case "finals 1", "finals 2":
            return 5
        default:
            return 0
        }
    }
}
