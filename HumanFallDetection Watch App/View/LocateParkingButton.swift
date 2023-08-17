//
//  LocateParkingButton.swift
//  HumanFallDetection Watch App
//
//  Created by Hsunwen Fang on 2023/8/16.
//

import Foundation
import SwiftUI
import MapKit

var body: some View{
    HStack{
        Button{
//            search(for: "parking")
        } label: {
            Label("Parking", systemImage: "car")
        }
        .buttonStyle(.borderedProminent)
        
        Button{
//            search(for: "restaurant")
        } label: {
            Label("Restaurant", systemImage: "knife")
        }
        .buttonStyle(.borderedProminent)
    }
    .labelStyle(.iconOnly)
}

