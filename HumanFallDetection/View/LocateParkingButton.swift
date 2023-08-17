//
//  LocateParkingButton.swift
//  HumanFallDetection Watch App
//
//  Created by Hsunwen Fang on 2023/8/16.
//

import Foundation
import SwiftUI

var body: some View{
    HStack{
        Button{
            search(for: "parking")
        } label: {
            Label("Parking", systemImage: "car")
        }
        .buttonStyle(.borderedProminent)
        
        Button{
            search(for: "restaurant")
        } label: {
            Label("Restaurant", systemImage: "knife")
        }
        .buttonStyle(.borderedProminent)
    }
    .labelStyle(.iconOnly)
}

@Binding var searchResults: [MKMapItem]

func search(for query: String){
    let requests = MKLocalSearch.Request()
    requests.naturalLanguageQuery = query
    requests.resultTypes = .pointOfInterest
    requests.region = MKCoordinateRegion(
        center: .cityHall, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
}
