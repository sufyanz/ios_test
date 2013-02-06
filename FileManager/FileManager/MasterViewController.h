//
//  MasterViewController.h
//  FileManager
//
//  Created by Sufyan Anees on 2/1/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WEPopoverController.h"
#import "WEPopoverContentViewController.h"

@interface MasterViewController : UITableViewController<UISplitViewControllerDelegate,UIPopoverControllerDelegate,PopoverControllerDelegate>
{
    
    NSArray *AryFiles;
    NSMutableArray *AryPagedFiles;
    int PageNo;
    
    NSMutableArray *data;
    UIPopoverController *popoverController;
        WEPopoverController *statusPopover;

}
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, strong) WEPopoverController *statusPopover;
@property int Type;

@end
