//
//  WEPopoverContentViewController.h
//  WEPopover
//
//  Created by Werner Altewischer on 06/11/10.
//  Copyright 2010 Werner IT Consultancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentViewDelegate<NSObject>

-(void)dismmissPopup:(NSString*)status;

@end

@interface WEPopoverContentViewController : UITableViewController {
    NSArray* imagesArray;
    NSArray* rowArray;
    id <ContentViewDelegate> delegate;
}
@property (nonatomic, retain) id <ContentViewDelegate> delegate;
@end
