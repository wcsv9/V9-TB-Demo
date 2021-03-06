//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2015.11.16 at 11:14:39 AM CST 
//


package com.ibm.commerce.order.entities;

import com.ibm.commerce.copyright.IBMCopyright;



/**
 * <p>Java class for OrderItemLifeCycleStatusEnumeration.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="OrderItemLifeCycleStatusEnumeration">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}normalizedString">
 *     &lt;enumeration value="P"/>
 *     &lt;enumeration value="E"/>
 *     &lt;enumeration value="X"/>
 *     &lt;enumeration value="C"/>
 *     &lt;enumeration value="M"/>
 *     &lt;enumeration value="L"/>
 *     &lt;enumeration value="B"/>
 *     &lt;enumeration value="A"/>
 *     &lt;enumeration value="R"/>
 *     &lt;enumeration value="S"/>
 *     &lt;enumeration value="D"/>
 *     &lt;enumeration value="F"/>
 *     &lt;enumeration value="G"/>
 *     &lt;enumeration value="H"/>
 *     &lt;enumeration value="W"/>
 *     &lt;enumeration value="N"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
public enum OrderItemLifeCycleStatusEnumeration {


    /**
     * Order item is in shopping cart.
     * 
     */
    P,

    /**
     * Order item is editing.
     * 
     */
    E,

    /**
     * Order item is canceled.
     * 
     */
    X,

    /**
     * Payment is authorized.
     * 
     */
    C,

    /**
     * Order item is submitted.
     * 
     */
    M,

    /**
     * Order item is low inventory.
     * 
     */
    L,

    /**
     * Order item is back ordered.
     * 
     */
    B,

    /**
     * Payment review is needed.
     * 
     */
    A,

    /**
     * Order item is released to fulfillment.
     * 
     */
    R,

    /**
     * Order item is shipped.
     * 
     */
    S,

    /**
     * Order item is deposited.
     * 
     */
    D,

    /**
     * Order item is ready for remote fulfillment.
     * 
     */
    F,

    /**
     * Order item is pending remote fulfillment.
     * 
     */
    G,

    /**
     * Order item remote fulfillment failed.
     * 
     */
    H,

    /**
     * Order item is pending buyer approval.
     * 
     */
    W,

    /**
     * Order item is rejected by buyer administrator.
     * 
     */
    N;

    /**
	 * IBM copyright notice field.
	 */
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = IBMCopyright.SHORT_COPYRIGHT;
	
    public String value() {
        return name();
    }

    public static OrderItemLifeCycleStatusEnumeration fromValue(String v) {
        return valueOf(v);
    }

}
