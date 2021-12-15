//
//  ViewController.swift
//  dynamic_table_view_tutorial
//
//  Created by Jeff Jeong on 2020/09/01.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit


// 섹션
enum Section {
    case feed, post, board
}

// 클래스
class Feed: Hashable {
    let uuid: UUID = UUID()
    var content: String
    init(content: String) {
        self.content = content
    }
    
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

// 스트럭트
struct Post: Hashable {
    var content: String
}


class MyTableVC: UIViewController {
    
    // 1. 테이블 뷰
    @IBOutlet weak var myTableView: UITableView!
    
    // 2. 데이터 소스 - UITableViewDataSource delegate 를 대체
    var dataSource: UITableViewDiffableDataSource<Section, Feed>!
    
    // 3. 스냅샷 - 현재의 데이터 상태
    var snapshot: NSDiffableDataSourceSnapshot<Section, Feed>!
    
    let feedArray = [
        Feed(content: "simply dummy text of the printing and"),
        Feed(content: "um has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type "),
        Feed(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribestablished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
        Feed(content: "established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
        Feed(content: "a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is thaai"),
        Feed(content: "ho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it is pai"),
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simplho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it y because it is pai")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 쎌 리소스 파일 가져오기
        // let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: <#T##Bundle?#>)
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        // 쏄에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCellId")
        
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 120
        
        // 아주 중요
        self.myTableView.delegate = self
        // self.myTableView.dataSource = self
        
        print("feedArray.count : \(feedArray.count)")
        
        // MARK: - 데이터 소스 설정
        dataSource = UITableViewDiffableDataSource<Section, Feed>(tableView: self.myTableView, cellProvider: {
            (tableview: UITableView, indexPath: IndexPath, identifier: Feed) -> UITableViewCell? in
            
            // 셀 클래스 연결
            let cell = tableview.dequeueReusableCell(withIdentifier: "myTableViewCellId", for: indexPath) as! MyTableViewCell
            
            cell.userContentLabel.text = identifier.content
            
            return cell
        })
        
        // MARK: - 데이터 소스의 스냅샷 생성
        snapshot = NSDiffableDataSourceSnapshot<Section, Feed>()
        
        // 섹션 추가
        snapshot.appendSections([.feed])
        
        // 방금 추가한 섹션에 아이템 넣기
        snapshot.appendItems(feedArray, toSection: .feed)
        
        // 현재 스냅샷을 화면에 노출
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }

}


extension MyTableVC: UITableViewDelegate {}


//extension MyTableVC: UITableViewDataSource {
//
//    // 테이블 뷰 쎌의 갯수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.contentArray.count
//      }
//
//    // 각 쎌에 대한 설정
//      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCellId", for: indexPath) as! MyTableViewCell
//
//        cell.userContentLabel.text = contentArray[indexPath.row]
//
////        cell.userProfileImg.layer.cornerRadius = cell.userProfileImg.frame.height / 2
//
//        return cell
//
//      }
//}
