#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# see github.com/Toblerity/Shapely/blob/master/shapely/examples/*.py
#
#   sudo apt-cache show xclip
#   python genareas.py | xclip -sel clip
#
# for testing, paste the result in geojson.io

import json, geojson

from geojson import Feature, FeatureCollection
from shapely.ops import cascaded_union
from shapely.geometry import mapping, shape, Point, LineString

with open('example.geojson', 'r') as f:
    js = json.load(f)

spots, points, lines = [], [], []
buffer_distance = 0.0001

for feature in js['features']:
    if feature['geometry'] and feature['geometry']['type'] == 'Point':
        x = feature['geometry']['coordinates'][0]
        y = feature['geometry']['coordinates'][1]
        p = Point(x,y)
        points.append(p)
        spots.append(p.buffer(buffer_distance))

for feature in js['features']:
    if feature['geometry'] and feature['geometry']['type'] == 'LineString':
        l = LineString(feature['geometry']['coordinates'])
        lines.append(l)
        spots.append(l.buffer(buffer_distance))

patches = cascaded_union(spots)
# see also: object.symmetric_difference(other)

import copy
patches = []
for spot1 in spots:
    sfinal = copy.deepcopy(spot1)
#    for spot2 in spots:
#        if spot1 != spot2:
#            sfinal = spot1.difference(spot2)
    patches.append(sfinal)

features = []
for p in patches:
    f = Feature(geometry=p)
    f.pop('id', None)
    features.append(f)

fc = FeatureCollection(features)

print(geojson.dumps(fc))
