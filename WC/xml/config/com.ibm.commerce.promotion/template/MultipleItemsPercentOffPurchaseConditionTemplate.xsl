<?xml version="1.0" encoding="UTF-8"?>

<!--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2008, 2015 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- handles purchase condition -->
    <xsl:template name="PurchaseConditionTemplate" match="/">
	    <PurchaseCondition impl="com.ibm.commerce.marketing.promotion.condition.PurchaseCondition">
            <Pattern impl="com.ibm.commerce.marketing.promotion.condition.Pattern">
				<xsl:for-each select="PromotionData/Elements/PurchaseCondition/MultipleItemsPromotionElement">
	            	<xsl:if test="(IncludeCatalogEntryIdentifier or IncludeCategoryIdentifier or ExcludeCatalogEntryIdentifier or ExcludeCategoryIdentifier) and Data/Quantity">
						<xsl:call-template name="MultipleItemsTemplate">
							 <xsl:with-param name="lowerBound" select="Data/Quantity" />
							 <xsl:with-param name="upperBound" select="Data/Quantity" />
							 <xsl:with-param name="selectCatalogEntryOrCategory" select="Data/selectCatalogEntryOrCategory" />
						</xsl:call-template>
					</xsl:if>						
				</xsl:for-each>
            </Pattern>
            <Distribution impl="com.ibm.commerce.marketing.promotion.reward.PatternQuantityVolumeDistribution">
				<Range impl="com.ibm.commerce.marketing.promotion.reward.DistributionRange">
		            <UpperBound>-1</UpperBound>
		            <LowerBound>1</LowerBound>
		            <UpperBoundIncluded>false</UpperBoundIncluded>
		            <LowerBoundIncluded>true</LowerBoundIncluded>
		            <RewardChoice>
		                <Reward impl="com.ibm.commerce.marketing.promotion.reward.DefaultReward">
		                    <AdjustmentFunction impl="com.ibm.commerce.marketing.promotion.reward.AdjustmentFunction">
		                        <FilterChain impl="com.ibm.commerce.marketing.promotion.condition.FilterChain">
									<xsl:choose>
										<xsl:when test="PromotionData/Elements/PurchaseCondition/IncludePaymentTypeIdentifier">
											<xsl:choose>
												<xsl:when test="PromotionData/Elements/PurchaseCondition/IncludePaymentTypeIdentifier/Data/PaymentType != 'Any'">
													<Filter impl="com.ibm.commerce.marketing.promotion.condition.PaymentTypeFilter">
														<IncludePaymentType>
															<PaymentMethodName><xsl:value-of select="PromotionData/Elements/PurchaseCondition/IncludePaymentTypeIdentifier/Data/PaymentType" /></PaymentMethodName>
														</IncludePaymentType>
													</Filter>
												</xsl:when>
											</xsl:choose>						
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="string-length(PromotionData/Elements/PurchaseCondition/IncludeShipModeIdentifier) &gt; 0">
											<Filter impl="com.ibm.commerce.marketing.promotion.condition.ShippingModeFilter">
												<DN><xsl:value-of select="PromotionData/Elements/PurchaseCondition/IncludeShipModeIdentifier/Data/DN" /></DN>
												<StoreIdentifier><xsl:value-of select="PromotionData/Elements/PurchaseCondition/IncludeShipModeIdentifier/Data/StoreIdentifier" /></StoreIdentifier>
												<Carrier><xsl:value-of select="PromotionData/Elements/PurchaseCondition/IncludeShipModeIdentifier/Data/Carrier" /></Carrier>
												<ShippingCode><xsl:value-of select="PromotionData/Elements/PurchaseCondition/IncludeShipModeIdentifier/Data/ShippingCode" /></ShippingCode>
											</Filter>
										</xsl:when>
									</xsl:choose>								
		                            <Filter impl="com.ibm.commerce.marketing.promotion.condition.DummyFilter"></Filter>
		                        </FilterChain>
		                        <Adjustment impl="com.ibm.commerce.marketing.promotion.reward.PercentOffAdjustment">
		                            <Percentage><xsl:value-of select="PromotionData/Elements/PurchaseCondition/Data/Percentage" /></Percentage>
		                            <MaxAmount><xsl:value-of select="PromotionData/Elements/PurchaseCondition/Data/MaxAmount" /></MaxAmount>
		                            <Currency><xsl:value-of select="PromotionData/Elements/PurchaseCondition/Data/Currency" /></Currency>
		                            <AdjustmentType>AllAffectedItems</AdjustmentType>
		                        </Adjustment>
		                    </AdjustmentFunction>
		                </Reward>
		            </RewardChoice>
       			</Range>   
                <PatternFilter impl="com.ibm.commerce.marketing.promotion.condition.DummyPatternFilter"></PatternFilter>
            </Distribution>
        </PurchaseCondition>
    </xsl:template>
	
	 <!-- handles MultipleItemsPromotionElement -->
	<xsl:template name="MultipleItemsTemplate">
		<xsl:param name="lowerBound" />
        <xsl:param name="upperBound" />
		<xsl:param name="selectCatalogEntryOrCategory" />
		<Constraint impl="com.ibm.commerce.marketing.promotion.condition.Constraint">
			<WeightedRange impl="com.ibm.commerce.marketing.promotion.condition.WeightedRange">
				<LowerBound><xsl:value-of select="$lowerBound" /></LowerBound>
				<UpperBound><xsl:value-of select="$upperBound" /></UpperBound>
				<Weight>1</Weight>
			</WeightedRange>
			<FilterChain impl="com.ibm.commerce.marketing.promotion.condition.FilterChain">
				<xsl:choose>
					<xsl:when test="$selectCatalogEntryOrCategory='catalogEntry'">
						<Filter impl="com.ibm.commerce.marketing.promotion.condition.MultiSKUFilter">
							<xsl:for-each select="IncludeCatalogEntryIdentifier">
								<IncludeCatEntryKey>
									<xsl:call-template name="CatalogEntryKeyTemplate">
										<xsl:with-param name="dn" select="Data/DN" />
										<xsl:with-param name="sku" select="Data/SKU" />
									</xsl:call-template>
								</IncludeCatEntryKey>
							</xsl:for-each>
							<xsl:for-each select="ExcludeCatalogEntryIdentifier">
								<ExcludeCatEntryKey>
									<xsl:call-template name="CatalogEntryKeyTemplate">
										<xsl:with-param name="dn" select="Data/DN" />
										<xsl:with-param name="sku" select="Data/SKU" />
									</xsl:call-template>
								</ExcludeCatEntryKey>
							</xsl:for-each>
						</Filter>
					</xsl:when>
					<xsl:when test="$selectCatalogEntryOrCategory='category'">
						<Filter impl="com.ibm.commerce.marketing.promotion.condition.CategoryFilter">
							<xsl:for-each select="IncludeCategoryIdentifier">
								<IncludeCategory>
									<xsl:call-template name="CategoryKeyTemplate">
										<xsl:with-param name="dn" select="Data/DN" />
										<xsl:with-param name="name" select="Data/Name" />
									</xsl:call-template>
								</IncludeCategory>
							</xsl:for-each>
							<xsl:for-each select="ExcludeCategoryIdentifier">
								<ExcludeCategory>
									<xsl:call-template name="CategoryKeyTemplate">
										<xsl:with-param name="dn" select="Data/DN" />
										<xsl:with-param name="name" select="Data/Name" />
									</xsl:call-template>
								</ExcludeCategory>
							</xsl:for-each>
						</Filter>
						<xsl:if test="ExcludeCatalogEntryIdentifier">
						<!-- Only populate when there are exclude items -->
							<Filter impl="com.ibm.commerce.marketing.promotion.condition.MultiSKUFilter">
								<xsl:for-each select="ExcludeCatalogEntryIdentifier">
									<ExcludeCatEntryKey>
										<xsl:call-template name="CatalogEntryKeyTemplate">
											<xsl:with-param name="dn" select="Data/DN" />
											<xsl:with-param name="sku" select="Data/SKU" />
										</xsl:call-template>
									</ExcludeCatEntryKey>
								</xsl:for-each>
							</Filter>
						</xsl:if>
					</xsl:when>						
				</xsl:choose> 
				<xsl:if test="CatalogEntryAttributeRule">
				<!-- Only populate when there are attributes -->
					<Filter
						impl="com.ibm.commerce.marketing.promotion.condition.CatalogEntryAttributeFilter">
						<AssociatedLanguage><xsl:value-of select="//PromotionData/Elements/PurchaseCondition/Data/Language" /></AssociatedLanguage>
						<xsl:choose>
							<xsl:when test="//PromotionData/Elements/PurchaseCondition/Data/CatalogEntryAttributeRuleCaseSensitive">
								<CaseSensitive><xsl:value-of select="//PromotionData/Elements/PurchaseCondition/Data/CatalogEntryAttributeRuleCaseSensitive" /></CaseSensitive>
							</xsl:when>
							<xsl:otherwise>
								<CaseSensitive>false</CaseSensitive>
							</xsl:otherwise> 
						</xsl:choose>
						<SupportAttributeWithNoAssociatedLanguage>true</SupportAttributeWithNoAssociatedLanguage>
						<xsl:for-each select="CatalogEntryAttributeRule">
							<xsl:call-template name="CatalogEntryAttributeRuleTemplate">
								<xsl:with-param name="attributeRule" select="." />
							</xsl:call-template>	
						</xsl:for-each>					
					</Filter>
				</xsl:if>
			</FilterChain>
		</Constraint>
	</xsl:template>		
    <!-- handles CatalogEntryKey -->
    <xsl:template name="CatalogEntryKeyTemplate">
        <xsl:param name="dn" />
        <xsl:param name="sku" />
        <CatalogEntryKey>
            <DN><xsl:value-of select="$dn" /></DN>
            <SKU><xsl:value-of select="$sku" /></SKU>
        </CatalogEntryKey>
    </xsl:template>
	<!-- handles CategoryKey -->
	<xsl:template name="CategoryKeyTemplate">
		<xsl:param name="dn" />
		<xsl:param name="name" />
		<CategoryKey>
			<DN><xsl:value-of select="$dn" /></DN>
			<Name><xsl:value-of select="$name" /></Name>
		</CategoryKey>
	</xsl:template>
    <!-- handles CatalogEntryAttributeRule  -->
    <xsl:template name="CatalogEntryAttributeRuleTemplate">
        <xsl:param name="attributeRule" />
        <AttributeRule>
            <Name><xsl:value-of select="Data/Name" /></Name>
            <DataType><xsl:value-of select="Data/DataType" /></DataType>
            <MatchingType><xsl:value-of select="Data/MatchingType" /></MatchingType>
            <xsl:for-each select="Data/Value">
                <Value><xsl:value-of select="." /></Value>
            </xsl:for-each>
        </AttributeRule>
    </xsl:template>      
</xsl:transform>
