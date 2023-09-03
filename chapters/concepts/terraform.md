# terraform

By [terraforming the machine](https://github.com/kamangir/awesome-bash-cli/blob/main/bash/modules/terraform.sh), `giza` ensures that the [core](./core.md) is initialized in every future interaction with the machine. For example, depending on the application, it may be necessary that the [core](./core.md) is initialized when the machine is rebooted or when an interactive ssh or bash session starts.

Terraforming generally includes a modification of `bashrc`, `bash_profile`, `screenrc`, and `desktop` files.
