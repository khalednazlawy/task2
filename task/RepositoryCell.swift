//
//  RepositoryCell.swift
//  task
//
//  Created by khaled nazlawy on 2/6/18.
//  Copyright © 2018 khaled nazlawy. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var labelNameOfRep: UILabel!
    @IBOutlet weak var labelDescrption: UILabel!
    @IBOutlet weak var labelProgrammingLang: UILabel!
    @IBOutlet weak var labelLast_update: UILabel!
    @IBOutlet weak var labelNumberOfForks: UILabel!
    @IBOutlet weak var LabelStragersCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
