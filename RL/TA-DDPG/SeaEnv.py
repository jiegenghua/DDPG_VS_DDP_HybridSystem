import gym
from gym import spaces
import math
import numpy as np
import pygame
from itertools import chain
class SeaEnv(gym.Env):
    metadata = {"render_modes": ["human", "rgb_array"], "render_fps": 60}

    def __init__(self, render_mode='human', size=5):
        super(SeaEnv, self).__init__()
        self.observation_space = spaces.Box(np.array([0, -10, 0]), np.array([0, 10, 2]), shape=(3, ), dtype=np.float32)
        self.action_space = spaces.Box(-10,10, shape=(1, ), dtype=np.float32)
        self.dt = 0.01

    def step(self, action):
        done = False
        info = {}
        x1 = self.state[0]
        x2 = self.state[1]
        A1 = np.array([[-1, 0], [0, 1.5]])
        #A2 = np.array([[-1, 2], [-2, -1]])
        A2 = np.array([[1, 0], [0, -1]])
        A3 = np.array([[-1, 4], [-4, - 1]])
        A4 = np.array([[-0.5, 0], [0, - 0.7]])
        A5 = np.array([[-0.5, - 5], [1, - 0.5]])
        A6 = np.array([[-1, - 5], [1, - 0.5]])
        A7 = np.array([[-1, 0], [2, -1]])
        B = np.array([1, 1])
        x = np.array([x1, x2])
        u = action[0]
        if x1 <= 3 and x1>=0 and x2>=5 and x2<=10:
            dx = np.matmul(A1, x.T)+B*u
        elif x1>=3 and x1<=7 and x2>=5 and x2<=10:
            dx = np.matmul(A2, x.T)+B*u+np.array([0, 0])
        elif x1>=7 and x2<=10 and x2>=5 and x2<=10:
            dx = np.matmul(A3, x.T)+B*u
        elif x1>=0 and x1<=3 and x2>=0 and x2<=5:
            dx = np.matmul(A4, x.T)+B*u
        elif x1>=3 and x2<=7 and x2>=0 and x2<=5:
            dx = np.matmul(A5, x.T)+B*u
        elif x1>=7 and x2<=10 and x2>=0 and x2<=5:
            dx = np.matmul(A6, x.T)+B*u
        else:
            dx = np.matmul(A7, x.T) + B * u
        dx = np.append(dx,1)
        self.state = self.state + dx*self.dt

        reward = -(u**2+x1**2+x2**2)*self.dt
        return self.state, reward, done, info

    def reset(self):
        self.state = np.array([8, 8, 0])
        return self.state