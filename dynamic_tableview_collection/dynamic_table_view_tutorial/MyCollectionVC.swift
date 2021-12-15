//
//  MyCollectionVC.swift
//  dynamic_table_view_tutorial
//
//  Created by 김민규 on 2021/12/12.
//  Copyright © 2021 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit


class MyCollectionVC: UIViewController {
    
    @IBOutlet weak var mySegementControl: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    fileprivate let systemImageNameArray = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ]
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyCollectionVC - viewDidLoad() called")
        
        // 콜렉션 뷰에 대한 설정
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // 사용할 콜렉션뷰 셀 등록 (Nib 파일)
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        
        // 쏄에 리소스 등록
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
        // 콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다
        self.myCollectionView.collectionViewLayout = createCompositionalLayoutFirst()
        
    }
    
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        print("MyCollectionVC - onCollectionViewTypeChanged() called / sender.selectedSegmentIndex : \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutFirst()
        case 1:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutSecond()
        case 2:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutThird()
        default:
            break
        }
    }
    
    
    
}

//MARK: - 콜렉션뷰 콤포지셔널 레이아웃 관련
extension MyCollectionVC {
    
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayoutFirst() -> UICollectionViewLayout {
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜블 (키: 값) 의 묶음으로 들어옴. 반환 하는것은 NSCollectionLayoutSection 콜렉션 레이아웃 셋션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 고정값, estimated 추측값, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            // let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            // section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
    
    fileprivate func createCompositionalLayoutSecond() -> UICollectionViewLayout {
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜블 (키: 값) 의 묶음으로 들어옴. 반환 하는것은 NSCollectionLayoutSection 콜렉션 레이아웃 셋션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 고정값, estimated 추측값, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/2)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            // let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            // section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
    
    fileprivate func createCompositionalLayoutThird() -> UICollectionViewLayout {
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜블 (키: 값) 의 묶음으로 들어옴. 반환 하는것은 NSCollectionLayoutSection 콜렉션 레이아웃 셋션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 고정값, estimated 추측값, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템간의 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            // let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            // section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
}


// 콜렉션뷰 델리게이트 - 액션과 관련된 것들
extension MyCollectionVC: UICollectionViewDelegate {}

// 콜렉션뷰 데이터소스 - 데이터와 관련된 것들
extension MyCollectionVC: UICollectionViewDataSource {
    
    // 각 섹션에 들어갈 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    
    // 각 콜렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // let cellId = String(describing: MyCollectionViewCell.self)
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCustomCollectionViewCell.self), for: indexPath) as! MyCustomCollectionViewCell
        
        cell.imageName = self.systemImageNameArray[indexPath.item]
        
        //cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        // cell.contentView.layer.cornerRadius = 8
        // cell.contentView.layer.borderWidth = 1
        // cell.contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        // 데이터에 따른 셀 UI 변경
        // 이미지 설정
        // cell.profileImage.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
        // 라벨 설정
        // cell.profileLabel.text = self.systemImageNameArray[indexPath.item]
        
        return cell
    }
    
}
