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

class MapViewController: LightVC { //}, GMSMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var webView: UIWebView!
//    @IBOutlet weak var mapView: GMSMapView!
//    var locationManager = CLLocationManager()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.locationManager.startUpdatingLocation()

        self.webView.loadRequest(URLRequest(url: URL(string: "https://www.google.com/maps/d/embed?mid=1UuI1sahr6xefo4F-uFgtxNIS_yw")!))
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
