//
//  MapViewController.swift
//  Westview
//
//  Created by Ronak Shah on 8/15/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: LightVC, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(32.967277,  -117.149097), span: span)
        self.mapView.setRegion(region, animated: false)
        self.mapView.showsUserLocation = true
        self.mapView.mapType = MKMapType.satellite
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
