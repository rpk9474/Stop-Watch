//
//  ViewController.swift
//  Stop Watch
//
//  Created by D7702_10 on 2019. 4. 3..
//  Copyright © 2019년 D7702_10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var myTimer = Timer()
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeButtonState(Start: true, Pause: false, Stop: false)
        timeLabel.text = String(count)
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        changeButtonState(Start: false, Pause: true, Stop: true)
        
        if (!myTimer.isValid) {
            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            print("start Button = \(myTimer.isValid)")
        }
    }
    

    @IBAction func pauseButtonPressed(_ sender: Any) {
        
        changeButtonState(Start: true, Pause: false, Stop: true)
        
        myTimer.invalidate()
    }
    

    @IBAction func stopButtonPressed(_ sender: Any) {
        
        changeButtonState(Start: true, Pause: false, Stop: false)
        
        myTimer.invalidate()
        print(myTimer.isValid)
        
        count = 0
        timeLabel.text = String(count)
    }
    
    @objc func updateTime(){
        count += 1
        timeLabel.text = String(count)
    }
    
    func changeButtonState(Start : Bool, Pause : Bool, Stop : Bool) {
        startButton.isEnabled = Start
        pauseButton.isEnabled = Pause
        stopButton.isEnabled = Stop
    }
    
    
    
}

