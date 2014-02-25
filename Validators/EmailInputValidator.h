//
//  EmailInputValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

extern NSString *const kEmailValidatorRegex;
extern NSString *const kEmailValidatorDescription;
extern NSString *const kEmailValidatorReason;
extern NSString *const kEmptyEmailValidatorReason;

@interface EmailInputValidator : InputValidator

@end
