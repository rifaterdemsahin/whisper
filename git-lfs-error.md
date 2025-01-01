> git push origin main:main
remote: warning: File 6_Symbols/vroll_dec1/IMG_7314.MOV is 88.48 MB; this is larger than GitHub's recommended maximum file size of 50.00 MB        
remote: error: Trace: 4a37302025ae2bf933904da6052fe2719df1b0419c9da30824f3963db2a83b78        
remote: error: See https://gh.io/lfs for more information.        
remote: error: File 6_Symbols/vroll_dec1/RPReplay_Final1735380819.mp4 is 115.85 MB; this exceeds GitHub's file size limit of 100.00 MB        
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.        
To https://github.com/rifaterdemsahin/whisper
 ! [remote rejected] main -> main (pre-receive hook declined)
error: failed to push some refs to 'https://github.com/rifaterdemsahin/whisper'


git lfs install
📄 Transcriptions appended to /workspaces/whisper/6_Symbols/transcription_2025-01-01.yaml
@rifaterdemsahin ➜ /workspaces/whisper (main) $ git lfs install
Updated Git hooks.
Git LFS initialized.
@rifaterdemsahin ➜ /workspaces/whisper (main) $ 


It looks like you're encountering issues with pushing large files to GitHub. GitHub has a file size limit of 100 MB for individual files. To handle larger files, you can use Git Large File Storage (LFS). Here's a step-by-step guide to resolve this issue:

1. **Install Git LFS**:
   ```sh
   git lfs install
   ```

2. **Track the large files**:
   You need to tell Git LFS to track the large files. For example:
   ```sh
   git lfs track "*.MOV"
   git lfs track "*.mp4"
   ```

3. **Add the tracked files**:
   ```sh
   git add .gitattributes
   git add 6_Symbols/vroll_dec1/IMG_7314.MOV
   git add 6_Symbols/vroll_dec1/RPReplay_Final1735380819.mp4
   ```

4. **Commit the changes**:
   ```sh
   git commit -m "Track large files with Git LFS"
   ```

5. **Push the changes**:
   ```sh
   git push origin main
   ```

By following these steps, you should be able to push your large files to GitHub without encountering the file size limit error[1](https://github.com/orgs/community/discussions/61221)[2](https://trycatchdebug.net/news/1341032/large-file-github-limit).

If you run into any issues, feel free to ask for more help! 😊