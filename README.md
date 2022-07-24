# German Tram Sign Recognition Dataset

## Overview

Within the scope of the dissertation "Environment Detection for Railway Applications based on Automotive Technology", a new dataset was created in order to tackle the major lack of publicly available options for Railway Sign Recognition. 

The novel collection comprises both detection and classification, with the annotations devised for the two partitions being present in this repository.

This README aims at explaining how one can download the footage used for the dataset, extracted from [YouTube videos](https://youtube.com/playlist?list=PLXu4ZCM9_2LyYf7cVcswrJfHWGpOGcLfG), and take advantage of the annotations here at hand.

### Resources

Overall, the resources here made available are:

* A compiled list of all German Tram Signs, along with some additional properties;
* A compiled list of the German Tram Signs labelled for the dataset;
* 10 JSON files created for the videos used for Traffic Sign Detection (one file for each video);
* 1 JSON file containing all labels from the ROIs extracted from the Detection partition, used for Classification;
* The MATLAB Labelling Sessions created to annotate the Detection Partition, using the [Video Labeler Tool](https://www.mathworks.com/help/vision/ug/get-started-with-the-video-labeler.html?s_tid=mwa_osa_a);
* The MATLAB script used to downsample the videos;
* The SVGs manually devised in [Inkscape](https://inkscape.org/pt/) to be used as ideal signs, upon being converted to PNGs.

## How was the dataset created?

### Targets

Since no clear documentation could be found, in English, compiling all existent German tram signs, a list was devised, compacting in one place, with some additional properties (such as a photo, dimensions...), all found instances.

Since the initially constructed document targeted too many signs, upon the revision of the videos, a filtered list was created, targeting only the signs that always influenced the tram driver.

These lists can be found in the **Targets folder**. The overall one is called *"German Tram Signs"*, while the filtered one is called *"Seen German Tram Signs"*.

### Videos Used

The [YouTube playlist](https://youtube.com/playlist?list=PLXu4ZCM9_2LyYf7cVcswrJfHWGpOGcLfG) contains 12 videos. From these, by order of appearance, videos nº9 and nº10 were not used, as they were captured in undesirable circumstances.

The videos were downloaded using [VLC Media Player](https://www.videolan.org/vlc/download-windows.html), following this [tutorial](https://www.bogotobogo.com/VideoStreaming/VLC/Downloading_YouTube_Video_using_VLC.php).

### MATLAB

To reduce the number of frames and avoid unnecessary labelling, the videos were downsampled using the MATLAB script present in the **Matlab folder**, *less_fps.m*. The original videos have 25fps, which are reduced to 5 frames for each second passed. Then, the videos are saved using the 25fps rate to speed up the annotation process.

Using MATLAB's [Video Labeler Tool](https://www.mathworks.com/help/vision/ug/get-started-with-the-video-labeler.html?s_tid=mwa_osa_a), 
