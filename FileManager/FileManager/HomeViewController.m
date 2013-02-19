//
//  HomeViewController.m
//  FileManager
//
//  Created by Sufyan Anees on 2/4/13.
//  Copyright (c) 2013 Sufyan Anees. All rights reserved.
//

#import "HomeViewController.h"
#import "SVProgressHUD.h"
#import "AccountInfo.h"
#import "MasterViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

  //     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    //     self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
      //   }
         
    }
    return self;
}
-(IBAction)ShowMyFiles:(id)sender
{
    MasterViewController *mv = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil];
    mv.Type = 1;
    [self.navigationController pushViewController:mv animated:YES];

}
-(IBAction)ShowSharedFiles:(id)sender
{
    MasterViewController *mv = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil];
    mv.Type = 2;
    [self.navigationController pushViewController:mv animated:YES];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationItem setTitle:@"File Manager"];
     DataManger *DM = [DataManger alloc];
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSLog(@"val %@",[pref objectForKey:@"DataDownloaded"]);
    if([pref objectForKey:@"DataDownloaded"] && [[NSString stringWithFormat:@"%@", [pref objectForKey:@"DataDownloaded"]] isEqualToString:@"1"])
    {
       NSArray *AryAccont =  [DM getAccountData];
        if([AryAccont count] > 0)
        {
            AccountInfo *ai = [AryAccont objectAtIndex:0];
            lblAvailSpace.text = [self Getinvo:[ai availableSpace]];
            lblUsedSpace.text = [self Getinvo:[ai usedSpace]];
            lblTotalSpace.text = [self Getinvo:[ai totalSpace]];
            [lblMode  setText:[ai mode]];
            [lblPendngs setText:[NSString stringWithFormat:@"%@", [ai pendingRequest]]];
            [lblRevNo setText:[NSString stringWithFormat:@"%@", [ai revisionID]]];
    
            
            
        }
        else
        {
            
        }
    
    }
    else
    {
    DM.delegate = self;
    [DM GetDataFromFile];
    [SVProgressHUD show];
    }
}

- (void)didServiceResponseSuccess: (NSString *) value
{

    if([value isEqualToString:@"Done"])
    {
        NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
        [pref setObject:@"1" forKey:@"DataDownloaded"];
        [pref synchronize];
           DataManger *DM = [DataManger alloc];
        NSArray *AryAccont =  [DM getAccountData];
        if([AryAccont count] > 0)
        {
            AccountInfo *ai = [AryAccont objectAtIndex:0];
            lblAvailSpace.text = [self Getinvo:[ai availableSpace]];
            lblUsedSpace.text = [self Getinvo:[ai usedSpace]];
            lblTotalSpace.text = [self Getinvo:[ai totalSpace]];
            [lblMode  setText:[ai mode]];
            [lblPendngs setText:[NSString stringWithFormat:@"%@", [ai pendingRequest]]];
            [lblRevNo setText:[NSString stringWithFormat:@"%@", [ai revisionID]]];
            
            
            
        }

    
        
    }else
    {
        UIAlertView *Ai = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Database error Occured" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Ai show];
    }
    
        [SVProgressHUD dismiss];
}
- (void)didServiceResposeFail: (NSString *) value
{
    UIAlertView *Ai = [[UIAlertView alloc] initWithTitle:@"Error" message:value delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [Ai show];
    
        [SVProgressHUD dismiss];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
