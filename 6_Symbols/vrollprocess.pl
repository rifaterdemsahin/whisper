# Path to your .mov file
# Execute > cd 6_Symbols
# Execute > pip install whisper ffmpeg-python
# Execute > python vrollprocess.pl 
import whisper
import subprocess
import datetime
import yaml

# Path to your .mov file
mov_file = "/workspaces/whisper/6_Symbols/Timeline.mov"
audio_file = "/workspaces/whisper/6_Symbols/temp_audio.wav"
output_file = f"/workspaces/whisper/6_Symbols/transcription_{datetime.date.today()}.yaml"

# Extract audio using ffmpeg and overwrite the existing WAV file
subprocess.run(["ffmpeg", "-y", "-i", mov_file, "-ar", "16000", "-ac", "1", "-q:a", "3", "-acodec", "pcm_s16le", audio_file])

# Load the Whisper model
model = whisper.load_model("base")  # Use 'small', 'medium', or 'large' for more accuracy
result = model.transcribe(audio_file)

# Prepare the YAML content
transcription_data = {
    "file_name": mov_file,
    "transcription": result["text"]
}

# Append the transcription to the output file in YAML format
with open(output_file, "a") as f:
    yaml.dump(transcription_data, f, default_flow_style=False)

print(f"Transcription appended to {output_file}")