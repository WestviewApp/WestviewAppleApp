//
//  CalendarViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class CalendarViewController: LightVC {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(URLRequest(url: URL(string: "https://calendar.google.com/calendar/embed?showTitle=0&showTabs=0&showCalendars=0&showPrint=0&src=westviewwolverines%40gmail.com&ctz=America/Los_Angeles")!))
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.webView.loadRequest(URLRequest(url: URL(string: "https://calendar.google.com/calendar/embed?showTitle=0&showTabs=0&showCalendars=0&showPrint=0&src=westviewwolverines%40gmail.com&ctz=America/Los_Angeles")!))
    }
    @IBAction func openInSafari(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://calendar.google.com/calendar/embed?showTitle=0&showTabs=0&showCalendars=0&showPrint=0&src=westviewwolverines%40gmail.com&ctz=America/Los_Angeles")!)

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
