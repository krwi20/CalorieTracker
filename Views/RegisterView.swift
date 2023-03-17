//
//  RegisterView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
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
                
                Button(action: {
                    
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("Purple"))
                        .cornerRadius(15.0)
                }
                
                Button(action: {
                    
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
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
