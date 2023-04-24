//
//  File.swift
//  DrawApp
//
//  Created by pavel mishanin on 24.04.2023.
//

import UIKit

final class CanvasPresenter {
    
    private weak var canvasView: CanvasView?
    
    private var previousPoint2: CGPoint?
    private var previousPoint1: CGPoint?
    private var currentPoint: CGPoint?
    private var image: UIImage?
    private var backgroundImage: UIImage?
    
    private let penTool = PenDrawTool()
    
    func viewDidLoad(canvasView: CanvasView) {
        self.canvasView = canvasView
    }
    
    func draw() {
        image?.draw(at: CGPoint.zero)
        penTool.draw()
    }
    
    func touchesBegan(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        
        previousPoint1 = touch.previousLocation(in: canvasView)
        currentPoint = touch.location(in: canvasView)
        
        penTool.setInitialPoint(currentPoint!)
    }
                 
    func touchesMoved(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        
        previousPoint2 = previousPoint1
        previousPoint1 = touch.previousLocation(in: canvasView)
        currentPoint = touch.location(in: canvasView)
        
        let renderingBox = penTool.createBezierRenderingBox(previousPoint2!, widhPreviousPoint: previousPoint1!, withCurrentPoint: currentPoint!)
        
        canvasView?.setNeedsDisplay(renderingBox)
    }
    
    func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canvasView?.touchesMoved(touches, with: event)
        finishDrawing()
    }
}

private extension CanvasPresenter {
    
    func finishDrawing() {
        updateCacheImage(false)
    }
    
    func updateCacheImage(_ isUpdate: Bool) {
        guard let canvasView = canvasView else {return}
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, false, 0.0)
        
        if isUpdate {
            image = nil
            if let backgroundImage = backgroundImage  {
                (backgroundImage.copy() as! UIImage).draw(at: CGPoint.zero)
            }
        } else {
            image?.draw(at: .zero)
            penTool.draw()
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
