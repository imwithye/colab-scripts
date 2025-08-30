Colab Scripts
---

Handy scripts to help you make the most of Google Colab.

## Useful Tools and Libraries

```
curl -sSL https://raw.githubusercontent.com/imwithye/colab-scripts/refs/heads/main/install.sh | bash
```

## ComfyUI

```python
!curl -sSL https://raw.githubusercontent.com/imwithye/colab-scripts/refs/heads/main/install.sh | bash -s -- comfyui

from google.colab import output
output.serve_kernel_port_as_iframe(8188, height='960')
```
