//
//  DataManger.m
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "DataManger.h"
#import "JSONKit.h"
#import "AccountInfo.h"
#import "FileInfo.h"

@implementation DataManger
@synthesize db;
-(NSArray *)getAccountData
{
        db=[[FileDBManager create] retain];
    
  return [db getAllRecordsFromEntity:@"AccountInfo"];
    [db release];
    
}

-(NSArray *)getFileData:(NSString *)Type
{
    db=[[FileDBManager create] retain];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"fileType == %@", Type];
    return [db getAllRecordsFromEntity:@"FileInfo" pred:pred];
    [db release];
}
-(IBAction)GetDataFromFile
{
  
    NSString *urlString = @"https://gist.github.com/raw/4680060/aac6d818e7103edfe721e719b1512f707bcfb478/sample.json";
    
    
    ASIHTTPRequest *fdRequest = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    [fdRequest addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
    [fdRequest.requestHeaders setObject:@"application/json" forKey:@"Accept"];
    [fdRequest.requestHeaders setObject:@"application/json" forKey:@"Content-Type"];
    
    [fdRequest setDelegate:self];
    [fdRequest setDidFailSelector:@selector(fetchDataFailed:)];
    [fdRequest setDidFinishSelector:@selector(fetchDataFinished:)];
    [fdRequest startAsynchronous];
}

- (void)fetchDataFailed:(ASIHTTPRequest *)request
{
    NSLog(@"JSON error got %@",[request responseString]);
    [self.delegate didServiceResposeFail:[request responseString]];
       
}         
- (void)fetchDataFinished:(ASIHTTPRequest *)request
{
    db=[[FileDBManager create] retain];
    NSLog(@"JSON got %@",[request responseString]);
    
    NSDictionary *Result = [request.responseString objectFromJSONString];
    
    AccountInfo *ai =  [db insertAccountInfo:[NSString stringWithFormat:@"%@",[Result objectForKey:@"availableSpace"]] mode:[Result objectForKey:@"mode"] pendingRequest:[NSNumber numberWithInt:[[Result objectForKey:@"pendingRequests"] intValue]] revisionID:[NSNumber numberWithInt:[[Result objectForKey:@"rev_id"] intValue]] totalSpace:[NSString stringWithFormat:@"%@",[Result objectForKey:@"totalSpace"]] usedSpace:[NSString stringWithFormat:@"%@",[Result objectForKey:@"usedSpace"]]];
    
    if(ai)
    {
        NSArray *MyFiles = [[Result objectForKey:@"my_files"] objectForKey:@"content"];
        
        for (NSDictionary *FileD in MyFiles) {
            
           [db insertFileInfo:[FileD objectForKey:@"created_date"] fileType:@"1" is_Share:[FileD objectForKey:@"is_shared"] itemID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"item_id"]] lastUpdatedBy:[FileD objectForKey:@"last_updated_by"] lastUpdatedDate:[FileD objectForKey:@"last_updated_date"] link:[FileD objectForKey:@"link"] mimeType:[FileD objectForKey:@"mime_type"] name:[FileD objectForKey:@"name"] parentID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"parent_id"]] path:[FileD objectForKey:@"path"] pathByID:[FileD objectForKey:@"path_by_id"] shareBy:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"shared_by"]] shareDate:[FileD objectForKey:@"shared_date"] shareID:[FileD objectForKey:@"share_id"] shareLevel:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"share_level"]] size:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"size"]] status:[FileD objectForKey:@"status"] type:[FileD objectForKey:@"type"] userID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"user_id"]] AccountInfo:ai]; // AccountInfo:ai
           
            
        
        }
        
        
        NSArray *SharedFiles = [[Result objectForKey:@"shared_files"] objectForKey:@"content"];
        
        for (NSDictionary *FileD in SharedFiles) {
            
       [db insertFileInfo:[FileD objectForKey:@"created_date"] fileType:@"2" is_Share:[FileD objectForKey:@"is_shared"] itemID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"item_id"]] lastUpdatedBy:[FileD objectForKey:@"last_updated_by"] lastUpdatedDate:[FileD objectForKey:@"last_updated_date"] link:[FileD objectForKey:@"link"] mimeType:[FileD objectForKey:@"mime_type"] name:[FileD objectForKey:@"name"] parentID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"parent_id"]] path:[FileD objectForKey:@"path"] pathByID:[FileD objectForKey:@"path_by_id"] shareBy:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"shared_by"]] shareDate:[FileD objectForKey:@"shared_date"] shareID:[FileD objectForKey:@"share_id"] shareLevel:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"share_level"]] size:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"size"]] status:[FileD objectForKey:@"status"] type:[FileD objectForKey:@"type"] userID:[NSString stringWithFormat:@"%@",[FileD objectForKey:@"user_id"]] AccountInfo:ai];//
            
            
            
        }
        
            [self.delegate didServiceResponseSuccess:@"Done"];
        
        
           }
    else
    {
                    [self.delegate didServiceResponseSuccess:@"Error"];
    }
    
    
    [db release];

}

@end
