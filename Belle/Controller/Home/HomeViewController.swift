//
//  HomeViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import XLPagerTabStrip

class HomeViewController: TwitterPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNav()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        let child_1 = NoteListTableViewController()
        vcs.append(child_1)
        let child_2 = NoteListCollectionViewController(collectionViewLayout: UICollectionViewLayout())
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
