//
//  FileDBManager.m
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "FileDBManager.h"
#import "FileInfo.h"
#import "AccountInfo.h"

@implementation FileDBManager
+ (FileDBManager *)create{
    return [[[FileDBManager alloc]init] autorelease];
}

-(AccountInfo*)insertAccountInfo:(NSString*)availableSpace mode:(NSString*)mode pendingRequest:(NSNumber*)pendingRequest  revisionID:(NSNumber*)revisionID  totalSpace:(NSString*)totalSpace  usedSpace:(NSString*)usedSpace
{
    AccountInfo *ai=[NSEntityDescription insertNewObjectForEntityForName:@"AccountInfo" inManagedObjectContext:[self managedObjectContext]];
  
    [ai setAvailableSpace:availableSpace];
    [ai setMode:mode];
    [ai setPendingRequest:pendingRequest];
    [ai setRevisionID:revisionID];
    [ai setTotalSpace:totalSpace];
    [ai setUsedSpace:usedSpace];
    
    NSError *error = nil;
    if([[self managedObjectContext]save:&error]){//db commit
        return ai;
        
    }
    else{
        NSLog(@"%@",error);
        return nil;
    }
}

-(FileInfo*)insertFileInfo:(NSString *)createdDate fileType:(NSString*)fileType is_Share:(NSString*)is_Share  itemID:(NSString*)itemID  lastUpdatedBy:(NSString*)lastUpdatedBy  lastUpdatedDate:(NSString *)lastUpdatedDate  link:(NSString*)link  mimeType:(NSString*)mimeType  name:(NSString*)name  parentID:(NSString*)parentID  path:(NSString*)path  pathByID:(NSString*)pathByID  shareBy:(NSString*)shareBy  shareDate:(NSString *)shareDate  shareID:(NSString*)shareID  shareLevel:(NSString*)shareLevel  size:(NSString*)size  status:(NSString*)status  type:(NSString*)type  userID:(NSString*)userID  AccountInfo:(AccountInfo *)AccountInfo
{
    FileInfo *fi=[NSEntityDescription insertNewObjectForEntityForName:@"FileInfo" inManagedObjectContext:[self managedObjectContext]];
    
 
    [fi setAccount:AccountInfo];
    [fi setCreatedDate:createdDate];
    [fi setFileType:fileType];
    [fi setIs_Share:is_Share];
    [fi setItemID:itemID];
    [fi setLastUpdatedBy:lastUpdatedBy];
    [fi setLastUpdatedDate:lastUpdatedDate];
    [fi setLink:link];
    [fi setMimeType:mimeType];
    [fi setName:name];
    [fi setParentID:parentID];
    [fi setPath:path];
    [fi setPathByID:pathByID];
    [fi setShareBy:shareBy];
    [fi setShareDate:shareDate];
    [fi setShareID:shareID];
    [fi setShareLevel:shareLevel];
    [fi setSize:size];
    [fi setStatus:status];
    [fi setType:type];
    [fi setUserID:userID];
    
    
    
    NSError *error = nil;
    if([[self managedObjectContext]save:&error]){//db commit
        return fi;
        
    }
    else{
        NSLog(@"%@",error);
        return nil;
    }
}
-(NSArray*)getAllRecordsFromEntity:(NSString *)entity
{
    //NSPredicate *pred = [NSPredicate predicateWithFormat:@"CustomerName == %@", predicate];
    return [self queryDBForEntity:entity predicate:nil sortByField:nil];
}

-(NSArray*)getAllRecordsFromEntity:(NSString *)entity pred:(NSPredicate *)predicate
{
    //NSPredicate *pred = [NSPredicate predicateWithFormat:@"CustomerName == %@", predicate];
    return [self queryDBForEntity:entity predicate:predicate sortByField:nil];
}

@end
