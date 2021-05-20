//
//  MapViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit
//import MapKit
//import GoogleMaps
extension String {
  func stringByAddingPercentEncodingForRFC3986() -> String? {
    let unreserved = "-._~/?"
    let allowed = NSMutableCharacterSet.alphanumeric()
    allowed.addCharacters(in: unreserved)
    return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
  }
}
class MapViewController: LightVC { //}, GMSMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var webView: UIWebView!
//    @IBOutlet weak var mapView: GMSMapView!
//    var locationManager = CLLocationManager()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.locationManager.startUpdatingLocation()
     /*   let url = NSURL (string: "https://www.google.com/maps/d/embed?mid=1UuI1sahr6xefo4F-uFgtxNIS_yw");
        let request = NSURLRequest(URL: url as! URL);
        self.webView.loadRequest(request)*/
        var string = "https://www.google.com/maps/d/embed?mid=1UuI1sahr6xefo4F-uFgtxNIS_yw"
        
        if let url = URL(string: string) {
               let request = URLRequest(url: url)
               webView.loadRequest(request)
           } else {
       // Do something like. Show an alert that could not load webpage etc.
       }
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
