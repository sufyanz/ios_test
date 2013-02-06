//
//  AcountInfo.h
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FileInfo;

@interface AccountInfo : NSManagedObject
@property (nonatomic, retain) NSString * availableSpace;
@property (nonatomic, retain) NSString * mode;
@property (nonatomic, retain) NSNumber * pendingRequest;
@property (nonatomic, retain) NSNumber * revisionID;
@property (nonatomic, retain) NSString * totalSpace;
@property (nonatomic, retain) NSString * usedSpace;


@end

@interface AccountInfo (CoreDataGeneratedAccessors)

- (void)addReasonsObject:(FileInfo *)value;
- (void)removeReasonsObject:(FileInfo *)value;
- (void)addReasons:(NSSet *)values;
- (void)removeReasons:(NSSet *)values;

@end
