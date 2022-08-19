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
            print(name+" "+email+" "+password)
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
        print(json)
        // serializacao da informacao para tipo data
        do {
            let jsonSerialized = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            urlRequest.httpBody = jsonSerialized // declaracao da variavel tipo data como body do urlrequest
            let (_, response) = try await URLSession.shared.data(for: urlRequest)
            print(response)
            return
        } catch {
            print(error)
            return
        }
    }

    static func userLogin(username: String, password: String) async -> String {
        print(username+" "+password)
        guard let url = URL(string: "http://adaspace.local/users/login") else {
            return ""
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]

        let authData = (username + ":" + password).data(using: .utf8)!.base64EncodedString()
        urlRequest.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")

        let body: String = ""

        do {
            let bodyData = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
            urlRequest.httpBody = bodyData
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            let dataDecoded = try JSONDecoder().decode(TokenHandlerModel.self, from: data)
            if let responseHeader = response as? HTTPURLResponse {
                if responseHeader.statusCode == 200 {
                    print(String(data: data, encoding: .utf8)!)
                    return String(dataDecoded.token)
                }
            }
        } catch {
            print(error)
        }
        return "" 
    }

    static func userLogout(token: String) async {
        guard let url = URL(string: "http://adaspace.local/users/logout") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        let authData = token.data(using: .utf8)!.base64EncodedString()
        urlRequest.addValue("Bearer \(authData)", forHTTPHeaderField: "Authorization")
        let dict: String = ""

        do {
            let dictData = try JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
            urlRequest.httpBody = dictData
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            print(String(data: data, encoding: .utf8)!)
        } catch {
            print(error)
        }
        return

    }
}
