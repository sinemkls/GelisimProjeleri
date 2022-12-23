//
//  ViewController.swift
//  chronometre
//
//  Created by sinem keleş on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLbel: UILabel!
    var timer = Timer()
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        timerLbel.text = String(time)
        time = 0
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerApp), userInfo: nil, repeats: true)
    }
    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
    }
    @IBAction func resetButton(_ sender: Any) {
        
        time = 0
        timerLbel.text = String(time)
        timer.invalidate()

    }
    @objc func timerApp(){
        timerLbel.text = String(time)
         time += 1
        
    }
}

 
