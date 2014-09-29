## Geolog Import

This repository holds files for the import of road infrastructure of the City of São Paulo to OpenStreetMap.

* [Import page at OpenStreetMap's wiki](https://wiki.openstreetmap.org/wiki/Geolog_PMSP_Import)
* [Data page at City of São Paulo site](http://www.prefeitura.sp.gov.br/cidade/secretarias/desenvolvimento_urbano/dados_estatisticos/index.php?p=160798)
* [GEOLOG dataset](http://www.prefeitura.sp.gov.br/cidade/secretarias/upload/desenvolvimento_urbano/dados_estatisticos/arquivos/20131203_geolog.zip)
* [GEOLOG map](https://api.tiles.mapbox.com/v4/mapaslivres.hnhcwhfr/page.html?access_token=pk.eyJ1IjoibWFwYXNsaXZyZXMiLCJhIjoidmVxbkRhRSJ9.fe8NAiiw9ACGjVgGgowbgg)

## Import plan

The plan is still in early stage, but the ideia is to generate a map layer with GEOLOG data, allowing collaborators to draw over it, using JOSM or iD. The progress will be tracked using OSM Task Manager.

## TileMill map

Steps to generate a GEOLOG map locally:

1. Clone this repository locally;

2. Symlink to TileMill:<br/>
`ln -s ~/your-repo-dir/Geolog-PMSP/TileMill ~/Documents/MapBox/project/Geolog-PMSP`

3. Download and expand [GEOLOG zip](http://www.prefeitura.sp.gov.br/cidade/secretarias/upload/desenvolvimento_urbano/dados_estatisticos/arquivos/20131203_geolog.zip) to `~/your-repo-dir/Geolog-PMSP/TileMill/data`.

4. Open the GEOLOG project in TileMill.
