terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "terraform_user"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
  
}

resource "terratowns_home" "home" {
  name = "Where does the Soap come from?"
  description = <<DESCRIPTION
The creation of soap, like so many other wonderful discoveries,was likely accidental.
The prevailing story holds that on Mount Sapo, animals were burned as offerings to the gods.
After the ceremonies, the fire pits were full of ashes and animal fats.
When it rained, water ran through the ashes and fats, washing them down the river.
When the woman took their washing to the river, they found clumps of a pale, waxy substance floating in the water.
The woman washed their clothes by pounding them on the rocks. When the waxy substance was beaten with the clothes, it made a lather, and the clothes got cleaner.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.cloudfront_url
  town = "missingo"
  content_version = var.arcanum.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}  

resource "terratowns_home" "home_payday" {
  name = "How to cook perfect pasta"
  description = <<DESCRIPTION
Pastas are divided into two broad categories: dried (pasta secca) and fresh (pasta fresca).
Most dried pasta is produced commercially via an extrusion process, although it can be produced at home.
Fresh pasta is traditionally produced by hand, sometimes with the aid of simple machines.
Fresh pastas available in grocery stores are produced commercially by large-scale machines.
DESCRIPTION
  domain_name = module.home_payday_hosting.cloudfront_url
  town = "missingo"
  content_version = var.payday.content_version
}