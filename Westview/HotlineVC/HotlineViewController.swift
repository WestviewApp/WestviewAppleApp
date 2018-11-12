//
//  HandbookViewController.swift
//  Westview
//
//  Created by Anushka Gupta on 08/16/18.
//

import UIKit

class HotlineViewController: LightVC {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.webView.loadRequest(URLRequest(url: URL(string: Bundle.main.path(forResource: "hotline", ofType: "pdf")!)!))
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


