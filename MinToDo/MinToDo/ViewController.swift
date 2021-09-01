//
//  ViewController.swift
//  MinToDo
//
//  Created by 김민규 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    var mainTextLabe : UILabel = {
        
        var label = UILabel()
        label.text = "헬로우 월드"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(mainTextLabe)
        
        mainTextLabe.translatesAutoresizingMaskIntoConstraints = false
        mainTextLabe.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainTextLabe.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
}

