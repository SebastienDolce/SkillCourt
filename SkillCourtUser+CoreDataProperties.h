//
//  SkillCourtUser+CoreDataProperties.h
//  SkillCourt
//
//  Created by sebastien dolce on 3/6/16.
//  Copyright © 2016 Gummy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SkillCourtUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkillCourtUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *position;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *sequences;

@end

@interface SkillCourtUser (CoreDataGeneratedAccessors)

- (void)addSequencesObject:(NSManagedObject *)value;
- (void)removeSequencesObject:(NSManagedObject *)value;
- (void)addSequences:(NSSet<NSManagedObject *> *)values;
- (void)removeSequences:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
