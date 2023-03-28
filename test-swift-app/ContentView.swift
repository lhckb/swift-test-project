//
//  ContentView.swift
//  test-swift-app
//
//  Created by Luís Cruz on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            NavigationStack {
                Image(systemName: "applelogo")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("APP TESTE!")
                NavigationLink {
                    Counter()
                } label: {
                    Text("Counter")
                }
                .padding()
                NavigationLink {
                    SecondPage()
                } label: {
                    Text("Second Page")
                }
                .padding()
                NavigationLink {
                    ViewFromRequest()
                } label: {
                    Text("View from Request")
                }
            }
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
