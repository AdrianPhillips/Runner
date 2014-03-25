//
//  EndScene.h
//  Runner Runner
//
//  Created by Adrian Phillips on 2/24/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface EndScene : SKScene
- (id)initWithSize:(CGSize)size showStartButton:(BOOL)display;
- (id)initWithSize:(CGSize)size playerWon:(BOOL)isWon;
@end
