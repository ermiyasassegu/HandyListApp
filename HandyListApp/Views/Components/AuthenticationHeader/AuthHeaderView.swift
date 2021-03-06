//
//  AuthHeaderView.swift
//  HandyListApp
//
//  Created by iosdev on 12.4.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: LocalizedStringKey
    let title2: LocalizedStringKey
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack {Spacer() }
                
                Text(title1)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text(title2)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:260)
            .padding()
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
        }
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcomne to HandyList")
    }
}
