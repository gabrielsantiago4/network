//
//  UsersView.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import SwiftUI

struct UsersView: View {
    @State var users: [UserModel] = []
    var body: some View {
        VStack {
            Text("Users List").bold()
                .foregroundColor(.black)
                .font(.title)
            List {
                ForEach(users, id: \.self) { user in
                    Text(user.name)
                }
            }
            .task {
                users = await ApiService.getUsers()
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
