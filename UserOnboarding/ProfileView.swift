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
        
        VStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)

            Text(currentUserName ?? "Your name here")
            Text("This user \(currentUserAge ?? 0) years old!")
            Text("Their gender is \(currentUserGender ?? "unknown")")
        }
    }
}

#Preview {
    ProfileView()
}
