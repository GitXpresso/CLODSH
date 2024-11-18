# Dockersh
The sh in docker sh stands for self hosted folders will be ready for you to run browsers and others stuff the orginal people who made the docker container will be credited.
## Todo 
- [X] Finish making Docker installation on kali linux tutorial
- [X] Finish making docker compose installation on kali linux tutorial
- [ ] 

# Table of Contents

<details><summary>Browsers</summary>

- [Firefox](#Firefox)
- [Chromium](#Chromium)
- [Ungoogled Chromium](#Ungoogled-Chromium)
- [Opera](#Opera) 
- [Tor](#Tor)
</details>

<details><summary>Workspace</summary>
 
[Gogs](#Gogs)

</details>
 
<details><summary>Docker Installation</summary>
 
 - [How to Install Docker on Kali Linux](#How-to-Install-Docker-on-Kali-Linux)
 - [How to Install Docker Compose on Kali Linux](#How-to-Install-Docker-Compose-on-Kali-Linux)
 - [Docker Compose Guide](#Docker-Compose-Guide)

</details>

<details><summary>things that has nonthing to do with or about this repository</summary>
 
- [Visitor's Counter](#Visitors)
- [Repository Version](#CLODSH-Readmemd)

</details>

# Firefox
[![Firefox logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/firefox-icon.png&w=110)](https://www.mozilla.org/firefox/)[![Firefox](https://images.placeholders.dev/?width=224&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=Firefox&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.mozilla.org/firefox/)

Mozilla Firefox is a free and open-source web browser developed by Mozilla
Foundation and its subsidiary, Mozilla Corporate. 

Originally Created by: [Jlesage](https://github.com/jlesage)

Original Repository: [Docker Firefox](https://github.com/jlesage/docker-firefox)

Donate to the Original Creator of Docker Firefox
[![PayPal](https://img.shields.io/badge/PayPal-003087?logo=paypal&logoColor=fff)](https://paypal.me/JocelynLeSage)


# Firefox Setup

First git clone the this repository
```
git clone https://github.com/GitXpresso/dockersh.git
```
Then do 
```
cd Firefox
```
To start firefox do
```
docker compose up
```
Or 
```

```
# Chromium

[![chromium](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/chromium-logo.png)](https://www.chromium.org/chromium-projects/)

[Chromium](https://www.chromium.org/chromium-projects/) is an open-source browser project that aims to build a safer, faster, and more stable way for all users to experience the web.

Chromium Official Github Mirror: [chromium](https://github.com/chromium/chromium)

Originally Created by: [LinuxServer](https://github.com/linuxserver)

Original Repository: [Docker Chromium](https://github.com/linuxserver/chromium)

Creator website: [linuxserver.io](https://linuxserver.io)

Donations : [Linux Server Open collective](https://opencollective.com/linuxserver/)

# Table of Contents
- [Application Setup](#Application-Setup)
- [Security](#Security)
- [Options in all KasmVNC based GUI containers](Options-in-all-KasmVNC-based-GUI-containers)
- [Language Support - Internationalization](#Language-Support-Internationalization)
- [DRI3 GPU Acceleration](#DRI3-GPU-Acceleration)
- [Nvidia GPU Support](#Nvidia-GPU-Support)
- [Application management](#Application-management)
- [Usage](#Usage)
- [Parameters](#Parameters)
- [Environment variables from files Docker secrets](#Environment-variables-from-files-Docker-secrets)
- [Umask for running applications](#Umask-for-running-applications)
- [User / Group Identifiers](#Use-/-Group-Identifiers)
- [Docker-Mods](#Docker-Mods)
- [Support Info](#Support-Info)
- [Building locally](#Building-locally)
- [Versions](#Versions)

Supported Architectures
---------------------------------------------------------------------

We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://distribution.github.io/distribution/spec/manifest-v2-2/#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `lscr.io/linuxserver/chromium:latest` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:


|Architecture|Available|Tag                  |
|------------|---------|---------------------|
|x86-64      |✅        |amd64-<version tag>  |
|arm64       |✅        |arm64v8-<version tag>|
|armhf       |❌        |                     |


Application Setup
---------------------------------------------------------

The application can be accessed at:

*   http://yourhost:3000/
*   https://yourhost:3001/*   

To Run the selfhosted chromium do the following commands below

*Modern GUI desktop apps have issues with the latest Docker and syscall compatibility, you can use Docker with the `--security-opt seccomp=unconfined` setting to allow these syscalls on hosts with older Kernels or libseccomp**

### Security

Warning

Do not put this on the Internet if you do not know what you are doing.

By default this container has no authentication and the optional environment variables `CUSTOM_USER` and `PASSWORD` to enable basic http auth via the embedded NGINX server should only be used to locally secure the container from unwanted access on a local network. If exposing this to the Internet we recommend putting it behind a reverse proxy, such as [SWAG](https://github.com/linuxserver/docker-swag), and ensuring a secure authentication solution is in place. From the web interface a terminal can be launched and it is configured for passwordless sudo, so anyone with access to it can install and run whatever they want along with probing your local network.

### Options in all KasmVNC based GUI containers

This container is based on [Docker Baseimage KasmVNC](https://github.com/linuxserver/docker-baseimage-kasmvnc) which means there are additional environment variables and run configurations to enable or disable specific functionality.

#### Optional environment variables



* Variable: CUSTOM_PORT
  * Description: Internal port the container listens on for http if it needs to be swapped from the default 3000.
* Variable: CUSTOM_HTTPS_PORT
  * Description: Internal port the container listens on for https if it needs to be swapped from the default 3001.
* Variable: CUSTOM_USER
  * Description: HTTP Basic auth username, abc is default.
* Variable: PASSWORD
  * Description: HTTP Basic auth password, abc is default. If unset there will be no auth
* Variable: SUBFOLDER
  * Description: Subfolder for the application if running a subfolder reverse proxy, need both slashes IE /subfolder/
* Variable: TITLE
  * Description: The page title displayed on the web browser, default "KasmVNC Client".
* Variable: FM_HOME
  * Description: This is the home directory (landing) for the file manager, default "/config".
* Variable: START_DOCKER
  * Description: If set to false a container with privilege will not automatically start the DinD Docker setup.
* Variable: DRINODE
  * Description: If mounting in /dev/dri for DRI3 GPU Acceleration allows you to specify the device to use IE /dev/dri/renderD128
* Variable: DISABLE_IPV6
  * Description: If set to true or any value this will disable IPv6
* Variable: LC_ALL
  * Description: Set the Language for the container to run as IE fr_FR.UTF-8 ar_AE.UTF-8
* Variable: NO_DECOR
  * Description: If set the application will run without window borders in openbox for use as a PWA.
* Variable: NO_FULL
  * Description: Do not autmatically fullscreen applications when using openbox.


#### Optional run configurations



* Variable: --privileged
  * Description: Will start a Docker in Docker (DinD) setup inside the container to use docker in an isolated environment. For increased performance mount the Docker directory inside the container to the host IE -v /home/user/docker-data:/var/lib/docker.
* Variable: -v /var/run/docker.sock:/var/run/docker.sock
  * Description: Mount in the host level Docker socket to either interact with it via CLI or use Docker enabled applications.
* Variable: --device /dev/dri:/dev/dri
  * Description: Mount a GPU into the container, this can be used in conjunction with the DRINODE environment variable to leverage a host video card for GPU accelerated applications. Only Open Source drivers are supported IE (Intel,AMDGPU,Radeon,ATI,Nouveau)


### Language Support - Internationalization

The environment variable `LC_ALL` can be used to start this container in a different language than English simply pass for example to launch the Desktop session in French `LC_ALL=fr_FR.UTF-8`. Some languages like Chinese, Japanese, or Korean will be missing fonts needed to render properly known as cjk fonts, but others may exist and not be installed inside the container depending on what underlying distribution you are running. We only ensure fonts for Latin characters are present. Fonts can be installed with a mod on startup.

To install cjk fonts on startup as an example pass the environment variables (Alpine base):

```
-e DOCKER_MODS=linuxserver/mods:universal-package-install 
-e INSTALL_PACKAGES=fonts-noto-cjk-e LC_ALL=zh_CN.UTF-8

```


The web interface has the option for "IME Input Mode" in Settings which will allow non english characters to be used from a non en\_US keyboard on the client. Once enabled it will perform the same as a local Linux installation set to your locale.

### DRI3 GPU Acceleration

For accelerated apps or games, render devices can be mounted into the container and leveraged by applications using:

`--device /dev/dri:/dev/dri`

This feature only supports **Open Source** GPU drivers:


|Driver|Description                                                          |
|------|---------------------------------------------------------------------|
|Intel |i965 and i915 drivers for Intel iGPU chipsets                        |
|AMD   |AMDGPU, Radeon, and ATI drivers for AMD dedicated or APU chipsets    |
|NVIDIA|nouveau2 drivers only, closed source NVIDIA drivers lack DRI3 support|


The `DRINODE` environment variable can be used to point to a specific GPU. Up to date information can be found [here](https://www.kasmweb.com/kasmvnc/docs/master/gpu_acceleration.html)

### Nvidia GPU Support

**Nvidia support is not compatible with Alpine based images as Alpine lacks Nvidia drivers**

Nvidia support is available by leveraging Zink for OpenGL support. This can be enabled with the following run flags:



* Variable: --gpus all
  * Description: This can be filtered down but for most setups this will pass the one Nvidia GPU on the system
* Variable: --runtime nvidia
  * Description: Specify the Nvidia runtime which mounts drivers and tools in from the host


The compose syntax is slightly different for this as you will need to set nvidia as the default runtime:

```
sudo nvidia-ctk runtime configure --runtime=docker --set-as-default
sudo service docker restart

```


And to assign the GPU in compose:

```
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [compute,video,graphics,utility]

```


### Application management
<!-- If you see this, this is just a test. -->
#### PRoot Apps

If you run system native installations of software IE `sudo apt-get install filezilla` and then upgrade or destroy/re-create the container that software will be removed and the container will be at a clean state. For some users that will be acceptable and they can update their system packages as well using system native commands like `apt-get upgrade`. If you want Docker to handle upgrading the container and retain your applications and settings we have created [proot-apps](https://github.com/linuxserver/proot-apps) which allow portable applications to be installed to persistent storage in the user's `$HOME` directory and they will work in a confined Docker environment out of the box. These applications and their settings will persist upgrades of the base container and can be mounted into different flavors of KasmVNC based containers on the fly. This can be achieved from the command line with:

```
proot-apps install filezilla

```


PRoot Apps is included in all KasmVNC based containers, a list of linuxserver.io supported applications is located [HERE](https://github.com/linuxserver/proot-apps?tab=readme-ov-file#supported-apps).

#### Native Apps

It is possible to install extra packages during container start using [universal-package-install](https://github.com/linuxserver/docker-mods/tree/universal-package-install). It might increase starting time significantly. PRoot is preferred.

```
  environment:
    - DOCKER_MODS=linuxserver/mods:universal-package-install
    - INSTALL_PACKAGES=libfuse2|git|gdb

```


### Lossless mode

This container is capable of delivering a true lossless image at a high framerate to your web browser by changing the Stream Quality preset to "Lossless", more information [here](https://www.kasmweb.com/docs/latest/how_to/lossless.html#technical-background). In order to use this mode from a non localhost endpoint the HTTPS port on 3001 needs to be used. If using a reverse proxy to port 3000 specific headers will need to be set as outlined [here](https://github.com/linuxserver/docker-baseimage-kasmvnc#lossless).

Usage
---------------------------------

To help you get started creating a container from this image you can either use docker-compose or the docker cli.

### docker-compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```
---
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - CHROME_CLI=https://www.linuxserver.io/ #optional
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000
      - 3001:3001
    shm_size: "1gb"
    restart: unless-stopped

```


### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```
docker run -d \
  --name=chromium \
  --security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e CHROME_CLI=https://www.linuxserver.io/ `#optional` \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /path/to/config:/config \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/chromium:latest

```


Parameters
-------------------------------------------

Containers are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

### Ports (`-p`)


|Parameter|Function                   |
|---------|---------------------------|
|3000     |Chromium desktop gui.      |
|3001     |HTTPS Chromium desktop gui.|


### Environment Variables (`-e`)



* Env: PUID=1000
  * Function: for UserID - see below for explanation
* Env: PGID=1000
  * Function: for GroupID - see below for explanation
* Env: TZ=Etc/UTC
  * Function: specify a timezone to use, see this list.
* Env: CHROME_CLI=https://www.linuxserver.io/
  * Function: Specify one or multiple Chromium CLI flags, this string will be passed to the application in full.


### Volume Mappings (`-v`)


|Volume |Function                                                              |
|-------|----------------------------------------------------------------------|
|/config|Users home directory in the container, stores local files and settings|


#### Miscellaneous Options



* Parameter: --shm-size=
  * Function: This is needed for any modern website to function like youtube.
* Parameter: --security-opt seccomp=unconfined
  * Function: For Docker Engine only, many modern gui apps need this to function on older hosts as syscalls are unknown to Docker. Chromium runs in no-sandbox test mode without it.


Environment variables from files Docker secrets
-----------------------------------------------------------------------------------------------------------------------

You can set any environment variable from a file by using a special prepend `FILE__`.

As an example:

```
-e FILE__MYVAR=/run/secrets/mysecretvariable

```


Will set the environment variable `MYVAR` based on the contents of the `/run/secrets/mysecretvariable` file.

Umask for running applications
-----------------------------------------------------------------------------------

For all of our images we provide the ability to override the default umask settings for services started within the containers using the optional `-e UMASK=022` setting. Keep in mind umask is not chmod it subtracts from permissions based on it's value it does not add. Please read up [here](https://en.wikipedia.org/wiki/Umask) before asking for support.

User / Group Identifiers
---------------------------------------------------------------------

When using volumes (`-v` flags), permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id your_user` as below:

Example output:

```
uid=1000(your_user) gid=1000(your_user) groups=1000(your_user)

```


Docker Mods
---------------------------------------------

[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=chromium&query=%24.mods%5B%27chromium%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=chromium "view available mods for this container.") [![Docker Universal Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=universal&query=%24.mods%5B%27universal%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=universal "view available universal mods.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) as well as universal mods that can be applied to any one of our images can be accessed via the dynamic badges above.

Support Info
-----------------------------------------------

*   Shell access whilst the container is running:
    
    ```
docker exec -it chromium /bin/bash

```

    
*   To monitor the logs of the container in realtime:
    
*   Container version number:
    
    ```
docker inspect -f '{{ index .Config.Labels "build_version" }}' chromium

```

    
*   Image version number:
    
    ```
docker inspect -f '{{ index .Config.Labels "build_version" }}' lscr.io/linuxserver/chromium:latest

```

    

Updating Info
-------------------------------------------------

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (noted in the relevant readme.md), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Compose

*   Update images:
    
    *   All images:
        
    *   Single image:
        
        ```
docker-compose pull chromium

```

        
*   Update containers:
    
    *   All containers:
        
    *   Single container:
        
        ```
docker-compose up -d chromium

```

        
*   You can also remove the old dangling images:
    

### Via Docker Run

*   Update the image:
    
    ```
docker pull lscr.io/linuxserver/chromium:latest

```

    
*   Stop the running container:
    
*   Delete the container:
    
*   Recreate a new container with the same docker run parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
    
*   You can also remove the old dangling images:
    

### Image Update Notifications - Diun (Docker Image Update Notifier)

Tip

We recommend [Diun](https://crazymax.dev/diun/) for update notifications. Other tools that automatically update containers unattended are not recommended or supported.

Building locally
-------------------------------------------------------

If you want to make local modifications to these images for development purposes or just to customize the logic:

```
git clone https://github.com/linuxserver/docker-chromium.git
cd docker-chromium
docker build \
  --no-cache \
  --pull \
  -t lscr.io/linuxserver/chromium:latest .

```


The ARM variants can be built on x86\_64 hardware and vice versa using `lscr.io/linuxserver/qemu-static`

```
docker run --rm --privileged lscr.io/linuxserver/qemu-static --reset

```


Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.
## Versions
---------------------------------------

*   **10.02.24:** - Update Readme with new env vars and ingest proper PWA icon.
*   **08.01.24:** - Fix re-launch issue for chromium by purging temp files on launch.
*   **29.12.23:** - Rebase to Debian Bookworm.
*   **13.05.23:** - Rebase to Alpine 3.18.
*   **01.04.23:** - Preserve arguments passed to Chromium and restructure to use wrapper.
*   **18.03.23:** - Initial release.


 

# Tor
<p align="center">
  <img width="300px" src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Tor_project_logo_hq.png">
</p

Originally Created by: [DomiStyles](https://github.com/DomiStyle)

Forked and Edited by:
[GitXpresso](https://github.com/GitXpresso)

Original Repository: [Docker Tor Browser](https://github.com/DomiStyle/docker-tor-browser)

# Table of Contents
   
<details><summary>Docker</summary>

- [Docker Compose Script](#Docker-Compose-Script)
- [Docker Container Commands](#Docker-Container-Commands)
- [Docker Installation](#How-to-install-Docker)

</details>
   
<details><summary>Configuration</summary>

- [Platform configuration](#Platform-configuration)
- [Browser configuration](#Browser-configuration)
 
</details>

<details><summary>Others</summary>
   
- [Volumes](#Volumes)
- [Port](#Port)
- [Issues And limitations](#Issues-And-limitations)

</details>

![](https://github.com/DomiStyle/docker-tor-browser/raw/master/screenshot.png)
*Tor browser running inside of Firefox*

## About

This image allows running a [Tor browser](https://www.torproject.org/) instance on any headless server. The browser can be accessed via either a web interface or directly from any VNC client.

Container is based on [baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) by [jlesage](https://github.com/jlesage)

Both amd64 and arm64 container runtimes are supported, but only the amd64 image uses an official build of the Tor Browser. The arm64 image uses an [unofficial build via tor-browser-ports](https://sourceforge.net/projects/tor-browser-ports/) because the Tor Project does not have an official arm build of the Tor Browser. Both the official and unofficial builds are signed, and the signatures are verified when building this container.

# Usage

See the docker-compose [here](https://github.com/DomiStyle/docker-tor-browser/blob/master/docker-compose.yml) or use this command

    docker run -d -p 5800:5800 domistyle/tor-browser

The web interface will be available on port 5800.
to use port on a browser go to this url
```
127.0.0.1:8080
```
## Platform configuration

No special configuration is necessary, however some recommended variables are available:

| Variable  | Description | Default  | Required |
|-----------|-------------|----------|----------|
| `DISPLAY_WIDTH` | Set the width of the virtual screen | ``1280`` | No |
| `DISPLAY_HEIGHT` | Set the height of the virtual screen | ``768`` | No |
| `KEEP_APP_RUNNING` | Automatically restarts the Tor browser if it exits | ``0`` | No |
| `TZ` | Set the time zone for the container | - | No |

** For advanced configuration options please take a look [here](https://github.com/jlesage/docker-baseimage-gui#environment-variables).**

## Browser configuration

You may install the browser with your own configuration. Copy the template configuration to get started.
If `mozilla.cfg` is available then it is used, otherwise no browser changes are made.
```
cd browser-cfg
cp mozilla.cfg.template mozilla.cfg
```
** For more information on the available options: http://kb.mozillazine.org/About:config_entries

## Volumes

It is not recommended to add persistent volumes to your Tor Browser. We do not support any issues that arise from persistent volumes.
# Docker Compose Script
```yaml
version: '3.9'

services:
  tor:
    image: domistyle/tor-browser
    container_name: tor
    restart: unless-stopped
    ports:
      - 5800:5800
      - 5900:5900
    environment:
      DISPLAY_WIDTH: 1920
      DISPLAY_HEIGHT: 1080
      KEEP_APP_RUNNING: 1
      TZ: Europe/Vienna
```

# Docker Container Commands
 To install tor browser using docker compose, copy and paste the command in your terminal
```bash
docker compose up
```
To stop the docker container do
```bash
docker stop tor
```
To start the container again, put the following command below and paste it in your terminal 
```bash
docker start tor
```
To remove the container you can do 
```bash
docker compose down
```
or you can do this
``` 
docker rm tor
```
# How to install Docker
First update all your packages by doing
```bash
sudo apt update
```
After you update all your packages then it is time to install docker.io by doing 
```bash
sudo apt install -y docker.io
```
To add systemctl to docker do this
```bash
sudo systemctl enable docker --now
```
To verify that you docker put the following command below
```bash
docker
```
To use docker without doing sudo every time do this
```bash
sudo usermod -aG docker $USER
```


## Port

| Port       | Description                                  |
|------------|----------------------------------------------|
| `5800` | Provides a web interface to access the Tor browser |
| `5900` | Provides direct access to the NoVNC server |

## Issues And limitations

* shm_size might need to be set to 2GB or more if you experience crashes
### Github user who updated this markdown:
[GitXpresso](https://github.com/GitXpresso)
<details><summary>Docker</summary>
- [Docker Compose Script](#Docker-Compose-Script)
- [Docker Container Commands](#Docker-Container-Commands)
- [Docker Installation](#How-to-install-Docker)

</details>
   
<details><summary>Configuration</summary>

- [Platform configuration](#Platform-configuration)
- [Browser configuration](#Browser-configuration)
 
</details>

<details><summary>Others</summary>
   
- [Volumes](#Volumes)
- [Port](#Port)
- [Issues And limitations](#Issues-And-limitations)

</details>

![](https://github.com/DomiStyle/docker-tor-browser/raw/master/screenshot.png)
*Tor browser running inside of Firefox*

## About

This image allows running a [Tor browser](https://www.torproject.org/) instance on any headless server. The browser can be accessed via either a web interface or directly from any VNC client.

Container is based on [baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) by [jlesage](https://github.com/jlesage)

Both amd64 and arm64 container runtimes are supported, but only the amd64 image uses an official build of the Tor Browser. The arm64 image uses an [unofficial build via tor-browser-ports](https://sourceforge.net/projects/tor-browser-ports/) because the Tor Project does not have an official arm build of the Tor Browser. Both the official and unofficial builds are signed, and the signatures are verified when building this container.

# Usage

See the docker-compose [here](https://github.com/DomiStyle/docker-tor-browser/blob/master/docker-compose.yml) to use this command as a faster way of installing Tor.

    docker run -d -p 5800:5800 --name tor domistyle/tor-browser --restart=unless-stopped

The web interface will be available on port 5800.

## Platform configuration

No special configuration is necessary, however some recommended variables are available:

| Variable  | Description | Default  | Required |
|-----------|-------------|----------|----------|
| `DISPLAY_WIDTH` | Set the width of the virtual screen | ``1280`` | No |
| `DISPLAY_HEIGHT` | Set the height of the virtual screen | ``768`` | No |
| `KEEP_APP_RUNNING` | Automatically restarts the Tor browser if it exits | ``0`` | No |
| `TZ` | Set the time zone for the container | - | No |

** For advanced configuration options please take a look [here](https://github.com/jlesage/docker-baseimage-gui#environment-variables).**

## Browser configuration

You may install the browser with your own configuration. Copy the template configuration to get started.
If `mozilla.cfg` is available then it is used, otherwise no browser changes are made.
```
cd browser-cfg
cp mozilla.cfg.template mozilla.cfg
```
** For more information on the available options: http://kb.mozillazine.org/About:config_entries

## Volumes

It is not recommended to add persistent volumes to your Tor Browser. We do not support any issues that arise from persistent volumes.
# Docker Compose Script
```yaml
version: '3.9'

services:
  tor:
    image: domistyle/tor-browser
    container_name: tor
    restart: unless-stopped
    ports:
      - 5800:5800
      - 5900:5900
    environment:
      DISPLAY_WIDTH: 1920
      DISPLAY_HEIGHT: 1080
      KEEP_APP_RUNNING: 1
      TZ: Europe/Vienna
```

# Docker Container Commands
 To install tor browser using docker compose, copy and paste the command in your terminal
```bash
docker compose up
```
To stop the docker container do
```bash
docker stop tor
```
To start the container again, put the following command below and paste it in your terminal 
```bash
docker start tor
```
To remove the container you can do 
```bash
docker compose down
```
or you can do this
``` 
docker rm tor
```
# How to install Docker
First update all your packages by doing
```bash
sudo apt update
```
After you update all your packages then it is time to install docker.io by doing 
```bash
sudo apt install -y docker.io
```
To add systemctl to docker do this
```bash
sudo systemctl enable docker --now
```
To verify that you docker put the following command below
```bash
docker
```
To use docker without doing sudo every time do this
```bash
sudo usermod -aG docker $USER
```


## Port

| Port       | Description                                  |
|------------|----------------------------------------------|
| `5800` | Provides a web interface to access the Tor browser |
| `5900` | Provides direct access to the NoVNC server |
| IP | Description                                     |    
| `127.0.0.1` | Provides a way to use tor on your browser |

## Issues And limitations

* shm_size might need to be set to 2GB or more if you experience crashes
### Github user who updated this markdown:
[GitXpresso](https://github.com/GitXpresso)


# Gogs 

![gogs-brand](https://user-images.githubusercontent.com/2946214/146899259-6a8b58ad-8d6e-40d2-ab02-79dc6aadabbf.png)

[![GitHub Workflow Status](https://img.shields.io/github/checks-status/gogs/gogs/main?logo=github&style=for-the-badge)](https://github.com/gogs/gogs/actions?query=branch%3Amain) [![Discord](https://img.shields.io/discord/382595433060499458.svg?style=for-the-badge&logo=discord)](https://discord.gg/9aqdHU7) [![Sourcegraph](https://img.shields.io/badge/view%20on-Sourcegraph-brightgreen.svg?style=for-the-badge&logo=sourcegraph)](https://sourcegraph.com/github.com/gogs/gogs)

Repository: [Gogs](https://github.com/gogs/gogs)

User: [Gogs](https://github.com/gogs/)

Donate:

# Table of Contents
- [💌 Features](#💌-Features) 
- [💾 Hardware requirements](#💾-Hardware-requirements)
- [💻 Browser support](#-💻-Browser-support)

    <details><summary>Docker</summary>
  
  - [Docker Installation](#Docker-Installation)
  
     * [Docker for Gogs](#Docker-for-Gogs)
       * [Usage](#Usage)
         * [Settings](#Settings)
           * [Backup system](#Backup-system)
             * [Upgrade](#Upgrade)
               * [Quick Start](#Quick-Start)
 
## 🔮 Vision

The Gogs (`/gɑgz/`) project aims to build a simple, stable and extensible self-hosted Git service that can be set up in the most painless way. With Go, this can be done with an independent binary distribution across all platforms that Go supports, including Linux, macOS, Windows and ARM-based systems.

## 📡 Overview

- Please visit [our home page](https://gogs.io) for user documentation.
- Please refer to [CHANGELOG.md](CHANGELOG.md) for list of changes in each releases.
- Want to try it before doing anything else? Do it [online](https://try.gogs.io/gogs/gogs)!
- Having trouble? Help yourself with [troubleshooting](https://gogs.io/docs/intro/troubleshooting.html) or ask questions in [Discussions](https://github.com/gogs/gogs/discussions).
- Want to help with localization? Check out the [localization documentation](https://gogs.io/docs/features/i18n.html).
- Ready to get hands dirty? Read our [contributing guide](.github/CONTRIBUTING.md).
- Hmm... What about APIs? We have experimental support with [documentation](https://github.com/gogs/docs-api).

## 💌 Features

- User dashboard, user profile and activity timeline.
- Access repositories via SSH, HTTP and HTTPS protocols.
- User, organization and repository management.
- Repository and organization webhooks, including Slack, Discord and Dingtalk.
- Repository Git hooks, deploy keys and Git LFS.
- Repository issues, pull requests, wiki, protected branches and collaboration.
- Migrate and mirror repositories with wiki from other code hosts.
- Web editor for quick editing repository files and wiki.
- Jupyter Notebook and PDF rendering.
- Authentication via SMTP, LDAP, reverse proxy, GitHub.com and GitHub Enterprise with 2FA.
- Customize HTML templates, static files and many others.
- Rich database backend, including PostgreSQL, MySQL, SQLite3 and [TiDB](https://github.com/pingcap/tidb).
- Have localization over [31 languages](https://crowdin.com/project/gogs).

## 💾 Hardware requirements

- A Raspberry Pi or $5 Digital Ocean Droplet is more than enough to get you started. Some even use 64MB RAM Docker [CaaS](https://www.docker.com/blog/containers-as-a-service-caas/).
- 2 CPU cores and 512MB RAM would be the baseline for teamwork.
- Increase CPU cores when your team size gets significantly larger, memory footprint remains low.

## 💻 Browser support

- Please see [Semantic UI](https://github.com/Semantic-Org/Semantic-UI#browser-support) for specific versions of supported browsers.
- The smallest resolution officially supported is **1024*768**, however the UI may still look right in smaller resolutions, but no promises or fixes.

# Docker Installation
![Docker](https://user-images.githubusercontent.com/25181517/117207330-263ba280-adf4-11eb-9b97-0ac5b40bc3be.png
# Docker for Gogs

![Docker pulls](https://img.shields.io/docker/pulls/gogs/gogs?logo=docker&style=for-the-badge)

Visit [Docker Hub](https://hub.docker.com/u/gogs) or [GitHub Container registry](https://github.com/gogs/gogs/pkgs/container/gogs) to see all available images and tags.

## Usage

To keep your data out of Docker container, we do a volume (`/var/gogs` -> `/data`) here, and you can change it based on your situation.

```sh
# Pull image from Docker Hub.
docker pull gogs/gogs

# Create local directory for volume.
mkdir -p /var/gogs

# Use `docker run` for the first time.
docker run --name=gogs -p 10022:22 -p 10880:3000 -v /var/gogs:/data gogs/gogs

# Use `docker start` if you have stopped it.
docker start gogs
```

Note: It is important to map the SSH service from the container to the host and set the appropriate SSH Port and URI settings when setting up Gogs for the first time. To access and clone Git repositories with the above configuration you would use: `git clone ssh://git@hostname:10022/username/myrepo.git` for example.

Files will be store in local path `/var/gogs` in my case.

Directory `/var/gogs` keeps Git repositories and Gogs data:

    /var/gogs
    |-- git
    |   |-- gogs-repositories
    |-- ssh
    |   |-- # ssh public/private keys for Gogs
    |-- gogs
        |-- conf
        |-- data
        |-- log

#### Custom directory

The "custom" directory may not be obvious in Docker environment. The `/var/gogs/gogs` (in the host) and `/data/gogs` (in the container) is already the "custom" directory and you do not need to create another layer but directly edit corresponding files under this directory.

#### Using Docker volumes

```sh
# Create docker volume.
$ docker volume create --name gogs-data

# Use `docker run` for the first time.
$ docker run --name=gogs -p 10022:22 -p 10880:3000 -v gogs-data:/data gogs/gogs
```

## Settings

### Application

Most of the settings are obvious and easy to understand, but there are some settings can be confusing by running Gogs inside Docker:

- **Repository Root Path**: keep it as default value `/home/git/gogs-repositories` because `start.sh` already made a symbolic link for you.
- **Run User**: keep it as default value `git` because `build/finalize.sh` already setup a user with name `git`.
- **Domain**: fill in with Docker container IP (e.g. `192.168.99.100`). But if you want to access your Gogs instance from a different physical machine, please fill in with the hostname or IP address of the Docker host machine.
- **SSH Port**: Use the exposed port from Docker container. For example, your SSH server listens on `22` inside Docker, **but** you expose it by `10022:22`, then use `10022` for this value. **Builtin SSH server is not recommended inside Docker Container**
- **HTTP Port**: Use port you want Gogs to listen on inside Docker container. For example, your Gogs listens on `3000` inside Docker, **and** you expose it by `10880:3000`, but you still use `3000` for this value.
- **Application URL**: Use combination of **Domain** and **exposed HTTP Port** values (e.g. `http://192.168.99.100:10880/`).

Full documentation of application settings can be found [here](https://github.com/gogs/gogs/blob/main/conf/app.ini).

### Container options

This container has some options available via environment variables, these options are opt-in features that can help the administration of this container:

- **SOCAT_LINK**:
  - <u>Possible value:</u>
      `true`, `false`, `1`, `0`
  - <u>Default:</u>
      `true`
  - <u>Action:</u>
      Bind linked docker container to localhost socket using socat.
      Any exported port from a linked container will be binded to the matching port on localhost.
  - <u>Disclaimer:</u>
      As this option rely on the environment variable created by docker when a container is linked, this option should be deactivated in managed environment such as Rancher or Kubernetes (set to `0` or `false`)
- **RUN_CROND**:
  - <u>Possible value:</u>
      `true`, `false`, `1`, `0`
  - <u>Default:</u>
      `false`
  - <u>Action:</u>
      Request crond to be run inside the container. Its default configuration will periodically run all scripts from `/etc/periodic/${period}` but custom crontabs can be added to `/var/spool/cron/crontabs/`.
- **BACKUP_INTERVAL**:
  - <u>Possible value:</u>
      `3h`, `7d`, `3M`
  - <u>Default:</u>
      `null`
  - <u>Action:</u>
      In combination with `RUN_CROND` set to `true`, enables backup system.\
      See: [Backup System](#backup-system)
- **BACKUP_RETENTION**:
  - <u>Possible value:</u>
      `360m`, `7d`, `...m/d`
  - <u>Default:</u>
      `7d`
  - <u>Action:</u>
      Used by backup system. Backups older than specified in expression are deleted periodically.\
      See: [Backup System](#backup-system)
- **BACKUP_ARG_CONFIG**:
  - <u>Possible value:</u>
      `/app/gogs/example/custom/config`
  - <u>Default:</u>
      `null`
  - <u>Action:</u>
      Used by backup system. If defined, supplies `--config` argument to `gogs backup`.\
      See: [Backup System](#backup-system)
- **BACKUP_ARG_EXCLUDE_REPOS**:
  - <u>Possible value:</u>
      `test-repo1`, `test-repo2`
  - <u>Default:</u>
      `null`
  - <u>Action:</u>
      Used by backup system. If defined, supplies `--exclude-repos` argument to `gogs backup`.\
      See: [Backup System](#backup-system)
- **BACKUP_EXTRA_ARGS**:
  - <u>Possible value:</u>
      `--verbose --exclude-mirror-repos`
  - <u>Default:</u>
      `null`
  - <u>Action:</u>
      Used by backup system. If defined, append content to arguments to `gogs backup`.\
      See: [Backup System](#backup-system)

## Backup system

Automated backups with retention policy:

- `BACKUP_INTERVAL` controls how often the backup job runs and supports interval in hours (h), days (d), and months (M), eg. `3h`, `7d`, `3M`. The lowest possible value is one hour (`1h`).
- `BACKUP_RETENTION` supports expressions in minutes (m) and days (d), eg. `360m`, `2d`. The lowest possible value is 60 minutes (`60m`).

## Upgrade

:exclamation::exclamation::exclamation:<span style="color: red">**Make sure you have volumed data to somewhere outside Docker container**</span>:exclamation::exclamation::exclamation:

Steps to upgrade Gogs with Docker:

- `docker pull gogs/gogs`
- `docker stop gogs`
- `docker rm gogs`
- Finally, create a container for the first time and don't forget to do the same for the volume and port mapping.

## Known issues

- The docker container cannot currently be built on Raspberry 1 (armv6l) as our base image `alpine` does not have a `go` package available for this platform.

## Useful links

- [Share port 22 between Gogs inside Docker & the local system](http://www.ateijelo.com/blog/2016/07/09/share-port-22-between-docker-gogs-ssh-and-local-system)



# How to Install Docker on Kali Linux
![Docker](https://user-images.githubusercontent.com/25181517/117207330-263ba280-adf4-11eb-9b97-0ac5b40bc3be.png)
## Step 1: Install Dependency packages
Start the installation by ensuring that all the packages used by docker as dependencies are installed.
```bash
sudo apt update && sudo apt -y full-upgrade
sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates
```
## Check if a reboot is required after the upgrade:
```
[ -f /var/run/reboot-required ] && sudo reboot -f
```
## Step 2: Import Docker GPG key
Import Docker GPG key used for signing Docker packages:
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
```

## Step 3: Add the Docker repository to Kali Linux
Add Docker repository which contain the latest stable releases of Docker CE.

```
echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list
```
This command will add repository URL to /etc/apt/sources.list.d/docker.list.

## Step 4: Install Docker on Kali Linux
Update the apt package index.
```
sudo apt update
```
## Step 5
To install Docker CE on Kali Linux, run the command:
 ```
sudo apt install docker-ce docker-ce-cli containerd.io
```
Hit the y key to start installation of Docker on Kali Linux.

## Step 6
This installation will add docker group to the system without any users. Add your user account to the group to run docker commands as non-privileged user.
```
sudo usermod -aG docker $USER
newgrp docker
```
## Step 7
Check Docker version installed.
```
docker version
```
# How to Install Docker Compose on Kali Linux
## Step 1
since kali linux already have curl installed, that means you dont need to install curl.
```
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
```
## Step 2
Make the binary file executable.
```
chmod +x docker-compose-linux-x86_64
```
## Part 3
Move the file to your PATH.
```
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
```
## Part 4
To know if you successfully install docker compose you need to confirm the version.
```
docker-compose version
```
The output should look this:

`Docker Compose version v2.28.1` 
 
## Part 5
Add user to docker group:
```
sudo usermod -aG docker $USER
newgrp docker
```
# Docker Compose Guide
To install and run the container do
```
docker compose up
```
To restart the container do
```
docker compose restart
```
To remove the container do
```
docker compose down
```
# Quick Start
## Step 1
Moving the current directory your in to the "Shell" directory
```bash
cd Shell
```
## Step 2
Make the file executable
```bash
chmod u+x ./gogs.sh
```
## Step 3
Starting gogs.sh
```bash
./gogs.sh
```
Dont have go installed them heres a tutorial, only has 3 steps
## Step 2
Make the file executable
```
chmod u+x ./go.sh
```
## Step 3
Run the bash file
```
./go.sh
```
# Uninstalling Go
## Step 1
Move from CLODSH to CLODSH/Shell
```bash
cd Shell
```
## Step 2
Make the file executable
```bash
chmod u+x ./rmgo.sh
```
Step 3
Uninstalling Go
```bash
./rmgo.sh
```
## CLODSH Readmemd 
Version: 1.38
