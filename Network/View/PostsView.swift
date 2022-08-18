//
//  PostsView.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import SwiftUI

struct PostsView: View {
    @State var posts: [PostModel] = []
    var body: some View {
        VStack{
            Text("Posts List").bold()
                .font(.title)
                .foregroundColor(.black)
            List {
                ForEach(posts, id: \.self) { post in
                    Text(post.content)
                }
            }
            .task {
                posts = await ApiService.getPosts()
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
