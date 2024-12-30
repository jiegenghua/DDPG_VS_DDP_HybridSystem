import gym
from gym import spaces
import math
import numpy as np
import pygame

class MultiregionEnv(gym.Env):
    metadata = {"render_modes": ["human", "rgb_array"], "render_fps": 60}

    def __init__(self, render_mode='human', size=5):
        super(MultiregionEnv, self).__init__()
        self.observation_space = spaces.Box(np.array([-10, -10, 0]), np.array([10, 10, 2]), shape=(3, ), dtype=np.float32)
        self.action_space = spaces.Box(-10, 10, shape=(1,), dtype=np.float32)
        self.dt = 0.01
    def step(self, action):
        done = False
        info = {}
        A1 = np.array([[-1, 2],
                       [-2, -1]])
        A2 = np.array([[-1, -2],
                       [1, -0.5]])
        A3 = np.array([[-0.5, -5],
                       [1, -0.5]])
        A4 = np.array([[-1, 0],
                       [2, -1]])
        B = np.array([1, 1])
        x1 = self.state[0]
        x2 = self.state[1]

        u = action[0]
        x = np.array([x1, x2])
        if x2 < -5 and x1 < -5:
            dx = np.matmul(A1, x.T)+B*u
        elif x2 >= -5 and x1 <= -2 and x1-x2 <= 0:
            dx = np.matmul(A2, x.T)+B*u
        elif x1 >= -5 and x1-x2 > 0 and x2 <= -2:
            dx = np.matmul(A3, x.T)+B*u
        else:
            dx = np.matmul(A4, x.T)+B*u
        dx = np.append(dx, 1)
        self.state = self.state + dx*self.dt
        reward = -(0.5*((x1)**2+(x2)**2+(u)**2))*self.dt
        return self.state, reward, done, info

    def reset(self):
        self.state = np.array([-8, -6, 0])
        return self.state
