//
//  ContentView.swift
//  Weatherrrr
//
//  Created by Sarah Malek on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    // initialize location manager
    @StateObject var locationManager = LocationManager()
     
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            }
            else{
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue:0.563, saturation: 0.967, brightness: 0.476))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
