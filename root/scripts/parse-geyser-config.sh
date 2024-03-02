#!/usr/bin/env sh

CONFIG_DIR=/app
CONFIG_FILE=${CONFIG_DIR}/config.yml

{
if [ -f ${CONFIG_FILE} ]; then
  echo "${CONFIG_FILE} exists, skipping parse..."
  exit 0
fi
}

set -e

echo "Parsing environment for ${CONFIG_FILE}"
mkdir -p ${CONFIG_DIR}
touch ${CONFIG_FILE}

# parse env vars
IFS='
'
bedrockAddress="${BEDROCK_ADDRESS:-0.0.0.0}"
bedrockPort="${BEDROCK_PORT:-19132}"
bedrockCloneRemotePort="${BEDROCK_CLONE_REMOTE_PORT:-false}"
bedrockMotd1="${BEDROCK_MOTD1:-Geyser}"
bedrockMotd2="${BEDROCK_MOTD2:-Another Geyser server.}"
bedrockServerName="${BEDROCK_SERVER_NAME:-Geyser}"
bedrockCompressionLevel="${BEDROCK_COMPRESSION_LEVEL:-6}"
bedrockBroadcastPort="${BEDROCK_BROADCAST_PORT:-${bedrock_port}}"
bedrockEnableProxyProtocol="${BEDROCK_ENABLE_PROXY_PROTOCOL:-false}"
bedrockProxyProtocolWhitelistedIps="${BEDROCK_PROXY_PROTOCOL_WHITELISTED_IPS:-127.0.0.1${IFS}172.18.0.0/16}"
remoteAddress="${REMOTE_ADDRESS:-auto}"
remotePort="${REMOTE_PORT:-25565}"
remoteAuthType="${REMOTE_AUTH_TYPE:-online}"
remoteAllowPasswordAuthentication="${REMOTE_ALLOW_PASSWORD_AUTHENTICATION:-true}"
remoteUseProxyProtocol="${REMOTE_USE_PROXY_PROTOCOL:-false}"
remoteForwardHostname="${REMOTE_FORWARD_HOSTNAME:-false}"
floodgateKeyFile="${FLOODGATE_KEY_FILE:-key.pem}"
savedUserLogins="${SAVED_USER_LOGINS:-ThisExampleUsernameShouldBeLongEnoughToNeverBeAnXboxUsername${IFS}ThisOtherExampleUsernameShouldAlsoBeLongEnough}"
pendingAuthenticationTimeout="${PENDING_AUTHENTICATION_TIMEOUT:-120}"
commandSuggestions="${COMMAND_SUGGESTIONS:-true}"
passthroughMotd="${PASSTHROUGH_MOTD:-true}"
passthroughPlayerCounts="${PASSTHROUGH_PLAYER_COUNTS:-true}"
legacyPingPassthrough="${LEGACY_PING_PASSTHROUGH:-false}"
pingPassthroughInterval="${PING_PASSTHROUGH_INTERVAL:-3}"
forwardPlayerPing="${FORWARD_PLAYER_PING:-false}"
maxPlayers="${MAX_PLAYERS:-100}"
debugMode="${DEBUG_MODE:-false}"
allowThirdPartyCapes="${ALLOW_THIRD_PARTY_CAPES:-false}"
allowThirdPartyEars="${ALLOW_THIRD_PARTY_EARS:-false}"
showCooldown="${SHOW_COOLDOWN:-title}"
showCoordinates="${SHOW_COORDINATES:-true}"
disableBedrockScaffolding="${DISABLE_BEDROCK_SCAFFOLDING:-false}"
emoteOffhandWorkaround="${EMOTE_OFFHAND_WORKAROUND:-disabled}"
defaultLocale="${DEFAULT_LOCALE:-en_us}"
cacheImages="${CACHE_IMAGES:-0}"
allowCustomSkulls="${ALLOW_CUSTOM_SKULLS:-true}"
maxVisibleCustomSkulls="${MAX_VISIBLE_CUSTOM_SKULLS:-128}"
customSkullRenderDistance="${CUSTOM_SKULL_RENDER_DISTANCE:-32}"
addNonBedrockItems="${ADD_NON_BEDROCK_ITEMS:-true}"
aboveBedrockNetherBuilding="${ABOVE_BEDROCK_NETHER_BUILDING:-false}"
forceResourcePacks="${FORCE_RESOURCE_PACKS:-true}"
xboxAchievementsEnabled="${XBOX_ACHIEVEMENTS_ENABLED:-false}"
logPlayerIpAddresses="${LOG_PLAYER_IP_ADDRESSES:-true}"
notifyOnNewBedrockUpdate="${NOTIFY_ON_NEW_BEDROCK_UPDATE:-true}"
unusableSpaceBlock="${UNUSABLE_SPACE_BLOCK:-minecraft:barrier}"
metricsEnabled="${METRICS_ENABLED:-true}"
metricsUuid="${METRICS_UUID:-$(uuidgen)}"
scoreboardPacketThreshold="${SCOREBOARD_PACKET_THRESHOLD:-20}"
enableProxyConnections="${ENABLE_PROXY_CONNECTIONS:-false}"
mtu="${MTU:-1400}"
useDirectConnection="${USE_DIRECT_CONNECTION:-true}"
disableCompression="${DISABLE_COMPRESSION:-true}"

