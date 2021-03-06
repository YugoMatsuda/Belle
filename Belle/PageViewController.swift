//
//  PageViewController.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-06.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
//        UIPageControl.appearance().backgroundColor = .yellow
//        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
//        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
//        UIPageControl. .frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let pageIndex = pages.firstIndex(of: viewController), pageIndex - 1 >= 0 {
            return pages[pageIndex - 1]
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let pageIndex = pages.firstIndex(of: viewController), pageIndex + 1 < pages.count {
            return pages[pageIndex + 1]
        }
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    // MARK: - Private

    /// 紙芝居の各ページとなる UIViewController
    private lazy var pages: [UIViewController] = {
        return [createPage(color: .white), createPage(color: .red), createPage(color: .white)]
    }()

    private func createPage(color: UIColor) -> UIViewController {
        let page = UIViewController()
        page.view.backgroundColor = color
        return page
    }

}
