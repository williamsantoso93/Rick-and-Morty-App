//
//  ContentView.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterListScreen()
                .tabItem {
//                    Image("Character")
//                        .renderingMode(.original)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 28, height: 28)
                    Text("Character")
                }
            LocationListScreen()
                .tabItem {
                    Text("Location")
                }
            EpisodeListScreen()
                .tabItem {
                    Text("Episode")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
