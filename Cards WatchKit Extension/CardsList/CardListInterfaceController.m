//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "CardListInterfaceController.h"
#import "CardTableRowController.h"
#import "Card.h"
#import <AFNetworking.h>
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>

@interface CardListInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;
@property (strong, nonatomic) IBOutlet WKInterfaceImage *activityImage;
@property (strong, nonatomic) NSMutableArray* cards;


@end

@implementation CardListInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
    [self.activityImage setImageNamed:@"Activity"];
    [self.activityImage startAnimatingWithImagesInRange:NSMakeRange(0, 15) duration:1.0 repeatCount:0];
    NSURL* url = [NSURL URLWithString:@"https://msgr.lwo.by:8443/cards_response"];
    NSURL* urlStatement = [NSURL URLWithString:@"https://msgr.lwo.by:8443/history"];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:[url absoluteString]
      parameters:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSArray* array = [[responseObject objectForKey:@"values"] objectForKey:@"cards"];
             
             [manager GET:[urlStatement absoluteString]
               parameters:nil
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObjectStatement) {
                 NSMutableArray* arrayofStatements = [[responseObjectStatement objectForKey:@"values"] objectForKey:@"history"];
                 [self.table setNumberOfRows:[array count] withRowType:@"CardTableRowController"];
                 self.cards = [NSMutableArray array];
                      
                //creating array of cards
                 for(NSMutableDictionary* dict in array){
                     //creating card
                     Card* card = [[Card alloc] initWithDictionary:dict];
                     //creating array of statements for card
                     for(NSDictionary* dict in arrayofStatements){
                         Statement* statement = [[Statement alloc] initWithDictionary:dict];
                         [card.statement addObject:statement];
                     }
                     [self.cards addObject:card];
                 }
                      [self.activityImage stopAnimating];
                //into rows in table
                 for(int i =0;i<[self.cards count];i++){
                     Card* card=self.cards[i];
                     CardTableRowController* row = [self.table rowControllerAtIndex:i];
                     [row.label setText:card.name];
                     [row.image setImageNamed:card.imageName];
                     [row.number setText:card.number];
                     
                 }
             
             }
                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
                      NSLog(@"Error: %@", [failure localizedDescription]);
                  }];
           
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
             NSLog(@"Error: %@", [failure localizedDescription]);
         }];
    
    
    
   
        
    
}


-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{
   [self pushControllerWithName:@"CardDetailInterfaceController" context:[self.cards objectAtIndex:rowIndex]];
}

//-(NSMutableArray*)cards {
//   if (!_cards) {
//#pragma mark - from plist
//        _cards =[[NSMutableArray alloc]init];
//        NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];
//        for (NSDictionary* dict in plist) {
//            Card* card = [[Card alloc] initWithDictionary:dict];
//            [_cards addObject:card];
//        }
//    }
//
//    return _cards;
//}


@end



