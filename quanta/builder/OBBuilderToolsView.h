//
//  OBBuilderToolsView.h
//  quanta
//
//  Created by Taylor Petrick on 2013-01-05.
//  Copyright (c) 2013 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBElement.h"
#import "OBTunnel.h"
#import "OBGameBubble.h"

@interface OBBuilderToolsView : UIView
{
    OBElement** elements;
    int selected;
}
@end