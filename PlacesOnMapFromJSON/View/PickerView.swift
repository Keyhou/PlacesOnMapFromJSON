//
//  PickerView.swift
//  PlacesOnMapFromJSON
//
//  Created by Keyhan Mortezaeifar on 26/09/2022.
//

import SwiftUI

struct PickerView: View {
    @State private var defaultPicker = 0
    var theUserWouldChooseWhatTheyPrefer = [MapView(), ListView()] as [Any]
    var body: some View {
        VStack {

            Picker("", selection: $defaultPicker) {
                            Text("Carte").tag(0)
                            Text("Liste").tag(1)
                        }
                        .pickerStyle(.segmented)

//                        Text("Value: \(theUserWouldChooseWhatTheyPrefer)")
          }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
