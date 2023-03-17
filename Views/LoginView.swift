//
//  LoginView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LoginView: View {
    // User's Details
    @State var email = ""
    @State var password = ""
    // Manage the error state and loading state of the view
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false
    // To store log-in status, username, and userUID in local storage
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_name") var usernameStored: String = ""
    @AppStorage("user_UID") var userUID: String = ""
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Login")
                .font(.largeTitle.bold())
                .padding(.bottom, 20)
                .foregroundColor(.white)
            
            VStack(spacing: 0) {
                
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
                
                Button(action: loginAccount) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("Purple"))
                        .cornerRadius(15.0)
                }
                
                Button(action: skip) {
                    Text("Reset Password")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("Purple"))
                        .cornerRadius(15.0)
                }
                
                Button(action: {
                    createAccount.toggle()
                }) {
                    Text("Register")
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
        // Present a full-screen cover for the registerView
        // Can dismiss it in the RegisterView to come back to LoginView
        .fullScreenCover(isPresented: $createAccount) {
            RegisterView()
        }
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
    
    // Login Account
    func loginAccount() {
        isLoading = true
        Task {
            do {
                try await Auth.auth().signIn(withEmail: email, password: password)
                print("Account Logged In!")
                try await fetchUser()
            } catch {
                await setError(error)
            }
        }
    }
    
    // If user is found fetch data from Firestore
    func fetchUser() async throws {
        // Safely unwrap current user's UID
        guard let userID = Auth.auth().currentUser?.uid else { return }
        // Fetch user data from Firestore as User object
        let user = try await
        Firestore.firestore().collection("Users").document(userID).getDocument(as: User.self)
        // Update UI on the main thread with fetched user data
        await MainActor.run(body: {
            userUID = userID
            usernameStored = user.username
            logStatus = true
        })
    }
    
    func skip() {
        logStatus = true
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
