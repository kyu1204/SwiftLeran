//
//  MyCircleView.swift
//  AutoLayoutWithCode
//
//  Created by 김민규 on 2021/10/02.
//

import Foundation
import UIKit

class MyCircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView - layoutSubviews() called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
