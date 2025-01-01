import whisper
import subprocess
 
# Path to your .mov file
# Execute > cd 6_Symbols
# Execute > pip install whisper ffmpeg-python
# Execute > python vrollprocess.pl 
mov_file = "Timeline.mov"
audio_file = "temp_audio.wav"
 
# Extract audio using ffmpeg
subprocess.run(["ffmpeg", "-i", mov_file, "-ar", "16000", "-ac", "1", "-q:a", "3", "-acodec", "pcm_s16le", audio_file])
 
# Load the Whisper model
model = whisper.load_model("base")  # Use 'small', 'medium', or 'large' for more accuracy
result = model.transcribe(audio_file)
 
# Print the transcription
print(result["text"])