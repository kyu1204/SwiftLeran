//
//  ViewController.swift
//  StackViewTuto
//
//  Created by 김민규 on 2021/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberButtons: [CircleButton]!
    @IBOutlet weak var phoneCallButton: CircleButton!
    
    var phoneNumberString = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btnItem in phoneNumberButtons {
            btnItem.addTarget(self, action: #selector(onNumberBtnClick(sender:)), for: .touchUpInside)
        }
        phoneCallButton.addTarget(self, action: #selector(onPhoneCallBtnClick(sender:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onNumberBtnClick(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }

    @objc fileprivate func onPhoneCallBtnClick(sender: UIButton) {
        phoneNumberString.removeAll()
    }
}

