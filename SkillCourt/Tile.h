//
//  Tile.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

//@property (retain, nonatomic ) INT r, g, b)
@property (assign) int R, G, B;
-(void) setColor : (int*) red : (int*) green :  (int*) blue;
-(NSString*) interpreter;
-(void) zeroOut;
-(id) init;
@end
