//
//  GridInfo.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridInfo : NSObject

@property (strong, nonatomic) NSString* gridName;
@property (assign) int rows, cols;
-(id) init: (NSString *) theName : (int) theRows :(int) theCols;
-(id) init;
@end
