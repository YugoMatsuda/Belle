//
//  PostMemoTextViewCell.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-11.
//

import UIKit

class PostMemoTextViewCell: UITableViewCell {

    @IBOutlet weak var titleTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpTextField(){
        titleTextField.setUnderLine()

    }
    
}
