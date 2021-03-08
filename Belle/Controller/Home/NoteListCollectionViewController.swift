//
//  NoteListCollectionViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-06.
//

import XLPagerTabStrip

private let reuseIdentifier = "NoteListCollectionViewCell"

class NoteListCollectionViewController: UICollectionViewController {
    
    var itemInfo: IndicatorInfo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layout.itemSize = CGSize(width:self.view.frame.size.width - 40, height: 50)
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "NoteListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
        guard let nabHeight = navigationController?.navigationBar.frame.height else { return }
        collectionView.contentInset.bottom = nabHeight * 2.5
//        collectionView.frame.size.height = self.view.frame.size.height - nabHeight * 2
//
//        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NoteListCollectionViewCell
        cell.backgroundColor = .systemBackground
        cell.setUp()
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
}

extension NoteListCollectionViewController: IndicatorInfoProvider{

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
