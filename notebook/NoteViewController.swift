//
//  NoteViewController.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var txtTitle: UITextView!
    @IBOutlet weak var txtNote: UITextView!
    @IBOutlet weak var pckCategory: UIPickerView!
    @IBOutlet weak var imgBase: UIImageView!
    
    var imagePicker: UIImagePickerController!
    var noteEdit : Note?
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.getCategories()
        if noteEdit != nil {
            self.loadFields()
        }
    }
    
    func getCategories() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            self.categories = try context.fetch(request)
            self.pckCategory.reloadAllComponents()
        } catch {
        }
    }
    
    func loadFields() {
        if let item = noteEdit {
            txtTitle.text = item.title
            txtNote.text = item.note
            if let cat = item.category {
                var index = 0
                repeat {
                    let s = categories[index]
                    if s.name == cat.name {
                        pckCategory.selectRow(index, inComponent: 0, animated: true)
                        break;
                    }
                    index += 1
                } while (index < categories.count)
            }
            
            if let imgObj = item.image {
                if let img = imgObj.image as? UIImage {
                    imgBase.image = img
                }
            }
        }
        
        
        
    }
    
    @IBAction func addNote(_ sender: UIButton) {
        var note : Note!
        
        
        if noteEdit == nil {
            note = Note(context: context)
        }else {
            note = noteEdit
        }
        
        if imgBase.image != #imageLiteral(resourceName: "pic") {
            let img = Images(context: context)
            img.image = imgBase.image
            note.image = img
        }
        
        
        if let title = txtTitle.text {
            note.title = title
        }
        
        if let noteText = txtNote.text {
            note.note = noteText
            if noteText.lengthOfBytes(using: String.Encoding.utf8) > 100 {
                let index = noteText.index(noteText.startIndex, offsetBy: 97)
                note.brief = noteText.substring(to: index) + "..."
            }else {
                note.brief = noteText
            }
        }
        
        note.category = self.categories[pckCategory.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func turnBack(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addCategory(_ sender: UIButton) {
        performSegue(withIdentifier: "CategoryAdd", sender: sender)
    }
    
    @IBAction func tapBaseImageButton(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cat = categories[row]
        return cat.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoryAdd" {
            if let vc = segue.destination as? CategoryPopupViewController {
                vc.clo = {
                    self.getCategories()
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgBase.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}

