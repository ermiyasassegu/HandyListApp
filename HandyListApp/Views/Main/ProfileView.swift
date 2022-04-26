//
//  ProfileView.swift
//  HandyListApp
//
//  Created by iosdev on 18.4.2022.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        
        VStack(alignment: .leading){
           headerView
            
           actionButtons
            
            userInfoDetails
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                    
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 26, y: 24)
            }
        }
        .frame(height: 96)
    }
}

var actionButtons: some View {
    HStack{
        Spacer()
        
        Button {
            
        } label: {
            Text("Edit Profile")
                .font(.subheadline).bold()
                .frame(width: 120, height: 32)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
        }
    }
    .padding(.trailing)
}
var userInfoDetails: some View {
    VStack(alignment: .leading, spacing: 4) {
        HStack {
            Text("Heath Robert")
                .font(.title2).bold()
            
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(Color(.systemBlue))
        }
        
        Text("@Jocker")
            .font(.subheadline)
            .foregroundColor(.gray)
        
        Text(" Follow me on Instagram or Twitter")
            .font(.subheadline)
            .padding(.vertical)
        
        HStack{
            HStack{
                Image(systemName: "mappin.and.ellipse")
                
                Text("Helsinki, UUsimaa")
            }
            Spacer()
            
            HStack {
                Image(systemName: "link")
                Text("www.imstagram.fi/Heath")
            }
        }
       
    }
    .padding(.horizontal)
}
