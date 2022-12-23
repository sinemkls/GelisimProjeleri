//
//  ContentView.swift
//  SicaklikCevirici
//  Created by sinem keleş on 12.09.2022.
// Internationalization & Localization = ulusallaştırma & yerelleştirme

import SwiftUI

struct ContentView: View {
    
    @State var fahreneitValue: String = ""
    @State var isVisible = false
    
    let numberFormatter: NumberFormatter = {
        
        let numberFormatter = NumberFormatter()  // {}() kullandık çünkü içinde estra ayarlamalar  yapılacak
        numberFormatter.numberStyle = .decimal  // ne tip bi formatlama olacağına karar veriyoruz
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2  // ondalıktan sonra min ve max uzayabileceği rakam sayısını verdik
        return numberFormatter
    }()
    
    func convertToCelcius() -> String {
        
        if let value = Double(fahreneitValue){ // kod bloğu double değeri çıkartıyorsa çalışacak
            
            let fahreneit =
            Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celciusValue = fahreneit.converted(to: .celsius) // celcius değerine dönecek   // //converted(to = fahreneittan yeni bir değer oluşturuyor ve ona eşitliyor
               //convert to = fahreneit değerine çeviriyor
            let formatedCelciusValue = numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???" // string kullanmışsın zaten ikinci bir string kullanacaksan 2. bir parametre oluştur diyor
           return formatedCelciusValue // doubledan stringe çevirdik burada "\()" ile
            
        }
        else // eğer çalışmıyorsa ??? gelecek  celcius değeri olarak( default stringi )
        {
            return"???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("CONVERSİON_TEXT_FIELD_PLACEHOLDER", text: $fahreneitValue) //stringi binding haline getirmek için dolar işareti koyup değişkenin  adını yazdık kullanıcı text girdiğinde fahreneitValue değeri güncellenecek
                .keyboardType(.decimalPad) // klavye tipini seçtik
                .font(Font .system(size:64 ))
                .multilineTextAlignment(.center)
            Text("CONVERSİON_FAHRENHEIT")
            
            Text("CONVERSİON_IS_ACTUALLY ")
                .foregroundColor(.gray)
            
            Text(convertToCelcius())
                .font(Font .system(size:64 ))
             
            Text("CONVERSİON_DERGEES_CELCIUS")
            
            Spacer() // mevcut boşluğu dolduran view SPacer
            
        }.foregroundColor(.green ) // renk seçeneği
        .font(.title) // bütün arayüze büyüklük uygulanabilir
        .opacity(isVisible ? 1.0 : 0.0 ) // görünmezden görünüre
        .offset(x: 0, y: isVisible ? 0 : 70) // aşağıdan yukayı kaydırma
        .animation(.easeIn(duration: 2.0))

        .onAppear { // tetikleyici
            self.isVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
