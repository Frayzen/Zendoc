---
title: "Leson 1"
---
Last edited time: May 14, 2024 9:17 PM

# Table of content

# DevOps Concepts

DevOps means development and operations. The whole point is to have a long-term vision of the code base.

DevOps is a really wide apelation and there is a lot of jobs hidden behind the scene.

## Development

- Creating code, applications
- A will to introduces changes
- Work env: laptop, IDE…

## Operations

- Ensure services are working and available
- A will to not break anything
- Work env: servers/VMs, text editor and sshp

## Dev POV

The dev POV is their laptop (with their OS, libs, env, specs…). We can question how to ship the product to production ? Especially since the Dev can introduce architectural changes, new dependencies etc...

## Ops POV

The Ops team need to understand how it works without taking ages. It needs to update and deploy easily the app. It also need to make sure it works well and create a difference dev and prod environment (handle secrets / configs for example).

## Devs / Ops relation

- **CEO:** the chief executive officer, the head of the whole company
- **CTO:** the chief technique officer, the head of the technical aspect of the company
- **Sales:** the team in charge of the marketing. Their main objective is to find new clients. They are the one that need to “feel” the market and find which direction the service should take.
- **Product:** the team in charge of the service design / look / usage
- **Devs:** the team in charge of the development of the service.
- **QAs (Quality Assurance):** the team in charge of finding the bugs in the service.
- **Ops:** the team in charge of managing the production and maintenance of the service.
- Smaller teams:
    - Archi
    - Security
    - …

## In concrete

- DevOps is a set of **tools and practice**, some tools are so **popuplar** they became new **standards**.
- Aim to reduce - *even remove* - friction between Devs and Ops
- Devs are doing a bit of Ops and Ops a bit of Dev
- DevOps is not **really** a job

A lot of people from the Ops world come used to be developer that worked on Ops on their freetime.

  

## Service’s lifecycle

- In local, on the machine.

→ Test

- Staging: a platform, a simulation of the production to find out the bugs.

→ RC (release candidate)

- QA, PPR, SBX sandbox :  a platform to test bugs

→ Release

- Prod: the actual working service

<aside>
💡 In case of an incident we do an **RCA** (root cause analyses) to find the **RC** (root cause), we **patch** the issue and create a **fix**

</aside>

<aside>
💡 The **time to market** is the amount of time it takes between the implementation of a feature and its deployment in production.

</aside>

## Concept: 12 Factors

### Goal

- Be as declarative as possible
- Understand interactions between app and system.
- No divergence between dev and prod
- Try to be platform agnostic
- Be able to scale up/down

### The factors

1. **CodeBase:** one codebase tracked in revision control, many deploys
2. **Dependencies:** Explicitly declare and isolate dependecies
3. **Config**: Store config in the environment
4. **Port binding:** expose services via port binding
5. **Dev/prod parity:** keep development staging and production as similar as possible

…

It is very good clues but **not the magical solution**.

<aside>
💡 DevOps is about mentatlity and tools !

</aside>

# DevOps tools

## YAML

YAML is widely used to create configurations.

The 3d article of the 12 factors implies the strict separation of config from code.

<aside>
💡 This means that the configuration should **not** be within the code
→ Some people even say the code should not be in the VCS (*version control service*) but **could** and **should** be stored in another VCS.
⚠️ Be careful **not to store any secrets in plaintext** in VCS however.

</aside>

Configuration will be different between dev, staging and prod(s).

### What is configuration ?

- Everything removing genericity
- Everything that can change from an env to another

***Example:** address of the database, IP/port to bind to. Log-Level, Path(s) to store data…*

### How to provide config ?

- env variables (*recommended for simple cases but limited to key : value)*
- config files (more complex but advanced)

YAML = Yet Another Markup Language

It is used for Docker-Compose, Gitlab-CI, Kubernetes, Helm…

A superset of JSON to make it more human readable. That means that any JSON file is a valid YAML file.

It is a key value format where key are a strings and values can be other types (string, int, boolean …)

<aside>
⚠️ Indentation is important

</aside>

## Docker

## Docker compose

# Git workflow

# Observability
