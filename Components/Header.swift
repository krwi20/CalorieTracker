//
//  Header.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Header: View {
    // Hold the user profile data once fetched
    @State private var myProfile: User?
    // To store log-in status in local storage
    @AppStorage("log_status") var logStatus: Bool = false
    // Manage the error state and loading state of the view
    @State var errorMessage: String = ""
    @State var showError: Bool = false
    @State var isLoading: Bool = false
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Circle()
                    .frame(width: 38, height: 38)
                if let myProfile {
                    Text("\(myProfile.username) 👋")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                } else {
                    ProgressView()
                }
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("HeaderOne"), Color("HeaderTwo")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        }
        .overlay {
            LoadingView(show: $isLoading)
        }
        .alert(errorMessage, isPresented: $showError) {
            
        }
        .task {
            if myProfile != nil { return }
            await fetchUserData()
        }
    }
    
    // Display errors with alert
    func setError(_ error: Error) async {
        await MainActor.run(body: {
            isLoading = false
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
    
    // Fetch user data from Firestore and set myProfile once data is retrieved
    func fetchUserData() async {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        guard let user = try? await
                Firestore.firestore().collection("Users").document(userUID).getDocument(as: User.self) else { return }
        await MainActor.run(body: {
            myProfile = user
        })
    }
    
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
