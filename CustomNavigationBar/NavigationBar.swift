//
//  NavigationBar.swift
//  UINavigationBar Programmatically
//
//  Created by ShawnBaek on 2017. 10. 6..
//  Copyright © 2017 ShawnBaek. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {

    //set NavigationBar's height
    //For iphonex, I recommended to set the minimum height to 88 or higher.
    var customHeight : CGFloat = 66
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        
        translatesAutoresizingMaskIntoConstraints = false
        
       
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
    
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tintColor = .black
        
        frame = CGRect(x: frame.origin.x, y:  0, width: frame.size.width, height: customHeight)

        // title position (statusbar height / 2)
        setTitleVerticalPositionAdjustment(-10, for: UIBarMetrics.default)
        
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = .yellow
            
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent") {

                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight - 20)
                
                
            }
        }
    }


}
