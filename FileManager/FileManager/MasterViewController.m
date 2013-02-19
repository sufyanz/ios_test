//
//  MasterViewController.m
//  FileManager
//
//  Created by Sufyan Anees on 2/1/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "MasterViewController.h"
#import "FileViewCell.h"
#import "DataManger.h"
#import "FileInfo.h"
#import "WEPopoverContentViewController.h"

@interface MasterViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end


@implementation MasterViewController


@synthesize Type;
@synthesize statusPopover;
@synthesize popoverController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
       
        /*if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
         */
    }
    return self;
}
							

- (void)configureView
{
    // Update the user interface for the detail item.

}

- (void)viewDidLoad
{
    
    if(self.Type == 1)
           [self.navigationItem setTitle:@"My Files"];
    else if(self.Type == 2)
          [self.navigationItem setTitle:@"Shared Files"];
    
         DataManger *DM = [DataManger alloc];
  AryFiles = [[NSArray alloc] initWithArray:[DM getFileData:[NSString stringWithFormat:@"%d",self.Type]]];
    
    NSLog(@"AryFiles %@",AryFiles);
    PageNo = 1;
    AryPagedFiles  = [[NSMutableArray alloc] init];
if(AryFiles.count > 20)
{
    for(int i = 0 ; i < 20 ; i++)
    {
        [AryPagedFiles addObject:[AryFiles objectAtIndex:i]];
    }
}
    else
    {
        [AryPagedFiles addObjectsFromArray:AryFiles];
    }
    
  //  [DM getFileData:[NSString stringWithFormat:@"%d",self.Type]];
    
    data = [[NSMutableArray alloc]init];
    [data addObjectsFromArray:[NSArray arrayWithObjects: @"Row 1", @"Row 2", @"Row 3", nil]];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)Getinvo:(NSString *)val
{
    double avsp = [val doubleValue];
    avsp = avsp / (1024 * 1024);
    if(avsp > 1024)
    {
        avsp = avsp / 1024 ;
        return [NSString stringWithFormat:@"%.2f GB",avsp];
    }
    else
    {
        return [NSString stringWithFormat:@"%.2f MB",avsp];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.tableView)
    {
        if(AryPagedFiles.count >= AryFiles.count)
    return [AryPagedFiles count];
        else
            return ([AryPagedFiles count] + 1);
    }
    else
    {
           return [data count];
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableView)
    {
    
        if(indexPath.row == [AryPagedFiles count])
        {
            static NSString *CellIdentifier = @"CellIdentifier";
            
            // Dequeue or create a cell of the appropriate type.
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            [cell.textLabel setFont:[UIFont fontWithName:@"Bold" size:20]];
            
            // Configure the cell.
            cell.textLabel.text =@"Load More Records";
            return cell;
        }
        
    
    static NSString *DTComplainCellIdentifier = @"FileViewCell";
    
    
    FileViewCell *Cell = (FileViewCell *)[tableView dequeueReusableCellWithIdentifier:DTComplainCellIdentifier];
    if (Cell == nil)
    {
        // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        NSArray *topObjects;
          if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
      topObjects = [[NSBundle mainBundle] loadNibNamed:@"FileViewCell_Pad" owner:self options:nil];
          }
        else
        {
                topObjects = [[NSBundle mainBundle] loadNibNamed:@"FileViewCell" owner:self options:nil];
        }
        for (id obj in topObjects)
        {
            if ([obj isKindOfClass:[UITableViewCell class]])
            {
                Cell = (FileViewCell *)obj;
                break;
            }
        }
    }
    FileInfo *fi = [AryPagedFiles objectAtIndex:indexPath.row];
    
    Cell.lblFileName.text = [fi name];
    Cell.lblFilePath.text = [fi path];
    Cell.lblIsShared.text = [fi is_Share];
    Cell.lblSharedBy.text = [fi shareBy];
    Cell.lblSharedDate.text = [fi shareDate];
    Cell.lblSize.text = [self Getinvo:[fi size]];
    Cell.lblStatus.text = [fi status];
    Cell.lblType.text = [fi type];
    Cell.lblUpdatedDate.text = [fi lastUpdatedDate];
        return Cell;
    }
    else
    {
        static NSString *CellIdentifier = @"CellIdentifier";
        
        // Dequeue or create a cell of the appropriate type.
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        [cell.textLabel setFont:[UIFont fontWithName:@"Bold" size:20]];
        
        // Configure the cell.
        cell.textLabel.text =[data objectAtIndex:indexPath.row];
        return cell;
        
    }


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableView)
    {
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
         return 80.0;
  }
    else
    {
        return 120.0;
    }
    }
    else
    {
        return 30;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if(tableView == self.tableView)
        {
            if(indexPath.row == [AryPagedFiles count])
            {
                NSLog(@"Ary count %d",(AryFiles.count - AryPagedFiles.count));
                int diff = (AryFiles.count - AryPagedFiles.count);
                [AryPagedFiles removeAllObjects];
                PageNo = PageNo + 1;
         
                
                if(diff < 20)
                {
                    NSLog(@"get in");
                    for(int i = 0 ; i < AryFiles.count ; i++)
                    {
                        [AryPagedFiles addObject:[AryFiles objectAtIndex:i]];
                    }
              
                }
                else{
                    for(int i = 0 ; i < (20 *PageNo) ; i++)
                    {
                        [AryPagedFiles addObject:[AryFiles objectAtIndex:i]];
                    }
                }
                
                [self.tableView reloadData];
                return;
            }
            
    //show popover
      if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
      {
          UIViewController* popoverContent = [[UIViewController alloc]init];
          UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 304)];
     
          UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 665) style:UITableViewStylePlain];
        //  table.backgroundColor=[UIColor colorWithRed:(107.0/255.0) green: (164.0/255) blue:(183.0/255) alpha:1];
          [table setDataSource:self];
          [table setDelegate:self];
          [table setRowHeight:80];
          [self.view addSubview:table];
          [popoverView addSubview:table];
          popoverContent.view = popoverView;
          popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 304);
          self.popoverController = [[UIPopoverController alloc]
                                    initWithContentViewController:popoverContent];
          //present the popover view non-modal with a
          //refrence to the toolbar button which was pressed
          CGRect frame = [tableView rectForRowAtIndexPath:indexPath];
          CGPoint yOffset = self.tableView.contentOffset;
          [self.popoverController  presentPopoverFromRect:CGRectMake(frame.origin.x, (frame.origin.y + yOffset.y), frame.size.width, frame.size.height)
                                                   inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
     
          
          //release the popover content
      }
            else
            {
                
                if (self.statusPopover)
                {
                    [self.statusPopover dismissPopoverAnimated:YES];
                    self.statusPopover = nil;
                }
                WEPopoverContentViewController *contentViewController = [[WEPopoverContentViewController alloc] initWithStyle:UITableViewStylePlain];
                contentViewController.delegate=self;
                CGRect frame = [tableView rectForRowAtIndexPath:indexPath];
                CGPoint yOffset = self.tableView.contentOffset;
                self.statusPopover = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
                [self.statusPopover presentPopoverFromRect:CGRectMake(frame.origin.x, (frame.origin.y + yOffset.y), frame.size.width, frame.size.height)
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            }
        }
    else
    {
        [self.popoverController dismissPopoverAnimated:NO];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)dismmissPopup:(NSString*)status
{
    if (self.statusPopover)
    {
		[self.statusPopover dismissPopoverAnimated:YES];
		self.statusPopover = nil;
	}
    NSLog(@"new Status %@",status);
}
- (void)popoverControllerDidDismissPopover:(WEPopoverController *)popoverController {
    
    NSLog(@"Did dismiss");
}

- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)popoverController {
    NSLog(@"Should dismiss");
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)ipopoverController
{
    barButtonItem.title = NSLocalizedString(@"Account", @"Account");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = ipopoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



@end
