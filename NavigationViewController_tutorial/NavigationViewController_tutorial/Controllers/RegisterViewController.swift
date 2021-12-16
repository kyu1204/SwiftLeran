//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 김민규 on 2021/12/16.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 네비게이션 바 숨김
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onLoginViewControllerClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerClicked() called")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
