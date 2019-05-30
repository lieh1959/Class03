//
//  MyBrowserViewController.swift
//  Class03
//
//  Created by lieh on 2019/5/6.
//  Copyright © 2019年 wunanlieh. All rights reserved.
//

import UIKit
import WebKit

class MyBrowserViewController: UIViewController,UITextFieldDelegate ,AsyncReponseDelegate{
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        print(responseString)
        
        myWebView.loadHTMLString(responseString, baseURL:URL(string: "https://www.google.com")!)
        
    }
    
    
    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var myWebView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let worker:AsyncRequestWorker=AsyncRequestWorker()
        worker.reponseDelegate = self
        worker.getResponse(from: "https://www.google.com", tag: 1)
        
       /* myWebView.load(URLRequest(url: URL(string:  "https://www.google.com")!))
        Do any additional setup after loading the view. */
    }
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillDisappear(animated)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillAppear(notification:)),name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillDisAppear(notification:)),name:
            UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(notification:)), name: Notification.Name(rawValue: "response.received"), object: nil)
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
     super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue:"response.received"), object: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    //Mark: -TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let accept="abcdeABCDE"
        let cs=NSCharacterSet(charactersIn: accept).inverted
        let filters=string.components(separatedBy: cs).joined(separator: "")
        if(string != filters)
        {
            return false
        }
        
        
        let current = textField.text! as NSString
        let newString : NSString =
         current.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= 10
    }
    
    @objc func keyboardWillAppear(notification:NSNotification?){
        print("keyboarWillAppear")

      guard let frame=notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        self.btnGoBottomConstraint.constant=frame.cgRectValue.height;
    }
    
    @objc func keyboardWillDisAppear(notification:NSNotification?){
        print("keyboarWillDisAppear")
        self.btnGoBottomConstraint.constant=31;
    }
    
    @objc func dataReceived(notification: NSNotification?){
    guard let responseString = notification?.userInfo?["aaa"] as? String else{
        return
    }
    
    print(responseString)
        myWebView.loadHTMLString(responseString,baseURL: URL(string: "https://www.google.com")!)
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
