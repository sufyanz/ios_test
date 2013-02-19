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
@property (nonatomic, strong) NSString * availableSpace;
@property (nonatomic, strong) NSString * mode;
@property (nonatomic, strong) NSNumber * pendingRequest;
@property (nonatomic, strong) NSNumber * revisionID;
@property (nonatomic, strong) NSString * totalSpace;
@property (nonatomic, strong) NSString * usedSpace;


@end

@interface AccountInfo (CoreDataGeneratedAccessors)

- (void)addReasonsObject:(FileInfo *)value;
- (void)removeReasonsObject:(FileInfo *)value;
- (void)addReasons:(NSSet *)values;
- (void)removeReasons:(NSSet *)values;

@end
