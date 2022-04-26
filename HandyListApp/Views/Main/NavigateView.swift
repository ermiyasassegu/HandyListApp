//
//  SettingView.swift
//  HandyListApp
//
//  Created by iosdev on 10.4.2022.
//

import SwiftUI

struct NavigateView: View {
    var body: some View {
        NavigationView{
            Text ("Location")
                .navigationTitle("Navigate")
        }
    }
}

struct NavigateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigateView()
    }
}
