#!/usr/bin/env python
# -*- coding: utf-8 -*-

import geojson
from shapely.geometry import mapping, shape
from geojson import Feature, Point, FeatureCollection

# this is an example that shows how to improve genareas.py

my_shape = shape(geojson.loads('{"type": "Point", "coordinates": [-81.222, -20.555]}'))

feature1 = Feature(geometry=my_shape)
feature2 = Feature(geometry=Point((-80.234, -22.532)))

features = [feature1, feature2]

for f in features: f.pop('id', None)  # it is a fix for geojson.io

fc = FeatureCollection(features)

print(geojson.dumps(fc))

#print(json.dumps(mapping(s)))
