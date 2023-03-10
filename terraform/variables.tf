variable project_id {
    type = string
    description = "Project ID to deploy resources to."
}

variable region {
    type = string
    description = "Region to deploy regional infrastructure to."
}

variable zone {
    type = string
    description = "Zone to deploy zonal infrastructure to."
}

variable notebook_users {
    type = list(string)
    description = "Principals that should be allowed to access notebook"
}

variable organization_id {
    type = string
    description = "Organization ID for removing blocking organization policies on project level"
}

variable notebook_image_repository {
    type = string
    description = "Repository for container image to use for the web ui notebook."
}

variable notebook_image_tag {
    type = string
    description = "Tag for container image to use for the web ui notebook."
}