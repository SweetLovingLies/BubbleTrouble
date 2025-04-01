//  GameScene.swift
//  BubbleTrouble
//
//  Created by Morgan Harris on 3/24/25.

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var scoreLabel: SKLabelNode!
    var highScoreLabel: SKLabelNode!
    var shieldProgressBar: SKSpriteNode!
    var currentScore: Int = 0
    var highScore: Int = 0
    var shieldLevel: Int = 0
    var isGamePaused: Bool = false

    // Shakira - fish node
    var fish: SKSpriteNode!
    var objects: [SKSpriteNode] = []

    let fishCategory: UInt32 = 0x1 << 0
    let objectCategory: UInt32 = 0x1 << 1

    override func didMove(to view: SKView) {
        setupUI()
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: 0) // Disable global gravity
        startGame()

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }

    func setupUI() {
        scoreLabel = SKLabelNode(text: "Score: 0")
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
        addChild(scoreLabel)

        highScoreLabel = SKLabelNode(text: "High Score: \(highScore)")
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        addChild(highScoreLabel)

        shieldProgressBar = SKSpriteNode(color: .blue, size: CGSize(width: 200, height: 20))
        shieldProgressBar.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        addChild(shieldProgressBar)
    }

    func startGame() {
        fish = SKSpriteNode(imageNamed: "Fish")
        fish.position = CGPoint(x: -600, y: 0)
        fish.zPosition = 1
        fish.physicsBody = SKPhysicsBody(rectangleOf: fish.size)
        fish.physicsBody?.categoryBitMask = fishCategory
        fish.physicsBody?.contactTestBitMask = objectCategory
        fish.physicsBody?.collisionBitMask = 0
        fish.physicsBody?.isDynamic = true
        fish.physicsBody?.affectedByGravity = false // Disable gravity on fish
        addChild(fish)

        spawnObjects()
    }

    func spawnObjects() {
        let createObject = SKAction.run { [weak self] in
            let objectNames = ["Shark", "LargeRock", "SmallRock", "EvilOctopus", "CuteOctopus", "Plank", "Bike"]
           // let collectBubbles = ["Bubbles"]
            let randomName = objectNames.randomElement()!
            let object = SKSpriteNode(imageNamed: randomName)
            object.position = CGPoint(x: self!.size.width / 2, y: CGFloat.random(in: -self!.size.height / 2...self!.size.height / 2))
            object.physicsBody = SKPhysicsBody(rectangleOf: object.size)
            object.physicsBody?.categoryBitMask = self!.objectCategory
            object.physicsBody?.contactTestBitMask = self!.fishCategory
            object.physicsBody?.collisionBitMask = 0
            object.physicsBody?.isDynamic = true
            object.physicsBody?.affectedByGravity = false

            let moveLeft = SKAction.moveTo(x: -self!.size.width / 2, duration: 3.0)
            let remove = SKAction.removeFromParent()
            object.run(SKAction.sequence([moveLeft, remove]))

            self?.addChild(object)
            self?.objects.append(object)
        }

        let spawnSequence = SKAction.sequence([createObject, SKAction.wait(forDuration: 1.0)])
        run(SKAction.repeatForever(spawnSequence))
    }

    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .up {
            moveFishUp()
        } else if gesture.direction == .down {
            moveFishDown()
        }
    }

    func moveFishDown() {
        if fish.position.y - fish.size.height / 2 > -size.height / 2 {
            fish.position.y -= 50
        }
    }

    func moveFishUp() {
        if fish.position.y + fish.size.height / 2 < size.height / 2 {
            fish.position.y += 50
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let contactA = contact.bodyA.node as? SKSpriteNode
        let contactB = contact.bodyB.node as? SKSpriteNode

        if contactA == fish || contactB == fish {
            let collidedObject = contactA == fish ? contactB : contactA
            handleCollision(with: collidedObject!)
        }
    }

    func handleCollision(with object: SKSpriteNode) {
        if object.name == "Obstacle" {
            gameOver()
        } else if object.name == "Bubble" {
            collectBubble()
        } else if object.name == "Bonus" {
            currentScore += 5
            updateScore()
        }

        object.removeFromParent()
        objects.removeAll { $0 == object }
    }

    override func update(_ currentTime: TimeInterval) {
        if !isGamePaused {
            objects.forEach { object in
                if object.position.x < -size.width / 2 {
                    object.removeFromParent()
                }
            }
        }
    }

    func gameOver() {
        isGamePaused = true
        fish.removeFromParent()
    }

    func collectBubble() {
        currentScore += 1
        updateScore()
        shieldLevel += 1
        updateShieldProgress()
    }

    func updateScore() {
        scoreLabel.text = "Score: \(currentScore)"
    }

    func updateShieldProgress() {
        let progress = CGFloat(shieldLevel) / 10
        shieldProgressBar.size.width = 200 * progress
    }
}
