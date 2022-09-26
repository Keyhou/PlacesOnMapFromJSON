//
//  ContentView.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        }
    var body: some View {
        return TabView {
                   MapView()
                       .tabItem {
                           Label("Carte", systemImage: "map.fill")
                       }

                   ListView()
                       .tabItem {
                           Label("Liste", systemImage: "list.bullet")
                       }
               }
        UITabBar.appearance().isTranslucent = false
    }
}

//struct ContentView: View {
//   
//    var body: some View {
//        TabView {
//            ZStack {
//                Color.green
//                    .opacity(0.1)
//                    .ignoresSafeArea()
//                
//                VStack {
//                    Text("Have the shape style touching the safe area edge.")
//                        .padding()
//                        .frame(maxHeight: .infinity)
//                    
//                    Rectangle()
//                        .fill(Color.clear)
//                        .frame(height: 10)
//                        .background(Color.green.opacity(0.2))
//                }
//                .font(.title2)
//            }
//            .tabItem {
//                Image(systemName: "star")
//                Text("Tab 1")
//            }
////                MapView()
////                    .tabItem {
////                        Label("Carte", systemImage: "map.fill")
////                    }
//                
//                ListView()
//                    .tabItem {
//                        Label("Liste", systemImage: "list.bullet")
//                    }
//            }
//        }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
