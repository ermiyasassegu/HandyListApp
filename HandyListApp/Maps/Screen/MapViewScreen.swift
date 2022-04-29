//
//  MapScreen.swift
//  HandyListApp
//
//  Created by iosdev on 29.4.2022.
//

import SwiftUI

struct MapViewScreen: View {
   
    
    @ObservedObject var locationManager = LocationManager()
  
    @State private var search: String = ""
   
    
    private func getNearByLandmarks() {
        
      
        
       
            
        }
        
    }
    
    func calculateOffset() -> CGFloat {
        
       
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView()
            
            TextField("Search", text: $search, onEditingChanged: { _ in })
            {
                // commit
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                // on tap
                self.tapped.toggle()
            }.animation(.spring())
                .offset(y: calculateOffset())
            
        }
    }


struct MapViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapViewScreen()
    }
}
