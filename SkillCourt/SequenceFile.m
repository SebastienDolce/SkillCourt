//
//  SequenceFile.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "SequenceFile.h"

@implementation SequenceFile
@synthesize grids,info,steps;
-(id) init
{
    if (self = [super init])
    {
        info = [[NSMutableDictionary alloc] init];
        grids = [[NSMutableArray<GridInfo *> alloc] init];
        steps = [[NSMutableArray<Step *> alloc] init];
    }
    return self;
}

-(id) init : (NSMutableDictionary*) theInfo :(NSMutableArray*) theGrid : (NSMutableArray*) theStep
{
    if (self = [super init])
    {
        info = theInfo;
        grids = theGrid;
        steps = theStep;
    }
    return self;
}

-(void) exportFile : (NSString*) filename
{
    NSMutableData *archiveData = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiveData];
    archiver.outputFormat = NSPropertyListXMLFormat_v1_0;
    [archiver encodeRootObject:self];
    [archiver finishEncoding];
    [archiveData writeToFile:[[NSBundle mainBundle] resourcePath] atomically:YES];
}

@end
