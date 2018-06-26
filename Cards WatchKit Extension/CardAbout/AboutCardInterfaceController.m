//
//  AboutCardInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "AboutCardInterfaceController.h"
#import "InfoTableRowController.h"
#import <AFNetworking.h>
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>
#import "Requisites.h"

@interface AboutCardInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;
@property (strong, nonatomic) IBOutlet WKInterfaceImage *activityImage;

@end

@implementation AboutCardInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
    [self.activityImage setImageNamed:@"Activity"];
    [self.activityImage startAnimatingWithImagesInRange:NSMakeRange(0, 15) duration:1.0 repeatCount:0];
    [self.activityImage setHidden:NO];
    [self.table setHidden:YES];
    
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager POST:@"https://msgr.lwo.by:8443/requisites"
       parameters:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSDictionary* dict =[[responseObject objectForKey:@"values"] objectForKey:@"requisites"];
              Requisites* requisites  = [[Requisites alloc] initWithDictionary:dict];
             
              
              
              [self.table setNumberOfRows:dict.count-2 withRowType:@"InfoTableRowController"];
              for(int i=0;i<dict.count-2;i++){
                  InfoTableRowController* row = [self.table rowControllerAtIndex:i];
                  
                  //Stop animation
                  [self.activityImage stopAnimating];
                  [self.activityImage setHidden:YES];
                  [self.table setHidden:NO];
                  
                  switch (i) {
                      case 0:{
                          [row.label setText:@"Банк"];
                          [row.data setText:requisites.bank];
                          break;
                      }
                      case 1:{
                          [row.label setText:@"Адрес банка"];
                          [row.data setText:requisites.bankDetails];
                          break;
                      }
                      case 2:{
                          [row.label setText:@"УНП"];
                          [row.data setText:requisites.unp];
                          break;
                      }
                      case 3:{
                          [row.label setText:@"Номер счета"];
                          [row.data setText:requisites.account];
                          break;
                      }
                      case 4:{
                          [row.label setText:@"Валюта счета"];
                          [row.data setText:requisites.currencyCode];
                          break;
                      }
                      case 5:{
                          [row.label setText:@"Название валюты"];
                          [row.data setText:requisites.currencyName];
                          break;
                      }
                      default:{
                          break;
                      }
                          
                  }
                  
                  
              }
              
          }
     
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
              NSLog(@"Error: %@", [failure localizedDescription]);
          }];
    
    

    
}



@end



