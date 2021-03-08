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
    
    private let postButton : AnimationButton = {
        let button = AnimationButton()
        button.setDimensions(width: 40, height: 40)
        button.tintColor = .systemBackground
        button.backgroundColor = .label
        button.setImage(UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.shadowOffset = .init(width: 1.5, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 15
        button.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNav()
        setUpButton()
    }
    
    
    func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "NoteListTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.contentInset.bottom = 180
    }
    func setUpNav(){
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        label.textColor = UIColor.label
        let day = CalenderLogic().getDay(Date())
        label.text = CalenderLogic().getMonthName(month: day.1) + ", " + String(day.2) + " / " + "" + String(day.0)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    func setUpButton(){
        self.navigationController!.view.addSubview(postButton)
        postButton.anchor(bottom: self.navigationController!.view.bottomAnchor, right: self.navigationController!.view.rightAnchor,  paddingBottom: 50, paddingRight:10)
//        self.tableView.bringSubviewToFront(self.postButton)
    }
    
    @objc func postButtonTapped(){
        print(#function)
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
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
