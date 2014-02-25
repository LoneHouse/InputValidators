//
//  InputValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Strings.h"

extern NSString *const kErrorDomain;
extern NSString *const kEmptyValidatorDescription;

@interface InputValidator : NSObject

@property (nonatomic, strong) NSString *input;

- (id)initWithInput:(NSString *)inputString;
- (BOOL)validateError:(NSError **)error;

@end
