# Introduction

Create a container with Ansible installed. The main reason for creating and
using this container is to make it easier for users to use Ansible out of the
box rather than having to worry about installing it first.

# Use the Container

The container is built so that a directory containing all the Ansible stuff
(playbooks, roles, etc.) is mounted to the path */srv/ansible* in the
container. This is why the working directory, by default, is */srv/ansible*.

The *examples* directory has a Docker Compose file for how to use the
container. The example expects a directory called *ansible* on the host which
is mounted in the container.

Once the container is running, run ``docker exec`` (or equivalent) and start
using Ansible the way you would were it installed anywhere else.
