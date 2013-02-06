//
//  DBAdapter.h
//
//  Created by Sufyan Anees on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DBAdapter : NSObject{
    NSManagedObjectContext *managedObjectContext;
}

@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext;


- (NSArray *)queryDBForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate sortByField:(NSString *)sortField;
- (void)insertObjectForEntity:(NSString *)entityName objectsToInsert:(NSDictionary *)dictObjects;
- (BOOL)deleteObject:(id)obj;
- (BOOL)doesRecordExistForEntity:(NSString *)entity fieldToCheck:(NSString *)fieldName valueToMatch:(id)val;
- (id)getRecordFromEntity:(NSString *)entity whereField:(NSString *)fieldName isEqualTo:(id)val;
- (NSArray*)getAllRecordsFromEntity:(NSString *)entity;
- (NSArray *)queryDBForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate sortByField:(NSString *)sortField SortASC:(BOOL)ASC;

- (BOOL)saveToDb;

+ (DBAdapter *)create;

@end
