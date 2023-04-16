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
                    Image("Character")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Character")
                }
            
            LocationListScreen()
                .tabItem {
                    Image("Location")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Location")
                }
            
            EpisodeListScreen()
                .tabItem {
                    Image("Episode")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                    
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
