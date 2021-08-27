

//
//  ViewController.swift
//  NewsTuto
//
//  Created by 김민규 on 2021/08/27.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData :Array<Dictionary<String, Any>>?
    
    func getNews() {
        // 데이터 request
        URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=785f2c78d2b34777bef1eef6504b9c38")!) { data, response, error in
            
            if let dataJson = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    // 백그라운드에서 데이터 로드(비동기) 후 메인 뷰에서 리로드
                    DispatchQueue.main.async {
                        // 데이터 리로드
                        self.TableViewMain.reloadData()
                    }
                }
                catch {}
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터가 몇개인지
        
        // news data 가 있으면 len, 없으면 0
        if let newsData = newsData {
            return newsData.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터가 무엇인지
        // Cell 을 사용하는 2가지 방법
        
        // 1. 임의 셀 생성
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        // 2. 스토리보드 + id
        // as ==> type 캐스팅 as?: 옵셔널 as!: 강제 캐스팅
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        if let newsData = newsData {
            let news = newsData[indexPath.row]
            if let news = news as? Dictionary<String, Any> {
                if let title = news["title"] as? String {
                    cell.LabelText.text = title
                }
                
            }
        }
        
        return cell
    }
    
    // 1. tableview delegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 데이터를 눌렀을 때
//
//        // 데이터 셋팅
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        if #available(iOS 13.0, *) {
//            let newsDetail = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
//            if let newsData = newsData {
//                let news = newsData[indexPath.row]
//                if let news = news as? Dictionary<String, Any> {
//                    if let imageUrl = news["urlToImage"] as? String {
//                        newsDetail.imageUrl = imageUrl
//                    }
//                    if let content = news["description"] as? String {
//                        newsDetail.content = content
//                    }
//                }
//            }
//
//            // 이동 - 수동
//            showDetailViewController(newsDetail, sender: nil)
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
    
    // 2. storyboard segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let newsDetail = segue.destination as? NewsDetailController {
                // 데이터 셋팅
                if let newsData = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow{
                        let news = newsData[indexPath.row]
                        if let news = news as? Dictionary<String, Any> {
                            if let imageUrl = news["urlToImage"] as? String {
                                newsDetail.imageUrl = imageUrl
                            }
                            if let content = news["description"] as? String {
                                newsDetail.content = content
                            }
                        }
                    }
                }
            }
        }
        
        // 이동 - 자동
    }
    
    // 1. 디테일 화면 만들기
    // 2. 값 보내기
    //  1. tableview delegate / 2. storyboard segue
    // 3. 화면이동
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }
    
    // 테이블 뷰 에서 제일 중요한 요소
    // 1. 데이터가 무엇인지
    // 2. 데이터가 몇개인지
    // 3. (옵션) 데이터를 눌렀을 때
}
