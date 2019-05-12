//
//  MyBrowserViewController.swift
//  Class03
//
//  Created by lieh on 2019/5/6.
//  Copyright © 2019年 wunanlieh. All rights reserved.
//

import UIKit

class MyBrowserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillDisappear(animated)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillAppear(notification:)),name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillDisAppear(notification:)),name:
            UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
     super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(notification:NSNotification?){
        print("keyboarWillAppear")
    }
    
    @objc func keyboardWillDisAppear(notification:NSNotification?){
        print("keyboarWillDisAppear")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
