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
    
    /*
     // MARK: - Navigation
     
     
     */
    
}
extension NoteListTableViewController: IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
