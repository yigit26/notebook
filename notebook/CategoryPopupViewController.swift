//
//  CategoryPopoverViewController.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit

class CategoryPopupViewController: UIViewController {
    @IBOutlet weak var txtCatName: UITextField!
    private var _clo : RefreshUI!
    var clo : RefreshUI {
        set {
            _clo = newValue
        }
        get {
            return _clo
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismiss(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCategory(_ sender: UIButton) {
        let category = Category(context: context)
        if !(txtCatName.text?.isEmpty)! {
            category.name = txtCatName.text
            ad.saveContext()
            self.clo()
            self.dismiss(sender)
        }
        
    }
}
