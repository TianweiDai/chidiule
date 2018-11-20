//
//  AdPageViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/18.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
protocol AdPageViewControllerDelegate: class {
    func setupAdPageController(numberOfPages: Int)
    func turnAdPageController(to index: Int)
}

class AdPageViewController: UIPageViewController {
    
    var images: [UIImage]? = [UIImage(named: "volauvent")!, UIImage(named: "bg2")!, UIImage(named: "bg3")!, UIImage(named: "volauvent")!]
    weak var pageViewControllerDelegate: AdPageViewControllerDelegate?
    
    
    struct Storyboard {
        static let adViewController = "AdViewController"
    }
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        


        if let images = self.images {

            for image in images {
                let adImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.adViewController)
                controllers.append(adImageVC)
//                print("load VC once")
            }
        }
        self.pageViewControllerDelegate?.setupAdPageController(numberOfPages: controllers.count)
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
                if let adImageVC = viewController as? AdViewController {
                    adImageVC.image = self.images?[index]
                    self.pageViewControllerDelegate?.turnAdPageController(to: index)
                }
            }
        }
    }


}
extension AdPageViewController: UIPageViewControllerDataSource{
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
extension AdPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! AdViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! AdViewController)
        }
    }
}
