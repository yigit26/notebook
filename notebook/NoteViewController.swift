//
//  NoteViewController.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func turnBack(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