# write to config file
echo "bedrock:" >> ${CONFIG_FILE}
echo "  address: ${bedrockAddress}" >> ${CONFIG_FILE}
echo "  port: ${bedrockPort}" >> ${CONFIG_FILE}
echo "  clone-remote-port: ${bedrockCloneRemotePort}" >> ${CONFIG_FILE}
echo "  motd1: \"${bedrockMotd1}\"" >> ${CONFIG_FILE}
echo "  motd2: \"${bedrockMotd2}\"" >> ${CONFIG_FILE}
echo "  server-name: \"${bedrockServerName}\"" >> ${CONFIG_FILE}
echo "  compression-level: ${bedrockCompressionLevel}" >> ${CONFIG_FILE}
echo "  broadcast-port: ${bedrockBroadcastPort}" >> ${CONFIG_FILE}
echo "  enable-proxy-protocol: ${bedrockEnableProxyProtocol}" >> ${CONFIG_FILE}

echo -n "  proxy-protocol-whitelisted-ips: [" >> ${CONFIG_FILE}
count=0
for protocol in ${bedrockProxyProtocolWhitelistedIps}
do
  if [ ${count} -ne 0 ]; then
    echo -n "," >> ${CONFIG_FILE}
  fi
  echo -n "\"$(echo ${protocol} | xargs echo -n)\"" >> ${CONFIG_FILE}
  count=$((count+1))
done
echo "]" >> ${CONFIG_FILE}


echo "remote:" >> ${CONFIG_FILE}
echo "  address: ${remoteAddress}" >> ${CONFIG_FILE}
echo "  port: ${remotePort}" >> ${CONFIG_FILE}
echo "  auth-type: ${remoteAuthType}" >> ${CONFIG_FILE}
echo "  allow-password-authentication: ${remoteAllowPasswordAuthentication}" >> ${CONFIG_FILE}
echo "  use-proxy-protocol: ${remoteUseProxyProtocol}" >> ${CONFIG_FILE}
echo "  forward-hostname: ${remoteForwardHostname}" >> ${CONFIG_FILE}

echo "floodgate-key-file: ${floodgateKeyFile}" >> ${CONFIG_FILE}

echo 'saved-user-logins:' >> ${CONFIG_FILE}
for login in ${savedUserLogins}; do
  echo "  - $(echo ${login} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo "pending-authentication-timeout: ${pendingAuthenticationTimeout}" >> ${CONFIG_FILE}
echo "command-suggestions: ${commandSuggestions}" >> ${CONFIG_FILE}
echo "passthrough-motd: ${passthroughMotd}" >> ${CONFIG_FILE}
echo "passthrough-player-counts: ${passthroughPlayerCounts}" >> ${CONFIG_FILE}
echo "legacy-ping-passthrough: ${legacyPingPassthrough}" >> ${CONFIG_FILE}
echo "ping-passthrough-interval: ${pingPassthroughInterval}" >> ${CONFIG_FILE}
echo "forward-player-ping: ${forwardPlayerPing}" >> ${CONFIG_FILE}
echo "max-players: ${maxPlayers}" >> ${CONFIG_FILE}
echo "debug-mode: ${debugMode}" >> ${CONFIG_FILE}
echo "allow-third-party-capes: ${allowThirdPartyCapes}" >> ${CONFIG_FILE}
echo "allow-third-party-ears: ${allowThirdPartyEars}" >> ${CONFIG_FILE}
echo "show-cooldown: ${showCooldown}" >> ${CONFIG_FILE}
echo "show-coordinates: ${showCoordinates}" >> ${CONFIG_FILE}
echo "disable-bedrock-scaffolding: ${disableBedrockScaffolding}" >> ${CONFIG_FILE}
echo "emote-offhand-workaround: \"${emoteOffhandWorkaround}\"" >> ${CONFIG_FILE}
echo "default-locale: ${defaultLocale}" >> ${CONFIG_FILE}
echo "cache-images: ${cacheImages}" >> ${CONFIG_FILE}
echo "allow-custom-skulls: ${allowCustomSkulls}" >> ${CONFIG_FILE}
echo "max-visible-custom-skulls: ${maxVisibleCustomSkulls}" >> ${CONFIG_FILE}
echo "custom-skull-render-distance: ${customSkullRenderDistance}" >> ${CONFIG_FILE}
echo "add-non-bedrock-items: ${addNonBedrockItems}" >> ${CONFIG_FILE}
echo "above-bedrock-nether-building: ${aboveBedrockNetherBuilding}" >> ${CONFIG_FILE}
echo "force-resource-packs: ${forceResourcePacks}" >> ${CONFIG_FILE}
echo "xbox-achievements-enabled: ${xboxAchievementsEnabled}" >> ${CONFIG_FILE}
echo "log-player-ip-addresses: ${logPlayerIpAddresses}" >> ${CONFIG_FILE}
echo "notify-on-new-bedrock-update: ${notifyOnNewBedrockUpdate}" >> ${CONFIG_FILE}
echo "unusable-space-block: ${unusableSpaceBlock}" >> ${CONFIG_FILE}

echo "metrics:" >> ${CONFIG_FILE}
echo "  enabled: ${metricsEnabled}" >> ${CONFIG_FILE}
echo "  uuid: ${metricsUuid}" >> ${CONFIG_FILE}

echo "scoreboard-packet-threshold: ${scoreboardPacketThreshold}" >> ${CONFIG_FILE}
echo "enable-proxy-connections: ${enableProxyConnections}" >> ${CONFIG_FILE}
echo "mtu: ${mtu}" >> ${CONFIG_FILE}
echo "use-direct-connection: ${useDirectConnection}" >> ${CONFIG_FILE}
echo "disable-compression: ${disableCompression}" >> ${CONFIG_FILE}

echo "config-version: 4" >> ${CONFIG_FILE}