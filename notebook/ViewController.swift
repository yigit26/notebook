//
//  ViewController.swift
//  notebook
//
//  Created by Yiğit Can Türe on 12/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [Note]()
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }
    
    func getData() {
        let fec : NSFetchRequest<Note> = Note.fetchRequest()
        let sortDesc = NSSortDescriptor(key: "date", ascending: false)
        fec.sortDescriptors = [sortDesc]
        do {
            self.data = try context.fetch(fec)
            self.tblView.reloadData()
        } catch {
        }
        
    }
    
    @IBAction func addNote(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteCell{
            let note = data[indexPath.row]
            if note.image != nil {
                if let imgBase = note.image?.image as? UIImage {
                    cell.imgTitle.isHidden = false
                    cell.imgTitle.image = imgBase
                }else {
                    cell.imgTitle.isHidden = true
                }
                
            } else {
                cell.imgTitle.isHidden = true
            }
            cell.lblTitle.text = note.title
            cell.lblBrief.text = note.brief
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: data[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let obj = sender as? Note {
                if let vc = segue.destination as? NoteViewController {
                    vc.noteEdit = obj
                }
            }
        }
    }
    
}

