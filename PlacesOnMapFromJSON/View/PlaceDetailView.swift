//
//  PlaceDetailView.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import SwiftUI

struct PlaceDetailView: View {
    
    @State var place: Place
    
    var body: some View {
//        NavigationView {
        VStack(alignment: .leading) {
//                Text(place.name)
                Text(place.address)
                Text("Services: \(place.type.capitalized)")
                HStack {
                    Text("Website: ")
                    Link(destination: URL(string: "\(place.url)")!) {
                        Image(systemName: "desktopcomputer")
                            .font(.largeTitle)
                    }
                }
//                Text(place.url)
                Text("WiFi available: " + String(place.wifi))
            }
            .navigationTitle(Text(place.name))
            .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: places[0])
    }
}
