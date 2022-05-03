//
//  SideMenuViewModel.swift
//  HandyListApp
//
//  Created by iosdev on 18.4.2022.
//

import Foundation
import SwiftUI


enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case nearByShop
    case Settings
    case logout
    
   // static let Profile : LocalizedStringKey = ""
    var title: String{
        switch self {
            // in this case the use of NsLocalizedString return a localized version of a string 
        case .profile:
            return NSLocalizedString("Profile", comment:"Profile")
        case .nearByShop:
            return NSLocalizedString("NearByShop", comment:"NearByShop")
        case .Settings:
            return NSLocalizedString("Setting", comment:"Setting")
        case .logout:
            return NSLocalizedString("Logout", comment:"Logout")
        }
    }
    
    var imageName: String {
        switch self {
            
        case .profile:
            return "person"
        case .nearByShop:
            return "location"
        case .Settings:
            return "gearshape"
        case .logout:
            return "arrow.left.square"
        }
    }
    
}
