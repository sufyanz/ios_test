//
//  HomeViewController.h
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManger.h"

@interface HomeViewController : UIViewController<GenericCallResponse>
{
    IBOutlet UILabel *lblTotalSpace;
     IBOutlet UILabel *lblAvailSpace;
     IBOutlet UILabel *lblUsedSpace;
     IBOutlet UILabel *lblMode;
     IBOutlet UILabel *lblRevNo;
     IBOutlet UILabel *lblPendngs;
}
-(IBAction)ShowMyFiles:(id)sender;
-(IBAction)ShowSharedFiles:(id)sender;

@end
