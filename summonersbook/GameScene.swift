//
//  GameScene.swift
//  summonersbook
//
//  Created by Dimitrie-Toma Furdui on 02/07/2019.
//  Copyright © 2019 Dimitrie-Toma Furdui. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var background: SKSpriteNode?
    var gear: SKSpriteNode?
    
    override func sceneDidLoad() {
        self.background = SKSpriteNode(imageNamed: "background")
        self.gear = SKSpriteNode(imageNamed: "gear")
    }
    
    override func didMove(to view: SKView) {
        if let background = self.background {
            background.size = self.size
            background.position = self.position
            background.name = "background"
            background.isUserInteractionEnabled = false
            self.addChild(background)
        }
        if let gear = self.gear {
            gear.size = CGSize(width: self.size.height / 5, height: self.size.height / 5)
            gear.position = CGPoint(x: self.size.width / 2 - gear.size.width, y: -self.size.height / 2 + gear.size.height)
            gear.name = "gear"
            gear.isUserInteractionEnabled = false
            self.addChild(gear)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchPosition = touch.location(in: self)
        let touchedNodes = self.nodes(at: touchPosition)
        for node in touchedNodes {
            if node.name == "gear" {
                if let scene = SKScene(fileNamed: "SettingsScene") {
                    scene.size = UIScreen.main.bounds.size
                    scene.scaleMode = .aspectFill
                    if let view = self.view {
                        view.presentScene(scene, transition: SKTransition.fade(with: .white, duration: 0.5))
                    }
                }
            }
        }
    }
}
