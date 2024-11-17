#!/bin/bash

set -eu -o pipefail

function exitHandler() {
    rm -f /etc/update-motd.d/91-cloudron-install-in-progress
}

trap exitHandler EXIT

vergte() {
    greater_version=$(echo -e "$1\n$2" | sort -rV | head -n1)
    [[ "$1" == "${greater_version}" ]] && return 0 || return 1
}

# change this to a hash when we make a upgrade release
readonly LOG_FILE="/var/log/cloudron-setup.log"
readonly MINIMUM_DISK_SIZE_GB="18" # this is the size of "/" and required to fit in docker images 18 is a safe bet for different reporting on 20GB min
readonly MINIMUM_MEMORY="941"      # this is mostly reported for 1GB main memory (DO 957, EC2 949, Linode 989, Lightsail 941)

readonly curl="curl --fail --connect-timeout 20 --retry 10 --retry-delay 2 --max-time 2400"

# copied from cloudron-resize-fs.sh
readonly rootfs_type=$(LC_ALL=C df --output=fstype / | tail -n1)
readonly physical_memory=$(LC_ALL=C free -m | awk '/Mem:/ { print $2 }')
readonly disk_size_bytes=$(LC_ALL=C df --output=size / | tail -n1)
readonly disk_size_gb=$((${disk_size_bytes}/1024/1024))

readonly RED='\033[31m'
readonly GREEN='\033[32m'
readonly YELLOW='\033[33m'
readonly DONE='\033[m'

# verify the system has minimum requirements met
if [[ "${rootfs_type}" != "ext4" && "${rootfs_type}" != "xfs" ]]; then
    echo "Error: Cloudron requires '/' to be ext4 or xfs" # see #364
    exit 1
fi

if [[ "${physical_memory}" -lt "${MINIMUM_MEMORY}" ]]; then
    echo "Error: Cloudron requires atleast 1GB physical memory"
    exit 1
fi

if [[ "${disk_size_gb}" -lt "${MINIMUM_DISK_SIZE_GB}" ]]; then
    echo "Error: Cloudron requires atleast 20GB disk space (Disk space on / is ${disk_size_gb}GB)"
    exit 1
fi

if [[ "$(uname -m)" != "x86_64" ]]; then
    echo "Error: Cloudron only supports amd64/x86_64"
    exit 1
fi

if cvirt=$(systemd-detect-virt --container); then
    echo "Error: Cloudron does not support ${cvirt}, only runs on bare metal or with full hardware virtualization"
    exit 1
fi

# do not use is-active in case box service is down and user attempts to re-install
if systemctl cat box.service >/dev/null 2>&1; then
    echo "Error: Cloudron is already installed. To reinstall, start afresh"
    exit 1
fi

provider="generic"
requestedVersion=""
installServerOrigin="https://api.cloudron.io"
apiServerOrigin="https://api.cloudron.io"
webServerOrigin="https://cloudron.io"
consoleServerOrigin="https://console.cloudron.io"
sourceTarballUrl=""
rebootServer="true"
setupToken="" # this is a OTP for securing an installation (https://forum.cloudron.io/topic/6389/add-password-for-initial-configuration)
appstoreSetupToken=""
cloudronId=""
appstoreApiToken=""
redo="false"

args=$(getopt -o "" -l "help,provider:,version:,env:,skip-reboot,generate-setup-token,setup-token:,redo" -n "$0" -- "$@")
eval set -- "${args}"

while true; do
    case "$1" in
    --help) echo "See https://docs.cloudron.io/installation/ on how to install Cloudron"; exit 0;;
    --provider) provider="$2"; shift 2;;
    --version) requestedVersion="$2"; shift 2;;
    --env)
        if [[ "$2" == "dev" ]]; then
            apiServerOrigin="https://api.dev.cloudron.io"
            webServerOrigin="https://dev.cloudron.io"
            consoleServerOrigin="https://console.dev.cloudron.io"
            installServerOrigin="https://api.dev.cloudron.io"
        elif [[ "$2" == "staging" ]]; then
            apiServerOrigin="https://api.staging.cloudron.io"
            webServerOrigin="https://staging.cloudron.io"
            consoleServerOrigin="https://console.staging.cloudron.io"
            installServerOrigin="https://api.staging.cloudron.io"
        elif [[ "$2" == "unstable" ]]; then
            installServerOrigin="https://api.dev.cloudron.io"
        fi
        shift 2;;
    --skip-reboot) rebootServer="false"; shift;;
    --redo) redo="true"; shift;;
    --setup-token) appstoreSetupToken="$2"; shift 2;;
    --generate-setup-token) setupToken="$(openssl rand -hex 10)"; shift;;
    --) break;;
    *) echo "Unknown option $1"; exit 1;;
    esac
done

# Only --help works as non-root
if [[ ${EUID} -ne 0 ]]; then
    echo "This script should be run as root." > /dev/stderr
    exit 1
