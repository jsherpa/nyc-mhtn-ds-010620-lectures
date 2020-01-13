#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep  4 14:25:52 2019

@author: swilson5
"""
import math
​

class Calculator:
    def __init__(self, data):
        self.data = data
        self.length = len(self.data)
        self.mean = sum(self.data) / self.length
        self.data.sort()
        if self.length % 2 == 0:
            self.median = ((self.data[int(self.length / 2)] + self.data[int(self.length / 2) - 1]) / 2)
        else:
            self.median = self.data[int(self.length / 2)]
        p1 = [((x - self.mean) ** 2) for x in self.data]
        self.variance = round((sum(p1)) / self.length, 2)
        self.stand_dev = round(math.sqrt(self.variance), 2)

    def add_data(self, new_data):
        if type(new_data) == list:
            self.data.extend(new_data)
        else:
            self.data.append(new_data)
        self.__init__(self.data)

    def remove_data(self, remove_data):
        newest = []
        for x in self.data:
            if x not in remove_data:
                newest.append(x)
        self.data = newest
        self.__init__(self.data)





