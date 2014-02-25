//
//  NumbersValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

extern NSString *const kNumbersValidatorRegex;
extern NSString *const kNumbersValidatorDescription;
extern NSString *const kNumbersValidatorReason;
extern NSString *const kNumbersEmptyValidatorReason;

typedef enum {
	NumbersValidatorTypeDecimal,
	NumbersValidatorTypeInteger
} NumbersValidatorType;


@interface NumbersValidator : InputValidator

@property (strong, nonatomic) NSNumber *maxValue;
@property (strong, nonatomic) NSString *maxValueErrorDescription;
@property (strong, nonatomic) NSNumber *minValue;
@property (strong, nonatomic) NSString *minValueErrorDescription;

@property (nonatomic) NumbersValidatorType validatorType;

- (id)initWithInput:(NSString *)inputString
	  validatorType:(NumbersValidatorType)validatorType;

- (id)initWithInput:(NSString *)inputString
	  validatorType:(NumbersValidatorType)validatorType
		   maxValue:(NSNumber *)maxValue
		   minValue:(NSNumber *)minValue;

@end
