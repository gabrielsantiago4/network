//
//  NewUserView.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import SwiftUI

struct NewUserView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            HStack {
                NavigationLink {
                    //
                } label: {
                    Text("Back")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding()
                Spacer()
                Text("Sign Up")
                    .bold()
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Go!")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding()

            }
            Form {
                Section(header: Text("Name: ").bold(), content: {
                    TextField("", text: $name)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                })
                .textFieldStyle(.automatic)
                
                Section(header: Text("Password: ").bold(), content: {
                    SecureField("", text: $password)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                })
                .textFieldStyle(.automatic)
                
                Section(header: Text("Email: ").bold(), content: {
                    TextField("", text: $email)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                })
                .textFieldStyle(.automatic)

            }
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
