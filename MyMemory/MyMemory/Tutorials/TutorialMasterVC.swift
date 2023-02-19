//
//  TutorialMasterVC.swift
//  MyMemory
//
//  Created by LEE on 2023/02/16.
//

import UIKit

class TutorialMasterVC: UIViewController, UIPageViewControllerDataSource{


    var pageVC: UIPageViewController!
    
    var contentTitles = ["STEP 1", "STEP 2", "STEP 3", "STEP 4"]
    var contentImages = ["Page0", "Page1", "Page2", "Page3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageVC = self.instantiateVC(identifier: "PageVC") as? UIPageViewController
        
        pageVC.dataSource = self
        
        let startContentVC = self.getContentVC(atIndex: 0)!
        pageVC.setViewControllers([startContentVC], direction: .forward, animated: true)
        
        self.pageVC.view.frame.origin = CGPoint(x: 0, y: 0)
        self.pageVC.view.frame.size.width = self.view.frame.width
        self.pageVC.view.frame.size.height = self.view.frame.height - 70
        
        self.addChild(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMove(toParent: self)
        
        // Do any additional setup after loading the view.
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.contentTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func getContentVC(atIndex idx: Int) -> UIViewController?{
        
        if self.contentTitles.count <= idx || idx < 0{
            return nil
        }
        
        guard let cvc = self.instantiateVC(identifier: "ContentsVC") as? TutorialContentsVC else{
            return nil
        }
        
        cvc.titleText = self.contentTitles[idx]
        cvc.imageFile = self.contentImages[idx]
        cvc.pageIndex = idx
        
        return cvc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard var index = (viewController as? TutorialContentsVC)?.pageIndex else{
            return nil
        }
        
        if index <= 0 { return nil }
        
        index -= 1
        return self.getContentVC(atIndex: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard var index = (viewController as? TutorialContentsVC)?.pageIndex else{
            return nil
        }
        
        if index >= self.contentTitles.count { return nil }
        
        index += 1
        return self.getContentVC(atIndex: index)
        
    }
    
    @IBAction func close(_ sender: Any) {
        
        let ud = UserDefaults.standard
        ud.set(true, forKey: UserInfoKey.tutorial)
        ud.synchronize()
        self.presentingViewController?.dismiss(animated: true)
        
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
