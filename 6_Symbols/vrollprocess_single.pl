# Path to your .mov file
# Execute > cd 6_Symbols
# Execute > pip install whisper ffmpeg-python
# Execute > python vrollprocess_single.pl 
import whisper
import subprocess
import datetime
import yaml
import os

# Path to your .mov file
mov_file = "/workspaces/whisper/6_Symbols/Timeline.mov"
audio_file = "/workspaces/whisper/6_Symbols/temp_audio.wav"
output_file = f"/workspaces/whisper/6_Symbols/transcription_{datetime.date.today()}.yaml"

# Extract audio using ffmpeg and overwrite the existing WAV file
subprocess.run(["ffmpeg", "-y", "-i", mov_file, "-ar", "16000", "-ac", "1", "-q:a", "3", "-acodec", "pcm_s16le", audio_file])

# Load the Whisper model
model = whisper.load_model("base")  # Use 'small', 'medium', or 'large' for more accuracy
result = model.transcribe(audio_file)

# Prepare the transcription data
transcription_data = {
    "file_name": mov_file,
    "transcription": result["text"]
}

# Load existing transcriptions if the file exists
if os.path.exists(output_file):
    with open(output_file, "r") as f:
        existing_data = yaml.safe_load(f)
        if not isinstance(existing_data, list):
            existing_data = []
else:
    existing_data = []

# Append the new transcription data
existing_data.append(transcription_data)

# Write the updated data back to the YAML file
with open(output_file, "w") as f:
    yaml.dump(existing_data, f, default_flow_style=False)

print(f"Transcription appended to {output_file}")