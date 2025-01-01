nofile_error

@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $ python vrollprocess.pl 
Traceback (most recent call last):
  File "/workspaces/whisper/6_Symbols/vrollprocess.pl", line 12, in <module>
    subprocess.run(["ffmpeg", "-i", mov_file, "-ar", "16000", "-ac", "1", "-q:a", "3", "-acodec", "pcm_s16le", audio_file])
  File "/usr/local/python/3.12.1/lib/python3.12/subprocess.py", line 548, in run
    with Popen(*popenargs, **kwargs) as process:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python/3.12.1/lib/python3.12/subprocess.py", line 1026, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/local/python/3.12.1/lib/python3.12/subprocess.py", line 1950, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'ffmpeg'
@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $ 