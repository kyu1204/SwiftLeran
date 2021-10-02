//
//  ViewController.swift
//  AutoLayoutWithCode
//
//  Created by 김민규 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    // 클로저로 뷰를 설정
    var mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var myThirdView : MyCircleView = {
       let circleView = MyCircleView()
        circleView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view 생성
        let myFirstView = UIView()
        // 코드로 view 조작 시 필수
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        // 백그라운드 컬러
        myFirstView.backgroundColor = .systemPink
        // view controller 에 view 에 추가
        self.view.addSubview(myFirstView)
        
        //x, y, 가로, 세로
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20)
        ])
        
        self.view.addSubview(myThirdView)
        myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5).isActive = true
        myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5).isActive = true
        myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50).isActive = true
        myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
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
            .previewDisplayName("아이폰 11")
    }
}

#endif
