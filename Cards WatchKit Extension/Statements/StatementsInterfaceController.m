//
//  ExtractionInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "StatementsInterfaceController.h"
#import "TransactionTableRowController.h"
#import "History.h"
#import <AFNetworking.h>
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>



@interface StatementsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* forWeekLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* noDataLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;
@property (strong, nonatomic) IBOutlet WKInterfaceImage *activityImage;
@property (strong, nonatomic) NSMutableArray* statements;

@end

@implementation StatementsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
   
    [self.noDataLabel setHidden:YES];
    [self.activityImage setImageNamed:@"Activity"];
    [self.activityImage startAnimatingWithImagesInRange:NSMakeRange(0, 15) duration:1.0 repeatCount:0];
    [self.activityImage setHidden:NO];
    [self.table setHidden:YES];
    
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager POST:@"https://msgr.lwo.by:8443/history"
       parameters:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              self.statements = [NSMutableArray array];
                  NSMutableArray* arrayofHistory = [[responseObject objectForKey:@"values"] objectForKey:@"history"];
                  for(NSDictionary* dict in arrayofHistory){
                      History* history = [[History alloc] initWithDictionary:dict];
                      [self.statements addObject:history];
                  }
                  if(self.statements.count>0){
                      
                      [self.table setNumberOfRows:self.statements.count withRowType:@"TransactionTableRowController"];
                      for(int i=0;i<self.statements.count;i++){
                          TransactionTableRowController* row = [self.table rowControllerAtIndex:i];
                          History* history = [self.statements objectAtIndex:i];
                          
                          NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                          [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                          NSDate *date  = [dateFormatter dateFromString:history.date];
                          
                          // Convert to new Date Format
                          [dateFormatter setDateFormat:@"dd.MM.yyyy"];
                          NSString *newDate = [dateFormatter stringFromDate:date];
                      
                          //Stop animation
                          [self.activityImage stopAnimating];
                          [self.activityImage setHidden:YES];
                          [self.table setHidden:NO];
                          
                          
                          [row.text setText:history.type];
                          [row.date setText:newDate];
                          [row.money setText:[history.sign stringByAppendingString:[history.transactionAmt stringByAppendingString:[@" " stringByAppendingString:history.transactionAmtCurrency]]]];
              
                          if([history.sign isEqualToString:@"-"]){
                              [row.money setTextColor:[UIColor colorWithRed:0.96 green:0.74 blue:0.42 alpha:1.0]];
                          } else {
                              [row.money setTextColor:[UIColor colorWithRed:0.55 green:0.81 blue:0.39 alpha:1.0]];
                          }
              
                      }
                  }else{
                      [self.forWeekLabel setHidden:YES];
                      [self.noDataLabel setText:@"Не было операций за прошлую неделю"];
              
                  }
              
          }
     
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
              NSLog(@"Error: %@", [failure localizedDescription]);
          }];
    
    
    
    

}



@end



