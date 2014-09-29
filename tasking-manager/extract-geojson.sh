#!/bin/bash

which ogr2ogr > /dev/null
if [ $? -eq 1 ]; then
  echo "ogr2ogr não encontrado. Instale: sudo apt-cache search gdal-bin"
  exit 1
fi

# '+proj=utm +zone=23 +south +units=m +ellps=aust_SA +towgs84=-67.35,3.88,-38.22'

function logradouros() {  
  rm data/logradouros.geojson
  ogr2ogr \
    -s_srs '+proj=utm +zone=23 +south +units=m +ellps=aust_SA +towgs84=-90.00,3.88,-47.00' \
    -t_srs 'EPSG:4326' -f 'GeoJSON' data/logradouros.geojson \
    ../TileMill/data/GEOLOG/LAYERS_GEOLOG/DEINFO_SEGTOS_212.shp \
    -dialect sqlite -sql \
    "select ST_union(Geometry),CODL,NAME,TITULO,PREP from DEINFO_SEGTOS_212 GROUP BY CODL"
}

function quadras211() {
  rm data/quadras-211.geojson
  ogr2ogr \
    -s_srs '+proj=utm +zone=23 +south +units=m +ellps=aust_SA +towgs84=-90.00,3.88,-47.00' \
    -t_srs 'EPSG:4326' -f "GeoJSON" data/quadras-211.geojson \
    ../TileMill/data/GEOLOG/LAYERS_GEOLOG/DEINFO_QUADRAS_FISCAIS_211.shp
}

function quadras212() {
  rm data/quadras-212.geojson
  ogr2ogr \
    -s_srs '+proj=utm +zone=23 +south +units=m +ellps=aust_SA +towgs84=-90.00,3.88,-47.00' \
    -t_srs 'EPSG:4326' -f "GeoJSON" data/quadras-212.geojson \
    ../TileMill/data/GEOLOG/LAYERS_GEOLOG/DEINFO_QUADRAS_FISCAIS_\ 212.shp
}

function setores() {
  rm data/setores.geojson
  ogr2ogr \
    -s_srs '+proj=utm +zone=23 +south +units=m +ellps=aust_SA +towgs84=-90.00,3.88,-47.00' \
    -t_srs 'EPSG:4326' -f "GeoJSON" data/setores.geojson \
    ../TileMill/data/GEOLOG/LAYERS_GEOLOG/DEINFO_SETORES_FISCAIS.shp
}

case "$1" in
  logradouros)
    logradouros
    ;;
  quadras211)
    quadras211
    ;;
  quadras212)
    quadras212
    ;;
  quadras)
    quadras211
    quadras212
    ;;
  setores)
    setores
    ;;
  *)
    echo "Help:"
    echo "      bash extract-geojson.sh [ logradouros | quadras[211|212] | setores ]"
    echo
    echo "Cuidado! Ele substitui arquivos data/*.geojson"
    ;;
esac
