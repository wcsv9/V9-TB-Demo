//<%--
//********************************************************************
//*-------------------------------------------------------------------
//* Licensed Materials - Property of IBM
//*
//* WebSphere Commerce
//*
//* (c) Copyright IBM Corp.  2008, 2009
//* All Rights Reserved
//*
//* US Government Users Restricted Rights - Use, duplication or
//* disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//*
//*-------------------------------------------------------------------
//*
//--%>

/**
 * @fileOverview This file declares the contexts of the store locator.
 *
 * @version 1.0
 *
 */


/**
 * The functions defined in the class are used to initialize the common parameters of the contexts and set the 
 * properties of a specific context.
 *
 * @class This StoreLocatorContextsJSStore class defines all the variables and functions for manipuating the contexts
 * of the store locator.
 *
 */
StoreLocatorContextsJSStore = {
    /* common paramater declarations */
    langId: "-1",
    storeId: "",
    catalogId: "",
    orderId: "",
    fromPage: "StoreLocator",

    /**
     * This function initializes the common parameters. 
     *
     * @param {String} langId The language ID. 
     * @param {String} storeId The store ID.
     * @param {String} catalogId The catalog ID.
     * @param {String} orderId The order ID.
     * @param {String} fromPage The constants indicates what the calling page is.
     *
     */
    setCommonParameters: function (langId, storeId, catalogId, orderId, fromPage) {
        this.langId = langId;
        this.storeId = storeId;
        this.catalogId = catalogId;
        this.orderId = orderId;
        this.fromPage = fromPage;
    },

    /**
     * This function sets a property of a context. 
     *
     * @param {String} contextId The context identifier. 
     * @param {String} property The property name.
     * @param {String} value The property value.
     *
     */
    setContextProperty: function (contextId, property, value) {
        wcRenderContext.getRenderContextProperties(contextId)[property] = value;
    }

}


/* context declaration for "provinceSelectionsContext" */
wcRenderContext.declare("provinceSelectionsContext", ["provinceSelections"], ""),

    /* context declaration for "citySelectionsContext" */
    wcRenderContext.declare("citySelectionsContext", ["citySelections"], ""),

    /* context declaration for "storeLocatorResultsContext" */
    wcRenderContext.declare("storeLocatorResultsContext", ["storeLocatorResults"], ""),

    /* context declaration for "selectedStoreListContext" */
    wcRenderContext.declare("selectedStoreListContext", ["selectedStoreList"], "")
