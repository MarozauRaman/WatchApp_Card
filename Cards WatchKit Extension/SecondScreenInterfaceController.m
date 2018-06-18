//
//  SecondScreenInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "SecondScreenInterfaceController.h"


@interface SecondScreenInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *cardInfo;
@property (nonatomic) NSDictionary *currentText;
@end

@implementation SecondScreenInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Назад"];
    NSDictionary *dict = (NSDictionary*) context;
    _currentText = dict ;
    [_labelll setText:dict[@"name"]];
    [_balance setText:[dict[@"amount"] stringByAppendingString:@" BYN"]];
    
    [_number setText:dict[@"number"]];
    
    
    NSString* lowerKey = [dict[@"name"] lowercaseString];
    for(int i = 0;i<1; i++){
    if ([lowerKey containsString:@"mastercard"]) {
        [_image setImageNamed:@"mastercard.png"];
        break;
    }
    if ([lowerKey containsString:@"visa"]){
        [_image setImageNamed:@"visa.png"];
        break;
    }
    if ([lowerKey containsString:@"maestro"]) {
        [_image setImageNamed:@"maestro.png"];
        break;
    } else {
        [_image setImageNamed:@"anyCard.png"];
        break;
      }

    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)ExtractionButton {
    
    [self pushControllerWithName:@"ExtractionInterfaceController" context:_currentText];
}
- (IBAction)AboutCardButton {
     [self pushControllerWithName:@"AboutCardInterfaceController" context:_currentText];
}


@end



