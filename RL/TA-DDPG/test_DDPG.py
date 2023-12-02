import gym
import tensorflow as tf
from tensorflow.keras import layers
import numpy as np
import matplotlib.pyplot as plt
from MultiregionEnv import MultiregionEnv
import figurePlotting
from MultiregionEnv2 import MultiregionEnv2

env = MultiregionEnv()
# load policy from trained code
def create_model():
    last_init = tf.random_uniform_initializer(minval=-0.003, maxval=0.003)
    inputs = layers.Input(shape=(3, ))
    out = layers.Dense(256, activation="relu")(inputs)
    out = layers.Dense(256, activation="relu")(out)
    outputs = layers.Dense(1, activation="tanh", kernel_initializer=last_init)(out)
    outputs = outputs*10
    model = tf.keras.Model(inputs, outputs)
    return model

model = create_model()

def policy(state):
    sampled_actions = tf.squeeze(model(state))
    sampled_actions = sampled_actions.numpy()
    legal_action = np.clip(sampled_actions, -10, 10)
    return [np.squeeze(legal_action)]

# Load the previously saved weights
checkpoint_path = "Data/policy"
model.load_weights(checkpoint_path)

gamma = 1
tau = 0.005
T = 2

# main testing
prev_state = env.reset()
count = 0
x_state = [prev_state]
u_control = []
while count < T/0.01:
    print("step:",count)
    tf_prev_state = tf.expand_dims(tf.convert_to_tensor(prev_state), 0)
    action = policy(tf_prev_state)       # get policy from trained model
    u_control.append(action[0])
    state, reward, done, info = env.step(action)
    x_state.append(state)
    prev_state = state
    count = count+1



#np.savetxt('state.csv', x_state, delimiter=',')
#np.savetxt('control.csv', u_control, delimiter=',')
figurePlotting.plotting_Multiregion(x_state,u_control)
cost = figurePlotting.cost_multipleRegion(x_state, u_control, dt=0.01)
print("Cost==>{}".format(cost))
