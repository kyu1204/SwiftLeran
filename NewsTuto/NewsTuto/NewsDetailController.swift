//
//  NewsDetailController.swift
//  NewsTuto
//
//  Created by 김민규 on 2021/08/28.
//

import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    
    // 1. image url
    // 2. description
    // 3. title
    
    var imageUrl: String?
    var content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageUrl = imageUrl {
            // 이미지를 그리기
            if let data = try? Data(contentsOf: URL(string: imageUrl)!) {
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let content = content {
            // 본문 그리기
            self.LabelMain.text = content
        }
    }
}
