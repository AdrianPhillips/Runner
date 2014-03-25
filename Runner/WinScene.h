//
//  WinScene.h
//  Runner Runner
//
//  Created by Adrian Phillips on 3/15/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface WinScene : SKScene
- (id)initWithSize:(CGSize)size playerWon:(BOOL)isWon;
- (id)initWithSize:(CGSize)size showStartButton:(BOOL)display;
@end
