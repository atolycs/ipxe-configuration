
#include <config/defaults.h>

#define NET_PROTO_IPV4
#define NET_PROTO_LACP
#define NET_PROTO_LLDP

#define DOWNLOAD_PROTO_TFTP
#define DOWNLOAD_PROTO_HTTP
#define DOWNLOAD_PROTO_HTTPS
#define DOWNLOAD_PROTO_NFS

#if defined ( PLATFORM_efi )
  #define DOWNLOAD_PROTO_FILE
#endif

/* Image Types */

#define IMAGE_TRUST_CMD
#define IMAGE_PNG
#define IMAGE_PEM
#define IMAGE_SCRIPT
#define IMAGE_GZIP

#if defined ( PLATFORM_pcbios )
  #define IMAGE_BZIMAGE
  #define IMAGE_ELF
  #define IMAGE_MULTIBOOT
  #define IMAGE_PXE
#endif

#if defined ( PLATFORM_efi )
  #define IMAGE_EFI
  #define IMAGE_EFISIG
#endif

#define NEIGHBOUR_CMD
#define NTP_CMD
#define REBOOT_CMD
#define PING_CMD
#define POWEROFF_CMD
#define CONSOLE_CMD

#define MENU_CMD
#define ROUTE_CMD
#define SANBOOT_CMD
#define VLAN_CMD
#define USB_CMD
#define CPUID_CMD

#undef SHIM_CMD 
