//
//  NSAttributedString+Extension.swift
//  CustomNavigationBar
//
//  Created by BaekSungwook on 2017. 10. 6..
//  Copyright © 2017년 BaekSungwook. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func getCGSize(maxWidth: CGFloat) -> CGSize {
        
        let size = self.boundingRect(with: CGSize(width: maxWidth, height: 1000), options:(NSStringDrawingOptions.usesLineFragmentOrigin), context:nil).size
        
        return size
    }
    
    
    //Helper Function : Convert String to UIImage
    func createUIImage(maxWidth:CGFloat) -> UIImage
    {
        let size = self.getCGSize(maxWidth: maxWidth)
        
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    
    
}
