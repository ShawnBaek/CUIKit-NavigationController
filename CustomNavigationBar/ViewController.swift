//
//  ViewController.swift
//  UINavigationBar Programmatically
//
//  Created by ShawnBaek on 2017. 10. 6..
//  Copyright © 2017 ShawnBaek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var navbar : UINavigationBar!
    
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //update NavigationBar's frame
        self.navigationController?.navigationBar.sizeToFit()
        print("NavigationBar Frame : \(String(describing: self.navigationController!.navigationBar.frame))")

    }
    
    //Hide Statusbar
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        //Important!
        if #available(iOS 11.0, *) {
            
            //Default NavigationBar Height is 44. Custom NavigationBar Height is 66. So We should set additionalSafeAreaInsets to 66-44 = 22
            //self.additionalSafeAreaInsets.top = 22
            self.additionalSafeAreaInsets.top = UIApplication.shared.statusBarFrame.size.height

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

