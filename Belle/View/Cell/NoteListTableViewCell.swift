//
//  NoteListTableViewCell.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import UIKit

class NoteListTableViewCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.clipsToBounds = true
        baseView.layer.masksToBounds = false
        baseView.layer.shadowOpacity = 0.2
        baseView.layer.shadowRadius = 3
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.cornerRadius = 20
        baseView.layer.shadowOffset = CGSize(width: 1,height: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
