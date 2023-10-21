//  /*
//
//  Project: UserOnboarding
//  File: OnboardingView.swift
//  Created by: Elaidzha Shchukin
//  Date: 21.10.2023
//
//  */

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - Welcome Screen
     1 - Add Name
     2 - Add Age
     3 - Add Gender
     */
    
    @State var onboardingState: Int = 0
    var body: some View {
        
        ZStack {
            // content
            
            // buttons
            VStack {
                Spacer()
                buttomButton
            }
            .padding(30)
        }
    }
}

#Preview {
    OnboardingView()
}

// MARK: COMPONENTS
extension OnboardingView{
    
    private var buttomButton: some View {
        Text("Sign in")
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(15)
            .onTapGesture {
                
            }
    }
}
