//
//  NPCMoveToState.swift
//  Prototipo1TFG
//
//  Created by Arancha Ferrero Ortiz de Zárate on 24/7/18.
//  Copyright © 2018 Arancha Ferrero Ortiz de Zárate. All rights reserved.
//

import GameplayKit

class NPCMoveToState: NPCState {
    
    var opponentLocation: CGPoint = CGPoint.zero
    
    override func update(deltaTime seconds: TimeInterval) {
        opponentLocation = entity.opponent.sprite.position
        
        entity.moveTo(location: opponentLocation)
        
        if entity.arriveTo(destiny: opponentLocation, deltaTime: seconds)
            || entity.collideWith(obstacles: [entity.opponent.sprite], deltaTime: seconds) {
            entity.velocity = CGPoint.zero
            entity.decideState()
        } else {
            entity.movePositionAt(deltaTime: seconds)
        }
    
    }
    
    override func didEnter(from previousState: GKState?) {
 
        stopAnimations(from: previousState)
        
        
        entity.moveTo(location: opponentLocation)
    }
}
