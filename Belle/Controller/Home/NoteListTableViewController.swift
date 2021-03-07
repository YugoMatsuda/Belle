//
//  NoteListTableViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import XLPagerTabStrip

class NoteListTableViewController: UITableViewController {
    
    var itemInfo: IndicatorInfo = ""
    private let reuseIdentifier = "NoteListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "NoteListTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for:indexPath) as! NoteListTableViewCell
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    /*
     // MARK: - Navigation
     
     
     */
    
}
extension NoteListTableViewController: IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
