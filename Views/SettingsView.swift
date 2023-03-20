//
//  SettingsView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    // To store log-in status in local storage
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        VStack {
            Text("Settings View")
                .font(.title)
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: signOut) {
                Text("Sign Out")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color("Purple"))
                    .cornerRadius(15.0)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
    
    // Sign the user out
    func signOut() {
        try? Auth.auth().signOut()
        logStatus = false
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
