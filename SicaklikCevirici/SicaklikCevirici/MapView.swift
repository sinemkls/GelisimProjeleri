//
//  MapView.swift
//  SicaklikCevirici
//
//  Created by sinem keleş on 20.09.2022.
// binding = bağlayıcı
// coordinateRegion = koordinatBölge
// safe area = güvenli bölge
//  region = bölge
// overlay kaplama = katman ekleyip üzerine çiziyor


 

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions: [MKCoordinateRegion] = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.0, longitude:29.0 ),
            span: MKCoordinateSpan(latitudeDelta: 4.0 , longitudeDelta: 4.0)
        ),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.509865, longitude:-0.118092 ),
            span: MKCoordinateSpan(latitudeDelta: 4.0 , longitudeDelta: 4.0)
        )
        
        
        
    ]
    
    
    
    
    @State var region: MKCoordinateRegion = regions[0]
    
    @State var selectedIndex = 0
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top) // tam ekrana aldık
            .overlay(
                VStack {
                    Picker("Picker", selection: $selectedIndex, content: {
                        Text("MAP_CITY_ISTANBUL").tag(0)
                        Text("MAP_CITY_LONDON").tag(1)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding() // picker ile çerçeve arasında aralık olması için
                    .onChange(of: selectedIndex, perform: { value in
                        self.region = MapView.regions[selectedIndex] // her selectedındex değiştiğinde region da yukarıdaki arrayden hangi indexteyse onu alıp güncelleyecek
                        
                    })
                    Spacer() // picker'ı en tepeye taşıdı
                }
                
            )

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}






