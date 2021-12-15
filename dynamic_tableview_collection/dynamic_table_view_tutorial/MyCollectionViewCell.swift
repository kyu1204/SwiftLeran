//
//  MyCollectionViewCell.swift
//  dynamic_table_view_tutorial
//
//  Created by 김민규 on 2021/12/12.
//  Copyright © 2021 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    var imageName: String = "" {
        didSet{
            print("MyCollectionViewCell / imageName - didSet(): \(imageName)")
            
            // 셀의 UI 설정
            self.profileImage.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
    
}
