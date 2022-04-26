//
//  SideMenuViewModel.swift
//  HandyListApp
//
//  Created by iosdev on 18.4.2022.
//

import Foundation


enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case nearByShop
    case Settings
    case logout
    
    var title: String{
        switch self {
            
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .nearByShop:
            return "NearByShop"
        case .Settings:
            return "Setting"
        case .logout:
            return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .nearByShop:
            return "location"
        case .Settings:
            return "gearshape"
        case .logout:
            return "arrow.left.square"
        }
    }
    
}
