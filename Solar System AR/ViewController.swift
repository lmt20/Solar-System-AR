//
//  ViewController.swift
//  Solar System AR
//
//  Created by Trường Lê Mạnh on 27/02/2021.
//

import UIKit
import SceneKit
import ARKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let baseNode = SCNNode()
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearScreen()
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let sun = Planet(name: "sun", image: UIImage(named: "sun.jpg")!, position: SCNVector3(x: 0, y: 0, z: 0), radius: 0.25, rotatePlanetSpeed: -0.3*1.2, ringSize: 0*2, rotateRingSpeed: 0)
        let sunNode = sun.createPlanetNode()
        let sunRingNode = sun.createRingNode()
        
        let mercury = Planet(name: "mercury", image: UIImage(named: "mercury.jpg")!, position: SCNVector3(x: 0.3*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 1.5*1.2, ringSize: 0.3*2, rotateRingSpeed: 0.6*1.5)
        let mercuryNode = mercury.createPlanetNode()
        let mercuryRingNode = mercury.createRingNode()
        
        let venus = Planet(name: "venus", image: UIImage(named: "venus.jpg")!, position: SCNVector3(x: 0.5*2, y: 0, z: 0), radius: 0.04*2, rotatePlanetSpeed: 1*1.2, ringSize: 0.5*2, rotateRingSpeed: 0.4*1.5)
        let venusNode = venus.createPlanetNode()
        let venusRingNode = venus.createRingNode()
        
        let earth = Planet(name: "earth", image: UIImage(named: "earth.jpg")!, position: SCNVector3(x: 0.7*2, y: 0, z: 0), radius: 0.05*2, rotatePlanetSpeed: 0.625*1.2, ringSize: 0.7*2, rotateRingSpeed: 0.25*1.5)
        let earthNode = earth.createPlanetNode()
        let earthRingNode = earth.createRingNode()
        
        
        let moon = Planet(name: "moon", image: UIImage(named: "moon.jpg")!, position: SCNVector3(x: 0.08*2, y: 0, z: 0), radius: 0.02*2, rotatePlanetSpeed: 0.08*1.2, ringSize: 0.7*2, rotateRingSpeed: 0.25*1.5)
        let moonNode = moon.createPlanetNode()
        let moonRingNode = moon.createRingNode(pipeRadius: 0.0001)
        moonRingNode.position = SCNVector3(x:0.0 , y: 0.02*2, z: 0)
        
        
        let mars = Planet(name: "mars", image: UIImage(named: "mars.jpg")!, position: SCNVector3(x: 0.8*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.575*1.2, ringSize: 0.8*2, rotateRingSpeed: 0.15*1.5)
        let marsNode = mars.createPlanetNode()
        let marsRingNode = mars.createRingNode()
        
        
        let jupiter = Planet(name: "jupiter", image: UIImage(named: "jupiter.jpg")!, position: SCNVector3(x: 1*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.475*1.2, ringSize: 1*2, rotateRingSpeed: 0.15*1.5)
        let jupiterNode = jupiter.createPlanetNode()
        let jupiterRingNode = jupiter.createRingNode()
        
        
        let saturn = Planet(name: "saturn", image: UIImage(named: "saturn.jpg")!, position: SCNVector3(x: 1.2*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.375*1.2, ringSize: 1.2*2, rotateRingSpeed: 0.12*1.5)
        let saturnNode = saturn.createPlanetNode()
        let saturnRingNode = saturn.createRingNode()
        
        
        let uranus = Planet(name: "uranus", image: UIImage(named: "uranus.jpg")!, position: SCNVector3(x: 1.4*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.3*1.2, ringSize: 1.4*2, rotateRingSpeed: 0.1*1.5)
        let uranusNode = uranus.createPlanetNode()
        let uranusRingNode = uranus.createRingNode()
        
        
        let neptune = Planet(name: "neptune", image: UIImage(named: "neptune.jpg")!, position: SCNVector3(x: 1.6*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.225*1.2, ringSize: 1.6*2, rotateRingSpeed: 0.08*1.5)
        let neptuneNode = neptune.createPlanetNode()
        let neptuneRingNode = neptune.createRingNode()
        
        
        let pluto = Planet(name: "pluto", image: UIImage(named: "pluto.jpg")!, position: SCNVector3(x: 1.7*2, y: 0, z: 0), radius: 0.03*2, rotatePlanetSpeed: 0.125*1.2, ringSize: 1.7*2, rotateRingSpeed: 0.06*1.5)
        let plutoNode = pluto.createPlanetNode()
        let plutoRingNode = pluto.createRingNode()
        
        mercuryRingNode.addChildNode(mercuryNode)
        venusRingNode.addChildNode(venusNode)
        earthRingNode.addChildNode(earthNode)
        
        moonRingNode.addChildNode(moonNode)
        earthNode.addChildNode(moonRingNode)
        
        marsRingNode.addChildNode(marsNode)
        jupiterRingNode.addChildNode(jupiterNode)
        saturnRingNode.addChildNode(saturnNode)
        uranusRingNode.addChildNode(uranusNode)
        neptuneRingNode.addChildNode(neptuneNode)
        plutoRingNode.addChildNode(plutoNode)
        
        baseNode.addChildNode(sunNode)
        baseNode.addChildNode(mercuryRingNode)
        baseNode.addChildNode(venusRingNode)
        baseNode.addChildNode(earthRingNode)
        baseNode.addChildNode(marsRingNode)
        baseNode.addChildNode(jupiterRingNode)
        baseNode.addChildNode(saturnRingNode)
        baseNode.addChildNode(uranusRingNode)
        baseNode.addChildNode(neptuneRingNode)
        baseNode.addChildNode(plutoRingNode)
        
        baseNode.position = SCNVector3(x: 0, y: -0.5, z: -1)
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.scene.rootNode.addChildNode(baseNode)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkNodeHit(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func checkNodeHit(_ gesture : UIGestureRecognizer){
        print("Detect touch")
        let currentTouchLocation = gesture.location(in: self.sceneView)
        
        guard let hitTestNode = sceneView.hitTest(currentTouchLocation, options: nil).first?.node else {
            return
        }
        
        switch hitTestNode.name {
        case "sun", "mercury", "venus", "moon", "mars", "jupiter", "saturn", "uranus", "neptune", "pluto":
            clearScreen()
            let planetName = hitTestNode.name!
            let planet = Planet(name: "\(planetName)_zoom", image: UIImage(named: "\(planetName).jpg")!, position: SCNVector3(x: 0, y: 0, z: 0), radius: 0.35, rotatePlanetSpeed: 0.3)
            let planetNode = planet.createPlanetNode()
            self.addNodeToScreen(node: planetNode)
            processRequest(with: planetName)
        case "earth":
            clearScreen()
            let planetName = hitTestNode.name!
            let planet = Planet(name: "\(planetName)_zoom", image: UIImage(named: "\(planetName).jpg")!, position: SCNVector3(x: 0, y: 0, z: 0), radius: 0.35, rotatePlanetSpeed: 0.3)
            let planetNode = planet.createPlanetNode()
            
            let moon = Planet(name: "moon", image: UIImage(named: "moon.jpg")!, position: SCNVector3(x: 0.8, y: 0.04, z: 0), radius: 0.08, rotatePlanetSpeed: 0.5*1.2, ringSize: 0.8, rotateRingSpeed: 0.1)
            let moonNode = moon.createPlanetNode()
            let moonRingNode = moon.createRingNode(pipeRadius: 0.0001)
            moonRingNode.position = SCNVector3(x:0.0 , y: 0.035*2, z: 0)
            moonRingNode.addChildNode(moonNode)
            planetNode.addChildNode(moonRingNode)
            
            self.addNodeToScreen(node: planetNode)
            processRequest(with: planetName)
        case "sun_zoom", "mercury_zoom", "venus_zoom", "earth_zoom", "moon_zoom", "mars_zoom", "jupiter_zoom", "saturn_zoom", "uranus_zoom", "neptune_zoom", "pluto_zoom":
            self.viewDidLoad()
        default:
            print("Don't touch any thing")
        }
    }
    
    
    func addNodeToScreen(node: SCNNode) {
        baseNode.addChildNode(node)
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.scene.rootNode.addChildNode(baseNode)
    }
    
    func clearScreen() {
        sceneView.scene.rootNode.enumerateChildNodes { (node, pointer) in
            node.removeFromParentNode()
        }
    }
    
    func createTextBox(text: String){
        let fmtText = formatText(text: text)
        let text = SCNText(string: fmtText, extrusionDepth: 2)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.magenta
        text.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x:0, y:0.4, z:-0.2)
        node.scale = SCNVector3(x:0.003, y:0.003, z:0.003)
        node.geometry = text
        self.addNodeToScreen(node: node)
    }
    
    func formatText(text: String) -> String {
        let index = text.firstIndex(of: "\n") ?? text.endIndex
        let text = String(text[..<index])
        var formatText = ""
        var count = 0
        var countLine = 0
        for char in text {
            count += 1
            formatText.append(char)
            if count >= 40 && char == " " {
                formatText.append("\n")
                count = 0
                countLine += 1
            }
            
            if countLine == 10 || (countLine == 9 && char == ".") {
                break
            }
            
        }
        return formatText
    }
    
    func processRequest(with categories: String) {
        
        let index = categories.firstIndex(of: ",") ?? categories.endIndex
        let firstCategory = String(categories[..<index])
        
        
        let parameters: [String: String] = ["format": "json", "action": "query", "prop": "extracts|pageimages", "exintro" : "", "explaintext" : "", "titles" : firstCategory, "redirects" : "1", "pithumbsize" : "500", "indexpageids" : ""]
        
        let endpoint = "https://en.wikipedia.org/w/api.php"
        
        AF.request(endpoint, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let resultJSON = JSON(value)
                if let pageId = resultJSON["query"]["pageids"][0].string {
                    let info = resultJSON["query"]["pages"][pageId]
                    if let description = info["extract"].string {
                        self.createTextBox(text: description)
                    }
                    
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
