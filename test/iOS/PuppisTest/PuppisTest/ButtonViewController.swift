//
//  ButtonViewController.swift
//  PuppisTest
//
//  Created by Ethan Hedrick on 6/26/15.
//  Copyright (c) 2015 Ethan Hedrick. All rights reserved.
//

import UIKit

class ButtonViewController : UIViewController {
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var buttonClickedLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonClickedLabel.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(sender: AnyObject){
        buttonClickedLabel.hidden = false
    }
}
