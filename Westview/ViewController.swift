//
//  ViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/2/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit


class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    typealias Announcement = String
    var announcements: [Announcement] = []
    
    @IBOutlet weak var announcementView: UITableView!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnnouncement(html: "<div class=newsItem><p><strong><a href=/en-US/Schools/HS/WVHS/Home/Announcements/College-Math-Classes-after-AP-Calculus-BC>College Math Classes after AP Calculus BC</a></strong><p>Students may enroll in math courses, including Multivariable Calculus (Calculus III), Linear Algebra, and Differential Equations, and earn college credit via Palomar and UCSD. Offerings are for Summer, Fall and Spring and registration has begun for some of these courses already. Click here to view the details of these courses and instructions on registering. Contact Diana Loo, dloo@powayusd.com with questions.</div>")
        self.announcementView.reloadData()
    }
    func addAnnouncement(html: String) {
        let css = "<style>@import url(https://fonts.googleapis.com/css?family=Roboto:400,500);.newsItem p strong a{text-decoration:none;color:#000}.newsItem p{font-family:Roboto,sans-serif;color:#000}</style>"
        let total = "\(css)\(html)"
        self.announcements.append(total)
    }
    
    // MARK Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total of \(announcements.count) announcements!)")
        return announcements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell") as! AnnouncementTableViewCell
        
        cell.webView.loadHTMLString(self.announcements[indexPath.row], baseURL: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let announcement = self.announcements[indexPath.row]
        let rows = announcement.components(separatedBy: "\n").count
        return CGFloat(20 * rows)
    }
    


}

