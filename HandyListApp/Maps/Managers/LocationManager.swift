//
//  LocationManager.swift
//  HandyListApp
//
//  Created by iosdev on 29.4.2022.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    // set the location
    @Published var location: CLLocation? = nil
    
    // initializer
    override init() {
            
            super.init()
          
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.distanceFilter = kCLDistanceFilterNone
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            
        }
        
    }
// extension for location delegete manager
extension LocationManager: CLLocationManagerDelegate {
    // this is to change the authorization to use in the simulator
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    // function to update the location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
}
