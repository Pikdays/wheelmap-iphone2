//
//  WMCreditsViewController.m
//  Wheelmap
//
//  Created by Taehun Kim on 1/7/13.
//  Copyright (c) 2013 Sozialhelden e.V. All rights reserved.
//

#import "WMCreditsViewController.h"

@interface WMCreditsViewController ()

@end

@implementation WMCreditsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.titleLabel.text = NSLocalizedString(@"Credits", nil);
    [self.doneButton setTitle:NSLocalizedString(@"Ready", nil) forState:UIControlStateNormal];
    
    UIImageView *bmas = [[UIImageView alloc] initWithFrame:CGRectMake(10, 80, 300, 220)];
    bmas.image = [UIImage imageNamed:@"credits_bmas.png"];
    [self.scroller addSubview:bmas];
    
    UIImageView *verein = [[UIImageView alloc] initWithFrame:CGRectMake(10, bmas.leftBottomY+10, 300, 148)];
    verein.image = [UIImage imageNamed:@"credits_verein.png"];
    [self.scroller addSubview:verein];
    
    UIImageView *authors = [[UIImageView alloc] initWithFrame:CGRectMake(10, verein.leftBottomY+10, 301, 90)];
    authors.image = [UIImage imageNamed:@"credits_authors.png"];
    [self.scroller addSubview:authors];
    
    UIImageView *license = [[UIImageView alloc] initWithFrame:CGRectMake(10, authors.leftBottomY+10, 300, 140)];
    license.image = [UIImage imageNamed:@"credits_credits.png"];
    license.contentMode = UIViewContentModeBottomRight;
    [self.scroller addSubview:license];
    
    self.scroller.contentSize = CGSizeMake(self.scroller.frame.size.width, license.leftBottomY+20);
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donePressed:)];
    [self.view addGestureRecognizer:tapGR];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)donePressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (CGSize)contentSizeForViewInPopover {
    return CGSizeMake(320.0f, 600.0f);
}

@end
