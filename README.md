# German Tram Sign Recognition Dataset

## Overview

Within the scope of the dissertation "Environment Detection for Railway Applications based on Automotive Technology", a new dataset was created in order to tackle the major lack of publicly available options for Railway Sign Recognition. 

The novel collection comprises both detection and classification, with the annotations devised for the two partitions being present in this repository.

This README aims at explaining how one can download the footage used for the dataset, extracted from [YouTube videos](https://youtube.com/playlist?list=PLXu4ZCM9_2LyYf7cVcswrJfHWGpOGcLfG), downsample the videos and take advantage of the annotations here at hand. Additionally, a virtual version of the targeted railway signs is also provided, resorting to SVGs.

### Resources

Overall, the resources here made available are:

* A compiled list of all German Tram Signs, along with some additional properties;
* A compiled list of the German Tram Signs labelled for the dataset;
* 10 JSON files created for the videos used for Traffic Sign Detection (one file for each video);
* 1 JSON file containing all labels from the ROIs extracted from the Detection partition, used for Classification;
* The MATLAB Labelling Sessions created to annotate the Detection partition, using the [Video Labeler Tool](https://www.mathworks.com/help/vision/ug/get-started-with-the-video-labeler.html?s_tid=mwa_osa_a);
* The MATLAB script used to downsample the videos;
* The SVGs manually devised in [Inkscape](https://inkscape.org/pt/) to be used as ideal signs, upon being converted to PNGs.

## How was the dataset created?

### Targets

Since no clear documentation could be found, in English, compiling all existent German tram signs, a list was devised, compacting in one place, with some additional properties (such as a photo, dimensions...), all found instances.

Since the initially constructed document targeted too many signs, upon the revision of the videos, a filtered list was created, targeting only the signs that always influenced the tram driver.

These lists can be found in the **_Targets_ folder**. The overall one is called *"German Tram Signs"*, while the filtered one is called *"Seen German Tram Signs"*.

### Videos Used

The [YouTube playlist](https://youtube.com/playlist?list=PLXu4ZCM9_2LyYf7cVcswrJfHWGpOGcLfG) contains 12 videos. From these, by order of appearance, videos nº9 and nº10 were not used, as they were captured in undesirable circumstances.

The videos were downloaded using [VLC Media Player](https://www.videolan.org/vlc/download-windows.html), following this [tutorial](https://www.bogotobogo.com/VideoStreaming/VLC/Downloading_YouTube_Video_using_VLC.php).

### MATLAB

To reduce the number of frames and avoid unnecessary labelling, the videos were downsampled using the MATLAB script present in the **_Matlab_ folder**, *"less_fps.m"*. The original videos have 25fps, which are then reduced to 5 frames for each second passed (5 times less frames). Lastly, the videos are saved using the 25fps rate to speed up the annotation process.

Using MATLAB's [Video Labeler Tool](https://www.mathworks.com/help/vision/ug/get-started-with-the-video-labeler.html?s_tid=mwa_osa_a), each downsampled video was labelled, using the classes / labels presented in the *"Seen German Tram Signs"* PDF.

Since MATLAB is a proprietary software, for each Labelling Session, a [GroundTruth object](https://www.mathworks.com/help/vision/ref/groundtruth.html) was saved and a CVS was exported, containing the annotations. For each CSV, a filtered JSON file was created with Python.

## Annotations

### Detection

In the **_Annotations/Detection_ folder**, one can find a JSON file for each downsampled video. Each frame is identified by a *Python Dict*, with a timestamp as *key* and corresponding Bounding Boxes as *value*. An example of a frame can be found in the figure below.

![Detection Example](https://github.com/JoaoSilvaFeup/German-Tram-Sign-Recognition-Dataset/blob/main/Images/detection.png)

This partition is composed of a total of almost 100k frames, where nearly 20k contain annotations.

### Classification

To create the classification partition, all ROIs were extracted from the Detection Dataset and saved in one folder, identified by a single JSON file.

The figure below illustrates an example of the tag assigned to each ROI, that follows the pattern {vx_fy: class}. Here, the *dictionary’s key* is composed of *‘vx’*, where *‘v’* stands for *“video”* and *‘x’* signals the respective id, and *‘fy’*, where *‘f’* stands for *“frame”* and *‘y’* signals the sequence by which that ROI appears in video *‘x’*.

![Classification Example](https://github.com/JoaoSilvaFeup/German-Tram-Sign-Recognition-Dataset/blob/main/Images/classification.png)

This partition is composed of a total of approximately 27k ROIs.

## Ideal Signs

Since the dataset does not feature a balanced distribution of appearances, which is quite typical in Sign Recognition applications, ideal signs were created using Inkscape.

The manually devised SVGs can be inserted into real scenes, after being converted to PNGs. These, during the conversion process, can take any size desired, since SVGs are "infinitly" scalable. The conversion can be performed using the library [cairosvg](https://cairosvg.org/), with Python.

The **_Ideal Signs_ folder** contains the workspace used, in the *"ideal signs.svg"* file.

Additionally, in the **_Ideal Signs / Base SVGs_ folder**, one can find the exported base classes, featured in the *"Seen German Tram Signs"* PDF.

Lastly, in the **_Ideal Signs / SVG Signs_ folder**, all variations observed in the videos were also created as SVGs.
