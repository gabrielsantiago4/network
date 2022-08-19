//
//  LoginView.swift
//  Network
//
//  Created by Matheus Augusto Alves de Meneses on 19/08/22.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var email: String = ""
    @State var password: String = ""
    let userDefault = UserDefaults.standard

    var isDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Username: ").bold()) {
                    TextField("", text: $email).font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .textFieldStyle(.automatic)
                Section(header: Text("Password: ").bold()) {
                    SecureField("", text: $password).font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .textFieldStyle(.automatic)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Sign Up")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                       // supostamente um dismiss.
                    } label: {
                        Text("Back")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        if true {
                            ContentView(confirm: [email, password], flag: false)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
