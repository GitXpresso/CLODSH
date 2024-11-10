# dockersh
## The sh in docker sh stands for self hosted folders will be ready for you to run browsers and others stuff the orginal people who made the docker container will be credited

# Table of Contents

<details><summary>Browsers</summary>

- [Firefox](#Firefox)
- [Chromium](#Chromium)
- [Ungoogled Chromium](#Ungoogled-Chromium)
- [Opera](#Opera) 
- [Tor](#Tor)

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
*   https://yourhost:3001/

**Modern GUI desktop apps have issues with the latest Docker and syscall compatibility, you can use Docker with the `--security-opt seccomp=unconfined` setting to allow these syscalls on hosts with older Kernels or libseccomp**

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
Docker-Compose-Script)
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


Browsersh Readme.md Version: 1.34
