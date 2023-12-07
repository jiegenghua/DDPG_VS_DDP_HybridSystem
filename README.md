# DDPG_VS_DDP_HybridSystem
## This repo holds all the data and code of the following project: "Finite Horizon Deep Deterministic Policy Gradient Method in Solving Optimal Control of State-Dependent Switched Systems".
### There are three environments: multiple region, multiple region with switched stage cost, and sea model
### The DDP algorithm is the widely used one, while here we added an event detection for the algorithm to be aware of the switch of the dynamics and stage cost. The code is in the DDP folder.
### For the DDPG, if you are using the Ubuntu system, you can run the code with the following command:
```python train_DDPG.py```

Please refer to the paper for more details.



