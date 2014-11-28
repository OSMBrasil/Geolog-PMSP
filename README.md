![snapshot](https://github.com/OSMBrasil/Geolog-PMSP/raw/master/data-snapshot.png)

## Geolog Import

Import of street network data from *Prefeitura de São Paulo*.

* [Import page at OpenStreetMap's wiki](https://wiki.openstreetmap.org/wiki/Geolog_PMSP_Import)
* [Data page at City of São Paulo site](http://www.prefeitura.sp.gov.br/cidade/secretarias/desenvolvimento_urbano/dados_estatisticos/index.php?p=160798)
* [GEOLOG dataset](http://www.prefeitura.sp.gov.br/cidade/secretarias/upload/desenvolvimento_urbano/dados_estatisticos/arquivos/20131203_geolog.zip)
* [GEOLOG map](https://api.tiles.mapbox.com/v4/mapaslivres.hnhcwhfr/page.html?access_token=pk.eyJ1IjoibWFwYXNsaXZyZXMiLCJhIjoidmVxbkRhRSJ9.fe8NAiiw9ACGjVgGgowbgg)

## Strategy

The dataset contains vectorial information about the street network of São Paulo. Each street segment has its name, postal codes and addresses ranges for both sides of the street.

As São Paulo has already good street network coverage on OpenStreetMap, so the import will be focused on fixing street names and improving addressing.

The import will be mostly manual, probably using Tasking Manager or another way to monitor progress.

## The Data

The target file is `DEINFO_SEGTOS_212.shp`. It comes originally with a coordinate reference system that seems to be wrong. A better alignment can be reached by using following proj4 parameters:

    +proj=utm +zone=23 +south +ellps=aust_SA +towgs84=-86.35,3.88,-38.22,0,0,0,0 +units=m +no_defs

## Current Status

We are working on finding a way to generate address ranges from the shapefile.

Next steps:

* Document a way to import the data to PostGIS
* Develop a scrip to generate [address interpolation ways](http://wiki.openstreetmap.org/wiki/Interpolation#Using_interpolation)
