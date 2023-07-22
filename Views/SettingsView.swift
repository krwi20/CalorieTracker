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
    @State private var showGoalsView = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 38, height: 38)
                    Text("John Smith")
                        .foregroundColor(.white)
                }
                
                List {
                    NavigationLink {
                        GoalsView()
                    } label: {
                        Text("Goals")
                            .foregroundColor(.white)
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Rectangle()
                        .fill(Color("Purple"))
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("Background")),
                            alignment: .bottom
                        ))
                    
                    Text("TEMP")
                        .foregroundColor(.white)
                        .listRowBackground(Rectangle()
                            .fill(Color("Purple"))
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("Background")),
                                alignment: .bottom
                            ))
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                .frame(height: 100)
                
                HStack {
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
                    Spacer()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
        }
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
