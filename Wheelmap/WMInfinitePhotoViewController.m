//
//  WMInfinitePhotoViewController.m
//  Wheelmap
//
//  Created by Andrea Gerlach on 11.12.12.
//  Copyright (c) 2012 Sozialhelden e.V. All rights reserved.
//

#import "WMInfinitePhotoViewController.h"
#import "InfiniteGallery.h"
#import "UIImageView+AFNetworking.h"


@interface WMInfinitePhotoViewController ()

@end

@implementation WMInfinitePhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.imageURLArray = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.infiniteGallery = [[InfiniteGallery alloc] initWithFrame:self.view.bounds];
    self.infiniteGallery.dataSource = self;
    self.infiniteGallery.delegate = self;
    
    [self.view addSubview:self.infiniteGallery];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(280, 10, 30, 20);
    [button setTitle:@"x" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

    
}

- (void) viewWillAppear:(BOOL)animated {
  [self.infiniteGallery gotoPageNumber:self.tappedImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark InfiniteGallery

-(int)numberOfPagesForGallery:(InfiniteGallery *)g {

    return self.imageURLArray.count;
}

-(UIView*)viewForGallery:(InfiniteGallery *)g pageNum:(int)pageNum pagesize:(CGSize)size {
    
    NSString *currentImageURL = [self.imageURLArray objectAtIndex:pageNum];
    UIImageView *imageView = [UIImageView new];
    [imageView setImageWithURL:[NSURL URLWithString:currentImageURL] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    return imageView;
}

- (void) backButtonPressed:(id) sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end