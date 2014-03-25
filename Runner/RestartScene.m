//
//  RestartScene.m
//  Runner Runner
//
//  Created by Adrian Phillips on 3/6/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import "RestartScene.h"
#import "MyScene.h"

@interface RestartScene () {
    SKSpriteNode *_restartButton;
    BOOL _restartButtonPressed;
    BOOL _showStartButton;
}

@end

@implementation RestartScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"Restart Game";
        myLabel.fontSize = 30;
        myLabel.fontColor = [UIColor whiteColor];
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),250);
        [self addChild:myLabel];
        
        //adding the background
        //SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"MainBG"];
        CGPoint position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        //background.position = position;
        //[self addChild:background];
        _restartButton = [SKSpriteNode spriteNodeWithImageNamed:@"restart_n"];
        _restartButton.position = position;
        [self addChild:_restartButton];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if (node == _restartButton) {
        [_restartButton setTexture:[SKTexture textureWithImageNamed:@"restart_n"]];
        _restartButtonPressed = YES;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Change to MainScene
    if (_restartButtonPressed) {
        MyScene *myScene = [[MyScene alloc] initWithSize:self.size];
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:2.0];
        [self.view presentScene:myScene transition:reveal];
    }
}

- (id)initWithSize:(CGSize)size showRestartButton:(BOOL)display {
    _showStartButton = display;
    return [self initWithSize:size];
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
