//
//  ContentView.swift
//  HumanFallDetection Watch App
//
//  Created by Hsunwen Fang on 2023/8/15.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D{
    static let cityHall = CLLocationCoordinate2D(latitude: 25.04123443500926, longitude: 121.56656047013317)
}

struct ContentView: View {
    
    // Properties
    
    // Sensor properties
    @State private var sensors: [Sensor] = [Sensor]()
    @State private var accelarationX: Double? = 0
    
    // Map properties
    
    @State private var searchResults: [MKMapItem] = []
    
    // Functions
    
    
    var body: some View {
        VStack {
            
            Map{
                Annotation("CityHall", coordinate: .cityHall){
                    ZStack{
                        RoundedRectangle(cornerRadius: 5).fill(.background)
                        RoundedRectangle(cornerRadius: 5).stroke(.secondary, lineWidth: 3)
                        Image(systemName: "star")
                            .padding(1)
                    }
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(height: 100)
            .mapStyle(.standard(elevation: .realistic))
            
            
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5.5){
                
                
                TextField("Ground Guard", text: Binding(get: {"\(accelarationX ?? 0)"}, set: {_,_ in accelarationX = 0.0}))
                
                Button{
                    // ACTION
                    
                    let sensor = Sensor(id: UUID(), interval: 0.1)
                    sensors.append(sensor)
                    accelarationX = sensor.getAcceleration()[0]
                    
                    
                } label: {
                    Image(systemName: "plus.circle")
                        
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
            }
            Text("\(sensors.count)")
        }//: VSTACK
    }
}

#Preview {
    ContentView()
}
