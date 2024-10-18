variable "location" {
    type = string
    default = "brazilsouth"
}

variable "tags" {
    type = map
    default = {
        "ambiente" = "desenvolvimento"
        "Integracao" = "Processo DevOps"
        "Compania" = "Aula DevOps"
        "Area" = "Marketing"
    }
}