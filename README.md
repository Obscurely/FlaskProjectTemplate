# Template Project: Python Flask Web App

This project is a template for building modern web applications using Python
with Flask, Tailwindcss, DaisyUI, HTMX, and Alpine.js. The goal is to enable
fast development of performant, modern websites with minimal need for knowledge
of CSS or JavaScript.

## Why These Technologies

### Python with Flask

Flask is a lightweight, easy-to-use micro web framework for Python. It's perfect
for small to medium web applications and with its minimalistic design, it
encourages modularity and reusability.

### Tailwindcss

Tailwindcss is a utility-first CSS framework that allows developers to style
their sites quickly without ever leaving their HTML. It minimizes the time spent
writing and maintaining CSS.

### DaisyUI

DaisyUI extends Tailwindcss by providing beautifully designed UI components. It
saves development time without sacrificing aesthetics, making it easier to build
attractive interfaces quickly.

### HTMX

HTMX allows you to access AJAX, CSS Transitions, WebSockets and more, directly
in your HTML, making it simpler to add dynamic content to web pages without
writing complex JavaScript.

### Alpine.js

Alpine.js offers you the reactivity and declarative nature of big frameworks
like Vue or React at a much lower cost. It’s perfect for adding simple
interactive elements to web pages.

By combining Flask with these front-end tools, you can quickly prototype and
build applications that are both attractive and interactive, all with minimal
coding effort involved in CSS and JavaScript.

## Prerequisites

Ensure you have Nix installed on your machine to handle packages and
environments:

- Install Nix: Follow the instructions at
  [NixOS.org](https://nixos.org/download.html).

## Set Up Development Environment

To set up and enter the development environment:

```bash
nix develop
```

The `flake.nix` file in the repository automatically handles the creation of a
development environment with all the necessary dependencies for both backend and
frontend development. This includes Python, Flask, and Node.js among other
necessary tools.

## Running The Application

Once inside the Nix shell all you have to do is go over to
[localhost:5000](http://localhost:5000) and view the application. Any changes
you make to the python will be automatically reflected on the page without the
need of refreshing. Any changes made to the templates will require a refresh.
Implementing something to work like liveserver is possilbe, but harder.

## Check for Dependency Updates

The Nix flakes system will check for the latest versions of tools (not python or
web dependencies) whenever you run:

```bash
nix flake update
```

This command updates the `flake.lock` file with the new dependency versions,
ensuring you are always working with the latest packages.

## Conclusion

This template project leverages a sophisticated stack to simplify web
development. By automating environment management and dependency updates and
combining powerful tools that minimize the need to write extensive CSS or
JavaScript, it enables fast, efficient creation of high-quality web
applications.
