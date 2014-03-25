//
//  EndScene.m
//  Runner Runner
//
//  Created by Adrian Phillips on 2/24/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import "EndScene.h"
#import "Levels.h"

@interface EndScene () {
    SKSpriteNode *_startButton;
    BOOL _startButtonPressed;
    BOOL _showStartButton;
}

@end

@implementation EndScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"You Died";
        myLabel.fontSize = 30;
        myLabel.fontColor = [UIColor whiteColor];
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),250);
        [self addChild:myLabel];
        
        //adding the background
        //SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"MainBG"];
        CGPoint position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        //background.position = position;
        //[self addChild:background];
        _startButton = [SKSpriteNode spriteNodeWithImageNamed:@"start_n"];
        _startButton.position = position;
        [self addChild:_startButton];
    }
    return self;
}

- (id)initWithSize:(CGSize)size playerWon:(BOOL)isWon
{
    self = [super initWithSize:size];
    if (self) {
       // SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"bg.png"];
        //background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        //[self addChild:background];
        
        // 1
        SKLabelNode* gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        gameOverLabel.fontSize = 42;
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame),350);
        if (isWon) {
            gameOverLabel.text = @"Game Won";
        } else {
            gameOverLabel.text = @"Game Over";
        }
        [self addChild:gameOverLabel];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if (node == _startButton) {
        [_startButton setTexture:[SKTexture textureWithImageNamed:@"start_n"]];
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

- (id)initWithSize:(CGSize)size showStartButton:(BOOL)display {
    _showStartButton = display;
    return [self initWithSize:size];
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
