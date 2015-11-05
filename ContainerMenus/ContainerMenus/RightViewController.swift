//
//  RightViewController.swift
//  ContainerMenus
//
//  Created by Heather Connery on 2015-11-05.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {
    
    weak var rootPresentationViewController:RootPresentationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func hideRightSelction(sender: UIBarButtonItem) {
        rootPresentationViewController?.toggleOpenRightPanelWithCompletion({ (complete) -> () in
            print("toggled closed")
        })
    }
}
