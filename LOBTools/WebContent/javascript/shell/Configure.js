//********************************************************************
//*-------------------------------------------------------------------
//* Licensed Materials - Property of IBM
//*
//* WebSphere Commerce
//*
//* (c) Copyright IBM Corp. 2018
//*
//* US Government Users Restricted Rights - Use, duplication or
//* disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//*
//*-------------------------------------------------------------------
//*

var darkFeatures;

function loadDarkFeatures() {
	darkFeatures = {
		"organizationManagement":true,
		"newCatalogManagement":true,
		"userManagement":true,
		"approvalManagement":true,
		"memberGroupManagement":true,
		"testMedalliaSurvey":true,
		"testTool":true,
		"localAdminConsole":true
	};
	for (var i = 0; i < localStorage.length; i++) {
		var key = localStorage.key(i);
		if (key.indexOf("darkFeature.") == 0) {
			var featureName = key.substr("darkFeature.".length);
			var featureDisabled = localStorage.getItem(key) == "true";
			darkFeatures[featureName] = featureDisabled;
		}
	}
}

function setDarkFeature(featureName, featureEnabled) {
	if (featureName != null && featureName != "") {
		localStorage.setItem("darkFeature."+featureName, featureEnabled != "true");
	}
}

function resetDarkFeatures() {
	localStorage.clear();
}
