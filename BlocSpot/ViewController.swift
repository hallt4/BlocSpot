//
//  ViewController.swift
//  BlocSpot
//
//  Created by Tyler Hall on 2/8/16.
//  Copyright © 2016 Hall Mobile. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    
    let mapView = MKMapView()
    let searchBar = UISearchBar()
    var mapKitItems = [MKMapItem]()
    
    
    //MKMapViewDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set vie to mapView
        self.view.addSubview(mapView)
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        
        let topMapViewConstraint = NSLayoutConstraint(item: self.view, attribute: .Top, relatedBy: .Equal, toItem: self.mapView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let bottomMapViewConstraint = NSLayoutConstraint(item: self.view, attribute: .Bottom, relatedBy: .Equal, toItem: self.mapView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let leadingMapViewConstraint = NSLayoutConstraint(item: self.view, attribute: .Leading, relatedBy: .Equal, toItem: self.mapView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let trailingMapviewConstraint = NSLayoutConstraint(item: self.view, attribute: .Trailing, relatedBy: .Equal, toItem: self.mapView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        
        for constraint in [topMapViewConstraint, bottomMapViewConstraint, leadingMapViewConstraint, trailingMapviewConstraint]{
            constraint.active = true
        }
        
        //add text input box for map query
        
        //mapView.delegate = self
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .Minimal
        searchBar.becomeFirstResponder()
        
        view.addSubview(searchBar)
        
        //segmented views for different types of maps
//        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
//        

//        
//        segmentedControl.selectedSegmentIndex = 0
//        
//        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
//        view.addSubview(segmentedControl)
        
        //layout constraints for the search bar, anchor to view
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = searchBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = searchBar.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        
        let trailingConstraint = searchBar.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        //activate constraints
        topConstraint.active = true
        
        leadingConstraint.active = true
        
        trailingConstraint.active = true
        
        // initial location set to Lehi, UT
//        let initialLocation = CLLocation(latitude: 40.4, longitude: -111.75)
        
        
//         centerMapOnLocation(initialLocation)
    }
    let regionRadius: CLLocationDistance = 1000
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//            regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
    
//    func mapTypeChanged(segControl: UISegmentedControl){
//        switch segControl.selectedSegmentIndex {
//        case 0:
//            mapView.mapType = .Standard
//        case 1:
//            mapView.mapType = .Hybrid
//        case 2:
//            mapView.mapType = .Satellite
//        default:
//            break
//        }
//    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
    searchBar.resignFirstResponder()
    // Do the search...
        
    let request = MKLocalSearchRequest()
    request.naturalLanguageQuery = searchBar.text
    let search = MKLocalSearch(request: request)
        
    search.startWithCompletionHandler { (response, error) -> Void in
        if error == nil{
            
            if let responseVerified = response {
                self.mapKitItems = responseVerified.mapItems
                for item in self.mapKitItems{
                    NSLog(item.name!)
                    
                }
                
            }
            
            
        } else{
            // TODO: Handle error
        }
        }
    
    }
    
}

