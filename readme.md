
# 🚀 Degreed Technical Challenge 🚀

The repository implements the specification of the [Degreed technical challenge](https://github.com/degreed/devops_cloud_engineer_challenge). 

## 🏠 Repository Structure

```
.
├── terraform
│   ├── applications
│   │   ├── cluster
│   │   └── services
│   └── modules
│       └── AKS
├── Makefile
├── readme.md
└── test
```

## ‍🔧 Prerequisites

You will need the following installed prerequisites:

### For Deploying

- [Make](https://www.gnu.org/software/make/manual/make.html)
- [Kubernetes CLI](https://kubernetes.io/docs/tasks/tools/)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)


## 🏃 Running 

### 👷‍♂️ Deploying the service

1. Ensure you are logged in to the requisite Azure Subscription. (`az login`)
    - Note: If logged in to more than one Subscription, use `az account set --subscription="SUBSCRIPTION_ID"` to specify a Subscription.

2. Run `make init`. This will initialize terraform and create required directories. 

3. Run `make plan`. This will run `terraform plan` and store the plan file.

4. Run `make apply`. This will deploy the infrastructure to the logged-in subscription. Ensure to validate the changes in the plan file.

### 🛠️ Testing

There is a single `terratest` created as a quick validation. 

1. Run `make test`. This will execute the test.

### 🧹 Linting

Linting is managed by `tflint`. The default linter and Azure ruleset are installed.

1. Run `make lint`. This will first validate the terraform plan, and then run the linter.

## 🔍‍ Useful Commands

Running `make apply` will generate a `kubeconfig` file, which we can use to run `kubectl`.

The `kubeconfig` file is exported to the project root to enable ease-of-usage.

Ensure the `KUBECONFIG` environment variable is set to the required path. Ie, from the repository root directory `export KUBECONFIG=./kubeconfig`.

### To get external service port

1. `kubectl get service --namespace=cluster gobuffapp --watch`