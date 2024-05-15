#ifndef FLUTTER_PLUGIN_LNG_PLUGIN_H_
#define FLUTTER_PLUGIN_LNG_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace lng {

class LngPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LngPlugin();

  virtual ~LngPlugin();

  // Disallow copy and assign.
  LngPlugin(const LngPlugin&) = delete;
  LngPlugin& operator=(const LngPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace lng

#endif  // FLUTTER_PLUGIN_LNG_PLUGIN_H_
