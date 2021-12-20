//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by 김민규 on 2021/12/19.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController - viewDidLoad() called")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            print("result: \(result)")
            KRProgressHUD.showSuccess()
            self.mainTitle.text = result
        })
    }
    
    fileprivate func sayHi(completion: @escaping(String) -> ()) {
        print("ViewController - sayHi() called")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("Hi!!!")
            
            completion("The End")
        }
    }


}

