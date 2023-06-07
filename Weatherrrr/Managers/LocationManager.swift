//
//  LocationManager.swift
//  Weatherrrr
//
//  Created by Sarah Malek on 6/6/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.first?.coordinate else {
            // handle case when the array of locations is empty
            return
        }
        location = newLocation
        isLoading = false
        
    }
    
    func locationManager(_ manager:CLLocationManager, didFailWithError error: Error){
        print("Error getting location", error)
        isLoading = false
    }
}

