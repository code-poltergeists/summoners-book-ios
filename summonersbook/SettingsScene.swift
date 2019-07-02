//
//  Settings.swift
//  summonersbook
//
//  Created by Dimitrie-Toma Furdui on 02/07/2019.
//  Copyright © 2019 Dimitrie-Toma Furdui. All rights reserved.
//

import SpriteKit
import GameplayKit

class SettingsScene: SKScene {
    var close: SKSpriteNode?
    
    var buttons = [SKLabelNode]()
    
    override func sceneDidLoad() {
        self.close = SKSpriteNode(imageNamed: "close")
        self.backgroundColor = .white
        for text in ["MUSIC", "SOUNDS", "NOTIFICATIONS"] {
            self.buttons.append({
                let node = SKLabelNode()
                node.text = text
                node.fontColor = .black
                return node
            }())
        }
    }
    
    override func didMove(to view: SKView) {
        if let close = self.close {
            close.size = CGSize(width: self.size.height / 5, height: self.size.height / 5)
            close.position = CGPoint(x: -self.size.width / 2 + close.size.width, y: self.size.height / 2 - close.size.height)
            close.name = "close"
            close.isUserInteractionEnabled = false
            self.addChild(close)
        }
        for (index, node) in self.buttons.enumerated() {
            node.position = CGPoint(x: self.position.x, y: self.position.y - CGFloat(index - 1) * self.size.height / 5)
            node.name = node.text
            self.addChild(node)
            print(node)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchPosition = touch.location(in: self)
        let touchedNodes = self.nodes(at: touchPosition)
        for node in touchedNodes {
            if node.name == "close" {
                if let scene = SKScene(fileNamed: "GameScene") {
                    scene.size = UIScreen.main.bounds.size
                    scene.scaleMode = .aspectFill
                    if let view = self.view {
                        view.presentScene(scene, transition: SKTransition.fade(with: .white, duration: 0.5))
                    }
                }
            } else {
                print(node.name)
            }
        }
    }
}
