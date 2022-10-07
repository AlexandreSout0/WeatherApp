//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alexandre Souto on 07/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                // Text("Your coodinates are: \(location.longitude), \(location.latitude)")
                if let weather = weather {
                    WeatherView(weather: weather)
                    //Text("Weather data fetched!")
                }else{
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                
                
            } else{
                if locationManager.isLoading{
                    LoadingView() // Call frame LoadingView
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            

        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
