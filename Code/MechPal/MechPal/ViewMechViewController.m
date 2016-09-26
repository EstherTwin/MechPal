//
//  ViewMechViewController.m
//  MechPal
//
//  Created by ilabafrica on 09/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ViewMechViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewMechViewController () <GMSMapViewDelegate>

@property(nonatomic)NSMutableArray* storedLocations;
@property(nonatomic)NSMutableArray* myPlaces;


@end

@implementation ViewMechViewController

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker     *)marker{
    
    UIAlertView* new = [[UIAlertView alloc] initWithTitle:@"Nice!" message:@"Good stuff" delegate:self cancelButtonTitle:@" Done!" otherButtonTitles:nil];
    [new show];
//    [self performSegueWithIdentifier:@"pushToMyVC" sender:self];
//    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PreviewMechViewController"];
//    //[self.navigationController pushViewController:controller animated:YES];
//    [self presentViewController:controller animated:YES completion:nil];
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSInteger index = [self.myTableView indexPathForSelectedRow].row;
//    
//    if([segue.identifier isEqualToString: @"eventIdentifier"]){
//        [(PreviewViewController *) segue.destinationViewController setEvents:
//         [self objectInListAtIndex: index]];
//        
//    }}
//
//-(Events *)objectInListAtIndex: (NSInteger) index{
//    return [event objectAtIndex: index];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-1.3089589
                                                            longitude:36.8108885
                                                                 zoom:10];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    mapView.delegate = self;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-1.3089589, 36.8108885);
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
    
    marker.title = @"Strathmore University";
    marker.snippet = @"Kenya";
    marker.icon = [UIImage imageNamed:@"map.png"];
    marker.map = mapView;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }}
- (IBAction)zoomIn:(UIButton *)sender {
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region;
    region.center.latitude = self.mapView.userLocation.coordinate.latitude;
    region.center.longitude = self.mapView.userLocation.coordinate.longitude;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    [self.mapView setRegion:region animated:YES];}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
}




- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        if ([annotation isKindOfClass:[MKUserLocation class]])
        {
            NSString *annotationIdentifier = @"userlocation";
            MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
            if (annotationView)
            {
                annotationView.annotation = annotation;
            }
            else
            {
                annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
            }
            
            return annotationView;
        }
    }
    
    // again, if you had other annotation types, such as MKPointAnnotation,
    // handle them here
    
//    if ([annotation isKindOfClass:[MKPointAnnotation class]])
//    {
//        
//    }
    
    return nil;
}
@end
