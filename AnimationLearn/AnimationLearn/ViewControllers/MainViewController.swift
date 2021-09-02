//
//  ViewController.swift
//  AnimationLearn
//
//  Created by 김민규 on 2021/08/30.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "메인화면"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView : AnimationView = {
        
        let animView = AnimationView(name: "74468-rocket")
        animView.frame = CGRect(x:0, y:0, width: 400, height: 400)
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(animationView)
        animationView.center = view.center
        
        animationView.play{ (finish) in
            print("애니메이션 종료")
            self.animationView.removeFromSuperview()

            self.view.backgroundColor = .white
            self.view.addSubview(self.titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
    }
    
}

