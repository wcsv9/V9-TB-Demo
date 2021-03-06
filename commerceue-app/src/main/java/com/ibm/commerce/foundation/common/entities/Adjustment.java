//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2015.11.16 at 11:14:39 AM CST 
//


package com.ibm.commerce.foundation.common.entities;

import com.ibm.commerce.copyright.IBMCopyright;



/**
 * Type definition of an adjustment.
 * 
 * <p>Java class for Adjustment complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Adjustment">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Usage" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="CalculationCodeID" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}CalculationCodeIdentifier" minOccurs="0"/>
 *         &lt;element name="Code" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="Description" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}Description" minOccurs="0"/>
 *         &lt;element name="Amount" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}MonetaryAmount" minOccurs="0"/>
 *         &lt;element name="DisplayLevel" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}DisplayLevelType" minOccurs="0"/>
 *         &lt;element name="IsPromotionCodeRequired" type="{http://www.w3.org/2001/XMLSchema}boolean" minOccurs="0"/>
 *         &lt;element name="PromotionType" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element ref="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}UserData" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
public class Adjustment {

	/**
	 * IBM copyright notice field.
	 */
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = IBMCopyright.SHORT_COPYRIGHT;
	
    protected String usage;
    protected CalculationCodeIdentifier calculationCodeID;
    protected String code;
    protected Description description;
    protected MonetaryAmount amount;
    protected String displayLevel;
    protected Boolean isPromotionCodeRequired;
    protected String promotionType;
    protected UserData userData;

    /**
     * Gets the value of the usage property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUsage() {
        return usage;
    }

    /**
     * Sets the value of the usage property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUsage(String value) {
        this.usage = value;
    }

    /**
     * Gets the value of the calculationCodeID property.
     * 
     * @return
     *     possible object is
     *     {@link CalculationCodeIdentifier }
     *     
     */
    public CalculationCodeIdentifier getCalculationCodeID() {
        return calculationCodeID;
    }

    /**
     * Sets the value of the calculationCodeID property.
     * 
     * @param value
     *     allowed object is
     *     {@link CalculationCodeIdentifier }
     *     
     */
    public void setCalculationCodeID(CalculationCodeIdentifier value) {
        this.calculationCodeID = value;
    }

    /**
     * Gets the value of the code property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCode() {
        return code;
    }

    /**
     * Sets the value of the code property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCode(String value) {
        this.code = value;
    }

    /**
     * Gets the value of the description property.
     * 
     * @return
     *     possible object is
     *     {@link Description }
     *     
     */
    public Description getDescription() {
        return description;
    }

    /**
     * Sets the value of the description property.
     * 
     * @param value
     *     allowed object is
     *     {@link Description }
     *     
     */
    public void setDescription(Description value) {
        this.description = value;
    }

    /**
     * Gets the value of the amount property.
     * 
     * @return
     *     possible object is
     *     {@link MonetaryAmount }
     *     
     */
    public MonetaryAmount getAmount() {
        return amount;
    }

    /**
     * Sets the value of the amount property.
     * 
     * @param value
     *     allowed object is
     *     {@link MonetaryAmount }
     *     
     */
    public void setAmount(MonetaryAmount value) {
        this.amount = value;
    }

    /**
     * Gets the value of the displayLevel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDisplayLevel() {
        return displayLevel;
    }

    /**
     * Sets the value of the displayLevel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDisplayLevel(String value) {
        this.displayLevel = value;
    }

    /**
     * Gets the value of the isPromotionCodeRequired property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isIsPromotionCodeRequired() {
        return isPromotionCodeRequired;
    }

    /**
     * Sets the value of the isPromotionCodeRequired property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setIsPromotionCodeRequired(Boolean value) {
        this.isPromotionCodeRequired = value;
    }

    /**
     * Gets the value of the promotionType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPromotionType() {
        return promotionType;
    }

    /**
     * Sets the value of the promotionType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPromotionType(String value) {
        this.promotionType = value;
    }

    /**
     * The user data area.
     * 
     * @return
     *     possible object is
     *     {@link UserData }
     *     
     */
    public UserData getUserData() {
        return userData;
    }

    /**
     * Sets the value of the userData property.
     * 
     * @param value
     *     allowed object is
     *     {@link UserData }
     *     
     */
    public void setUserData(UserData value) {
        this.userData = value;
    }

}
