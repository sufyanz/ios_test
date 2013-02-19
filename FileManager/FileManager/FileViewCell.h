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
@property (nonatomic, strong) IBOutlet UILabel *lblFileName;
@property (nonatomic, strong) IBOutlet UILabel *lblFilePath;
@property (nonatomic, strong) IBOutlet UILabel *lblStatus;
@property (nonatomic, strong) IBOutlet UILabel *lblIsShared;
@property (nonatomic, strong) IBOutlet UILabel *lblSharedBy;
@property (nonatomic, strong) IBOutlet UILabel *lblSize;
@property (nonatomic, strong) IBOutlet UILabel *lblType;
@property (nonatomic, strong) IBOutlet UILabel *lblSharedDate;
@property (nonatomic, strong) IBOutlet UILabel *lblUpdatedDate;
@end
