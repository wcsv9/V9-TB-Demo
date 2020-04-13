//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2015.11.16 at 11:14:39 AM CST 
//


package com.ibm.commerce.foundation.common.entities;

import java.util.ArrayList;
import java.util.List;

import com.ibm.commerce.copyright.IBMCopyright;


/**
 * The type definition for an attachment asset.
 * 
 * <p>Java class for AttachmentAsset complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="AttachmentAsset">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="AttachmentAssetIdentifier" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}AttachmentAssetIdentifier" minOccurs="0"/>
 *         &lt;element name="StoreIdentifier" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}StoreIdentifier" minOccurs="0"/>
 *         &lt;element name="AttachmentAssetPath" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RootDirectory" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DirectoryPath" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="MimeType" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="language" type="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}LanguageType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element ref="{http://www.ibm.com/xmlns/prod/commerce/9/foundation}UserData" minOccurs="0"/>
 *       &lt;/sequence>
 *       &lt;attribute name="localAsset" type="{http://www.w3.org/2001/XMLSchema}boolean" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
public class AttachmentAsset {

	/**
	 * IBM copyright notice field.
	 */
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = IBMCopyright.SHORT_COPYRIGHT;
	
    protected AttachmentAssetIdentifier attachmentAssetIdentifier;
    protected StoreIdentifier storeIdentifier;
    protected String attachmentAssetPath;
    protected String rootDirectory;
    protected String directoryPath;
    protected String mimeType;
    protected List<String> language;
    protected UserData userData;
    protected Boolean localAsset;

    /**
     * Gets the value of the attachmentAssetIdentifier property.
     * 
     * @return
     *     possible object is
     *     {@link AttachmentAssetIdentifier }
     *     
     */
    public AttachmentAssetIdentifier getAttachmentAssetIdentifier() {
        return attachmentAssetIdentifier;
    }

    /**
     * Sets the value of the attachmentAssetIdentifier property.
     * 
     * @param value
     *     allowed object is
     *     {@link AttachmentAssetIdentifier }
     *     
     */
    public void setAttachmentAssetIdentifier(AttachmentAssetIdentifier value) {
        this.attachmentAssetIdentifier = value;
    }

    /**
     * Gets the value of the storeIdentifier property.
     * 
     * @return
     *     possible object is
     *     {@link StoreIdentifier }
     *     
     */
    public StoreIdentifier getStoreIdentifier() {
        return storeIdentifier;
    }

    /**
     * Sets the value of the storeIdentifier property.
     * 
     * @param value
     *     allowed object is
     *     {@link StoreIdentifier }
     *     
     */
    public void setStoreIdentifier(StoreIdentifier value) {
        this.storeIdentifier = value;
    }

    /**
     * Gets the value of the attachmentAssetPath property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAttachmentAssetPath() {
        return attachmentAssetPath;
    }

    /**
     * Sets the value of the attachmentAssetPath property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAttachmentAssetPath(String value) {
        this.attachmentAssetPath = value;
    }

    /**
     * Gets the value of the rootDirectory property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRootDirectory() {
        return rootDirectory;
    }

    /**
     * Sets the value of the rootDirectory property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRootDirectory(String value) {
        this.rootDirectory = value;
    }

    /**
     * Gets the value of the directoryPath property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDirectoryPath() {
        return directoryPath;
    }

    /**
     * Sets the value of the directoryPath property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDirectoryPath(String value) {
        this.directoryPath = value;
    }

    /**
     * Gets the value of the mimeType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMimeType() {
        return mimeType;
    }

    /**
     * Sets the value of the mimeType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMimeType(String value) {
        this.mimeType = value;
    }

    /**
     * Gets the value of the language property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the language property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getLanguage().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getLanguage() {
        if (language == null) {
            language = new ArrayList<String>();
        }
        return this.language;
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

    /**
     * Gets the value of the localAsset property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isLocalAsset() {
        return localAsset;
    }

    /**
     * Sets the value of the localAsset property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setLocalAsset(Boolean value) {
        this.localAsset = value;
    }

}
