###                                                                                                                                                                                                                                                             
### headscale-cli Dockerfile                                                                                                                                                                                                                                    
###                                                                                                                                                                                                                                                             
FROM alpine:latest as BuildContainer                                                                                                                                                                                                                            

# Update and install dependencies                                                                                                                                                                                                                               
RUN apk add curl jq bash coreutils bash-completion bind-tools

# Change root shell to /bin/bash                                                                                                                                                                                                                                
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd                                                                                                                                                                                                               

# Get latest headscale release                                                                                                                                                                                                                                  
RUN ["/bin/bash", "-c", "HS_RELEASE=$(curl -s -L https://api.github.com/repos/juanfont/headscale/releases | jq -r '.[0].tag_name'); HS_RELEASE=${HS_RELEASE#v}; HS_ARCH_OS=( linux_amd64 linux_arm64 );for arch in ${HS_ARCH_OS[@]}; do curl -L -o /usr/local/bin/headscale_${HS_RELEASE}_$arch https://github.com/juanfont/headscale/releases/download/v${HS_RELEASE}/headscale_${HS_RELEASE}_$arch; chmod +x /usr/local/bin/headscale_${HS_RELEASE}_$arch; done"]                           

# Copy startup.sh script into container
COPY startup.sh /startup.sh

# Copy management scripts into /usr/local/bin
COPY scripts/* /usr/local/bin/

# Container startup script
ENTRYPOINT ["/bin/bash", "-c", "/startup.sh"]
