# Numerical Stroop Task Experiment and Behavioral Data Analysis

## Overview

This project presents a Numerical Stroop Task designed in OpenSesame and analyzed in both MATLAB and Python. 
The task was used to investigate cognitive interference effects by comparing behavioral performance across different stimulus conditions.

The Numerical Stroop effect reflects the conflict between automatic and task-relevant processing. 
In this task, participants identified the numerically larger digit while ignoring its physical size. 
This makes the paradigm useful for studying cognitive control, interference processing, and reaction time differences across conditions.

## Objective

The aim of this project was to:
- design and run a behavioral experiment using OpenSesame
- collect reaction time data from participants
- clean and analyze the dataset
- visualize performance across conditions
- reproduce the analysis in both MATLAB and Python

## Experiment Design

Participants completed a Numerical Stroop task with three conditions:

- Congruent: numerical value and physical size matched
- Incongruent: numerical value and physical size conflicted
- Neutral: comparison without congruency conflict

A total of 6 participants completed the task.

## Measures

The main behavioral measures were:
- Reaction time
- Accuracy

The analysis shown in this repository focuses on **reaction times for correct responses**.

## Tools Used
- OpenSesame for task design and experiment implementation
- MATLAB for behavioral data analysis and visualization
- Python for reproducing the same analysis workflow in a second programming environment

## Repository Structure
```text

numerical-stroop-task/
├── data/                # anonymized participant CSV files
├── experiment/          # OpenSesame experiment file
├── results/             # generated plots and visual outputs
│   ├── all_participants/
│   ├── group_comparison/
│   └── individual/
├── scripts/
│   ├── main_analysis.m
│   ├── stroop_analysis.py
│   └── stroop_analysis.ipynb
└── README.md