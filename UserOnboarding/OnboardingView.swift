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
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default: Rectangle()
                        .foregroundColor(.red)
                }
            }
            
            // buttons
            VStack {
                Spacer()
                buttomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
}

#Preview {
    OnboardingView()
}

// MARK: COMPONENTS
extension OnboardingView {
    
    private var buttomButton: some View {
        Text(onboardingState == 0 ? "Sign Up" :
                onboardingState == 3 ? "Finish" : "Next")
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .cornerRadius(15)
        //.animation(nil)
        .onTapGesture {
            handleButtonPressed()
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
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your name?")
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            TextField("Your name here...", text: $name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(15)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your age?")
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            Text("\(String(format: "%.0f", age))")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your gender?")
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            Picker(selection: $gender,
                   label:
                    Text("Select a gender")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(15)
                   ,
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
                
            })
            // .pickerStyle(<#_#>)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: FUNCTIONS
extension OnboardingView {

    func handleButtonPressed() {
        // Check Inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                alertTitle = "title"
                showAlert.toggle()
                return
            }
        default:
            break
        }
        
        // Go To The Next Sectiom
        if onboardingState == 3 {
            // sign in
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
