import matplotlib.pylab as plt
import numpy as np
import matplotlib


def plotting_sea(x_state, u_control):
    fig = plt.figure(1)
    ax = fig.add_subplot(111)
    rect1 = matplotlib.patches.Rectangle((0, 0), 3, 5, color='green')
    rect2 = matplotlib.patches.Rectangle((3, 0), 4, 5, color='pink')
    rect3 = matplotlib.patches.Rectangle((7, 0), 3, 5, color='yellow')
    rect4 = matplotlib.patches.Rectangle((0, 5), 3, 5, color='black')
    rect5 = matplotlib.patches.Rectangle((3, 5), 4, 5, color='tomato')
    rect6 = matplotlib.patches.Rectangle((7, 5), 3, 5, color='magenta')
    ax.add_patch(rect1)
    ax.add_patch(rect2)
    ax.add_patch(rect3)
    ax.add_patch(rect4)
    ax.add_patch(rect5)
    ax.add_patch(rect6)
    x1 = np.array([item[0] for item in x_state])
    x2 = np.array([item[1] for item in x_state])
    plt.plot(x1, x2)
    plt.xlim([0, 10])
    plt.ylim([0, 10])
    plt.show()

    plt.figure(2)
    plt.plot(u_control)
    plt.xlabel('t')
    plt.ylabel('u')
    plt.show()

def cost_sea(x_state, u_control,dt):
    x1 = np.array([item[0] for item in x_state])
    x2 = np.array([item[1] for item in x_state])
    u = np.array(u_control)
    m = len(u)
    cost = 0
    for i in range(m):
        cost +=  (x1[i]**2+x2[i]**2+u[i] ** 2) * dt
    return cost

def plotting_Multiregion(x_state, u_control):
    plt.figure(1)
    y = np.arange(-10, 10, .01)
    x = np.arange(-10, 10, .01)
    Y, X = np.meshgrid(y, x)
    maxf = np.zeros(shape=Y.shape)
    maxf.fill(-9999.99)
    for i, x_ in enumerate(x):
        for j, y_ in enumerate(y):
            if x_ < -5 and y_ < -5:
                maxf[i, j] = 4
            elif y_ >= -5 and x_ <= -2 and x_ - y_ <= 0:
                maxf[i, j] = 1
            elif x_ >= -5 and x_ - y_ > 0 and y_ <= -2:
                maxf[i, j] = 2
            elif x_ > -2 and y_ > -2:
                maxf[i, j] = 3
    plt.contourf(X, Y, maxf, [0, 1, 2, 3, 4])
    plt.colorbar()
    x_state_x = [item[0] for item in x_state]
    x_state_y = [item[1] for item in x_state]
    plt.plot(-8, -6, 'go')
    plt.plot(0, 0, 'ro')
    plt.plot(x_state_x, x_state_y, 'r--')
    plt.xlabel(r'$x_1$', fontsize=16)
    plt.ylabel(r'$x_2$', fontsize=16)
    plt.show()

    plt.figure(2)
    plt.plot(u_control)
    plt.plot(x_state_x)
    plt.plot(x_state_y)
    plt.plot(np.array([0, 200]), np.array([-2, -2]), linewidth='2')
    plt.plot(np.array([0, 200]), np.array([-5, -5]), linewidth='2')
    plt.plot()
    plt.xlabel(r'$t$', fontsize=16)
    plt.ylabel(r'$u,x1,x2$', fontsize=16)
    plt.show()
def cost_multipleRegion2(x_state, u_control,dt):
    x1 = np.array([item[0] for item in x_state])
    x2 = np.array([item[1] for item in x_state])
    u = np.array(u_control)
    m = len(u)
    cost = 0
    for i in range(m):
        if x2[i] < -5 and x1[i] < -5:
            cost += 0.5 * (x1[i] ** 2 + x2[i] ** 2 + u[i] ** 2) * dt
        elif x2[i] >= -5 and x1[i] <= -2 and x1[i] - x2[i] <= 0:
            cost += 0.5 * (x1[i] ** 2 + x2[i] ** 2 + u[i] ** 2) * dt
        elif x1[i] >= -5 and x1[i] - x2[i] > 0 and x2[i] <= -2:
            cost += 5 * (x1[i] ** 2 + x2[i] ** 2 + u[i] ** 2) * dt
        elif x1[i] > -2 and x2[i] > -2:
            cost += 0.5 * (x1[i] ** 2 + x2[i] ** 2 + u[i] ** 2) * dt
    return cost

def cost_multipleRegion(x_state, u_control,dt):
    x1 = np.array([item[0] for item in x_state])
    x2 = np.array([item[1] for item in x_state])
    u = np.array(u_control)
    m = len(u)
    cost = 0
    for i in range(m):
        cost += 0.5 * (x1[i] ** 2 + x2[i] ** 2 + u[i] ** 2) * dt
    return cost
