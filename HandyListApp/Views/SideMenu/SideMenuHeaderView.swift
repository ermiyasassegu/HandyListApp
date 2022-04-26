//
//  SideMenuHeaderView.swift
//  HandyListApp
//
//  Created by iosdev on 14.4.2022.
//

import SwiftUI

struct SideMenuHeaderView: View {
    //@Binding var isShowing: Bool
    
    var body: some View {
//        ZStack(alignment: .topTrailing){
//            Button(action: {isShowing.toggle()}, label: {
//                Image(systemName: "xmark")
//                    .frame(width: 32, height: 32)
//                foregroundColor(.white)
//                    .padding()
//            })
//        }
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
