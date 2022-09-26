//
//  JSONModel.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import Foundation

//Example
//id": 1,
//"name": "Café CRAFT",
//"lat": 48.8731907,
//"lon": 2.3631488,
//"address": "24 Rue des Vinaigriers - 75010 Paris",
//"type": "coffee / coworking",
//"url": "http://cafe-craft.com",
//"wifi": true

struct Place: Identifiable, Decodable {
    var id: Int
    var name: String
    var lat: Double
    var lon: Double
    var address: String
    var type: String
    var url: String
    var wifi: Bool
}

// Trois étapes que l'on définie dans la fonction load
//let file = Bundle.main.url(forResource: "places.json", withExtension: nil)
//
//let jsonData = try! Data(contentsOf: file!)
//
//let places: [Place] = try! JSONDecoder().decode([Place].self, from: jsonData)

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

var places: [Place] = load("places.json")
