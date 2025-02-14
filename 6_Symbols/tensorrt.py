import torch
import numpy as np
import time
from transformers import WhisperProcessor, WhisperForConditionalGeneration
import onnxruntime
import tensorrt as trt
from pathlib import Path

def convert_to_onnx(model_name="openai/whisper-tiny", output_path="whisper.onnx"):
    """Convert Whisper model to ONNX format"""
    # Load model and processor
    processor = WhisperProcessor.from_pretrained(model_name)
    model = WhisperForConditionalGeneration.from_pretrained(model_name)
    model.eval()

    # Create dummy input
    dummy_input = torch.randn(1, 80, 3000)
    
    # Export to ONNX
    torch.onnx.export(
        model,
        dummy_input,
        output_path,
        input_names=['input'],
        output_names=['output'],
        dynamic_axes={
            'input': {0: 'batch_size', 2: 'sequence_length'},
            'output': {0: 'batch_size'}
        },
        opset_version=13
    )
    return processor

def convert_onnx_to_tensorrt(onnx_path="whisper.onnx", engine_path="whisper.engine"):
    """Convert ONNX model to TensorRT engine"""
    logger = trt.Logger(trt.Logger.WARNING)
    builder = trt.Builder(logger)
    network = builder.create_network(1 << int(trt.NetworkDefinitionCreationFlag.EXPLICIT_BATCH))
    parser = trt.OnnxParser(network, logger)
    
    # Parse ONNX
    with open(onnx_path, 'rb') as model:
        parser.parse(model.read())

    # Build engine
    config = builder.create_builder_config()
    config.max_workspace_size = 1 << 30  # 1GB
    engine = builder.build_engine(network, config)
    
    # Save engine
    with open(engine_path, 'wb') as f:
        f.write(engine.serialize())

def benchmark_models(audio_input, num_runs=5):
    """Benchmark PyTorch, ONNX, and TensorRT models"""
    results = {}
    
    # PyTorch benchmark
    model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-tiny")
    model.eval()
    
    torch_times = []
    for _ in range(num_runs):
        start = time.time()
        with torch.no_grad():
            _ = model(audio_input)
        torch_times.append(time.time() - start)
    results['pytorch'] = np.mean(torch_times)
    
    # ONNX benchmark
    onnx_session = onnxruntime.InferenceSession("whisper.onnx")
    onnx_times = []
    for _ in range(num_runs):
        start = time.time()
        _ = onnx_session.run(None, {'input': audio_input.numpy()})
        onnx_times.append(time.time() - start)
    results['onnx'] = np.mean(onnx_times)
    
    # TensorRT benchmark
    TRT_LOGGER = trt.Logger(trt.Logger.WARNING)
    with open("whisper.engine", 'rb') as f:
        engine_data = f.read()
    
    runtime = trt.Runtime(TRT_LOGGER)
    engine = runtime.deserialize_cuda_engine(engine_data)
    context = engine.create_execution_context()
    
    trt_times = []
    for _ in range(num_runs):
        start = time.time()
        # Add TensorRT inference code here
        trt_times.append(time.time() - start)
    results['tensorrt'] = np.mean(trt_times)
    
    return results

def main():
    # Convert models
    processor = convert_to_onnx()
    convert_onnx_to_tensorrt()
    
    # Create sample input
    audio_input = torch.randn(1, 80, 3000)
    
    # Run benchmarks
    results = benchmark_models(audio_input)
    
    # Print results
    print("\nBenchmark Results (average inference time in seconds):")
    print(f"PyTorch: {results['pytorch']:.4f}")
    print(f"ONNX: {results['pytorch']:.4f}")
    print(f"TensorRT: {results['tensorrt']:.4f}")
    
    print("\nSpeedup Ratios:")
    print(f"ONNX vs PyTorch: {results['pytorch']/results['onnx']:.2f}x")
    print(f"TensorRT vs PyTorch: {results['pytorch']/results['tensorrt']:.2f}x")

if __name__ == "__main__":
    main()