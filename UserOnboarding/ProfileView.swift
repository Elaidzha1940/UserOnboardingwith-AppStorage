//  /*
//
//  Profile: UserOnboarding
//  File: ProfileView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.10.2023
//
//  */

import SwiftUI

struct ProfileView: View {
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    
    @AppStorage("sign_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)

            Text(currentUserName ?? "Your name here")
            Text("This user \(currentUserAge ?? 0) years old!")
            Text("Their gender is \(currentUserGender ?? "unknown")")
            
            Text("Sign Out")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(15)
                .onTapGesture {
                    signOut()
                }

        }
        .font(.system(size: 20, weight: .medium, design: .rounded))
        .foregroundColor(.white)
        .padding()
        .background(Color.black)
        .cornerRadius(15)
        .shadow(color: .black, radius: 10, x: 5 , y: 5)
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
