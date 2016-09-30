//
//  PreviewMechViewController.h
//  MechPal
//
//  Created by ilabafrica on 26/09/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PreviewModel.h"
#import "ViewMechViewController.h"

@interface PreviewMechViewController : UIViewController

@property(weak, nonatomic) PreviewModel *PreviewModel;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *contact;
@property (weak, nonatomic) IBOutlet UITextField *detail;

@end
