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
    
    [self tableWithCards];
   
}


-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{
   [self pushControllerWithName:@"CardDetailInterfaceController" context:[self.cards objectAtIndex:rowIndex]];
}

-(void)willActivate{
    [self tableWithCards];
}

-(void)tableWithCards{
    [self.activityImage setImageNamed:@"Activity"];
    [self.activityImage startAnimatingWithImagesInRange:NSMakeRange(0, 15) duration:1.0 repeatCount:0];
    [self.activityImage setHidden:NO];
    [self.table setHidden:YES];
    
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager POST:@"https://msgr.lwo.by:8443/cards_response"
       parameters:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSArray* array = [[responseObject objectForKey:@"values"] objectForKey:@"cards"];
              [self.table setNumberOfRows:[array count] withRowType:@"CardTableRowController"];
              self.cards = [NSMutableArray array];
              
              //creating array of cards
              for(NSMutableDictionary* dict in array){
                  //creating card
                  Card* card = [[Card alloc] initWithDictionary:dict];
                  
                  
                  [self.cards addObject:card];
              }
              
              //Stop animation
              [self.activityImage stopAnimating];
              [self.activityImage setHidden:YES];
              [self.table setHidden:NO];
              
              //into rows in table
              for(int i =0;i<[self.cards count];i++){
                  Card* card=self.cards[i];
                  CardTableRowController* row = [self.table rowControllerAtIndex:i];
                  [row.label setText:card.cardName];
                  [row.image setImageNamed:card.type];
                  [row.number setText:card.num];
                  
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
              NSLog(@"Error: %@", [failure localizedDescription]);
          }];
}

@end



