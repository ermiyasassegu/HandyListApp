//
//  MapView.swift
//  HandyListApp
//
//  Created by iosdev on 29.4.2022.
//

import Foundation
import SwiftUI
import MapKit

// create a coordinator
class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    // initialization
    init(_ control: MapView) {
        self.control = control
    }
    // the function that add the user and location nearByshops landmark annotations
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
           
            // this is the first location that is the user_location
           if let annotationView = views.first {
               if let annotation = annotationView.annotation {
                   if annotation is MKUserLocation {
                       // range of the search location with landmark annotation
                       let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                       mapView.setRegion(region, animated: true)
                       
                   }
               }
           }
           
       }
   }

struct MapView : UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    // the map view create here
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        // user location
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    //coordinate the model and view
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    // update the map view
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
             // update the landmark annotation
        updateAnnotations(from: uiView)
    }
    // update the landmark annotation according to the given location name
    private func updateAnnotations(from mapView: MKMapView) {
           mapView.removeAnnotations(mapView.annotations)
           let annotations = self.landmarks.map(LandmarkAnnotation.init)
           mapView.addAnnotations(annotations)
          
       }
}

