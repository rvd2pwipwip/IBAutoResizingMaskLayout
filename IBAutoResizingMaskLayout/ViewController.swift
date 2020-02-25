//
//  ViewController.swift
//  IBAutoResizingMaskLayout
//
//  Created by Herve Desrosiers on 2020-02-24.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var tileView: TileView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 5% radius
        let radius = tileView.bounds.width / 20
        tileView.layer.cornerRadius = radius
    }
}

