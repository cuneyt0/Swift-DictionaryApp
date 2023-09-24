//
//  WordTableViewCell.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import UIKit

class WordTableViewCell: UITableViewCell {

    @IBOutlet weak var turkishLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
