//
//  MyScene.m
//  Buttontest
//
//  Created by Richard Yeates on 2014-04-25.
//  Copyright (c) 2014 Richard Yeates. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //Create the non-moving button as a sprite
        SKSpriteNode *button1 = [SKSpriteNode spriteNodeWithImageNamed:@"PlayButton.png"];
        button1.position = CGPointMake(self.size.width/4, self.size.height/2);
        [self addChild:button1];
        //Create the moving button as a sprite
        SKSpriteNode *button2 = [SKSpriteNode spriteNodeWithImageNamed:@"PlayButton.png"];
        button2.position = CGPointMake(self.size.width*.75, self.size.height/2);
        [self addChild:button2];

        //Create the base actions for scaling up and down the image
        SKAction *pulseOut = [SKAction scaleTo:1.2 duration:0.5];
        SKAction *pulseIn = [SKAction scaleTo:1.0 duration:0.5];
        //Create a sequence of the scaling actions, and repeat them forever in a loop
        SKAction *sequence = [SKAction sequence:@[pulseOut, pulseIn]];
        SKAction *repeatSequence = [SKAction repeatActionForever:sequence];
        //Run that action sequence on the button in question
        [button2 runAction:repeatSequence];
        
        SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle]
                                                                        pathForResource:@"backHighlight"   ofType:@"sks"]];
        emitter.position = CGPointMake(button2.position.x, button2.position.y);
        emitter.zPosition = -100;
        [self addChild:emitter];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
  
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
