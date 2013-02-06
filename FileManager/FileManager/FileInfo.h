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

@property (nonatomic, retain) NSString * createdDate;
@property (nonatomic, retain) NSString * fileType;
@property (nonatomic, retain) NSString * is_Share;
@property (nonatomic, retain) NSString * itemID;
@property (nonatomic, retain) NSString * lastUpdatedBy;
@property (nonatomic, retain) NSString * lastUpdatedDate;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * mimeType;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * parentID;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * pathByID;
@property (nonatomic, retain) NSString * shareBy;
@property (nonatomic, retain) NSString * shareDate;
@property (nonatomic, retain) NSString * shareID;
@property (nonatomic, retain) NSString * shareLevel;
@property (nonatomic, retain) NSString * size;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSManagedObject *account;

@end
