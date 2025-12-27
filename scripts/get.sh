wget -O data.zip https://github.com/v2fly/domain-list-community/archive/refs/heads/master.zip
unzip -j ./data.zip "*/data/*" -d ./data
rm -f data.zip

for i in facebook geolocation-!cn google netflix private telegram twitter fastly cloudflare
do
  echo "- Download $i"
  curl -sSL https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/${i}.list |sed "s/\+\.//g" |sed "s/^/full:/g" > data/${i}
done

echo "- Download cn"
curl -sSL https://raw.githubusercontent.com/SnowCore8/IPChinaList/master/china_domain.txt |sed "s/\+\.//g" |sed "s/^/full:/g" > data/cn
echo "- Download gfw"
curl -sSL https://raw.githubusercontent.com/SnowCore8/IPChinaList/master/gfw_domain.txt |sed "s/\+\.//g" |sed "s/^/full:/g" > data/gfw
