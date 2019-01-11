// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>

#import "FLEChannels.h"

/**
 * Translates between a binary message and higher-level method call and response/error objects.
 */
@protocol FLEMethodCodec

/**
 * Returns the shared instance of the codec.
 */
+ (nonnull instancetype)sharedInstance;

/**
 * Returns a binary encoding of the given |methodCall|, or nil if the method call cannot be
 * serialized by this codec.
 */
- (nullable NSData*)encodeMethodCall:(nonnull FLEMethodCall*)methodCall;

/**
 * Returns the FLEMethodCall encoded in |methodData|, or nil if it cannot be decoded.
 */
- (nullable FLEMethodCall*)decodeMethodCall:(nonnull NSData*)methodData;

/**
 * Returns a binary encoding of |result|. Returns nil if |result| is not a type supported by the
 * codec.
 */
- (nullable NSData*)encodeSuccessEnvelope:(nullable id)result;

/**
 * Returns a binary encoding of |error|. Returns nil if the |details| parameter of |error| is not
 * a type supported by the codec.
 */
- (nullable NSData*)encodeErrorEnvelope:(nonnull FLEMethodError*)error;

@end

/**
 * A codec that uses JSON as the encoding format. Method arguments and error details for plugins
 * using this codec must be serializable to JSON.
 */
@interface FLEJSONMethodCodec : NSObject <FLEMethodCodec>
@end

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FLEStandardDataType) {
    FLEStandardDataTypeUInt8,
    FLEStandardDataTypeInt32,
    FLEStandardDataTypeInt64,
    FLEStandardDataTypeFloat64,
};

@interface FLEStandardWriter : NSObject
- (instancetype )initWithData:(NSMutableData*)data;
- (void)writeByte:(UInt8)value;
- (void)writeBytes:(const void*)bytes length:(NSUInteger)length;
- (void)writeData:(NSData*)data;
- (void)writeSize:(UInt32)size;
- (void)writeAlignment:(UInt8)alignment;
- (void)writeUTF8:(NSString*)value;
- (void)writeValue:(id )value;
@end

@interface FLEStandardReader : NSObject
- (instancetype )initWithData:(NSData* )data;
- (BOOL)hasMore;
- (UInt8)readByte;
- (void)readBytes:(void*)destination length:(NSUInteger)length;
- (NSData*)readData:(NSUInteger)length;
- (UInt32)readSize;
- (void)readAlignment:(UInt8)alignment;
- (NSString*)readUTF8;
- (id _Nullable )readValue;
- (id _Nullable )readValueOfType:(UInt8)type;
@end


@interface FLEStandardReaderWriter : NSObject
- (FLEStandardWriter*)writerWithData:(NSMutableData*)data;
- (FLEStandardReader*)readerWithData:(NSData*)data;
@end


/**
 * A codec that uses JSON as the encoding format. Method arguments and error details for plugins
 * using this codec must be serializable to JSON.
 */
@interface FLEStandardMethodCodec : NSObject <FLEMethodCodec>
+ (instancetype _Nonnull )codecWithReaderWriter:(FLEStandardReaderWriter* _Nonnull)readerWriter;
@end

@interface FLEStandardTypedData : NSObject
/**
 Creates a `FlutterStandardTypedData` which interprets the specified data
 as plain bytes.
 
 - Parameter data: the byte data.
 */
+ (instancetype)typedDataWithBytes:(NSData*)data;

/**
 Creates a `FlutterStandardTypedData` which interprets the specified data
 as 32-bit signed integers.
 
 - Parameter data: the byte data. The length must be divisible by 4.
 */
+ (instancetype)typedDataWithInt32:(NSData*)data;

/**
 Creates a `FlutterStandardTypedData` which interprets the specified data
 as 64-bit signed integers.
 
 - Parameter data: the byte data. The length must be divisible by 8.
 */
+ (instancetype)typedDataWithInt64:(NSData*)data;

/**
 Creates a `FlutterStandardTypedData` which interprets the specified data
 as 64-bit floats.
 
 - Parameter data: the byte data. The length must be divisible by 8.
 */
+ (instancetype)typedDataWithFloat64:(NSData*)data;

+ (instancetype)typedDataWithData:(NSData*)data type:(FLEStandardDataType)type;

/**
 The raw underlying data buffer.
 */
@property(readonly, nonatomic) NSData* data;

/**
 The type of the encoded values.
 */
@property(readonly, nonatomic) FLEStandardDataType type;

/**
 The number of value items encoded.
 */
@property(readonly, nonatomic) UInt32 elementCount;

/**
 The number of bytes used by the encoding of a single value item.
 */
@property(readonly, nonatomic) UInt8 elementSize;
@end

@interface FLEStandardBigInteger : NSObject
/**
 Creates a `FlutterStandardBigInteger` from a hexadecimal representation.
 
 - Parameter hex: a hexadecimal string.
 */
+ (instancetype)bigIntegerWithHex:(NSString*)hex;

/**
 The hexadecimal string representation of this integer.
 */
@property(readonly, nonatomic) NSString* hex;
@end


NS_ASSUME_NONNULL_END
// TODO: Implement the other core Flutter codecs. Issue #67.
