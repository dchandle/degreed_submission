package main_test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/k8s"
	"github.com/stretchr/testify/assert"
	v1 "k8s.io/api/core/v1"
)

func TestAKSServices(t *testing.T) {

	kubeconfigPath := "../kubeconfig"
	kubectlOptions := k8s.NewKubectlOptions("", kubeconfigPath, "cluster")


	databaseServiceName := "cluster"
	databaseServicePort := int32(5432)
	
	// Assert that the database service is running as expected
	dbService := k8s.GetService(t, kubectlOptions, databaseServiceName)
	assert.NotNil(t, dbService)
	assert.Equal(t, databaseServiceName, dbService.Name)
	assert.Equal(t, v1.ServiceType("ClusterIP"), dbService.Spec.Type)
	assert.Equal(t, databaseServicePort, dbService.Spec.Ports[0].Port)

	appServiceName := "gobuffapp"
	appServicePort := int32(3000)

	// Assert that the application service is running as expected
	appService := k8s.GetService(t, kubectlOptions, appServiceName)
	assert.NotNil(t, appService)
	assert.Equal(t, appServiceName, appService.Name)
	assert.Equal(t, v1.ServiceType("LoadBalancer"), appService.Spec.Type)
	assert.Equal(t, appServicePort, appService.Spec.Ports[0].Port)
}