fi

# Only --help works with mismatched ubuntu
ubuntu_version=$(lsb_release -rs)
if [[ "${ubuntu_version}" != "16.04" && "${ubuntu_version}" != "18.04" && "${ubuntu_version}" != "20.04" && "${ubuntu_version}" != "22.04" && "${ubuntu_version}" != "24.04" ]]; then
    echo "Cloudron requires Ubuntu 18.04, 20.04, 22.04, 24.04" > /dev/stderr
    exit 1
fi

if which nginx >/dev/null || which docker >/dev/null || which node > /dev/null; then
    if [[ "${redo}" == "false" ]]; then
        echo "Error: Some packages like nginx/docker/nodejs are already installed. Cloudron requires specific versions of these packages and will install them as part of its installation. Please start with a fresh Ubuntu install and run this script again." > /dev/stderr
        exit 1
    fi
fi

# Install MOTD file for stack script style installations. this is removed by the trap exit handler. Heredoc quotes prevents parameter expansion
cat > /etc/update-motd.d/91-cloudron-install-in-progress <<'EOF'
#!/bin/bash

printf "**********************************************************************\n\n"

printf "\t\t\tWELCOME TO CLOUDRON\n"
printf "\t\t\t-------------------\n"

printf '\n\e[1;32m%-6s\e[m\n\n' "Cloudron is installing. Run 'tail -f /var/log/cloudron-setup.log' to view progress."

printf "Cloudron overview - https://docs.cloudron.io/ \n"
printf "Cloudron setup - https://docs.cloudron.io/installation/#setup \n"

printf "\nFor help and more information, visit https://forum.cloudron.io\n\n"

printf "**********************************************************************\n"
EOF
chmod +x /etc/update-motd.d/91-cloudron-install-in-progress

# workaround netcup setting immutable bit. required for installation pre 8.0
if lsattr -l /etc/resolv.conf 2>/dev/null | grep -q Immutable; then
    chattr -i /etc/resolv.conf
fi

# Can only write after we have confirmed script has root access
echo "Running cloudron-setup with args : $@" > "${LOG_FILE}"

echo ""
echo "##############################################"
echo "         Cloudron Setup (${requestedVersion:-latest})"
echo "##############################################"
echo ""
echo " Follow setup logs in a second terminal with:"
echo " $ tail -f ${LOG_FILE}"
echo ""
echo " Join us at https://forum.cloudron.io for any questions."
echo ""

echo "=> Updating apt and installing script dependencies"
if ! apt-get update &>> "${LOG_FILE}"; then
    echo "Could not update package repositories. See ${LOG_FILE}"
    exit 1
fi

if ! DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install --no-install-recommends curl python3 ubuntu-standard software-properties-common -y &>> "${LOG_FILE}"; then
    echo "Could not install setup dependencies (curl). See ${LOG_FILE}"
    exit 1
fi

echo "=> Validating setup token"
if [[ -n "${appstoreSetupToken}" ]]; then
    if ! httpCode=$(curl -sX POST -H "Content-type: application/json"  -o /tmp/response.json -w "%{http_code}" --data "{\"setupToken\": \"${appstoreSetupToken}\"}" "${apiServerOrigin}/api/v1/cloudron_setup_done"); then
        echo "Could not reach ${apiServerOrigin} to complete setup"
        exit 1
    fi
    if [[ "${httpCode}" != "200" ]]; then
        echo -e "Failed to validate setup token.\n$(cat /tmp/response.json)"
        exit 1
    fi

    setupResponse=$(cat /tmp/response.json)
    cloudronId=$(echo "${setupResponse}" | python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["cloudronId"])')
    appstoreApiToken=$(echo "${setupResponse}" | python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["cloudronToken"])')
fi

echo "=> Checking version"
if ! releaseJson=$($curl -s "${installServerOrigin}/api/v1/releases?boxVersion=${requestedVersion}"); then
    echo "Failed to get release information"
    exit 1
fi

if [[ "$requestedVersion" == "" ]]; then
    version=$(echo "${releaseJson}" | python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["version"])')
else
    version="${requestedVersion}"
fi

# 7.6 dropped support for CPUs lacking AVX but this came back in 8.0
if ! grep -q avx /proc/cpuinfo; then
    if vergte "${version}" "7.5.99" && vergte "7.8.0" "${version}"; then
        echo "Cloudron version ${version} requires AVX support in the CPU. No avx found in /proc/cpuinfo"
        exit 1
    else
        echo "    ${YELLOW}CPU has no AVX support. MongoDB will be disabled${DONE}"
    fi
fi

if [[ "${ubuntu_version}" == "24.04" ]] && ! vergte "${version}" "8.0.0"; then
    echo "Cloudron >= 8.0.0 required for installation on Ubuntu ${ubuntu_version}"
    exit 1
fi

