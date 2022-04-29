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
                       
                       let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
                       mapView.setRegion(region, animated: true)
                       
                   }
               }
           }
           
       }
   }

struct MapView : UIViewRepresentable {
    
    //let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
             // update the landmark annotation
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
           mapView.removeAnnotations(mapView.annotations)
          
       }
}

