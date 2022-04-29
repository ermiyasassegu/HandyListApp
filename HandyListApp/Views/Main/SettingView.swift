//
//  SettingView.swift
//  HandyListApp
//
//  Created by iosdev on 26.4.2022.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        Text("V.0.0.1")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//import SwiftUI
//import UIKit
//
//enum Adresses {
//    static let twitter = "https://twitter.com/ermi_handy"
//    static let email = "mailto:foo@bar.com"
//    static let phone = "tel:07000000000"
//}
//
//struct SettingsView: View {
//
//    @Binding var darkModeEnabled: Bool
//    @Binding var systemThemeEnabled: Bool
//
//    let themeManager: ThemeManager
//
//    var body: some View {
//
//        NavigationView {
//
//            Form {
//
//                Section(header: Text("Display"),
//                        footer: Text("System settings will override Dark Mode and use the current device theme")) {
//                    Toggle(isOn: $darkModeEnabled,
//                           label: {
//                            Text("Dark mode")
//                           })
//                        .onChange(of: darkModeEnabled,
//                                  perform: { _ in
//                                    themeManager.handleTheme(darkMode: darkModeEnabled,
//                                                                  system: systemThemeEnabled)
//
//                                  })
//                    Toggle(isOn: $systemThemeEnabled,
//                           label: {
//                            Text("Use system settings")
//                           })
//                        .onChange(of: systemThemeEnabled,
//                                  perform: { _ in
//                                    themeManager.handleTheme(darkMode: darkModeEnabled,
//                                                                  system: systemThemeEnabled)
//
//                                  })
//                }
//
//                Section {
//                    Link(destination: URL(string: Adresses.twitter)!,
//                         label: {
//                            Label("Follow me on Twitter @tundsdev", systemImage: "link")
//                    })
//
//                    Link("Contact me via email",
//                         destination: URL(string: Adresses.email)!)
//
//                    Link("Call me",
//                         destination: URL(string: Adresses.phone)!)
//                }
//                .foregroundColor(Color(.red))
//                .font(.system(size: 16, weight: .semibold))
//            }
//            .navigationTitle("Settings")
//        }
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(darkModeEnabled: .constant(false),
//                     systemThemeEnabled: .constant(false),
//                     themeManager: ThemeManager())
//    }
//}
//
//class ThemeManager {
//
//    func handleTheme(darkMode: Bool, system: Bool) {
//
//        guard !system else {
//            UIApplication.keyWindow?.overrideUserInterfaceStyle = .unspecified
//            return
//        }
//
//        UIApplication.keyWindow?.overrideUserInterfaceStyle = darkMode ? .dark : .light
//    }
//}
//
//
//extension UIApplication {
//
//    static var keyWindow: UIWindow? {
//        // Get connected scenes
//        return UIApplication.shared.connectedScenes
//            // Keep only active scenes, onscreen and visible to the user
//            .filter { $0.activationState == .foregroundActive }
//            // Keep only the first `UIWindowScene`
//            .first(where: { $0 is UIWindowScene })
//            // Get its associated windows
//            .flatMap({ $0 as? UIWindowScene })?.windows
//            // Finally, keep only the key window
//            .first(where: \.isKeyWindow)
//    }
//
//}
