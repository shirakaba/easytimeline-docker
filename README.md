# easytimeline-docker

[EasyTimeline](http://infodisiac.com/Wikipedia/EasyTimeline/Introduction.htm) (and [Ploticus](http://ploticus.sourceforge.net/doc/welcome.html), which it depends upon), Dockerised. Image size is 198 MB.

## Building the image

```sh
# On x86_64 (e.g. Intel Mac):
docker build -t easytimeline .

# Otherwise (e.g. M1 Mac):
docker build --platform=linux/amd64 -t easytimeline .
```

## Running the container

```sh
# On x86_64 (e.g. Intel Mac):
docker run -v "${PWD}/mnt:/root/mnt:rw" easytimeline perl -X EasyTimeline.pl -i mnt/sample.txt

# Otherwise (e.g. M1 Mac):
docker run --platform linux/amd64 -v "${PWD}/mnt:/root/mnt:rw" easytimeline perl -X EasyTimeline.pl -i mnt/sample.txt
```

## Libraries used

### ploticus

No source-code modifications, but here's how I set things up:

I downloaded the ploticus 2.42 prebuilt Linux x86-64 binary from [this downloads page](http://ploticus.sourceforge.net/doc/download.html), removed the unneeded `pltestsuite` and `prefabs` directories within, and added in the `GPL.txt` licence from the source code bundle (also available on the downloads page).

### easytimeline

I copied the EasyTimeline.pl script from [this downloads page](http://infodisiac.com/Wikipedia/EasyTimeline/Download.htm), and added a generic copy of the GNU GPL v2 licence (as this is the licence mentioned on the footer of the website).

## Improvements

Would be nice if we could base off Alpine (< 10 MB image) or at least modern Ubuntu (79 MB image) instead, but I've had trouble installing a version of Perl old enough to run EasyTimeline.pl due to the deprecation of `defined(@array)`.
