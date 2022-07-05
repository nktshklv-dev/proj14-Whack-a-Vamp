//
//  wackSlot.swift
//  Wack-a-Vamp
//
//  Created by Nikita  on 7/4/22.
//

import UIKit
import SpriteKit

class wackSlot: SKNode {
    
    var charNode:SKSpriteNode!
    func configure(at position: CGPoint){
        self.position = position
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "vampGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        addChild(cropNode)
    }
}
