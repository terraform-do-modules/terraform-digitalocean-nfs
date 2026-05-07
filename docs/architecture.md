
# terraform-digitalocean-nfs --- Architecture

## Overview

This module provisions DigitalOcean NFS resources and related optional components. It exposes NFS creation, performance tier selection, optional VPC attachment, and optional snapshot creation through a single, composable interface.

---

## What NFS Is

DigitalOcean NFS provides a shared network file system that can be mounted by workloads inside a VPC. It is useful for applications that need shared, persistent file storage across multiple compute resources.

This module creates the NFS resource in a specified region and VPC, and can optionally create:

- an NFS attachment resource
- an NFS snapshot resource

---

## Core Resource Creation

The primary resource created by this module is the NFS filesystem itself.

Key inputs for creation:

- `region` defines where the NFS resource is created
- `size` defines the provisioned storage size in GiB
- `vpc_id` defines the VPC in which the NFS resource is created
- `performance_tier` defines the performance level of the NFS resource

Example:

```hcl
module "nfs" {
  source = "./modules/nfs"

  name             = "app"
  environment      = "prod"
  region           = "blr1"
  size             = 100
  vpc_id           = "vpc-xxxx"
  performance_tier = "high"
}

```

* * * * *

Naming and Labels
-----------------

The module supports a standard label pattern using:

-   `name`

-   `environment`

-   `label_order`

-   `managedby`

-   `extra_tags`

These inputs help maintain consistent resource naming and tagging across environments.

Example:

```
name        = "app"
environment = "prod"
label_order = ["name", "environment"]
managedby   = "hello@clouddrove.com"

extra_tags = {
  team = "platform"
  cost = "shared-storage"
}

```

* * * * *

Performance Tier
----------------

The `performance_tier` variable controls the performance profile of the NFS resource.

```
performance_tier = "high"

```

Use a higher tier for workloads that require stronger throughput or lower latency. Choose the tier based on the application access pattern, expected concurrency, and performance requirements.

The configured value is exposed through the `nfs_performance_tier` output.

* * * * *

Optional Attachment
-------------------

Set `enable_attachment = true` to create an NFS attachment resource.

This is useful when you want to explicitly attach or associate the NFS resource using a separate VPC context.

Inputs used for attachment:

-   `enable_attachment`

-   `attachment_vpc_id`

Example:

```
enable_attachment = true
attachment_vpc_id = "vpc-yyyy"

```

When enabled, the module exposes the created attachment ID through the `attachment_id` output.

* * * * *

Optional Snapshot
-----------------

Set `enable_snapshot = true` to create an NFS snapshot resource.

Snapshots can be used for backup, recovery, or point-in-time retention workflows.

Example:

```
enable_snapshot = true

```

When enabled, the created snapshot ID is available through the `snapshot_id` output.

* * * * *

Conditional Resource Creation
-----------------------------

The module supports a global enable switch:

```
enabled = true

```

Set `enabled = false` to prevent the module from creating any resources. This is useful when you want to preserve configuration structure across environments but selectively disable provisioning.

Optional sub-resources are also controlled independently:

-   `enable_attachment`

-   `enable_snapshot`

This allows the base NFS resource to be created with or without the optional attachment and snapshot resources.

* * * * *

Outputs
-------

The module exposes the following outputs for downstream use:

-   `nfs_id` --- ID of the NFS resource

-   `nfs_host` --- hostname or endpoint of the NFS resource

-   `nfs_mount_path` --- mount path for the NFS resource

-   `nfs_status` --- current status of the NFS resource

-   `nfs_performance_tier` --- configured performance tier

-   `snapshot_id` --- snapshot ID, when snapshot creation is enabled

-   `attachment_id` --- attachment ID, when attachment creation is enabled

These outputs can be passed into other modules, provisioning workflows, or post-deployment automation.

* * * * *

Example Usage
-------------

Basic NFS:

```
module "nfs" {
  source = "./modules/nfs"

  name             = "app"
  environment      = "dev"
  region           = "blr1"
  size             = 50
  vpc_id           = "vpc-xxxx"
  performance_tier = "high"
}

```

NFS with attachment and snapshot:

```
module "nfs" {
  source = "./modules/nfs"

  name               = "app"
  environment        = "prod"
  region             = "blr1"
  size               = 100
  vpc_id             = "vpc-xxxx"
  performance_tier   = "high"
  enable_attachment  = true
  attachment_vpc_id  = "vpc-yyyy"
  enable_snapshot    = true
}

```

* * * * *

Operational Checklist
---------------------

-   Set `enabled = true` only in environments where the NFS resource should be provisioned.
-   Use a consistent `name` and `environment` pattern for predictable resource naming.
-   Select `performance_tier` based on workload requirements rather than defaulting blindly.
-   Size the filesystem appropriately with `size` to avoid early resizing operations.
-   Ensure `vpc_id` is correct for the workloads that need network access to the NFS resource.
-   Enable `enable_snapshot = true` when backup or recovery workflows are required.

-   Enable `enable_attachment = true` only when attachment behavior is needed by the deployment design.

-   Use `extra_tags` to improve ownership, cost tracking, and operational visibility.
-   Consume outputs such as `nfs_host` and `nfs_mount_path` in compute modules or mount automation.
