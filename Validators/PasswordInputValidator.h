//
//  PasswordInputValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

extern NSString *const kPasswordValidatorRegex;
extern NSString *const kPasswordValidatorDescription;
extern NSString *const kPasswordValidatorReason;
extern NSString *const kEmptyPasswordValidatorReason;

@interface PasswordInputValidator : InputValidator

@end
