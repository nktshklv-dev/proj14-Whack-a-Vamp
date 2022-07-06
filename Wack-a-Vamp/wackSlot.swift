//
//  wackSlot.swift
//  Wack-a-Vamp
//
//  Created by Nikita  on 7/4/22.
//

import UIKit
import SpriteKit

class wackSlot: SKNode {
    
    var isVisible = false
    var isHit = false
    
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
    
    func show(hideTime: Double){
        if isVisible {return}
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.08))
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0{
            charNode.texture = SKTexture(imageNamed: "vampGood")
            charNode.name = "charFriend"
        }
        else{
            charNode.texture = SKTexture(imageNamed: "vampEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)){
            [weak self] in self?.hide()
        }
        
        
    }
    
    
    func hide(){
        if !isVisible{
            return
        }
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
    }
}
    
