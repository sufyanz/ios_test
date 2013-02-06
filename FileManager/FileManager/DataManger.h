//
//  DataManger.h
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "FileDBManager.h"

@protocol GenericCallResponse <NSObject>

- (void)didServiceResponseSuccess: (NSString *) value;
- (void)didServiceResposeFail: (NSString *) value;

@end

@interface DataManger : NSObject


-(IBAction)GetDataFromFile;
-(NSArray *)getAccountData;
-(NSArray *)getFileData:(NSString *)Type;
@property (nonatomic, assign) id<GenericCallResponse> delegate;
@property(nonatomic,retain)FileDBManager *db;
@end
