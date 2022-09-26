//
//  MapView.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct Location: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

//struct IdentifiablePlace: Identifiable {
//    let id: UUID
//    let location: CLLocationCoordinate2D
//    init(id: UUID = UUID(), lat: Double, long: Double) {
//        self.id = id
//        self.location = CLLocationCoordinate2D(
//            latitude: places.lat,
//            longitude: places.lon)
//    }
//}

struct MapView: View {
    
    //    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566140, longitude: 2.35), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
//    let locations = [
//        Location(id: UUID(), name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(id: UUID(), name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566140, longitude: 2.35), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @State var tracking : MapUserTrackingMode = .follow
    
    @State var manager = CLLocationManager()
    
//    @StateObject var managerDelegate = locationDelegate()
    
    var body: some View {
        
        //        Map(coordinateRegion: $mapRegion)
        //            .ignoresSafeArea()
        
        //        NavigationView {
        //            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
        //                MapAnnotation(coordinate: location.coordinate) {
        //                    NavigationLink {
        //                        Text(location.name)
        //                    } label: {
        //                        Circle()
        //                            .stroke(.red, lineWidth: 3)
        //                            .frame(width: 44, height: 44)
        //                    }
        //                }
        //            }
        //            .ignoresSafeArea()
        ////            .navigationTitle("London Explorer")
        //        }
        
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: places) { place in MapAnnotation(coordinate: CLLocationCoordinate2D(
                latitude: place.lat,
                longitude: place.lon
            )) {
                NavigationLink {
                    PlaceDetailView(place: place)
                } label: {
                    VStack {
                        Image(systemName: "mappin")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    .navigationTitle("Autour de moi")
                }
            }
            }
            .ignoresSafeArea()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
