//
//  Planet.swift
//  Solar System AR
//
//  Created by Trường Lê Mạnh on 27/02/2021.
//

import UIKit
import SceneKit

struct Planet {
    let name: String
    let image: UIImage
    let position: SCNVector3
    let radius: Float
    let rotatePlanetSpeed: Float
    let ringSize: Float
    let rotateRingSpeed: Float 
    
    init(name: String, image: UIImage, position: SCNVector3 = SCNVector3(x: 0, y: 0, z: 0), radius: Float = 0, rotatePlanetSpeed: Float = 0, ringSize: Float = 0, rotateRingSpeed: Float = 0) {
        self.name = name
        self.image = image
        self.position = position
        self.radius = radius
        self.rotatePlanetSpeed = rotatePlanetSpeed
        self.ringSize = ringSize
        self.rotateRingSpeed = rotateRingSpeed
    }
    
    func createPlanetNode() -> SCNNode {
        let planet = SCNSphere(radius: CGFloat(radius))
        let material = SCNMaterial()
        material.diffuse.contents = image
        planet.materials = [material]
        
        let planetNode = SCNNode(geometry: planet)
        planetNode.name = name
        planetNode.position = position
        rotatePlanet(planet: planetNode)
        
//        let meteoroidsNode = createRingNode()
//        planetNode.addChildNode(meteoroidsNode)
        return planetNode
    }
    
    func createRingNode(pipeRadius: Float = 0.001) -> SCNNode {
        let ring = SCNTorus(ringRadius: CGFloat(ringSize), pipeRadius: CGFloat(pipeRadius))
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "saturn_ring.png")
        ring.materials = [material]
        
        let ringNode = SCNNode(geometry: ring)
        rotateRing(ring: ringNode)
        return ringNode
    }
    
    func rotatePlanet(planet: SCNNode) {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(rotatePlanetSpeed), z: 0, duration: TimeInterval(1))
        planet.runAction(SCNAction.repeatForever(rotation))
    }
    
    func rotateRing(ring: SCNNode) {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(rotateRingSpeed), z: 0, duration: TimeInterval(1))
        ring.runAction(SCNAction.repeatForever(rotation))
    }
    
//    func createMeteoroidsNode() -> SCNNode {
//        let meteoroids = SCNTorus(ringRadius: 0.02, pipeRadius: 0.5)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "saturn_ring.png")
//        meteoroids.materials = [material]
//        let meteoroidsNode = SCNNode(geometry: meteoroids)
//        meteoroidsNode.position = SCNVector3(x:0.0 , y: 0.02, z: 0)
//        rotatePlanet(planet: meteoroidsNode)
//        return meteoroidsNode
//    }
    
}
