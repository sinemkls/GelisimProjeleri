//
//  SicaklikCeviriciApp.swift
//  SicaklikCevirici
//
//  Created by sinem keleş on 12.09.2022.
// conversion dönüştürmek
// map harita

import SwiftUI

@main
struct SicaklikCeviriciApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem{
                        HStack{
                            Image ("thermometer")
                            Text("TAB_CONVERSION")
                        }
                    }
                    
                MapView()
                    .tabItem{
                        HStack{
                            Image (systemName: "map")
                            Text("TAB_MAP")
                        }
                    }
                
            } .accentColor(.green)
        }
    }
}
