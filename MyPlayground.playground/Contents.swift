import PlaygroundSupport
import SpriteKit
import SceneKit

class GameScene: SKScene {
    
    func createHUD() -> SK3DNode {
        
        let scnScene = SCNScene()
        
        let line = SCNCylinder(radius: 5, height: 150)
        line.heightSegmentCount = 1
        line.radialSegmentCount = 6
        line.firstMaterial?.lightingModel = .constant
        line.firstMaterial?.diffuse.contents = UIColor.green

        let cone = SCNCone(topRadius: 0, bottomRadius: 10, height: 30)
        cone.heightSegmentCount = 1
        cone.radialSegmentCount = 6
        cone.firstMaterial?.lightingModel = .constant
        cone.firstMaterial?.diffuse.contents = UIColor.green
        
        let yAxis = SCNNode()
        yAxis.addChildNode(SCNNode(geometry: line))
        yAxis.addChildNode(SCNNode(geometry: cone))
        yAxis.childNodes[1].simdPosition = simd_float3(x: 0, y: 75, z: 0)
        
        scnScene.rootNode.addChildNode(yAxis)
        
        yAxis.simdWorldPosition = simd_float3(x: 0, y: 0, z: 0)
        
        //
        
        let line2 = SCNCylinder(radius: 5, height: 150)
        line2.heightSegmentCount = 1
        line2.radialSegmentCount = 6
        line2.firstMaterial?.lightingModel = .constant
        line2.firstMaterial?.diffuse.contents = UIColor.red

        let cone2 = SCNCone(topRadius: 0, bottomRadius: 10, height: 30)
        cone2.heightSegmentCount = 1
        cone2.radialSegmentCount = 6
        cone2.firstMaterial?.lightingModel = .constant
        cone2.firstMaterial?.diffuse.contents = UIColor.red
        
        let xAxis = SCNNode()
        xAxis.addChildNode(SCNNode(geometry: line2))
        xAxis.addChildNode(SCNNode(geometry: cone2))
        xAxis.childNodes[1].simdPosition = simd_float3(x: 0, y: 75, z: 0)
    
        scnScene.rootNode.addChildNode(xAxis)
        xAxis.simdWorldOrientation = simd_quatf(angle: .pi / 2, axis: SCNNode.simdLocalFront)
        
        xAxis.simdWorldPosition = simd_float3(x: 75, y: -75, z: 0)
        
        
        let line3 = SCNCylinder(radius: 5, height: 150)
        line3.heightSegmentCount = 1
        line3.radialSegmentCount = 6
        line3.firstMaterial?.lightingModel = .constant
        line3.firstMaterial?.diffuse.contents = UIColor.blue

        let cone3 = SCNCone(topRadius: 0, bottomRadius: 10, height: 30)
        cone3.heightSegmentCount = 1
        cone3.radialSegmentCount = 6
        cone3.firstMaterial?.lightingModel = .constant
        cone3.firstMaterial?.diffuse.contents = UIColor.blue
    
        let zAxis = SCNNode()
        zAxis.addChildNode(SCNNode(geometry: line3))
        zAxis.addChildNode(SCNNode(geometry: cone3))
        zAxis.childNodes[1].simdPosition = simd_float3(x: 0, y: 75, z: 0)
    
        scnScene.rootNode.addChildNode(zAxis)
        zAxis.simdWorldOrientation = simd_quatf(angle: .pi / 2, axis: SCNNode.simdLocalRight)
        
        zAxis.simdWorldPosition = simd_float3(x: 0, y: -75, z: 75)
        
        
        let node = SK3DNode(viewportSize: CGSize(width: 200, height: 200))
        let camera = SCNCamera()
        camera.zNear = 0.1
        camera.zFar = 600
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 150
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        node.scnScene = scnScene
        node.pointOfView = cameraNode
        node.pointOfView?.position = SCNVector3(x: 0, y: 0, z: 300)
        node.pointOfView?.simdOrientation = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)
        
        return node
    }
    
    override func didMove(to view: SKView) {
        self.addChild(createHUD())
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
