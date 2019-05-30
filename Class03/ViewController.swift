
//
//  ViewController.swift
//  Class03
//
//  Created by wunanlieh on 2018/4/7.
//  Copyright © 2019年 wunanlieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbmessage: UILabel!
    

    @IBAction func bt01(_ sender: UIButton) {
        lbmessage.text="hi,happy"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(UserDefaults.standard.string(forKey: "hi")!)")
        
    }


}

