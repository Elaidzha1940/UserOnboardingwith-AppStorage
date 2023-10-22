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
    
    @State var onboardingState: Int = 1
    @State var name: String = ""
    @State var age: Double = 50
    
    var body: some View {
        
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                case 1:
                    addNameSection
                case 2:
                    addAgeSection
                default: Rectangle()
                    
                }
            }
            
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
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "globe.europe.africa.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            
            Text("Welcome to the World.")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .overlay (
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 3)
                    , alignment: .bottom
                )
            
            Text("We're glad to have you. We're excited that you're joining our team.")
                .font(.system(size: 20, weight: .medium, design: .rounded))
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your name?")
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            TextField("Your name here...", text: $name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(height: 50)
                .padding(.horizontal)
                .background(Color.red)
                .cornerRadius(15)
            
            Spacer()
            Spacer()
        }
        .padding()
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your age?")
                .font(.system(size: 25, weight: .bold, design: .rounded))
        
            Slider(value: <#T##Binding<BinaryFloatingPoint>#>, in: <#T##ClosedRange<BinaryFloatingPoint>#>)
            Spacer()
            Spacer()
        }
        .padding()
    }
}
