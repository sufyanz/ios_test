//
//  FileDBManager.h
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "DBAdapter.h"
#import "AccountInfo.h"
#import "FileInfo.h"
@interface FileDBManager : DBAdapter

+(FileDBManager *)create;
-(AccountInfo*)insertAccountInfo:(NSString*)availableSpace mode:(NSString*)mode pendingRequest:(NSNumber*)pendingRequest  revisionID:(NSNumber*)revisionID  totalSpace:(NSString*)totalSpace  usedSpace:(NSString*)usedSpace;

-(FileInfo*)insertFileInfo:(NSString*)createdDate fileType:(NSString*)fileType is_Share:(NSString*)is_Share  itemID:(NSString*)itemID  lastUpdatedBy:(NSString*)lastUpdatedBy  lastUpdatedDate:(NSString*)lastUpdatedDate  link:(NSString*)link  mimeType:(NSString*)mimeType  name:(NSString*)name  parentID:(NSString*)parentID  path:(NSString*)path  pathByID:(NSString*)pathByID  shareBy:(NSString*)shareBy  shareDate:(NSString *)shareDate  shareID:(NSString*)shareID  shareLevel:(NSString*)shareLevel  size:(NSString*)size  status:(NSString*)status  type:(NSString*)type  userID:(NSString*)userID AccountInfo:(AccountInfo *)AccountInfo ;


-(NSArray*)getAllRecordsFromEntity:(NSString *)entity;
-(NSArray*)getAllRecordsFromEntity:(NSString *)entity pred:(NSPredicate *)predicate;
@end
