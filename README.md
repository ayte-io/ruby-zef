# WIP project

This project is under active development and not yet usable.

# What is Zef?

Zef is a framework for an opinionated Chef / Knife Zero usage. TL;DR: 

- Use YAML instead of JSON
- Describe nodes in YAML as well
- Use ssh-then-run-against-chef-zero approach (using Knife Zero) 
instead of having centralized node
- Do not rely on stored attributes, perform every run as first

## Installation

```bash
gem install zef
```

## Directory structure

```
nodes
cookbooks
data-bags # or dataBags, or data_bags
environments # or just envs
roles
zef.yml
```

## zef.yml

Configuration file determines repository root. Currently, all 
configuration options are optional, so you can just put an empty file
in repository root.

```yaml
schema: v1
paths:
  repository: repository
  cookbooks: [cookbooks]
  nodes: [nodes]
  dataBags: [data-bags, data_bags, dataBags]
  roles: [roles]
  environments: [environments, envs]
```

## <node-id>.yml

Describes single node. Provided settings are merged into attributes
before convergence. Hostname is not used (but you can pick it up in 
your recipe as `node['zef']['node']['hostname']`), address used for 
node connection.

```yaml
schema: v1
hostname: <fqdn:string, optional, default: id>
address: <ip address:string, optional, default: id>
runList: [<string>]
```

## Commands

### build

Alias for `build repository`

#### build repository

Builds entire Chef repository, rendering YAML files and installing
dependencies:

```bash
zef build repository
zef build repository <target-directory>
zef build repository <source-directory> <target-directory>
```

Any found cookbooks are built in process as well.

#### build cookbook

Builds cookbook from source, rendering YAML attributes/metadata into
.rb files:

```bash
zef build cookbook
zef build cookbook <target-directory>
zef build cookbook <source-directory> <target-directory>
```

If source or target directory is not set, it is presumed to be current
directory, meaning that cookbook may be built in-place.

### converge

Converges node with specified id. Performs repository build unless 
explicitly skipped.

```bash
zef converge <node id> [--skip-build]
```
