//
//  Sequence+CoreDataProperties.h
//  SkillCourt
//
//  Created by sebastien dolce on 3/6/16.
//  Copyright © 2016 Gummy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sequence.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sequence (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSData *routine;
@property (nullable, nonatomic, retain) SkillCourtUser *skillCourtUser;

@end

NS_ASSUME_NONNULL_END
