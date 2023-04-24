//
//  File.swift
//  DrawApp
//
//  Created by pavel mishanin on 24.04.2023.
//

import UIKit

final class CanvasView: UIView {
    
    private let presenter = CanvasPresenter()
    
    init() {
        super.init(frame: .zero)
        presenter.viewDidLoad(canvasView: self)
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        presenter.draw()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.touchesBegan(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.touchesMoved(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.touchesEnded(touches, with: event)
    }
}
