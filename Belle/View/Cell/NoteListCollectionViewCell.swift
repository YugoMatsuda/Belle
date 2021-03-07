//
//  NoteListCollectionViewCell.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import UIKit

class NoteListCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp() {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
        self.layer.shadowOffset = CGSize(width: 1,height: 1)
    }
}
