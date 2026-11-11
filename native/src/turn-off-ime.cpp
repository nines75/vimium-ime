#include <windows.h>

extern "C" void turn_off_ime() {
  constexpr LPARAM IMC_SETOPENSTATUS = 6;

  auto hwnd = GetForegroundWindow();
  if (!hwnd)
    return;

  auto ime = ImmGetDefaultIMEWnd(hwnd);
  if (!ime)
    return;

  SendMessage(ime, WM_IME_CONTROL, IMC_SETOPENSTATUS, 0);
}
