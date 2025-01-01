@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $ python vrollprocess.pl
ffmpeg version 7.0.2-static https://johnvansickle.com/ffmpeg/  Copyright (c) 2000-2024 the FFmpeg developers
  built with gcc 8 (Debian 8.3.0-6)
  configuration: --enable-gpl --enable-version3 --enable-static --disable-debug --disable-ffplay --disable-indev=sndio --disable-outdev=sndio --cc=gcc --enable-fontconfig --enable-frei0r --enable-gnutls --enable-gmp --enable-libgme --enable-gray --enable-libaom --enable-libfribidi --enable-libass --enable-libvmaf --enable-libfreetype --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-librubberband --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libvorbis --enable-libopus --enable-libtheora --enable-libvidstab --enable-libvo-amrwbenc --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libdav1d --enable-libxvid --enable-libzvbi --enable-libzimg
  libavutil      59.  8.100 / 59.  8.100
  libavcodec     61.  3.100 / 61.  3.100
  libavformat    61.  1.100 / 61.  1.100
  libavdevice    61.  1.100 / 61.  1.100
  libavfilter    10.  1.100 / 10.  1.100
  libswscale      8.  1.100 /  8.  1.100
  libswresample   5.  1.100 /  5.  1.100
  libpostproc    58.  1.100 / 58.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from '/workspaces/whisper/6_Symbols/Timeline.mov':
  Metadata:
    major_brand     : qt  
    minor_version   : 512
    compatible_brands: qt  
    creation_time   : 2024-11-04T21:40:45.000000Z
    encoder         : Blackmagic Design DaVinci Resolve Studio
  Duration: 00:00:05.06, start: 0.000000, bitrate: 27903 kb/s
  Stream #0:0[0x1]: Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080, 27974 kb/s, SAR 1:1 DAR 16:9, 60 fps, 60 tbr, 15360 tbn (default)
      Metadata:
        creation_time   : 2024-11-04T21:40:45.000000Z
        handler_name    : VideoHandler
        vendor_id       :     
        encoder         : H.264
        timecode        : 01:00:00:00
  Stream #0:1[0x2]: Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 319 kb/s (default)
      Metadata:
        creation_time   : 2024-11-04T21:40:45.000000Z
        handler_name    : SoundHandler
        vendor_id       : [0][0][0][0]
  Stream #0:2[0x3](eng): Data: none (tmcd / 0x64636D74), 0 kb/s (default)
      Metadata:
        creation_time   : 2024-11-04T21:40:45.000000Z
        handler_name    : TimeCodeHandler
        timecode        : 01:00:00:00
Stream mapping:
  Stream #0:1 -> #0:0 (aac (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to '/workspaces/whisper/6_Symbols/temp_audio.wav':
  Metadata:
    major_brand     : qt  
    minor_version   : 512
    compatible_brands: qt  
    ISFT            : Lavf61.1.100
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 16000 Hz, mono, s16, 256 kb/s (default)
      Metadata:
        creation_time   : 2024-11-04T21:40:45.000000Z
        handler_name    : SoundHandler
        vendor_id       : [0][0][0][0]
        encoder         : Lavc61.3.100 pcm_s16le
[out#0/wav @ 0x6bde040] video:0KiB audio:157KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: 0.048633%
size=     157KiB time=00:00:05.01 bitrate= 256.1kbits/s speed= 333x    
Traceback (most recent call last):
  File "/workspaces/whisper/6_Symbols/vrollprocess.pl", line 15, in <module>
    model = whisper.load_model("base")  # Use 'small', 'medium', or 'large' for more accuracy
            ^^^^^^^^^^^^^^^^^^
AttributeError: module 'whisper' has no attribute 'load_model'


It looks like you're encountering an `AttributeError` because the `whisper` module doesn't have a `load_model` attribute. This might be due to a version mismatch or an incorrect import.

Here are a few steps you can take to resolve this issue:

1. **Check the Installation**: Ensure that you have the correct version of the `whisper` library installed. You can install or update it using:
   ```bash
   pip install -U openai-whisper
   ```

2. **Correct Import**: Make sure you are importing the library correctly. The `whisper` library should be imported as follows:
   ```python
   import whisper
   model = whisper.load_model("base")
   ```

3. **Verify Function Availability**: Double-check the library's documentation or source code to ensure that the `load_model` function exists in the version you are using. You can find more information on the [GitHub repository](https://github.com/openai/whisper)[1](https://github.com/openai/whisper/discussions/1170).

If you continue to face issues, please let me know, and we can troubleshoot further!