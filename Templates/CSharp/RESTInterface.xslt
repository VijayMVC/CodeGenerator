<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:P="http://Schemas.QuantumConceptsCorp.com/CodeGenerator/Project.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns:qc="http://schemas.quantumconceptscorp.com/user-defined">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>

	<xsl:include href="ServiceDocumentation-Common.xslt"/>
	
	<xsl:param name="templateName"/>
	
	<xsl:template match="P:Project">
		<xsl:call-template name="Using-System-All"/>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace" select="'System.ServiceModel'"/>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace" select="'System.ServiceModel.Web'"/>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace" select="'System.ServiceModel.Activation'"/>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace" select="'System.ComponentModel'"/>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace" select="'WcfRestContrib.ServiceModel.Description'"/>
		</xsl:call-template>
		<xsl:call-template name="Using-Project"/>
		<xsl:call-template name="Using-Template">
			<xsl:with-param name="template" select="P:Templates/P:Template[@Name=$templateName]"/>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace">
				<xsl:value-of select="@RootNamespace"/>
				<xsl:text>.Common.Utils</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace">
				<xsl:value-of select="@RootNamespace"/>
				<xsl:text>.Service.Utils</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace">
				<xsl:text>DO = </xsl:text>
				<xsl:value-of select="@RootNamespace"/>
				<xsl:text>.DataObjects</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="Using">
			<xsl:with-param name="namespace">
				<xsl:value-of select="@RootNamespace"/>
				<xsl:text>.Service.ServiceObjects.REST</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:text>
namespace </xsl:text>
		<xsl:value-of select="@RootNamespace"/>
<xsl:text>.Service
{
	<![CDATA[/// <summary>Exposes functionality through one or more service end points.</summary>]]>
	[ServiceContract]
	public partial interface IREST
	{</xsl:text>
		<xsl:for-each select="P:TableMappings/P:TableMapping[@Exclude='false' and P:Attributes/P:Attribute/@Key='ServiceExposed']">
            <xsl:variable name="TableName" select="@TableName"/>
            <xsl:variable name="PKColumn" select=".//P:ColumnMapping[@PrimaryKey='true']"/>

			<xsl:call-template name="GetGetAllDocumentation">
				<xsl:with-param name="spacingBefore" select="concat($tab, $tab)"/>
			</xsl:call-template>
      <xsl:text>
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-All-Title"/>
      <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
			<xsl:choose>
				<xsl:when test="P:Attributes/P:Attribute[@Key='GetAllUriTemplateOverride']">
					<xsl:value-of select="P:Attributes/P:Attribute[@Key='GetAllUriTemplateOverride']/@Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@PluralClassName"/>
					<xsl:text>/{page}</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		List&lt;</xsl:text>
			<xsl:value-of select="@ClassName"/>
			<xsl:text>&gt; Get</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>(string page);
			</xsl:text>

			<xsl:text>
		/// &lt;summary&gt;Gets how many </xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text> exist.&lt;summary&gt;
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-AllCount-Title"/>
      <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
			<xsl:choose>
				<xsl:when test="P:Attributes/P:Attribute[@Key='GetAllPageCountUriTemplateOverride']">
					<xsl:value-of select="P:Attributes/P:Attribute[@Key='GetAllPageCountUriTemplateOverride']/@Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@PluralClassName"/>
					<xsl:text>/Count</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Get</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>Count();
			</xsl:text>

			<xsl:text>
		/// &lt;summary&gt;Gets how many pages of data exist for the </xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text> method.&lt;summary&gt;
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-AllPageCount-Title"/>
      <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
			<xsl:choose>
				<xsl:when test="P:Attributes/P:Attribute[@Key='GetAllPageCountUriTemplateOverride']">
					<xsl:value-of select="P:Attributes/P:Attribute[@Key='GetAllPageCountUriTemplateOverride']/@Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@PluralClassName"/>
					<xsl:text>/PageCount</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Get</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>PageCount();
			</xsl:text>
			
			<xsl:call-template name="GetGetByIDDocumentation">
				<xsl:with-param name="spacingBefore" select="concat($tab, $tab)"/>
			</xsl:call-template>
			<xsl:text>
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-PK-Title"/>
      <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
			<xsl:choose>
				<xsl:when test="P:Attributes/P:Attribute[@Key='GetByIDUriTemplateOverride']">
					<xsl:value-of select="P:Attributes/P:Attribute[@Key='GetByIDUriTemplateOverride']/@Value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@ClassName"/>
					<xsl:text>/{id}</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		</xsl:text>
			<xsl:value-of select="@ClassName"/>
			<xsl:text> Get</xsl:text>
			<xsl:value-of select="@ClassName"/>
			<xsl:text>ByID(string </xsl:text>
			<xsl:call-template name="ToLowerCase">
				<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping/P:ColumnMappings/P:ColumnMapping/@ColumnName"/>
			</xsl:call-template>
			<xsl:text>);
		
		///&lt;summary&gt;Returns a filtered collection of </xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text> based on the provided search query.&lt;/summary&gt;
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-Filter-Title"/>
      <xsl:text>")]
		[WebInvoke(Method="POST", UriTemplate = "/</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>/Filter")]
		[WebDispatchFormatter(WcfRestContrib.ServiceModel.Dispatcher.WebDispatchFormatter.FormatterDirection.Outgoing)]
		[FaultContract(typeof(ServiceFault))]
		List&lt;</xsl:text>
			<xsl:value-of select="@ClassName"/>
			<xsl:text>&gt; Filter</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>(SearchQuery searchQuery);
		
		///&lt;summary&gt;Returns a count of how many </xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text> exist based on the provided search query.&lt;/summary&gt;
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-FilterCount-Title"/>
      <xsl:text>")]
		[WebInvoke(Method="POST", UriTemplate = "/</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>/Filter/Count")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Filter</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>Count(SearchQuery searchQuery);
		
		///&lt;summary&gt;Returns a count of how many pages of </xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text> exist based on the provided search query.&lt;/summary&gt;
		[OperationContract]
		[Description("</xsl:text>
      <xsl:call-template name="Doc-FilterPageCount-Title"/>
      <xsl:text>")]
		[WebInvoke(Method="POST", UriTemplate = "/</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>/Filter/PageCount")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Filter</xsl:text>
			<xsl:value-of select="@PluralClassName"/>
			<xsl:text>PageCount(SearchQuery searchQuery);
			</xsl:text>

			<xsl:for-each select="../../P:ForeignKeyMappings/P:ForeignKeyMapping[@Exclude='false' and P:Attributes/P:Attribute/@Key='ServiceExposed' and @ParentTableMappingName=$TableName]">
                <xsl:variable name="parentTableName" select="@ParentTableMappingName"/>
                <xsl:variable name="parentTable" select="//P:TableMapping[@TableName=$parentTableName]"/>
                <xsl:variable name="parentColumnName" select="@ParentColumnMappingName"/>
                <xsl:variable name="referencedTableName" select="@ReferencedTableMappingName"/>
                <xsl:variable name="referencedTable" select="//P:TableMapping[@TableName=$referencedTableName]"/>
                <xsl:variable name="referencedColumnName" select="@ReferencedColumnMappingName"/>

				<xsl:value-of select="$newLine"/>
				<xsl:call-template name="GetForeignKeyGetDocumentation">
					<xsl:with-param name="spacingBefore" select="concat($tab, $tab)"/>
				</xsl:call-template>
				<xsl:text>
		[OperationContract]
		[Description("</xsl:text>
        <xsl:call-template name="Doc-FKPlural-Title"/>
        <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
				<xsl:choose>
					<xsl:when test="P:Attributes/P:Attribute[@Key='UriTemplateOverride']">
						<xsl:value-of select="P:Attributes/P:Attribute[@Key='UriTemplateOverride']/@Value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						<xsl:text>/{</xsl:text>
						<xsl:call-template name="FirstCharacterToLowerCase">
							<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						</xsl:call-template>
						<xsl:value-of select="$referencedColumnName"/>
						<xsl:text>}/</xsl:text>
						<xsl:value-of select="@PluralFieldName"/>
						<xsl:text>/{page}</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		List&lt;</xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@ClassName"/>
				<xsl:text>&gt; Get</xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@PluralClassName"/>
				<xsl:text>By</xsl:text>
				<xsl:value-of select="@FieldName"/>
				<xsl:text>(string </xsl:text>
				<xsl:call-template name="FirstCharacterToLowerCase">
					<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
				</xsl:call-template>
				<xsl:value-of select="$referencedColumnName"/>
				<xsl:text>, string page);

		/// &lt;summary&gt;Gets how many </xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@PluralClassName"/>
				<xsl:text> by </xsl:text>
				<xsl:value-of select="@FieldName"/>
				<xsl:text> exist.&lt;summary&gt;
		[OperationContract]
		[Description("</xsl:text>
        <xsl:call-template name="Doc-FKPluralCount-Title"/>
        <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
				<xsl:choose>
					<xsl:when test="P:Attributes/P:Attribute[@Key='PageCountUriTemplateOverride']">
						<xsl:value-of select="P:Attributes/P:Attribute[@Key='PageCountUriTemplateOverride']/@Value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						<xsl:text>/{</xsl:text>
						<xsl:call-template name="FirstCharacterToLowerCase">
							<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						</xsl:call-template>
						<xsl:value-of select="$referencedColumnName"/>
						<xsl:text>}/</xsl:text>
						<xsl:value-of select="@PluralFieldName"/>
						<xsl:text>/Count</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Get</xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@PluralClassName"/>
				<xsl:text>By</xsl:text>
				<xsl:value-of select="@FieldName"/>
				<xsl:text>Count(string </xsl:text>
				<xsl:call-template name="FirstCharacterToLowerCase">
					<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
				</xsl:call-template>
				<xsl:value-of select="$referencedColumnName"/>
				<xsl:text>);

		/// &lt;summary&gt;Gets how many pages of data exist for the </xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@PluralClassName"/>
				<xsl:text> by </xsl:text>
				<xsl:value-of select="@FieldName"/>
				<xsl:text> method.&lt;summary&gt;
		[OperationContract]
		[Description("</xsl:text>
        <xsl:call-template name="Doc-FKPluralPageCount-Title"/>
        <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
				<xsl:choose>
					<xsl:when test="P:Attributes/P:Attribute[@Key='PageCountUriTemplateOverride']">
						<xsl:value-of select="P:Attributes/P:Attribute[@Key='PageCountUriTemplateOverride']/@Value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						<xsl:text>/{</xsl:text>
						<xsl:call-template name="FirstCharacterToLowerCase">
							<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
						</xsl:call-template>
						<xsl:value-of select="$referencedColumnName"/>
						<xsl:text>}/</xsl:text>
						<xsl:value-of select="@PluralFieldName"/>
						<xsl:text>/PageCount</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		int Get</xsl:text>
				<xsl:value-of select="../../P:TableMappings/P:TableMapping[@TableName=$parentTableName]/@PluralClassName"/>
				<xsl:text>By</xsl:text>
				<xsl:value-of select="@FieldName"/>
				<xsl:text>PageCount(string </xsl:text>
				<xsl:call-template name="FirstCharacterToLowerCase">
					<xsl:with-param name="input" select="../../P:TableMappings/P:TableMapping[@TableName=$referencedTableName]/@ClassName"/>
				</xsl:call-template>
				<xsl:value-of select="$referencedColumnName"/>
				<xsl:text>);

        /// &lt;summary&gt;</xsl:text>
          <xsl:call-template name="Doc-FKSingular-Description"/>
          <xsl:text>&lt;/summary&gt;
		[OperationContract]
		[Description("</xsl:text>
        <xsl:call-template name="Doc-FKSingular-Title"/>
        <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
        <xsl:call-template name="Doc-FKSingular-RESTURI"/>
        <xsl:text>")]
		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		</xsl:text>
        <xsl:value-of select="$referencedTable/@ClassName"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="Doc-FKSingular-SOAPMethod"/>
        <xsl:text>(string </xsl:text>
        <xsl:call-template name="FirstCharacterToLowerCase">
          <xsl:with-param name="input" select="$parentTable/@ClassName"/>
        </xsl:call-template>
        <xsl:value-of select="$PKColumn/@FieldName"/>
        <xsl:text>);</xsl:text>
      </xsl:for-each>
			
			<xsl:for-each select="P:UniqueIndexMappings/P:UniqueIndexMapping[@Exclude='false']">
				<xsl:value-of select="$newLine"/>
				<xsl:call-template name="GetUniqueIndexMappingDocumentation">
					<xsl:with-param name="spacingBefore" select="concat($tab, $tab)"/>
				</xsl:call-template>
				<xsl:text>
		[OperationContract]
		[Description("</xsl:text>
        <xsl:call-template name="Doc-UX-Title"/>
        <xsl:text>")]
		[WebGet(UriTemplate = "</xsl:text>
				<xsl:choose>
					<xsl:when test="P:Attributes/P:Attribute[@Key='UriTemplateOverride']">
						<xsl:value-of select="P:Attributes/P:Attribute[@Key='UriTemplateOverride']/@Value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../../@ClassName"/>
						<xsl:text>?</xsl:text>
						<xsl:for-each select="P:ColumnNames/P:ColumnName">
							<xsl:variable name="columnName" select="text()"/>
							<xsl:variable name="column" select="../../../../P:ColumnMappings/P:ColumnMapping[@ColumnName=$columnName]"/>
							
							<xsl:value-of select="$column/@FieldName"/>
							<xsl:text>={</xsl:text>
							<xsl:call-template name="FirstCharacterToLowerCase">
								<xsl:with-param name="input" select="$column/@FieldName"/>
							</xsl:call-template>
							<xsl:text>}</xsl:text>
							<xsl:if test="position()!=last()">
								<xsl:text>&amp;</xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>")]
   		[AspNetCacheProfile("Default")]
		[WebDispatchFormatter]
		[FaultContract(typeof(ServiceFault))]
		</xsl:text>
				<xsl:value-of select="../../@ClassName"/>
				<xsl:text> Get</xsl:text>
				<xsl:value-of select="../../@ClassName"/>
				<xsl:text>By</xsl:text>
				<xsl:for-each select="P:ColumnNames/P:ColumnName">
					<xsl:variable name="columnName" select="text()"/>
					<xsl:variable name="column" select="../../../../P:ColumnMappings/P:ColumnMapping[@ColumnName=$columnName]"/>
					
					<xsl:value-of select="$column/@FieldName"/>
					<xsl:if test="position()!=last()">
						<xsl:text>And</xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>(</xsl:text>
				<xsl:for-each select="P:ColumnNames/P:ColumnName">
					<xsl:variable name="columnName" select="text()"/>
					<xsl:variable name="column" select="../../../../P:ColumnMappings/P:ColumnMapping[@ColumnName=$columnName]"/>
					
					<xsl:text>string </xsl:text>
					<xsl:call-template name="FirstCharacterToLowerCase">
						<xsl:with-param name="input" select="$column/@FieldName"/>
					</xsl:call-template>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>);</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:text>
	}
}</xsl:text>
	</xsl:template>
</xsl:stylesheet>