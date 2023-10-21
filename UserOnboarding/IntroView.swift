//  /*
//
//  Project: UserOnboarding
//  File: IntroView.swift
//  Created by: Elaidzha Shchukin
//  Date: 21.10.2023
//
//  */

import SwiftUI

struct IntroView: View {
    @AppStorage("sign_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
            // background
            ZStack {
                LinearGradient(
                    colors: [Color.white, Color.black],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea()
        
                if currentUserSignedIn{
                    Text("Profile")
                } else {
                    Text("Onboarding")
                }
        }
    }
}

#Preview {
    IntroView()
}
