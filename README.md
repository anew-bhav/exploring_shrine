# Exploring Shrine

This repository is a rails application built to explore shrine gem for handling various scenarios while uploading files.
The shrine gem brings modularity and simplicity of usage with easy to use API. 
One can read more on shrine [here](https://shrinerb.com/).

The project was created to demonstrate how to build the following features

- User should have a profile image
- profile image should have maximum size of 5MB
- only image files get stored while uploading profile images
- ability to support different versions of the files based on resolutions: 300x300, 500x500, 800x800
- User should be able to upload multiple video files
- Video file should get processed before getting saved
- a thumbnail for each video file should get generated.

> The project only the above feature list implemented into model classes.
> there is no controller or view which provides interface to interact. 
> to test these models, one has to use `rails console` only



