//
//  MechSDataService.m
//  MechPal
//
//  Created by ilabafrica on 27/09/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "MechSDataService.h"
#import "PreviewModel.h"


@implementation MechSDataService
@synthesize delegate=_delegate;

//-(NSMutableArray *) getSearchedFilmFromAPI:(NSString *)searchParam{
//    NSMutableArray *masterList = [[NSMutableArray alloc] init];
//    NSString *s_response = [self makeApiCall:searchParam];
//    NSError __autoreleasing **error = nil;
//    
//    NSData *dataStream = [self converResponseToDataStream:s_response];
//    
//    if (dataStream != nil) {
//        NSDictionary *s_dict = [NSJSONSerialization JSONObjectWithData:dataStream options:kNilOptions error:error];
//        
//        NSArray *searchResult = [s_dict objectForKeyedSubscript:@"Search"];
//        
//        if ([searchResult count] > 0) {
//            for (NSDictionary *movie in searchResult) {
//                PreviewModel * i_film = [[PreviewModel alloc] initWithAttributes:movie];
//                
//                [masterList addObject:i_film];
//                
//            }
//        }
//        
//    }
//    
//    return masterList;
//}

@end
