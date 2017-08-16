//
//  HandbookViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class HandbookViewController: LightVC {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pdfURL = Bundle.main.url(forResource: "handbook", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                
                self.webView.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                print("should work")
                
            }
            catch {
                print("whee errors")
                // catch errors here
            }
            
        }
        else {
            print("dafaq")
        }
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
