//
//  ViewMechViewController.h
//  MechPal
//
//  Created by ilabafrica on 09/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewMechViewController : UIViewController <MKMapViewDelegate>
- (IBAction)setMapType:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)zoomIn:(UIButton *)sender;

@end
