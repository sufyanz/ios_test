//
//  FileViewCell.h
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileViewCell : UITableViewCell
{
    IBOutlet UILabel *lblFileName;
      IBOutlet UILabel *lblFilePath;
      IBOutlet UILabel *lblStatus;
      IBOutlet UILabel *lblIsShared;
      IBOutlet UILabel *lblSharedBy;
      IBOutlet UILabel *lblSize;
      IBOutlet UILabel *lblType;
      IBOutlet UILabel *lblSharedDate;
      IBOutlet UILabel *lblUpdatedDate;
    
}
@property (nonatomic, retain) IBOutlet UILabel *lblFileName;
@property (nonatomic, retain) IBOutlet UILabel *lblFilePath;
@property (nonatomic, retain) IBOutlet UILabel *lblStatus;
@property (nonatomic, retain) IBOutlet UILabel *lblIsShared;
@property (nonatomic, retain) IBOutlet UILabel *lblSharedBy;
@property (nonatomic, retain) IBOutlet UILabel *lblSize;
@property (nonatomic, retain) IBOutlet UILabel *lblType;
@property (nonatomic, retain) IBOutlet UILabel *lblSharedDate;
@property (nonatomic, retain) IBOutlet UILabel *lblUpdatedDate;
@end
