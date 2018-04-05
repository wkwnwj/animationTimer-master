//
//  ViewController.swift
//  animationTimer
//
//  Created by D7703_27 on 2018. 4. 5..
//  Copyright © 2018년 D7703_27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageCounter: UILabel!
    
    var counter = 1
    var myTimer = Timer()
    var file = "right"
    var but = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageCounter.text = String(counter)
    }
    @IBAction func play(_ sender: Any) {
        
        if but == true {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
            but = false
        }else if but == false {
            
            self.myTimer.invalidate()
            but = true
        }
    }

    
    @objc func doAnimation() {
        
        if file == "right"{
            counter = counter + 1
            if counter == 5 {
                file = "left"
            }
            
        } else if file == "left"{
            counter = counter - 1
            if counter == 1{
                file = "right"
            }
            
        }
        myImageView.image = UIImage(named: "frame\(counter).png")
        imageCounter.text = String(counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

