#import <objc/runtime.h>

#import "WebRTCModule+RTCPeerConnection.h"
#import "WebRTCUtils.h"
#import "WebRTCValueManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation RTCDataChannel (ReactNativeWebRTCKit)
// TODO(kdxu) 実装する
@end

@implementation WebRTCModule (RTCDataChannel)

#pragma mark - RTCDataChannelDelegate

- (void)dataChannelDidChangeState:(RTCDataChannel*)dataChannel
{
  NSDictionary *event = @{@"id": @(channel.channelId),
                          @"valueTag": channel.peerConnectionId};
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"dataChannelStateChanged"
                                                  body:event];
}

- (void)dataChannel:(RTCDataChannel *)dataChannel didReceiveMessageWithBuffer:(RTCDataBuffer *)buffer
{
  // TODO(kdxu): データ受け渡し
  NSString *type;
  if (buffer.isBinary) {
    type = @"binary";
  } else {
    type = @"text";
  }
  NSDictionary *event = @{@"id": @(dataChannel.channelId),
                          @"valueTag": dataChannel.valueTag,
                          @"type": type};
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"dataChannelReceiveMessage"
                                                  body:event];
}

@end