if ! sourceTarballUrl=$(echo "${releaseJson}" | python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["info"]["sourceTarballUrl"])'); then
    echo "No source code for version '${requestedVersion:-latest}'"
    exit 1
fi

echo "=> Downloading Cloudron version ${version} ..."
box_src_tmp_dir=$(mktemp -dt box-src-XXXXXX)

if ! $curl -sL "${sourceTarballUrl}" | tar -zxf - -C "${box_src_tmp_dir}"; then
    echo "Could not download source tarball. See ${LOG_FILE} for details"
    exit 1
fi

echo -n "=> Installing base dependencies (this takes some time) ..."
init_ubuntu_script=$(test -f "${box_src_tmp_dir}/scripts/init-ubuntu.sh" && echo "${box_src_tmp_dir}/scripts/init-ubuntu.sh" || echo "${box_src_tmp_dir}/baseimage/initializeBaseUbuntuImage.sh")
if ! /bin/bash "${init_ubuntu_script}" &>> "${LOG_FILE}"; then
    echo "Init script failed. See ${LOG_FILE} for details"
    exit 1
fi
echo ""

# The provider flag is still used for marketplace images
mkdir -p /etc/cloudron
echo "${provider}" > /etc/cloudron/PROVIDER
[[ ! -z "${setupToken}" ]] && echo "${setupToken}" > /etc/cloudron/SETUP_TOKEN

echo -n "=> Installing Cloudron version ${version} (this takes some time) ..."
if ! /bin/bash "${box_src_tmp_dir}/scripts/installer.sh" &>> "${LOG_FILE}"; then
    echo "Failed to install cloudron. See ${LOG_FILE} for details"
    exit 1
fi
echo ""

mysql -uroot -ppassword -e "REPLACE INTO box.settings (name, value) VALUES ('api_server_origin', '${apiServerOrigin}');" 2>/dev/null
mysql -uroot -ppassword -e "REPLACE INTO box.settings (name, value) VALUES ('web_server_origin', '${webServerOrigin}');" 2>/dev/null
mysql -uroot -ppassword -e "REPLACE INTO box.settings (name, value) VALUES ('console_server_origin', '${consoleServerOrigin}');" 2>/dev/null

if [[ -n "${appstoreSetupToken}" ]]; then
    mysql -uroot -ppassword -e "REPLACE INTO box.settings (name, value) VALUES ('cloudron_id', '${cloudronId}');" 2>/dev/null
    mysql -uroot -ppassword -e "REPLACE INTO box.settings (name, value) VALUES ('appstore_api_token', '${appstoreApiToken}');" 2>/dev/null
fi

echo -n "=> Waiting for cloudron to be ready (this takes some time) ..."
while true; do
    echo -n "."
    if status=$($curl -s -f "http://localhost:3000/api/v1/cloudron/status" 2>/dev/null); then
        break # we are up and running
    fi
    sleep 10
done

ip4=$(curl -s --fail --connect-timeout 10 --max-time 10 https://ipv4.api.cloudron.io/api/v1/helper/public_ip | sed -n -e 's/.*"ip": "\(.*\)"/\1/p' || true)
ip6=$(curl -s --fail --connect-timeout 10 --max-time 10 https://ipv6.api.cloudron.io/api/v1/helper/public_ip | sed -n -e 's/.*"ip": "\(.*\)"/\1/p' || true)

url4=""
url6=""
fallbackUrl=""
if [[ -z "${setupToken}" ]]; then
    [[ -n "${ip4}" ]] && url4="https://${ip4}"
    [[ -n "${ip6}" ]] && url6="https://[${ip6}]"
    [[ -z "${ip4}" && -z "${ip6}" ]] && fallbackUrl="https://<IP>"
else
    [[ -n "${ip4}" ]] && url4="https://${ip4}/?setupToken=${setupToken}"
    [[ -n "${ip6}" ]] && url6="https://[${ip6}]/?setupToken=${setupToken}"
    [[ -z "${ip4}" && -z "${ip6}" ]] && fallbackUrl="https://<IP>?setupToken=${setupToken}"
fi
echo -e "\n\n${GREEN}After reboot, visit one of the following URLs and accept the self-signed certificate to finish setup.${DONE}\n"
[[ -n "${url4}" ]] && echo -e "  * ${GREEN}${url4}${DONE}"
[[ -n "${url6}" ]] && echo -e "  * ${GREEN}${url6}${DONE}"
[[ -n "${fallbackUrl}" ]] && echo -e "  * ${GREEN}${fallbackUrl}${DONE}"

if [[ "${rebootServer}" == "true" ]]; then
    systemctl stop box mysql # sometimes mysql ends up having corrupt privilege tables

    # https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#ANSI_002dC-Quoting
    read -p $'\n'"The server has to be rebooted to apply all the settings. Reboot now ? [Y/n] " yn
    yn=${yn:-y}
    case $yn in
        [Yy]* ) exitHandler; systemctl reboot;;
        * ) exit;;
    esac
fi
