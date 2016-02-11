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
    
    @IBOutlet weak var mapView: MKMapView!
    

    var mapKitItems = [MKMapItem]()
    
    
    //MKMapViewDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
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

