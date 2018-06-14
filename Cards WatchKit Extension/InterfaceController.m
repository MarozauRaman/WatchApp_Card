//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "InterfaceController.h"
#import "CardTableRowController.h"
#import "SecondScreenInterfaceController.h"


@interface InterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *card;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Bank"];
    [self configureTableWithData];
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
-(void)configureTableWithData{
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];

    NSString *asterisks = @"****";
    //number of rows
    int num = [plist count];

    [self.card setNumberOfRows:num withRowType:@"CardTableRowController"];
    
    NSInteger rowCount = self.card.numberOfRows;

    
    for(int i =0;i<rowCount;i++){
        CardTableRowController* row = [self.card rowControllerAtIndex:i];
        
        NSDictionary *dict = [plist objectAtIndex:i];
        for(id key in dict){
            NSString* data = [dict objectForKey:key];
            if([key  isEqual: @"Title"]){
                [row.labell setText:data];
                NSString* lowerKey = [data lowercaseString];
               
           
                if ([lowerKey containsString:@"mastercard"]) {
                    [row.image setImageNamed:@"mastercard.png"];
                    break;
                }
                if ([lowerKey containsString:@"visa"]){
                    [row.image setImageNamed:@"visa.png"];
                    break;
                }
                if ([lowerKey containsString:@"maestro"]) {
                    [row.image setImageNamed:@"maestro.png"];
                    break;
                } else {
                    [row.image setImageNamed:@"anyCard.png"];
                    break;
                }
                
            }
            if([key isEqual:@"Number"]){
                [row.number setText:[asterisks stringByAppendingString:[data substringFromIndex:15]]];
                
                
            }
        }
    }
}




@end



