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
            Text("Placeholder").padding(.all,40)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("New")
        .padding(.vertical, 10)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.dark)
    }
}
