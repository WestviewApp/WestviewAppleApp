//
//  ScheduleTableViewCell.swift
//  Westview
//
//  Created by Ronak Shah on 8/16/17.
//  Copyright © 2017 Ronak Shah. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var left: UILabel!
    @IBOutlet weak var mid: UILabel!
    @IBOutlet weak var right: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func setTitle() {
        self.left.font = UIFont(name: "Roboto Medium", size: 12)
        self.mid.font = UIFont(name: "Roboto Medium", size: 12)
        self.right.font = UIFont(name: "Roboto Medium", size: 12)
    }
    
    func setContent() {
        self.left.font = UIFont(name: "Roboto", size: 13)
        self.mid.font = UIFont(name: "Roboto", size: 13)
        self.right.font = UIFont(name: "Roboto", size: 13)
        /* set color of the text for the cells*/
        if #available(iOS 13.0, *) {
            self.left.textColor = UIColor.label
            self.mid.textColor = UIColor.label
            self.right.textColor = UIColor.label
        } else {
            self.left.textColor = UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 1)
            self.mid.textColor = UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 1)
            self.right.textColor = UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 1)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
