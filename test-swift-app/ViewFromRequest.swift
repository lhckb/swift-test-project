//
//  ViewFromRequest.swift
//  test-swift-app
//
//  Created by Luís Cruz on 27/03/23.
//

import SwiftUI

// TODO create cache layer for data
// TODO abstract URLImage requests and stuff

struct URLImage: View {
    let imageUrl: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let image = UIImage(data: data) {
            return AnyView(
                Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .background(Color.gray)
            )
        } else {
            return AnyView(
                Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .background(Color.gray)
                .onAppear{
                    fetchImage()
                }
            )
        }
        
        func fetchImage() {
            guard let url = URL(string: imageUrl) else { return }
            
            let task = URLSession.shared.dataTask(with: url) {(data, _, _) in
                self.data = data
            }
            
            task.resume()
        }
    }
}

struct ViewFromRequest: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    HStack {
                        URLImage(imageUrl: user.avatar_url, data: nil)
                        Text(user.login).bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Github Users")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ViewFromRequest_Previews: PreviewProvider {
    static var previews: some View {
        ViewFromRequest()
    }
}
