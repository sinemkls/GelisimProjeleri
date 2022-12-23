//
/*
 double toplama, cikarma, carpma, bolme,a,b;
 toplam = a+b;
 cikarma= a-b;
 carpma= a*b;
 bolme= a/b;
 
 */
//  ViewController.swift
//  hspmkn2
//
//  Created by sinem keleş on 6.08.2022.

 
// count  saymak
// previus öncesi
// index dizin
// func işlev
// char karakter
// index dizin


import UIKit // onu bne yazmadım aşağıda olan result yazınca onu hata olarakn gçösterdi senin önerdiğin sayfa ve seninle yaptığımızı birleştirmeye çalışlacaktım ama biribrinden çok ayrı ikside

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResult: UILabel!
    
    var workings:String = "" // boş dize oluşturduk
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }

    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = "" // çalıştırma
        calculatorResult.text = "" // sonuç
    }
    
    
    @IBAction func equalsTap(_ sender: Any)
    {
        if validInput()
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent) // yüzde için kont edilen çalışma / biçimlendirmesi
            let rslt = expression.expressionValue(with: nil, context: nil) as! Double // as! ??
            let resultDouble = formatResult(result: rslt) // sonuç dizisinin biçimlendrimeye eşit olduğunu  ve sonuca ileti liyor
            calculatorResult.text = resultDouble // hesap makinesi sonucu nokta metninin sonuç dizesine eşit
        
        }
        else {
            let alert = UIAlertController( // uyarı dizisi
                title: "Invalid Input", // geçersiz giriş
                message: "Calculator unable to do math basedon input",//Hesap makinesi girdiye dayalı matematik yapamıyor
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    func validInput( ) -> Bool // geçerli işlevde doğru-yanlış ataması
    {
        var count = 0
                var funcCharIndexes = [Int]()
                
                for char in workings
        {
            if specialCharacter (char: char)
            {
                funcCharIndexes.append(count)
            }
            count+=1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if (index == 0)
            {
             return false
            }
            if (index == workings .count - 1)
            {
                return false
            }
            
        if (previous != -1)
            {
            if(index - previous == 1)
                            {
                                return false
                            }
        }
            return (index != 0)
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if ( char == "*")
        {
            return true
        }
        if ( char == "/")
        {
            return true
        }
        if ( char == "+")
        {
            return true
        }
        
        return false
        
    }
    
    
    func formatResult(result: Double) -> String
    {
        return String(result)
        if(result.truncatingRemainder(dividingBy: 1) == 0)// tam sayı ise
        {
            return String(format: "%.0f", result)// ondalıklı sayı ise yuvarlama için
        }
        else
        {
            return String(format: "%.2f", result) // 2  ondalıklı sayı için yuvarlama
        }
    }
    
    
    @IBAction func allClearTap(_ sender: Any) // tümünü temizleyen tuş all clear
    {
        clearAll()
    }
    @IBAction func backTap(_ sender: Any) // hepsini değilde tek tek silen geri al tuşu back
    {
        if(!workings.isEmpty)
        {
            workings.removeLast() // son karakteri al(kaldrımak) ve çalışma metnini sıfırla
            calculatorWorkings.text = workings
        }
    }
    func addToWorkings(value: String)
    {
        workings += value // toplamda çalışan değer
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any)
    {
        addToWorkings(value: "%") // amaç butona basıldığında çalışma etiketine eklenmesi
    }
    @IBAction func devideTap(_ sender: Any)
    {
        addToWorkings(value: "/")
    }
    @IBAction func timesTap(_ sender: Any)
    {
        addToWorkings(value: "*")
    }
    @IBAction func minusTap(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    @IBAction func plusTap(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
   
    @IBAction func decimalTap(_ sender: Any)
    {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
}

