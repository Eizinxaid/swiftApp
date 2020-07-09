//
//  ViewController.swift
//  l2a
//
//  Created by Valentyn on 3/10/19.
//  Copyright © 2019 Valentyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var stateLabel: UILabel!

    var activity = Activity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switch1.setOn(true,animated: false)
        //initial state of LED
        activity.LEDcontrol(LEDState: "1")
        stateLabel.text="LED State: ON"
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        if(switch1.isOn){
            stateLabel.text="LED State: ON"
            activity.LEDcontrol(LEDState: "1")
        }
        else{
            stateLabel.text="LED State: OFF"
            activity.LEDcontrol(LEDState: "0")
        }
        
    }
}





