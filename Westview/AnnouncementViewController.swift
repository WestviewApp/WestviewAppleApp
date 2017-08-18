//
//  ViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/2/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit
import Kanna
import Alamofire

class AnnouncementViewController: LightVC, UIWebViewDelegate {

    typealias Announcement = String
    var announcements: [Announcement] = []
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var announcementView: UITableView!
    let url = "https://www.powayusd.com/en-US/Schools/HS/WVHS/home/Announcements"
    @IBOutlet weak var attendanceView: CardView!
    @IBOutlet weak var gradesView: CardView!
    @IBOutlet weak var canvasView: CardView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        //webView.loadRequest(URLRequest(url: URL(string: "https://www.powayusd.com/en-US/Schools/HS/WVHS/home/Announcements")!))
        scrapeAnnouncements()
        
        let touchGestureGrades = UITapGestureRecognizer(target: self, action:  #selector (self.openSynergy (_:)))
        let touchGestureCanvas = UITapGestureRecognizer(target: self, action:  #selector (self.openCanvas(_:)))
        let touchGestureAttendance = UITapGestureRecognizer(target: self, action:  #selector (self.openAttendance(_:)))
        self.gradesView.addGestureRecognizer(touchGestureGrades)
        self.canvasView.addGestureRecognizer(touchGestureCanvas)
        self.attendanceView.addGestureRecognizer(touchGestureAttendance)
        

    }
    
    func openSynergy(_ sender:UITapGestureRecognizer) {
        UIApplication.shared.openURL(URL(string: "https://sis.powayusd.com")!)
    }
    
    func openCanvas(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.openURL(URL(string: "https://poway.instructure.com")!)
    }
    func openAttendance(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.openURL(URL(string: "https://www.powayusd.com/en-US/Schools/HS/WVHS/parent-Resources/Attendance")!)
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        self.loadingImage.isHidden = true
        let url = request.url!.absoluteString
        if url.range(of: "applewebdata") != nil {
            var link = url.components(separatedBy: "en-US/")[1]
            link = "https://www.powayusd.com/en-US/\(link)"
            UIApplication.shared.openURL(URL(string: link)!)
            return false
        }
        
        return true
    }
    
    func scrapeAnnouncements() -> Void {
        Alamofire.request(url).responseString { response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }
    
    func parseHTML(html: String) -> Void {
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            for newsList in doc.css("div[class^='newsList']") {
                //let newsListString = newsList.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                
                
                let _ = newsList.toHTML
                if(newsList.text != nil) {
                    let h = newsList.toHTML
                    let css = "<style>@import url('https://fonts.googleapis.com/css?family=Roboto:400,500');.newsItem p{font-family: 'Roboto', sans-serif; font-family: 400; font-size: 15px; color: #8F8E94;}.newsItem p strong a{font-weight: 500; font-size: 17px; color: #030303; text-decoration: none;}</style>"
                    let final = h! + css
                    webView.loadHTMLString(final, baseURL: nil)
                }
                //webView.loadHTMLString(newsList?.toHTML, baseURL: nil)
            }
        }
    }
    
    


}

