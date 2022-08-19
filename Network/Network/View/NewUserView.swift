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
        NavigationView {
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                       // não fazer nada.
                    } label: {
                        Text("Back")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Sign Up")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        if true {
                            ContentView(confirm: [name, email, password], flag: true)
                        }
                    } label: {
                        Text("GO!")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
