//
//  SideMenuHeaderView.swift
//  HandyListApp
//
//  Created by iosdev on 14.4.2022.
//

import SwiftUI

struct SideMenuHeaderView: View {
    
    
    var body: some View {

        VStack(alignment: .leading) {
            Circle()
                .frame(width: 48, height: 48)
            Text("Bruce Wills")
                .font(.headline)
            
            Text("@batman")
                .font(.caption)
                .foregroundColor(.gray)
            HStack(spacing: 42){
                HStack(spacing:4){
                    Text("Follow me: on Instagram or")
                    Text("Twitter")
                }
                Spacer()
            }
            
            Spacer()
        }
        
            
    }
    
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView()
    }
}
