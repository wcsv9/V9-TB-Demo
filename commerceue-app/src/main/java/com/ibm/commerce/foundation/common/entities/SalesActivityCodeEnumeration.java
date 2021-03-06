//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2015.11.16 at 11:14:39 AM CST 
//


package com.ibm.commerce.foundation.common.entities;

import com.ibm.commerce.copyright.IBMCopyright;



/**
 * <p>Java class for SalesActivityCodeEnumeration.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="SalesActivityCodeEnumeration">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}normalizedString">
 *     &lt;enumeration value="LiteratureRequest"/>
 *     &lt;enumeration value="NewLead"/>
 *     &lt;enumeration value="DeadContent"/>
 *     &lt;enumeration value="TrafficReport"/>
 *     &lt;enumeration value="Sold"/>
 *     &lt;enumeration value="EMail"/>
 *     &lt;enumeration value="Letter"/>
 *     &lt;enumeration value="Fax"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
public enum SalesActivityCodeEnumeration {

    LITERATURE_REQUEST("LiteratureRequest"),
    NEW_LEAD("NewLead"),
    DEAD_CONTENT("DeadContent"),
    TRAFFIC_REPORT("TrafficReport"),
    SOLD("Sold"),
    E_MAIL("EMail"),
    LETTER("Letter"),
    FAX("Fax");
    private final String value;

    /**
	 * IBM copyright notice field.
	 */
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = IBMCopyright.SHORT_COPYRIGHT;
	
    SalesActivityCodeEnumeration(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static SalesActivityCodeEnumeration fromValue(String v) {
        for (SalesActivityCodeEnumeration c: SalesActivityCodeEnumeration.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
