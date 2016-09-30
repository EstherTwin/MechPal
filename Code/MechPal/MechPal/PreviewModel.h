//
//  PreviewModel.h
//  MechPal
//
//  Created by ilabafrica on 26/09/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreviewModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *position; // name of the event;
@property (nonatomic, strong) NSString *snippet; //event details
@property (nonatomic, strong) NSString *icon;

//@property (strong, nonatomic) NSMutableArray *mech;

//-(instancetype) initWithAttributes: (NSDictionary *)attributes;

@end
