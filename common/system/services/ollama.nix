{ pkgs, ... }:

{
  my.allowedUnfreePkgs = [
    "cuda_cccl"
    "cuda_cudart"
    "cuda_nvcc"
    "libcublas"
  ];

  services.ollama = {
    enable = true;
    host = "[::]";
    package = pkgs.ollama-cuda;
    environmentVariables = {
      OLLAMA_DEBUG = "1";
      OLLAMA_KEEP_ALIVE = "-1";
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_KV_CACHE_TYPE = "q8_0";
      OLLAMA_CONTEXT_LENGTH = "65536";
    };
    loadModels = [
      "qwen3:14b"
      "gpt-oss:20b"
    ];
  };
}
