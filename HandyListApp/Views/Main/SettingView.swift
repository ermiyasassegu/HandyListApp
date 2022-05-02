//
//  SettingView.swift
//  HandyListApp
//
//  Created by iosdev on 26.4.2022.
//

import SwiftUI

struct SettingView: View {
    @State private var darkMode:Bool = false
    @State private var currentMode:ColorScheme = .light
    var body: some View {
        NavigationView {
            Form {
                Toggle("Dark Mode", isOn: $darkMode)
                    .onChange(of: darkMode) { value in
                        if darkMode == true {
                            currentMode = .dark
                        } else {
                            currentMode = .light
                        }
                        
                    }
            }.navigationTitle("Settings")
                .preferredColorScheme(currentMode)
                .toggleStyle(SwitchToggleStyle(tint: Color.red))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
