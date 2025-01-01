//
//  Generated code. Do not modify.
//  source: protos/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

//@$pb.GrpcServiceName('chat.Chat')
class ChatClient extends $grpc.Client {
  static final _$enterChat =
      $grpc.ClientMethod<$0.EnterRequest, $0.ChatMessage>(
          '/chat.Chat/EnterChat',
          ($0.EnterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$0.ChatMessage, $0.MessageResponse>(
          '/chat.Chat/SendMessage',
          ($0.ChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MessageResponse.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatMessage> enterChat($0.EnterRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$enterChat, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.MessageResponse> sendMessage($0.ChatMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

//@$pb.GrpcServiceName('chat.Chat')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EnterRequest, $0.ChatMessage>(
        'EnterChat',
        enterChat_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EnterRequest.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatMessage, $0.MessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value),
        ($0.MessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatMessage> enterChat_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EnterRequest> request) async* {
    yield* enterChat(call, await request);
  }

  $async.Future<$0.MessageResponse> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChatMessage> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.ChatMessage> enterChat(
      $grpc.ServiceCall call, $0.EnterRequest request);
  $async.Future<$0.MessageResponse> sendMessage(
      $grpc.ServiceCall call, $0.ChatMessage request);
}
