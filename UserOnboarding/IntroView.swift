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
    var body: some View {
        
        VStack {
            // background
            ZStack {
                LinearGradient(
                    colors: [Color.white, Color.black],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    IntroView()
}
