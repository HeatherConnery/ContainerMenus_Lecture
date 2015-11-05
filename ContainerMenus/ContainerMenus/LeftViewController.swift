//
//  LeftViewController.swift
//  ContainerMenus
//
//  Created by Heather Connery on 2015-11-05.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    //create a weak var of type RPVC => set in prepareForSegue (in RPVC) => used here in IBAction
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

    @IBAction func hideLeftSelection(sender: UIBarButtonItem) {
        //in the completion we declare a bool called complete, if true do what's inside the block
        rootPresentationViewController?.toggleOpenLeftPanelWithCompletion({ (complete) -> () in
            print("toggled closed")
        })
    }
}
