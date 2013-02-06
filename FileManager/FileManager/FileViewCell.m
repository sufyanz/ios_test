//
//  FileViewCell.m
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "FileViewCell.h"

@implementation FileViewCell
@synthesize lblFileName,lblFilePath,lblIsShared,lblSharedBy,lblSharedDate,lblSize,lblStatus,lblType,lblUpdatedDate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [lblFileName release];
    lblFileName = nil;
    
    [lblFilePath release];
    lblFilePath = nil;
    
    [lblIsShared release];
    lblIsShared = nil;
    
    [lblSharedBy release];
    lblSharedBy = nil;
    
    [lblSharedDate release];
    lblSharedDate = nil;
    
    [lblSize release];
    lblSize = nil;
    
    [lblStatus release];
    lblStatus = nil;
    
    [lblType release];
    lblType = nil;
    
    [lblUpdatedDate release];
    lblUpdatedDate = nil;
    
    [super dealloc];
}

@end
