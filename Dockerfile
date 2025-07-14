FROM inductiveautomation/ignition:8.1.48

COPY --chmod=755 docker-entrypoint-shim.sh /usr/local/bin/

# Target the entrypoint shim for any custom logic prior to gateway launch
ENTRYPOINT [ "docker-entrypoint-shim.sh" ]

# Add third-party modules
COPY *.modl /usr/local/bin/ignition/user-lib/modules/

RUN ls -l /usr/local/bin/
RUN ls -l /usr/local/bin/ignition/user-lib/modules/
