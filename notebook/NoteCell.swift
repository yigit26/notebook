//
//  NoteCell.swift
//  notebook
//
//  Created by Yiğit Can Türe on 12/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBrief: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


}
