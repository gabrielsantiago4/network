//
//  ContentView.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import SwiftUI

struct ContentView: View {
    @State var confirm: [String] = []
    var flag: Bool
    let userDefault = UserDefaults.standard
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                if flag {
                    await ApiService.newUser(name: confirm[0], email: confirm[1], password: confirm[2])
                } else {
                    userDefault.set(await ApiService.userLogin(username: confirm[0], password: confirm[1]), forKey: "token")
                    print(userDefault.string(forKey: "token")!)
                }
            }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
