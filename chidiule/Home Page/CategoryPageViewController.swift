//
//  CategoryPageViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/20.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
protocol CategoryPageViewControllerDelegate: class {
    func setupCategoryPageController(numberOfPages: Int)
    func turnCategoryPageController(to index: Int)
}

class CategoryPageViewController: UIPageViewController {
    
    var categoryList1:[Category] = [
        Category(name: "川湘菜", image: UIImage(named: "spicy")!),
        Category(name: "日料", image: UIImage(named: "sushi")!),
        Category(name: "早茶粤菜", image: UIImage(named: "dimsum")!),
        Category(name: "本帮", image: UIImage(named: "lobster")!),
        Category(name: "米其林", image: UIImage(named: "burger")!),
        Category(name: "火锅烧烤", image: UIImage(named: "barbeque")!),
        Category(name: "台湾", image: UIImage(named: "taiwanrice")!),
        Category(name: "西餐", image: UIImage(named: "steak")!)
    ]
    var categoryList2:[Category] = [
        Category(name: "自助", image: UIImage(named: "spicy")!),
        Category(name: "东南亚", image: UIImage(named: "chicken")!),
        Category(name: "海鲜", image: UIImage(named: "grape")!),
        Category(name: "面条", image: UIImage(named: "noodle")!),
        Category(name: "韩国", image: UIImage(named: "sausage")!),
        Category(name: "Brunch", image: UIImage(named: "egg")!),
        Category(name: "咖啡", image: UIImage(named: "banana")!),
        Category(name: "面包", image: UIImage(named: "steak")!)
    ]
    
    weak var pageViewControllerDelegate: CategoryPageViewControllerDelegate?
    
    
    struct Storyboard {
        static let categoryViewController = "CategoryCollectionViewController"
    }
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        
        
        let categoryCollectionVC1 = storyboard.instantiateViewController(withIdentifier: Storyboard.categoryViewController)
        controllers.append(categoryCollectionVC1)
        let categoryCollectionVC2 = storyboard.instantiateViewController(withIdentifier: Storyboard.categoryViewController)
        controllers.append(categoryCollectionVC2)
        self.pageViewControllerDelegate?.setupCategoryPageController(numberOfPages: controllers.count)
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
        // Do any additional setup after loading the view.
    }
    
    func turnToPage(index: Int){
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)
            if currentIndex! > index {
                direction = .reverse
            }
        }
        self.configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    func configureDisplaying(viewController: UIViewController){
        
        for (index, vc) in controllers.enumerated(){
            if viewController === vc {
                if let categoryCollectionVC = viewController as? CategoryCollectionViewController {
//                    adImageVC.image = self.images?[index]
                    if index == 0 {
                        categoryCollectionVC.categories = categoryList1
                        categoryCollectionVC.page = 0
                    }
                    else {
                        categoryCollectionVC.categories = categoryList2
                        categoryCollectionVC.page = 1
                    }
                    self.pageViewControllerDelegate?.turnCategoryPageController(to: index)
                }
            }
        }
    }
    
    
}
extension CategoryPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index > 0 {
                return controllers[index - 1]
            }
        }
        //        return controllers.last
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        //        return controllers.first
        return nil
    }
    
    
}
extension CategoryPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! CategoryCollectionViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! CategoryCollectionViewController)
        }
    }
}

