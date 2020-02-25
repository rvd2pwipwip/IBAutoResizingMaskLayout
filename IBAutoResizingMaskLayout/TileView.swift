//
//  TileView.swift
//  IBAutoResizingMaskLayout
//
//  Created by Herve Desrosiers on 2020-02-24.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

@IBDesignable
class TileView: UIView {
    
    @IBInspectable var padding: CGFloat = 25.0 {
        didSet { // re-draw layout if padding changes
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) { // manual code use case
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { // for IB use case
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(blueView)
        addSubview(redView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Size of this container view
        let containerWidth = bounds.width // bounds = own coordinate system
        let containerHeight = bounds.height
        // Calculate width and height of each item including the padding
        let numberOfItems: CGFloat = 2
        let itemWidth = (containerWidth - (numberOfItems + 1) * padding) / numberOfItems
        let itemHeight = containerHeight - 2 * padding
        // Set the frames of the two subviews
        blueView.frame = CGRect(x: padding, y: padding, width: itemWidth, height: itemHeight)
        redView.frame = CGRect(x: 2 * padding + itemWidth, y: padding, width: itemWidth, height: itemHeight)
    }
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
}
