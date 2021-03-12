//
//  PostMemoViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-09.
//

import UIKit

class PostMemoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let reuseIdentifierPostMemoTextViewCell = "PostMemoTextViewCell"
    private let reuseIdentifierPostMemoFolderCell = "PostMemoFolderCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostMemoTextViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierPostMemoTextViewCell)
        tableView.register(UINib(nibName: "PostMemoFolderCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierPostMemoFolderCell)

    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension PostMemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierPostMemoFolderCell,for:indexPath) as! PostMemoFolderCell
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierPostMemoTextViewCell,for:indexPath) as! PostMemoTextViewCell
            cell.selectionStyle = .none
            return cell
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return self.view.frame.height
        }
    }
    
}
