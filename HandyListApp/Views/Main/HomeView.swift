//
//  HomeView.swift
//  HandyListApp
//
//  Created by iosdev on 10.4.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            Text (" My home")
                .navigationTitle("home")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

