//
//  ViewController.swift
//  DrawApp
//
//  Created by pavel mishanin on 24.04.2023.
//

import UIKit

final class DrawViewController: UIViewController {

    private let canvasView = CanvasView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupUI()
    }


}

// MARK: - UI
private extension DrawViewController {
    
    func setupUI() {
        view.backgroundColor = .lightGray
        canvasView.isUserInteractionEnabled = true
    }
}

// MARK: - Constraints
private extension DrawViewController {
    
    func setupConstraints() {
        view.addSubview(canvasView)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            canvasView.widthAnchor.constraint(equalTo: view.widthAnchor),
            canvasView.heightAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}
