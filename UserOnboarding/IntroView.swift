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
                    colors: [Color.black, Color.white],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea()
        
                if currentUserSignedIn{
                    ProfileView()
                        .transition(.asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .top)))
                } else {
                    OnboardingView()
                        .transition(.asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .top)))
                }
        }
    }
}

#Preview {
    IntroView()
}
