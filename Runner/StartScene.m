//
//  StartScene.m
//  Runner Runner
//
//  Created by Adrian Phillips on 2/23/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import "StartScene.h"
#import "Levels.h"

@interface StartScene () {
    SKSpriteNode *_startButton;
    BOOL _startButtonPressed;
    BOOL _showRestartButton;
}

@end

@implementation StartScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"Runner Runner";
        myLabel.fontSize = 30;
        myLabel.fontColor = [UIColor blueColor];
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),250);
        [self addChild:myLabel];
        //adding the background
        //SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"MainBG"];
        CGPoint position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        //background.position = position;
        //[self addChild:background];
        
        if (_showRestartButton) {
            _startButton = [SKSpriteNode spriteNodeWithImageNamed:@"restart_n"];
        }
        else {
            _startButton = [SKSpriteNode spriteNodeWithImageNamed:@"start_n"];
        }
        _startButton.position = position;
        [self addChild:_startButton];
    }
    return self;
}

- (id)initWithSize:(CGSize)size showRestartButton:(BOOL)display {
    _showRestartButton = display;
    return [self initWithSize:size];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if (node == _startButton) {
        if (_showRestartButton) {
            [_startButton setTexture:[SKTexture textureWithImageNamed:@"restart_s"]];
        }
        else {
            [_startButton setTexture:[SKTexture textureWithImageNamed:@"start_s"]];
        }
        _startButtonPressed = YES;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Change to MainScene
    if (_startButtonPressed) {
        SKScene *levels = [[Levels alloc] initWithSize:self.size];
        SKTransition *reveal = [SKTransition flipVerticalWithDuration:0.5];
        [self.view presentScene:levels transition:reveal];
    }
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
