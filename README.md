Colab Scripts
---

Handy scripts to help you make the most of Google Colab.

## Useful Tools and Libraries

```
!curl -sSL https://colab-scripts.yiwei.dev | bash
```

## ComfyUI

```
!curl -sSL https://colab-scripts.yiwei.dev | bash -s -- comfyui
```

Then to show it on the UI

```python
from google.colab import output
output.serve_kernel_port_as_iframe(8188, height='960')
```

## KASM VNC Server

```
!curl -sSL https://colab-scripts.yiwei.dev | bash -s -- kasm
```

KASM VNC Server requires manual setup. Please follow the instructions provided in the output. If you need create a window from the Jupyter Notebook, use

```python
import os

os.environ["DISPLAY"] = ":1"
```

## Xvfb VNC

```
!curl -sSL colab-scripts.yiwei.dev | bash -s -- xvfb
```

Then to show it on the UI

```python
from google.colab import output
output.serve_kernel_port_as_iframe(6080, path='/vnc.html', height='960')
```

If you need create a window from the Jupyter Notebook, use

```python
import os

os.environ["DISPLAY"] = ":1"
```
