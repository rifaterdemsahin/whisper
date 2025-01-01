@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $ pip install whisper ffmpeg-python
Collecting whisper
  Downloading whisper-1.1.10.tar.gz (42 kB)
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Collecting ffmpeg-python
  Downloading ffmpeg_python-0.2.0-py3-none-any.whl.metadata (1.7 kB)
Requirement already satisfied: six in /home/codespace/.local/lib/python3.12/site-packages (from whisper) (1.17.0)
Collecting future (from ffmpeg-python)
  Downloading future-1.0.0-py3-none-any.whl.metadata (4.0 kB)
Downloading ffmpeg_python-0.2.0-py3-none-any.whl (25 kB)
Downloading future-1.0.0-py3-none-any.whl (491 kB)
Building wheels for collected packages: whisper
  Building wheel for whisper (pyproject.toml) ... done
  Created wheel for whisper: filename=whisper-1.1.10-py3-none-any.whl size=41120 sha256=bf2d38282b085b68546d88ec700dbe2576b1b7c55349669dbef27171fbb65aee
  Stored in directory: /home/codespace/.cache/pip/wheels/34/b8/4e/9c4c3351d670e06746a340fb4b7d854c76517eec225e5b32b1
Successfully built whisper
Installing collected packages: whisper, future, ffmpeg-python
Successfully installed ffmpeg-python-0.2.0 future-1.0.0 whisper-1.1.10
@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $

pip install -U openai-whisper

@rifaterdemsahin ➜ /workspaces/whisper/6_Symbols (main) $ pip install -U openai-whisper
Collecting openai-whisper
  Downloading openai-whisper-20240930.tar.gz (800 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 800.5/800.5 kB 27.3 MB/s eta 0:00:00
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Collecting numba (from openai-whisper)
  Downloading numba-0.60.0-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl.metadata (2.7 kB)
Requirement already satisfied: numpy in /home/codespace/.local/lib/python3.12/site-packages (from openai-whisper) (2.2.0)
Requirement already satisfied: torch in /home/codespace/.local/lib/python3.12/site-packages (from openai-whisper) (2.5.1+cpu)
Collecting tqdm (from openai-whisper)
  Downloading tqdm-4.67.1-py3-none-any.whl.metadata (57 kB)
Collecting more-itertools (from openai-whisper)
  Downloading more_itertools-10.5.0-py3-none-any.whl.metadata (36 kB)
Collecting tiktoken (from openai-whisper)
  Downloading tiktoken-0.8.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (6.6 kB)
Collecting triton>=2.0.0 (from openai-whisper)
  Downloading triton-3.1.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (1.3 kB)
Requirement already satisfied: filelock in /home/codespace/.local/lib/python3.12/site-packages (from triton>=2.0.0->openai-whisper) (3.13.1)
Collecting llvmlite<0.44,>=0.43.0dev0 (from numba->openai-whisper)
  Downloading llvmlite-0.43.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (4.8 kB)
Collecting numpy (from openai-whisper)
  Downloading numpy-2.0.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (60 kB)
Collecting regex>=2022.1.18 (from tiktoken->openai-whisper)
  Downloading regex-2024.11.6-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (40 kB)
Requirement already satisfied: requests>=2.26.0 in /home/codespace/.local/lib/python3.12/site-packages (from tiktoken->openai-whisper) (2.32.3)
Requirement already satisfied: typing-extensions>=4.8.0 in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (4.12.2)
Requirement already satisfied: networkx in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (3.2.1)
Requirement already satisfied: jinja2 in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (3.1.4)
Requirement already satisfied: fsspec in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (2024.2.0)
Requirement already satisfied: setuptools in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (75.6.0)
Requirement already satisfied: sympy==1.13.1 in /home/codespace/.local/lib/python3.12/site-packages (from torch->openai-whisper) (1.13.1)
Requirement already satisfied: mpmath<1.4,>=1.1.0 in /home/codespace/.local/lib/python3.12/site-packages (from sympy==1.13.1->torch->openai-whisper) (1.3.0)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/codespace/.local/lib/python3.12/site-packages (from requests>=2.26.0->tiktoken->openai-whisper) (3.4.0)
Requirement already satisfied: idna<4,>=2.5 in /home/codespace/.local/lib/python3.12/site-packages (from requests>=2.26.0->tiktoken->openai-whisper) (3.10)
Requirement already satisfied: urllib3<3,>=1.21.1 in /home/codespace/.local/lib/python3.12/site-packages (from requests>=2.26.0->tiktoken->openai-whisper) (2.2.3)
Requirement already satisfied: certifi>=2017.4.17 in /home/codespace/.local/lib/python3.12/site-packages (from requests>=2.26.0->tiktoken->openai-whisper) (2024.8.30)
Requirement already satisfied: MarkupSafe>=2.0 in /home/codespace/.local/lib/python3.12/site-packages (from jinja2->torch->openai-whisper) (3.0.2)
Downloading triton-3.1.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (209.6 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 209.6/209.6 MB 51.8 MB/s eta 0:00:00
Downloading more_itertools-10.5.0-py3-none-any.whl (60 kB)
Downloading numba-0.60.0-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl (3.8 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 51.9 MB/s eta 0:00:00
Downloading numpy-2.0.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (19.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 19.2/19.2 MB 55.7 MB/s eta 0:00:00
Downloading tiktoken-0.8.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.2/1.2 MB 40.2 MB/s eta 0:00:00
Downloading tqdm-4.67.1-py3-none-any.whl (78 kB)
Downloading llvmlite-0.43.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (43.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 43.9/43.9 MB 54.0 MB/s eta 0:00:00
Downloading regex-2024.11.6-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (796 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 796.9/796.9 kB 30.5 MB/s eta 0:00:00
Building wheels for collected packages: openai-whisper
  Building wheel for openai-whisper (pyproject.toml) ... done
  Created wheel for openai-whisper: filename=openai_whisper-20240930-py3-none-any.whl size=803320 sha256=956a0429acfe0cfe7c27bd753d7c093925dea479ae0bdd55fa7db14e81f73662
  Stored in directory: /home/codespace/.cache/pip/wheels/7c/f5/6f/92094c35416f9397abb86b23cfe72fb255a3013012f983136d
Successfully built openai-whisper
Installing collected packages: triton, tqdm, regex, numpy, more-itertools, llvmlite, ti


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