##############################CONFIGURE INTRODUCTION############################
#configure type      configure value
#------------------:------------------
#cfg_os_type       : linux macos liteos
#cfg_shell_enble   : yes no
#cfg_libc_enable   : yes no
#cfg_cjson_enable  : yes no
#cfg_tcpip_type    : lwip linux_socket macos_socket none
#cfg_dtls_type     : mbedtls none
#cfg_embedtls_mode : crt psk none
#cfg_mqtt_type     : paho none
#cfg_lwm2m_type    : wakaama none
#cfg_oc_mqtt_type  : soft none
#cfg_oc_lwm2m_type : soft bc35 none
#cfg_loader_enable : yes no
#cfg_oc_lwm2m_demo_type:none  oc_lwm2m_demo_dtls and oc_lwm2m_demo_nodtls oc_lwm2m_demo_bs_dtls
#cfg_oc_mqtt_demo_type:none oc_mqtt_demo_static oc_mqtt_demo_bs

######################LOADER     CONFIURE TEMPLATE###############################
#cfg_os_type       := liteos
#cfg_shell_enble   := yes
#cfg_libc_enable   := yes
#cfg_cjson_enable  := no
#cfg_tcpip_type    := none
#cfg_dtls_type     := none
#cfg_embedtls_mode := none
#cfg_mqtt_type     := none
#cfg_lwm2m_type    := none
#cfg_oc_mqtt_type  := none
#cfg_oc_lwm2m_type := none
#cfg_loader_enable := yes
#cfg_oc_lwm2m_demo_type:= none
#cfg_oc_mqtt_demo_type:= none
#################################################################################
 
#####################  OC MQTT CONFIURE TEMPLATE################################
#cfg_os_type       := liteos
#cfg_shell_enble   := yes
#cfg_driver_enable := yes
#cfg_at_enable     := yes
#cfg_libc_enable   := yes
#cfg_cjson_enable  := yes
#cfg_tcpip_type    := 123
#cfg_dtls_type     := mbedtls
#cfg_embedtls_mode := crt
#cfg_mqtt_type     := paho
#cfg_lwm2m_type    := none
#cfg_oc_mqtt_type  := soft
#cfg_oc_lwm2m_type := none
#cfg_loader_enable := no
#cfg_oc_lwm2m_demo_type:= none
#cfg_oc_mqtt_demo_type:= oc_mqtt_demo_static

################################################################################

######################OC LWM2M CONFIURE TEMPLATE#################################
cfg_os_type       := liteos
cfg_arch_cpu_type := riscv32
cfg_shell_enble   := yes
cfg_driver_enable := yes
cfg_at_enable     := no
cfg_libc_enable   := no
cfg_cjson_enable  := no
cfg_tcpip_type    := none
cfg_dtls_type     := none
cfg_embedtls_mode := none
cfg_mqtt_type     := none
cfg_lwm2m_type    := none
cfg_oc_mqtt_type  := none
cfg_oc_lwm2m_type := none
cfg_loader_enable := no
cfg_oc_lwm2m_demo_type:= no
cfg_oc_mqtt_demo_type:= none
#################################################################################

include $(TOP_DIR)/iot_link/iot.mk