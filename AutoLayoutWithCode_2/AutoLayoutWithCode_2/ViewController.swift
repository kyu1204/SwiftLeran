//
//  ViewController.swift
//  AutoLayoutWithCode_2
//
//  Created by 김민규 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    var someViewBottomConstraint: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: "MyYellow")
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "MyBlue")
        someView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someView)
        someView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        
        
        let moveViewButton = UIButton(type: .system)
        moveViewButton.translatesAutoresizingMaskIntoConstraints = false
        moveViewButton.backgroundColor = .white
        moveViewButton.setTitle("위로 올리기", for: .normal)
        moveViewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveViewButton.setTitleColor(.black, for: .normal)
        moveViewButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        moveViewButton.layer.cornerRadius = 8
        moveViewButton.addTarget(self, action: #selector(self.moveView), for: .touchUpInside)
        
        view.addSubview(moveViewButton)
        moveViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moveViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc fileprivate func moveView() {
        someViewBottomConstraint?.constant -= 100
        
        UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }).startAnimation()
    }

}

#if DEBUG
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
            .previewDisplayName("미리보기")
    }
}

#endif
