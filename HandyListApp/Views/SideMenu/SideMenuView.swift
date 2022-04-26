//
//  SideMenuView.swift
//  HandyListApp
//
//  Created by iosdev on 13.4.2022.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
            
        VStack (alignment: .leading, spacing: 32){
            VStack(alignment: .leading){
                    Circle()
                        .frame(width: 48, height: 48)
                    Text("Bruce Wills")
                        .font(.headline)
                    
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                
                
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .Settings {
                    NavigationLink{
                        SettingView()
                    }label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    }  else if viewModel == .logout {
                        Button{
                            authViewModel.signOut()
                        }label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
                
            }
             Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


