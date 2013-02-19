//
//  FileInfo.h
//  FileManager
//
//  Created by Sufyan Anees on 2/5/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FileInfo : NSManagedObject

@property (nonatomic, strong) NSString * createdDate;
@property (nonatomic, strong) NSString * fileType;
@property (nonatomic, strong) NSString * is_Share;
@property (nonatomic, strong) NSString * itemID;
@property (nonatomic, strong) NSString * lastUpdatedBy;
@property (nonatomic, strong) NSString * lastUpdatedDate;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * mimeType;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * parentID;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * pathByID;
@property (nonatomic, strong) NSString * shareBy;
@property (nonatomic, strong) NSString * shareDate;
@property (nonatomic, strong) NSString * shareID;
@property (nonatomic, strong) NSString * shareLevel;
@property (nonatomic, strong) NSString * size;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * userID;
@property (nonatomic, strong) NSManagedObject *account;

@end
