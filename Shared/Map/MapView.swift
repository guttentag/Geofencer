//
//  MapView.swift
//  Geofencer
//
//  Created by Eran Gutentag on 16/07/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.087674, longitude: 34.972913),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var name: String = ""
    private let minDistance: Float = 10
    private let maxDistance: Float = 500
    @State private var radius: Float = 100
    
    var body: some View {
        VStack {
            HStack {
                Text("lat:")
                Text(String(format:"%.5f", region.center.latitude))
                    .padding(.trailing, 10)
                
                Text("lon:")
                Text(String(format:"%.5f", region.center.longitude))
                Spacer()
            }
            .padding(.horizontal, 10)
            ZStack {
                Map(
                    coordinateRegion: $region,
                    interactionModes: .all, showsUserLocation: true,
                    userTrackingMode: Binding<MapUserTrackingMode>(get: { .none }, set: { _ in }))
                MapTargetShape()
                    .stroke(Color.red, lineWidth: 2)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            TextField("Geofence name", text: $name)
                .padding()
            HStack {
                Slider(value: .init(
                    get: { (radius - minDistance) / (maxDistance - minDistance) },
                    set: { radius = ((maxDistance-minDistance) * $0) + minDistance }
                )).padding(.leading, 20)
                Spacer(minLength: 20)
                Text("\(Int(radius)) m").frame(minWidth: 80)
            }.padding()
            Button("Create", action: {
                // TODO save tap
            })
            .frame(minWidth: 200, minHeight: 60, alignment: .center)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("New")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.dark)
    }
}
