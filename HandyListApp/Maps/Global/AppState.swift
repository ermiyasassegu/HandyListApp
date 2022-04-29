//
//  AppState.swift
//  HandyListApp
//
//  Created by iosdev on 28.4.2022.
//

import Foundation

class AppsState: ObservableObject {
    @Published var places: [PlaceAnnotation] = []
}
