//
//  GridCommand.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridCommand : NSObject


@property (strong, nonatomic) NSString* gridName;
@property (assign) int theRow, theCol, R, G, B, ID;
-(id) init: (NSString *) theName : (int) theRows :(int) theCols : (int) theR :(int) theG : (int) theB :(int) theID;
-(id) init;

@end
