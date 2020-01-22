//
//  SubCategoriesTableViewCell.swift
//  black_shop
//
//  Created by Владислав Бочаров on 06/01/2020.
//  Copyright © 2020 Владислав Бочаров. All rights reserved.
//

import UIKit

class SubCategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameC: UILabel!
    @IBOutlet weak var typeC: UILabel!
    @IBOutlet weak var sortOrderSubCategoryLabel: UILabel!
    @IBOutlet weak var nameSubCategoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
