//
//  MyCustomCollectionViewCell.swift
//  dynamic_table_view_tutorial
//
//  Created by 김민규 on 2021/12/12.
//  Copyright © 2021 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit


class MyCustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!

    var imageName: String = "" {
        didSet{
            print("MyCustomCollectionViewCell / imageName - didSet(): \(imageName)")
            
            // 셀의 UI 설정
            self.profileImage.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.contentView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
}
