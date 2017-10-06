//
//  SecondViewController.swift
//  UINavigationBar Programmatically
//
//  Created by ShawnBaek on 2017. 10. 6..
//  Copyright © 2017 ShawnBaek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Create BackButton
        var backButton: UIBarButtonItem!
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraph.alignment = .center
        
        let attributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                           NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16),
                                           NSAttributedStringKey.paragraphStyle : paragraph
                                           ]
        
        let attributedString = NSAttributedString(string: "Back To", attributes:attributes)
        
        let backImage = attributedString.createUIImage(maxWidth: 1000)
        
        backButton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(SecondViewController.back(_:)))

        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.setBackgroundVerticalPositionAdjustment(-10, for: UIBarMetrics.default)
        
        
        self.navigationItem.titleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        
        self.navigationItem.titleView?.backgroundColor = .red
        
        
        self.navigationItem.titleView?.isUserInteractionEnabled = true
        let titleTap = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.titleTapped))
        titleTap.numberOfTapsRequired = 1
        self.navigationItem.titleView?.addGestureRecognizer(titleTap)
        
        
        
    }
    override var prefersStatusBarHidden: Bool {

        return true
    }
    @objc func back(_ sender: UITabBarItem){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func titleTapped(){
        
        print("title tapped")
        
    }
    
    
    //Helper Function : Get String CGSize
    func sizeOfAttributeString(_ str: NSAttributedString, maxWidth: CGFloat) -> CGSize {
        let size = str.boundingRect(with: CGSize(width: maxWidth, height: 1000), options:(NSStringDrawingOptions.usesLineFragmentOrigin), context:nil).size
        return size
    }
    
    
    //Helper Function : Convert String to UIImage
    func imageFromText(_ text:NSString, font:UIFont, maxWidth:CGFloat, color:UIColor) -> UIImage
    {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraph.alignment = .center // potentially this can be an input param too, but i guess in most use cases we want center align
        
        let attributedString = NSAttributedString(string: text as String, attributes: [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.paragraphStyle:paragraph])
        
        let size = sizeOfAttributeString(attributedString, maxWidth: maxWidth)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
