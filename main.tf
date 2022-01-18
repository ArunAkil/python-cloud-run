// Settings for the google cloud account
// Write the path to the json key giving access to the project
provider "google" {
  credentials = file("credentials.json")
  project = "python-cloud-run-338108"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

// Ressource 1: cloud run service running the docker image
// Write the path to the docker image hosted in the google container registry
// To set up this resource with Terraform, the service account key used 
// must have the appropriate permissions.
resource "google_cloud_run_service" "default" {
  name     = "demo"
  location = "europe-north1"

  template {
    spec {
      containers {
        image = "gcr.io/python-cloud-run-338108/python-image"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
