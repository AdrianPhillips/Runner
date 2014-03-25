//
//  Levels.m
//  Runner Runner
//
//  Created by Adrian Phillips on 2/23/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import "Levels.h"
#import "MyScene.h"


@interface Levels ()
@property BOOL contentCreated;
@end

@implementation Levels

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"MainBG"];
        //CGPoint position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        //background.position = position;
        //[self addChild:background];
    }
    return self;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self button]];
}

- (SKLabelNode *)button
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Level 1";
    button.fontSize = 42;
    button.position = CGPointMake(100, 250);
    button.name = @"button";
    return button;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button"]) {
        [self runButtonActionOnNode:node];
    }
}


-(void)runButtonActionOnNode:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *spaceshipScene  = [[MyScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:spaceshipScene transition:doors];
    }];
}


@end
