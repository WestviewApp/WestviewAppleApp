//
//  HandbookViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Edited by Anushka Gupta on 8/16/18.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class HandbookViewController: LightVC {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.webView.loadRequest(URLRequest(url: URL(string: Bundle.main.path(forResource: "handbook", ofType: "pdf")!)!))
        
        // Do any additional setup after loading the view.
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

