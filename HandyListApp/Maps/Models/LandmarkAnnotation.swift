
import MapKit
import UIKit

// blueprint to diplay the anotation in the map
final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
// initializer which shows in the MKAnnotation
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
