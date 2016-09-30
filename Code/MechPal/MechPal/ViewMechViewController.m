//
//  ViewMechViewController.m
//  MechPal
//
//  Created by ilabafrica on 09/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ViewMechViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "PreviewModel.h"
#import "MechSDataService.h"

@interface ViewMechViewController () <GMSMapViewDelegate>


@property(nonatomic)NSMutableArray* storedLocations;
@property(nonatomic)NSMutableArray* myPlaces;


@end

@implementation ViewMechViewController{
    NSArray *event;
}



- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker     *)marker{
//    
//    UIAlertView* new = [[UIAlertView alloc] initWithTitle:@"Nice!" message:@"Good stuff" delegate:self cancelButtonTitle:@" Done!" otherButtonTitles:nil];
//    [new show];
    //[self performSegueWithIdentifier:@"PreviewMechViewController" sender:self];
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PreviewMechViewController"];
    //[self.navigationController pushViewController:controller animated:YES];
    //UIViewController.setPreviewModel;
    [self presentViewController:controller animated:YES completion:nil];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //defoine keys
    name =@"name";
    contacts = @"contacts";
    details =@"details";
    latitude =@"latitude";
    longitude =@"longitude";
    path =@"path";
    
    
    myObject= [[NSMutableArray alloc] init];
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://nancet.netne.net/ParcelDelivery/getallmechanics.php?"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    // values in foreach loop
    for (NSDictionary *dataDict in jsonObjects) {
        NSString *strName = [dataDict objectForKey:@"name"];
        NSString *strContacts = [dataDict objectForKey:@"contacts"];
        NSString *strDetails = [dataDict objectForKey:@"details"];
         NSString *strLatitude = [dataDict objectForKey:@"latitude"];
         NSString *strLongitude = [dataDict objectForKey:@"longitude"];
         NSString *strPath = [dataDict objectForKey:@"path"];
        
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                strName, name,
                strContacts, contacts,
                strDetails, details,
                strLatitude, latitude,
                strLongitude, longitude,
                strPath, path,
                nil];
        [myObject addObject:dict];
    }
    NSLog(@"hcfdhgtfvhj = %@",[dict objectForKey:@"name"]);
    // Do any additional setup after loading the view.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-1.3089589
                                                            longitude:36.8108885
                                                                 zoom:12];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    mapView.delegate = self;
    self.view = mapView;
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.icon = [UIImage imageNamed:@"map.png"];
    marker2.position =CLLocationCoordinate2DMake(-1.3089589,36.8108885);
    marker2.title = @"Mercy";
    marker2.snippet = @"Specialized in Electicity";
    //marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker2.map = mapView;
    
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.icon = [UIImage imageNamed:@"map.png"];
    marker3.position =CLLocationCoordinate2DMake(-1.3354638,36.7938991);
    marker3.title = @"Meshack";
    marker3.snippet = @"Specialized in Electicity";
    //marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker3.map = mapView;
    
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    marker4.icon = [UIImage imageNamed:@"map.png"];
    marker4.position =CLLocationCoordinate2DMake(-1.3255193,36.8288165);
    marker4.title = @"Marcus";
    marker4.snippet = @"Specialized in Enginering";
    //marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker4.map = mapView;
    
    GMSMarker *marker5 = [[GMSMarker alloc] init];
    marker5.icon = [UIImage imageNamed:@"map.png"];
    marker5.position =CLLocationCoordinate2DMake(-1.3158015,36.8046964);
    marker5.title = @"Anthony";
    marker5.snippet = @"Specialized in Electicity";
    //marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker5.map = mapView;
    
    GMSMarker *marker6 = [[GMSMarker alloc] init];
    marker6.icon = [UIImage imageNamed:@"map.png"];
    marker6.position =CLLocationCoordinate2DMake(-1.3049073,36.8047638);
    marker6.title = @"Mathew";
    marker6.snippet = @"Specialized in Mechanical Enginering";
    //marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker6.map = mapView;
    
    event=[NSArray arrayWithObjects:marker2,marker3,marker4,marker5,marker6, nil];
    
    for (NSDictionary *diction in myObject)
    {
        //NSLog(@"hcfdhgtfvhj = %@",dicti[@"name"]);
        //NSLog(@"log",dicti[@"name"]);
        GMSMarker *marker = [[GMSMarker alloc] init];
        NSString *lat = [diction objectForKey:@"latitude"];
        NSString *lon = [diction objectForKey:@"longitude"];
        double lt=[lat doubleValue];
        double ln=[lon doubleValue];
        marker.icon = [UIImage imageNamed:@"map.png"];
        marker.position =CLLocationCoordinate2DMake(lt,ln);
        marker.title = [diction objectForKey:@"name"];
        marker.snippet = [diction objectForKey:@"details"];
        marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.map = mapView;
        //NSLog(@"log",dicti[@"name"]);
        
        
    }
    
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


-(PreviewModel *)objectInListAtIndex: (NSInteger) index{
    return [event objectAtIndex: index];
}

@end
