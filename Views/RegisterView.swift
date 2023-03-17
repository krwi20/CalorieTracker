//
//  RegisterView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct RegisterView: View {
    // User's Details
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    // Property wrapper to dismiss view
    @Environment(\.dismiss) var dismiss
    // Manage the error state and loading state of the view
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false
    // To store log-in status, username, and userUID in local storage
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_name") var usernameStored: String = ""
    @AppStorage("user_UID") var userUID: String = ""
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Register")
                .font(.largeTitle.bold())
                .padding(.bottom, 20)
                .foregroundColor(.white)
            
            VStack(spacing: 0) {
                
                TextField("Username", text: $username)
                    .textContentType(.username)
                    .padding()
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .padding()
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding()
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                
            }
            
            VStack(spacing: 30) {
                
                Button(action: registerAccount) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("Purple"))
                        .cornerRadius(15.0)
                }
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Go Back To Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("Purple"))
                        .cornerRadius(15.0)
                }
                
            }
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Background"))
        // Adds the loading view to the view when loading
        .overlay(content: {
            LoadingView(show: $isLoading)
        })
        // Presents alert when showError is true
        .alert(errorMessage, isPresented: $showError, actions: {})
    }
    
    // Display errors with alert
    func setError(_ error: Error) async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
            isLoading = false
        })
    }
    
    func registerAccount() {
        isLoading = true
        Task {
            do {
                // Create Firebase Account
                try await Auth.auth().createUser(withEmail: email, password: password)
                // Safely unwrap current user's UID
                guard let userUID = Auth.auth().currentUser?.uid else { return }
                // Creates a new User object with provided username, userUID and email
                let user = User(username: username, userUID: userUID, userEmail: email)
                // Saves the user data in Firestore collection "Users"
                // Updates the usernameStored, userUID and logStatus if successful
                let _ = try
                Firestore.firestore().collection("Users").document(userUID).setData(from: user, completion: {
                    error in
                    if error == nil {
                        print("Account saved successfully!")
                        usernameStored = username
                        self.userUID = userUID
                        logStatus = true
                    }
                })
            } catch {
                await setError(error)
            }
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
