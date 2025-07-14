FROM inductiveautomation/ignition:8.1.48

#COPY --chmod=755 --chown=ignition:ignition docker-entrypoint-shim.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint-shim.sh

# Target the entrypoint shim for any custom logic prior to gateway launch
# ENTRYPOINT ["/usr/local/bin/docker-entrypoint-shim.sh"]

# Add third-party modules
COPY --chown=ignition:ignition MQTT-Distributor-signed.modl /usr/local/bin/ignition/user-lib/modules/
COPY --chown=ignition:ignition MQTT-Engine-signed.modl /usr/local/bin/ignition/user-lib/modules/

RUN rm "/usr/local/bin/ignition/user-lib/modules/BACnet Driver-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/DNP3-Driver.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Enterprise Administration-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Serial Support Client-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/SMS Notification-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Symbol Factory-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Vision-module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Web Browser Module.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/Voice Notification-module.modl" && /
    rm -f "/usr/local/bin/ignition/user-lib/modules/IEC 61850 Driver-modl.modl" && /
    rm "/usr/local/bin/ignition/user-lib/modules/DNP3-Driver-v2.modl"

RUN ls -l /usr/local/bin/
RUN ls -l /usr/local/bin/ignition/user-lib/modules/
