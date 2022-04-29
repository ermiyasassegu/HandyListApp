//
//  MapView.swift
//  HandyListApp
//
//  Created by iosdev on 29.4.2022.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
           
           if let annotationView = views.first {
               if let annotation = annotationView.annotation {
                   if annotation is MKUserLocation {
                       
                       let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10, longitudinalMeters: 10)
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
    
    private func updateAnnotations(from mapView: MKMapView) {
           mapView.removeAnnotations(mapView.annotations)
           let annotations = self.landmarks.map(LandmarkAnnotation.init)
           mapView.addAnnotations(annotations)
          
       }
}

