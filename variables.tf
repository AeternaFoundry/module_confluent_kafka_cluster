variable "kafka_clusters" {
  description = <<EOT
Map of kafka_clusters, attributes below
Required:
    - availability
    - cloud
    - display_name
    - region
    - environment (block):
        - id (required)
Optional:
    - deletion_protection
    - basic (block):
        - max_ecku (optional)
    - byok_key (block):
        - id (required)
    - dedicated (block):
        - cku (required)
        - encryption_key (optional)
    - enterprise (block):
        - max_ecku (optional)
    - freight (block):
        - max_ecku (optional)
    - network (block):
        - id (required)
    - standard (block):
        - max_ecku (optional)
    - timeouts (block):
        - create (optional)
        - update (optional)
EOT

  type = map(object({
    availability        = string
    cloud               = string
    display_name        = string
    region              = string
    deletion_protection = optional(bool)
    environment = object({
      id = string
    })
    basic = optional(list(object({
      max_ecku = optional(number)
    })))
    byok_key = optional(object({
      id = string
    }))
    dedicated = optional(object({
      cku            = number
      encryption_key = optional(string)
    }))
    enterprise = optional(list(object({
      max_ecku = optional(number)
    })))
    freight = optional(list(object({
      max_ecku = optional(number)
    })))
    network = optional(object({
      id = string
    }))
    standard = optional(list(object({
      max_ecku = optional(number)
    })))
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

