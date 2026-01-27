#define CONSOLE_FRAMEBUFFER

#if defined( PLATFORM_efi )
  #define CONSOLE_EFI
#endif

#if ! defined ( SERIAL_NULL )
  #define CONSOLE_SERIAL
#endif
