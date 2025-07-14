FROM inductiveautomation/ignition:8.1.48

COPY --chmod=755 docker-entrypoint-shim.sh /usr/local/bin/

# Target the entrypoint shim for any custom logic prior to gateway launch
ENTRYPOINT ["/usr/local/bin/docker-entrypoint-shim.sh"]

# Add third-party modules
COPY MQTT-Distributor-signed.modl /usr/local/bin/ignition/user-lib/modules/
COPY MQTT-Engine-signed.modl /usr/local/bin/ignition/user-lib/modules/
RUN chown ignition:ignition /usr/local/bin/ignition/user-lib/modules/MQTT-Distributor-signed.modl
RUN chown ignition:ignition /usr/local/bin/ignition/user-lib/modules/MQTT-Engine-signed.modl

RUN ls -l /usr/local/bin/
RUN ls -l /usr/local/bin/ignition/user-lib/modules/
