//
//  ViewController.swift
//  BlocSpot
//
//  Created by Tyler Hall on 2/8/16.
//  Copyright © 2016 Hall Mobile. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initial location set to Lehi, UT
        let initialLocation = CLLocation(latitude: 40.57, longitude: -111.59)
        
        
         centerMapOnLocation(initialLocation)
    }
    let regionRadius: CLLocationDistance = 50000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    
}

