//
//  ValidatorsManager.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidatorsManager : NSObject

- (void)validateWithValidators:(NSArray *)validators error:(NSError **)error;

@end
