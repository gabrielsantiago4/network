//
//  ApiService.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import Foundation

struct ApiService {
    
    static func getUsers() async -> [UserModel] {
        // unwraping de url
        guard let url = URL(string: "http://adaspace.local/users") else {
            return []
        }
        // criar urlRequest
        let urlRequest = URLRequest(url: url)
        
        do {
            // Manda requisicao e armazena data e response em variaveis locais
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            // decodificando a variavel data de JSON para UserModel
            return try JSONDecoder().decode([UserModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    static func getPosts() async -> [PostModel] {
        // unwraping de url
        guard let url = URL(string: "http://adaspace.local/posts") else {
            return []
        }
        // criar urlRequest
        let urlRequest = URLRequest(url: url)
        
        do {
            // Manda requisicao e armazena data e response em variaveis locais
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            // decodificando a variavel data de JSON para PostModel
            return try JSONDecoder().decode([PostModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    static func newUser(name : String, email: String, password : String) async {
        guard let url = URL(string: "http://adaspace.local/users") else {
            return
        }
        // urlsrequest, metod e header
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type" : "application/json"
        ]
        // informacao para serializar
        let json = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        // serializacao da informacao para tipo data
        do {
            let jsonSerialized = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            urlRequest.httpBody = jsonSerialized // declaracao da variavel tipo data como body do urlrequest
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print(response)
            return
        } catch {
            print(error)
            return
        }
    }
}
