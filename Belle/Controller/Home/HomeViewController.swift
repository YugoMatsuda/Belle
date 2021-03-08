//
//  HomeViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import XLPagerTabStrip

class HomeViewController: TwitterPagerTabStripViewController {
    

    private let postButton : AnimationButton = {
        let button = AnimationButton()
        button.setDimensions(width: 50, height: 50)
        button.tintColor = .systemBackground
        button.backgroundColor = .label
        button.setImage(UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.layer.shadowOffset = .init(width: 1.5, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 15
        button.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNav()
        setUpButton()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        let child_1 = NoteListCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        vcs.append(child_1)
        let child_2 = NoteListTableViewController()
        vcs.append(child_2)
        return vcs
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
        self.view.addSubview(postButton)
        postButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor,  paddingBottom: 50, paddingRight:10)
        self.view.bringSubviewToFront(self.postButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func postButtonTapped(){
        print(#function)
    }
}
