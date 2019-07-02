//
//  GameViewController.swift
//  summonersbook
//
//  Created by Dimitrie-Toma Furdui on 02/07/2019.
//  Copyright © 2019 Dimitrie-Toma Furdui. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = SKScene(fileNamed: "GameScene") {
            scene.size = UIScreen.main.bounds.size
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView? {
                view.presentScene(scene)
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
