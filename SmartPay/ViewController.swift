//
//  ViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/12/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource  {

    // MARK: - Variables
    var imagesToDispayOnPageView:[String] = ["lambo.jpeg", "R8Goals.jpg"]

    var pageViewController: UIPageViewController?
    
    var contentViewController: ContentViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController?
        //initializing the page view controller
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
       
        //setting the page view controllers delegate
        self.pageViewController?.delegate = self
        
        //getting the first view controller to present using our method that returns a view controller at a specific index
        let firstViewController = self.viewControllerAtIndex(0, storyBoard: self.storyboard!)!
        
        //the setViewControllers method requires a array of view controllers
        let viewControllers = [firstViewController]
        
        //setting the view controllers and the direction
        self.pageViewController?.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 56)
        //setting the data source and adding the pageViewController to our view hiarchy
        self.pageViewController?.dataSource = self
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController?.didMove(toParentViewController: self)
    
    }
    // MARK: - Page View Controller Helper Functions
    
    func indexOfViewController(viewController: ContentViewController) -> Int {
        
        //this method returns the index of the passed in view controller. This function determines the index by using the images array and figuring out what image in set to the view and it uses the index of that image set on the content view and finds it in the imagesToDisplay array
        return imagesToDispayOnPageView.index(of: viewController.imageName!)!
    }
    
    func viewControllerAtIndex(_ index: Int, storyBoard: UIStoryboard) -> ContentViewController? {
        //this function will return a view controller at a specific index. I
        if (self.imagesToDispayOnPageView.count == 0 || (index >= self.imagesToDispayOnPageView.count)) {
            //if the images array is empty or the index is greater than the array count dont return a view because there is no view
            return nil
        }
        
        //if there is a view to create, create a view controller and supply its data
        contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        //set the image on that view to be the image of whatever the index of the images array
        contentViewController.imageName = imagesToDispayOnPageView[index]
        contentViewController.index = index
        
        //return the view
        return contentViewController
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // must know the index of the view controller currently presented to determine which view will come next. Use the function we created to determine the index. It requires a ContentViewController so that is why we cast it
        var index = self.indexOfViewController(viewController: viewController as! ContentViewController)
        
        // if the view controller that the user just navigated from or is about to navigate from is not foud
        if index == NSNotFound {
            
            //return nil to indicate there are no more view controllers to show
            return nil
        }
        
        // if the index passes the check and the next view controller has a valid spot in the images array add one to the idex
        index = index + 1
        
        // if the view controller that the user just navigated or attemted to naviagte is equal to the imagesToDisplay array count this means the user is attempting to swipe off the of the last view so return no view controller
        if index == self.imagesToDispayOnPageView.count {
            
            //return nil to indicate there are no more view controllers to show
            return nil
        }
        //if there is a view controller still to show return it after we check to make sure there is another view controller to show
        return self.viewControllerAtIndex(index, storyBoard: self.storyboard!)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // we need to know the current index or view controller the user is on so we can determine if there is a view controller before their current view controller
        var index = self.indexOfViewController(viewController: viewController as! ContentViewController)
        
        // if the index of the view is 0 or not found the current page is the first page and there is no view before it that can be returned so return nil
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        //if index check passes and there is a view controller to swip back to, take away 1 from the index so we can display the view controller at the index before
        index = index - 1
        
        //the return the index before
        return self.viewControllerAtIndex(index, storyBoard: self.storyboard!)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.imagesToDispayOnPageView.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.contentViewController.index
    }
}
