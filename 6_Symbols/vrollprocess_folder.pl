# Path to your .mov file
# Execute > cd 6_Symbols
# Execute > pip install whisper ffmpeg-python
# Execute > python /workspaces/whisper/6_Symbols/vrollprocess_folder.pl
import subprocess
import datetime
import yaml
import os
import whisper

# Path to your folder containing .mov files
mov_file_folder = "/workspaces/whisper/6_Symbols/vroll_dec1.1"
audio_file = "/workspaces/whisper/6_Symbols/temp_audio.wav"
output_file = f"/workspaces/whisper/6_Symbols/transcription_{datetime.date.today()}.yaml"

# Load the Whisper model
model = whisper.load_model("base")  # Use 'small', 'medium', or 'large' for more accuracy

# Function to transcribe a single .mov file
def transcribe_mov_file(mov_file):
    print(f"🔍 Extracting audio from {mov_file}...")
    # Extract audio using ffmpeg and overwrite the existing WAV file
    subprocess.run(["ffmpeg", "-y", "-i", mov_file, "-ar", "16000", "-ac", "1", "-q:a", "3", "-acodec", "pcm_s16le", audio_file], check=True)
    print(f"🎧 Audio extracted to {audio_file}")

    print("📝 Transcribing audio...")
    # Transcribe the audio file
    result = model.transcribe(audio_file)
    print("✅ Transcription complete")

    # Prepare the transcription data
    transcription_data = {
        "file_name": mov_file,
        "transcription": result["text"]
    }

    return transcription_data

# Load existing transcriptions if the file exists
if os.path.exists(output_file):
    with open(output_file, "r") as f:
        existing_data = yaml.safe_load(f)
        if not isinstance(existing_data, list):
            existing_data = []
else:
    existing_data = []

# Find all .mov files in the specified folder
print(f"🔍 Searching for .mov files in {mov_file_folder}...")
for root, dirs, files in os.walk(mov_file_folder):
    for file in files:
        if file.lower().endswith(".mov"):
            mov_file = os.path.join(root, file)
            print(f"📂 Found {mov_file}")
            transcription_data = transcribe_mov_file(mov_file)
            existing_data.append(transcription_data)
        else:
            print(f"❌ No .mov files found in {root}")

# Write the updated data back to the YAML file
with open(output_file, "w") as f:
    yaml.dump(existing_data, f, default_flow_style=False)

print(f"📄 Transcriptions appended to {output_file}")


