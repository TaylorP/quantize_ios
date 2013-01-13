//
//  OBBuilderViewController.m
//  quanta
//
//  Created by Taylor Petrick on 2013-01-05.
//  Copyright (c) 2013 Orange Bytes. All rights reserved.
//

#import "OBBuilderViewController.h"


@implementation OBBuilderViewController

@synthesize toolsView;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backToMenu:(id)sender
{    
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
