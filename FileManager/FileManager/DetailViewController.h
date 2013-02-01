//
//  DetailViewController.h
//  FileManager
//
//  Created by Sufyan Anees on 2/1/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
