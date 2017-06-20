//
//  ViewController.m
//  SceneKit-06
//
//  Created by ShiWen on 2017/6/19.
//  Copyright © 2017年 ShiWen. All rights reserved.
//

#import "ViewController.h"

#import <SceneKit/SceneKit.h>

@interface ViewController ()
@property (nonatomic,strong) SCNView *mScnView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mScnView.scene = [SCNScene scene];
    [self.view addSubview:self.mScnView];
    
    //添加相机
    SCNCamera *camera = [SCNCamera camera];
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.position = SCNVector3Make(0, 0, 40);
    cameraNode.camera = camera;
    [self.mScnView.scene.rootNode addChildNode:cameraNode];
    [self addShape];
    
}

-(SCNView *)mScnView{
    if (!_mScnView) {
        _mScnView = [[SCNView alloc] initWithFrame:self.view.bounds];
        _mScnView.backgroundColor = [UIColor blackColor];
        _mScnView.allowsCameraControl = YES;
    }
    return _mScnView;
}
-(void)addShape{
//    添加正方体
//    SCNBox *box = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0];
//    SCNNode *boxNode = [self nodeWithGeometry:box adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:boxNode];
    
//    添加平面
//    SCNPlane *plane = [SCNPlane planeWithWidth:10 height:10];
//    SCNNode *planeNode = [self nodeWithGeometry:plane adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:planeNode];
    
//    创建金字塔
//    SCNPyramid *pyramid = [SCNPyramid pyramidWithWidth:10 height:10 length:10];
//    SCNNode *pyramidNode = [self nodeWithGeometry:pyramid adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:pyramidNode];
    
//    创建球
//    SCNSphere *sphere = [SCNSphere sphereWithRadius:10];
//    SCNNode *sphereNode = [self nodeWithGeometry:sphere adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:sphereNode];
    
    
//    创建圆柱
//    SCNCylinder *cylinder = [SCNCylinder cylinderWithRadius:5 height:20];
//    SCNNode *cylinderNode = [self nodeWithGeometry:cylinder adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:cylinderNode];
    
    
//    创建圆锥
//    SCNCone *cone = [SCNCone coneWithTopRadius:0 bottomRadius:10 height:20];
//    SCNNode *coneNode = [self nodeWithGeometry:cone adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:coneNode];
//    
////    创建胶囊
//    SCNCapsule *capsule = [SCNCapsule capsuleWithCapRadius:5 height:20];
//    SCNNode *capsuleNode = [self nodeWithGeometry:capsule adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:capsuleNode];
    
////    创建圆环
//    SCNTorus *torus = [SCNTorus torusWithRingRadius:8 pipeRadius:3];
//    SCNNode *torusNode = [self nodeWithGeometry:torus adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
//    [self.mScnView.scene.rootNode addChildNode:torusNode];
    
//    创建地板
    SCNFloor *floor = [SCNFloor floor];
    SCNNode *floorNode = [self nodeWithGeometry:floor adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, -10, 0)];
    [self.mScnView.scene.rootNode addChildNode:floorNode];
    
//    文字
    SCNText *text = [SCNText textWithString:@"月读-雏田" extrusionDepth:5];
    text.font = [UIFont systemFontOfSize:5];
    SCNNode *textNode = [self nodeWithGeometry:text adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(-13, -6, 0)];
    [self.mScnView.scene.rootNode addChildNode:textNode];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-7.5, 0, 15, 15)];

    SCNShape *shape = [SCNShape shapeWithPath:path extrusionDepth:10];
    SCNNode *shapeNode = [self nodeWithGeometry:shape adIamgeName:@"box2.jpg" adPostion:SCNVector3Make(0, 0, 0)];
    [self.mScnView.scene.rootNode addChildNode:shapeNode];
    
    SCNAction *retation = [SCNAction rotateByAngle:M_PI_4 aroundAxis:SCNVector3Make(0, 1, 0) duration:0];
    [shapeNode runAction:retation];
    
    
    
}
-(SCNNode *)nodeWithGeometry:(SCNGeometry*)getmetry adIamgeName:(NSString *)name adPostion:(SCNVector3)postion{
    SCNNode *node = [SCNNode nodeWithGeometry:getmetry];
    getmetry.firstMaterial.diffuse.contents = [UIImage imageNamed:name];
    node.position = postion;
    return node;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
