//
//  RootPresentationViewController.swift
//  ContainerMenus
//
//  Created by Heather Connery on 2015-11-05.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class RootPresentationViewController: UIViewController {
    
    let drawerWidthConstant:CGFloat = 240.0
    var leftIsRevealed = false
    var rightIsRevealed = false

    @IBOutlet weak var centreContainerView: UIView!
    @IBOutlet weak var rightContainerView: UIView!
    @IBOutlet weak var leftContainerView: UIView!
    @IBOutlet weak var rightTrailingToSuperviewConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftLeadingToSuperviewConstraint: NSLayoutConstraint!
    
    // create 3 weak vars - one of each type of the 3 other VCs => used in prepareForSegue
    weak var centreViewController:CentreViewController?
    weak var leftViewController:LeftViewController?
    weak var rightViewController:RightViewController?
    
    override func viewDidLoad() {
        //print("LeftBefore = \(leftLeadingToSuperviewConstraint.constant)")
        super.viewDidLoad()
        
        setStage()
        //print("LeftAftersetStage = \(leftLeadingToSuperviewConstraint.constant)")
        // Do any additional setup after loading the view.
    }
    
    func setStage() {
        rightTrailingToSuperviewConstraint.constant = -drawerWidthConstant
        leftLeadingToSuperviewConstraint.constant = -drawerWidthConstant
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func toggleOpenLeftPanelWithCompletion(completion:(Bool)->()) {
        var panelOffset:CGFloat = 0
        if leftIsRevealed {
            panelOffset = -drawerWidthConstant
            
        }
        leftIsRevealed = !leftIsRevealed
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.leftLeadingToSuperviewConstraint.constant = panelOffset
            self.view.layoutIfNeeded()
            }) { (complete) -> Void in
                completion(complete)
        }
    }
    
    func toggleOpenRightPanelWithCompletion(completion:(Bool)->()) {
        var panelOffset:CGFloat = 0
        if rightIsRevealed {
            panelOffset = -drawerWidthConstant
            
        }
        rightIsRevealed = !rightIsRevealed
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.rightTrailingToSuperviewConstraint.constant = panelOffset
            self.view.layoutIfNeeded()
            }) { (complete) -> Void in
                completion(complete)
        }

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "leftInclusionSegue" {
            guard let navController = segue.destinationViewController as? UINavigationController, left = navController.topViewController as? LeftViewController else { return }
            leftViewController = left
            leftViewController?.rootPresentationViewController = self
            
        } else if segue.identifier == "centreInclusionSegue" {
            guard let navController = segue.destinationViewController as? UINavigationController, centre  = navController.topViewController as? CentreViewController else { return }
            centreViewController = centre
            centreViewController?.rootPresentationViewController = self

            
        } else if segue.identifier == "rightInclusionSegue" {
            guard let navController = segue.destinationViewController as? UINavigationController, right  = navController.topViewController as? RightViewController else { return }
            rightViewController = right 
            rightViewController?.rootPresentationViewController = self

            
        }
        
        
    }
    

}
