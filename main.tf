resource "confluent_kafka_cluster" "kafka_clusters" {
  for_each = var.kafka_clusters

  availability        = each.value.availability
  cloud               = each.value.cloud
  display_name        = each.value.display_name
  region              = each.value.region
  deletion_protection = each.value.deletion_protection

  environment {
    id = each.value.environment.id
  }

  dynamic "basic" {
    for_each = each.value.basic != null ? each.value.basic : []
    content {
      max_ecku = basic.value.max_ecku
    }
  }

  dynamic "byok_key" {
    for_each = each.value.byok_key != null ? [each.value.byok_key] : []
    content {
      id = byok_key.value.id
    }
  }

  dynamic "dedicated" {
    for_each = each.value.dedicated != null ? [each.value.dedicated] : []
    content {
      cku            = dedicated.value.cku
      encryption_key = dedicated.value.encryption_key
    }
  }

  dynamic "enterprise" {
    for_each = each.value.enterprise != null ? each.value.enterprise : []
    content {
      max_ecku = enterprise.value.max_ecku
    }
  }

  dynamic "freight" {
    for_each = each.value.freight != null ? each.value.freight : []
    content {
      max_ecku = freight.value.max_ecku
    }
  }

  dynamic "network" {
    for_each = each.value.network != null ? [each.value.network] : []
    content {
      id = network.value.id
    }
  }

  dynamic "standard" {
    for_each = each.value.standard != null ? each.value.standard : []
    content {
      max_ecku = standard.value.max_ecku
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      update = timeouts.value.update
    }
  }
}

