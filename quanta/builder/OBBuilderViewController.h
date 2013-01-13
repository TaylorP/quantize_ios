//
//  OBBuilderViewController.h
//  quanta
//
//  Created by Taylor Petrick on 2013-01-05.
//  Copyright (c) 2013 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBBuilderToolsView.h"
#import "OBBuilderSizeView.h"

@interface OBBuilderViewController : UIViewController
{
    
}
@property (nonatomic, retain) IBOutlet OBBuilderToolsView* toolsView;
@property (nonatomic, retain) IBOutlet OBBuilderSizeView*  sizeView;

-(IBAction)backToMenu:(id)sender;

@end
