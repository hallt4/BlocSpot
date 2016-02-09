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
    
    
    var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a mapView
        mapView = MKMapView()
        
        //set vie to mapView
        view = mapView
        
        //segmented views for different types of maps
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        //layout constraints for the seg control, anchor to view
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        //activate constraints
        topConstraint.active = true
        
        leadingConstraint.active = true
        
        trailingConstraint.active = true
        
        // initial location set to Lehi, UT
        let initialLocation = CLLocation(latitude: 40.57, longitude: -111.75)
        
        
         centerMapOnLocation(initialLocation)
    }
    let regionRadius: CLLocationDistance = 50000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }

    
}

