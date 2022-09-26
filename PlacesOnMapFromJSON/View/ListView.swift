//
//  ListView.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import SwiftUI

struct ListView: View {
    
    @State var searchPlaces = places
    
    var body: some View {
        NavigationView {
            List(searchPlaces) { place in
                NavigationLink(destination: {
                    PlaceDetailView(place: place)
                }, label: {
                    VStack(alignment: .leading) {
                        Text(place.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(String("\(place.address)"))
                    }
                    
                })
            }
            .navigationTitle(Text("Autour de moi"))
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
