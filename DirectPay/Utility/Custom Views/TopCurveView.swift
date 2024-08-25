//
//  TopCurveView.swift
//  DirectPay
//
//  Created by BS01550 on 25/8/24.
//

import Foundation
import UIKit

class TopCurveView: UIView {
    
    var shapeLayer: CAShapeLayer?
    
    let contentHeight = getContentHeightWithRespectToDevice(contentHeight: 145)
    let notchWidth = getContentHeightWithRespectToDevice(contentHeight: 120)
    let notchHeight = getContentHeightWithRespectToDevice(contentHeight: 15)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    func addShape(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        self.shapeLayer = shapeLayer
        
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    func createPath() -> CGPath {
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        
        
        bezierPath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        
        
        bezierPath.addLine(to: CGPoint(x: self.frame.width, y: contentHeight - 25 ))
        
        /// right most curve
        bezierPath.addQuadCurve(to: CGPoint(x: self.frame.width  - 20, y: contentHeight), controlPoint: CGPoint(x: self.frame.width , y: contentHeight))
        
        
        bezierPath.addLine(to: CGPoint(x: self.frame.midX + notchWidth / 2 , y: contentHeight))
        
        
        
        /// middle right curve
//        bezierPath.addQuadCurve(to: CGPoint(x: self.frame.midX + 47, y: getContentHeightWithRespectToDevice(contentHeight: 140)), controlPoint:CGPoint(x: self.frame.midX + 40, y: contentHeightToNotchBottom))
        
        bezierPath.addQuadCurve(to: CGPoint(x: self.frame.midX + 45, y: contentHeight - notchHeight), controlPoint: CGPoint(x: self.frame.midX + notchWidth / 2, y: contentHeight - notchHeight ))
        
        bezierPath.addLine(to: CGPoint(x: self.frame.midX - 45, y: contentHeight - notchHeight))
        
        //middle left curve
//        bezierPath.addQuadCurve(to: CGPoint(x: self.frame.midX - 47 , y: getContentHeightWithRespectToDevice(contentHeight: 140)), controlPoint: CGPoint(x: self.frame.midX - 50, y: contentHeightToNotchTop))
        
        bezierPath.addQuadCurve(to: CGPoint(x: self.frame.midX - notchWidth / 2, y: contentHeight), controlPoint: CGPoint(x: self.frame.midX - notchWidth / 2 , y: contentHeight - notchHeight))
        
        bezierPath.addLine(to: CGPoint(x: 20, y: contentHeight))
        
        //left most curve
        bezierPath.addQuadCurve(to: CGPoint(x: 0, y: contentHeight - notchHeight), controlPoint: CGPoint(x: 0, y: contentHeight))
        
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        
        // Close the path by returning to the starting point
        bezierPath.close()
        
        return bezierPath.cgPath
    }
    
}
