#include "include/lng/lng_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "lng_plugin.h"

void LngPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  lng::LngPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
