//
//  GameScene.swift
//  BubbleTrouble
//
//  Created by Morgan Harris on 3/24/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var scoreLabel: SKLabelNode!
        var highScoreLabel: SKLabelNode!
        var shieldProgressBar: SKSpriteNode!
        var currentScore: Int = 0
        var highScore: Int = 0
        var shieldLevel: Int = 0
        var isGamePaused: Bool = false
    
    override func didMove(to view: SKView) {
        setupUI()
        startGame()
		
    }
    
    func setupUI() {
            // Score Label
            scoreLabel = SKLabelNode(text: "Score: 0")
            scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
            addChild(scoreLabel)
            
            // High Score Label
            highScoreLabel = SKLabelNode(text: "High Score: \(highScore)")
            highScoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
            addChild(highScoreLabel)
            
            // Shield Progress Bar
            shieldProgressBar = SKSpriteNode(color: .blue, size: CGSize(width: 200, height: 20))
            shieldProgressBar.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
            addChild(shieldProgressBar)
        }
        
        func startGame() {
            // Start game logic, spawn bubbles and obstacles
        }
    
    func updateScore() {
            scoreLabel.text = "Score: \(currentScore)"
            if currentScore > highScore {
                highScore = currentScore
                highScoreLabel.text = "High Score: \(highScore)"
                showHighScoreFeedback()
            }
        }
        
        func showHighScoreFeedback() {
            // Visual feedback for high score
            let feedbackLabel = SKLabelNode(text: "New High Score!")
            feedbackLabel.position = CGPoint(x: frame.midX, y: frame.midY)
            feedbackLabel.fontSize = 40
            feedbackLabel.run(SKAction.sequence([
                SKAction.fadeIn(withDuration: 0.5),
                SKAction.wait(forDuration: 1.0),
                SKAction.fadeOut(withDuration: 0.5)
            ]))
            addChild(feedbackLabel)
        }
        
        override func update(_ currentTime: TimeInterval) {
            // Game loop logic
            if !isGamePaused {
                // Update game state, check for collisions, etc.
            }
        }
        
        func collectBubble() {
            currentScore += 1
            updateScore()
            // Update shield progress
            shieldLevel += 1
            updateShieldProgress()
        }
        
        func updateShieldProgress() {
            let progress = CGFloat(shieldLevel) / 10.0 //  10 bubbles for a shield
            shieldProgressBar.size.width = 200 * progress
            if shieldLevel >= 10 {
                // Grant shield
                shieldLevel = 0
            }
        }
        
        func dodgeObstacle() {
            // Logic for dodging obstacles
        }
        
        func pauseGame() {
            isGamePaused = true
            // Show pause menu
        }
        
        func resumeGame() {
            isGamePaused = false
            // Hide pause menu
        }
    
    // Handle remote input
       override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
           for press in presses {
               if press.type == .select {
                   if isGamePaused {
                       resumeGame()
                   } else {
                       pauseGame()
                   }
               }
               // Add more controls for dodging or other actions
           }
       }
       
       override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
           // Handle any actions when the press ends if necessary
       }
    }
    

    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
	
