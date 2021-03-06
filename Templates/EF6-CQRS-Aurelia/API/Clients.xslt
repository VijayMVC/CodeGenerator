<?xml version="1.0"?>

<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform" xmlns:P="http://Schemas.QuantumConceptsCorp.com/CodeGenerator/Project.xsd" xmlns:ms="urn:schemas-microsoft-com:xslt" xmlns:fn="urn:custom-functions">
    <x:output method="text" encoding="utf-8" indent="no" version="1.0" />

    <x:include href="../Common.xslt"/>
    
    <x:param name="elementName"/>

    <x:template match="P:Project">
        <x:apply-templates select="//P:TableMapping[@Exclude='false' and @TableName=$elementName]"/>
    </x:template>

    <x:template match="P:TableMapping">
        <x:variable name="table" select="."/>
        <x:variable name="pkColumn" select=".//P:ColumnMapping[@PrimaryKey='true']"/>
        <x:variable name="pkNameLower" select="fn:ToLower($pkColumn/@FieldName)"/>
        <x:variable name="childFKs" select="//P:ForeignKeyMapping[@Exclude='false' and not(.//P:Attribute[@Key='passthrough']) and @ParentTableMappingSchemaName=$table/@SchemaName and @ParentTableMappingName=$table/@TableName]"/>
        <x:variable name="parentFKs" select="//P:ForeignKeyMapping[@Exclude='false' and not(.//P:Attribute[@Key='passthrough']) and @ReferencedTableMappingSchemaName=$table/@SchemaName and @ReferencedTableMappingName=$table/@TableName]"/>
        <x:variable name="passthroughFKs" select="//P:ForeignKeyMapping[@Exclude='false' and .//P:Attribute[@Key='passthrough'] and @ReferencedTableMappingSchemaName=$table/@SchemaName and @ReferencedTableMappingName=$table/@TableName]"/>

        <x:call-template name="generated-notice"/>
        
        <x:text>
using </x:text>
        <x:call-template name="get-full-namespace">
            <x:with-param name="projectName" select="'Api.Common.Services'"/>
        </x:call-template>
        <x:text>;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ModelType = </x:text>
        <x:call-template name="get-full-namespace">
            <x:with-param name="projectName" select="'Api.Common.Models'"/>
        </x:call-template>
        <x:text>.</x:text>
        <x:value-of select="@ClassName"/>
        <x:text>;

namespace </x:text>
        <x:call-template name="get-full-namespace">
            <x:with-param name="projectName" select="'Api.Client'"/>
        </x:call-template>
        <x:text> {
    public partial class </x:text>
        <x:value-of select="@ClassName"/>
        <x:text>Client : BaseClient&lt;ModelType&gt;, I</x:text>
        <x:value-of select="@ClassName"/>
        <x:text>Service {
        public </x:text>
        <x:value-of select="@ClassName"/>
        <x:text>Client(IClientConfig config) : base(config) { }

        protected override string DefaultRoutePrefix { get; } = "</x:text>
        <x:value-of select="@PluralClassName"/>
        <x:text>";</x:text>

        <x:apply-templates select="$childFKs" mode="child">
            <x:with-param name="table" select="$table"/>
        </x:apply-templates>

        <x:apply-templates select="$parentFKs" mode="parent">
            <x:with-param name="table" select="$table"/>
        </x:apply-templates>

        <x:apply-templates select="$passthroughFKs" mode="passthrough">
            <x:with-param name="table" select="$table"/>
        </x:apply-templates>

        <x:apply-templates select=".//P:UniqueIndexMapping">
            <x:with-param name="table" select="$table"/>
        </x:apply-templates>
        
        <x:text>
    }
}</x:text>
    </x:template>

    <x:template match="P:ForeignKeyMapping" mode="child">
        <x:param name="table"/>
        <x:variable name="childTable" select="//P:TableMapping[@SchemaName=current()/@ReferencedTableMappingSchemaName and @TableName=current()/@ReferencedTableMappingName]"/>
        <x:variable name="childTablePK" select="$childTable//P:ColumnMapping[@ColumnName=current()/@ReferencedColumnMappingName]"/>
        <x:variable name="fieldNameLower" select="fn:FirstToLower(current()/@FieldName)"/>
        <x:variable name="routeName">
            <x:text>Get</x:text>
            <x:value-of select="@PluralPropertyName"/>
            <x:text>By</x:text>
            <x:value-of select="@PropertyName"/>
        </x:variable>

        <x:text>

        public Task&lt;IEnumerable&lt;ModelType&gt;&gt; </x:text>
        <x:value-of select="$routeName"/>
        <x:text>(</x:text>
        <x:value-of select="$childTablePK/@DataType"/>
        <x:text> </x:text>
        <x:value-of select="$fieldNameLower"/>
        <x:text>) {
            return Get&lt;IEnumerable&lt;ModelType&gt;&gt;($"</x:text>
        <x:value-of select="$childTable/@PluralClassName"/>
        <x:text>/{</x:text>
        <x:value-of select="$fieldNameLower"/>
        <x:text>}/</x:text>
        <x:value-of select="@PluralPropertyName"/>
        <x:text>");
        }</x:text>
    </x:template>

    <x:template match="P:ForeignKeyMapping" mode="parent">
        <x:param name="table"/>
        <x:variable name="parentTable" select="//P:TableMapping[@SchemaName=current()/@ParentTableMappingSchemaName and @TableName=current()/@ParentTableMappingName]"/>
        <x:variable name="parentTablePK" select="$parentTable//P:ColumnMapping[@ColumnName=current()/@ParentColumnMappingName]"/>
        <x:variable name="parentTablePKLower" select="fn:FirstToLower($parentTablePK/@FieldName)"/>
        <x:variable name="routeName">
            <x:text>Get</x:text>
            <x:value-of select="@PropertyName"/>
            <x:text>By</x:text>
            <x:value-of select="$parentTable/@ClassName"/>
        </x:variable>

        <x:text>

        public Task&lt;ModelType&gt; </x:text>
        <x:value-of select="$routeName"/>
        <x:text>(</x:text>
        <x:value-of select="$parentTablePK/@DataType"/>
        <x:text> </x:text>
        <x:value-of select="$parentTablePKLower"/>
        <x:text>) {
            return Get($"</x:text>
        <x:value-of select="$parentTable/@PluralClassName"/>
        <x:text>/{</x:text>
        <x:value-of select="$parentTablePKLower"/>
        <x:text>}/</x:text>
        <x:value-of select="@PropertyName"/>
        <x:text>");
        }</x:text>
    </x:template>

    <x:template match="P:ForeignKeyMapping" mode="passthrough">
        <x:param name="table"/>
        <x:variable name="linkingTable" select="//P:TableMapping[@SchemaName=current()/@ParentTableMappingSchemaName and @TableName=current()/@ParentTableMappingName]"/>
        <x:variable name="rightFK" select="//P:ForeignKeyMapping[@ParentTableMappingSchemaName=$linkingTable/@SchemaName and @ParentTableMappingName=$linkingTable/@TableName and @ForeignKeyName!=current()/@ForeignKeyName]"/>
        <x:variable name="rightTable" select="//P:TableMapping[@SchemaName=$rightFK/@ReferencedTableMappingSchemaName and @TableName=$rightFK/@ReferencedTableMappingName]"/>
        <x:variable name="rightTablePK" select="$rightTable//P:ColumnMapping[@ColumnName=current()/@ReferencedColumnMappingName]"/>
        <x:variable name="rightTablePKLower" select="fn:FirstToLower($rightTablePK/@FieldName)"/>
        <x:variable name="routeName">
            <x:text>Get</x:text>
            <x:value-of select="$rightFK/@PluralPropertyName"/>
            <x:text>By</x:text>
            <x:value-of select="$rightFK/@PropertyName"/>
        </x:variable>

        <x:text>

        public Task&lt;IEnumerable&lt;ModelType&gt;&gt; </x:text>
        <x:value-of select="$routeName"/>
        <x:text>(</x:text>
        <x:value-of select="$rightTablePK/@DataType"/>
        <x:text> </x:text>
        <x:value-of select="$rightTablePKLower"/>
        <x:text>) {
            return Get&lt;IEnumerable&lt;ModelType&gt;&gt;($"</x:text>
        <x:value-of select="$rightTable/@PluralClassName"/>
        <x:text>/{</x:text>
        <x:value-of select="$rightTablePKLower"/>
        <x:text>}/</x:text>
        <x:value-of select="$rightFK/@PluralPropertyName"/>
        <x:text>");
        }</x:text>
    </x:template>

    <x:template match="P:UniqueIndexMapping">
        <x:param name="table"/>
        <x:variable name="functionName">
            <x:text>GetBy</x:text>
            <x:for-each select=".//P:ColumnName">
                <x:value-of select="text()"/>

                <x:if test="position()!=last()">
                    <x:text>And</x:text>
                </x:if>
            </x:for-each>
        </x:variable>

        <x:text>

        public Task&lt;ModelType&gt; </x:text>
        <x:value-of select="$functionName"/>
        <x:text>(</x:text>
        <x:for-each select=".//P:ColumnName">
            <x:variable name="column" select="$table//P:ColumnMapping[@ColumnName=current()/text()]"/>

            <x:value-of select="$column/@DataType"/>
            <x:if test="$column/@Nullable='true' and //P:DataTypeMapping[@ApplicationDataType=$column/@DataType]">
                <x:text>?</x:text>
            </x:if>
            <x:text> </x:text>
            <x:value-of select="fn:FirstToLower($column/@FieldName)"/>

            <x:if test="position()!=last()">
                <x:text>, </x:text>
            </x:if>
        </x:for-each>
        <x:text>) {
            return Get($"</x:text>
        <x:value-of select="$table/@PluralClassName"/>
        <x:text>/</x:text>
        <x:for-each select=".//P:ColumnName">
            <x:variable name="column" select="$table//P:ColumnMapping[@ColumnName=current()/text()]"/>

            <x:value-of select="$column/@FieldName"/>
            <x:text>={</x:text>
            <x:value-of select="fn:FirstToLower($column/@FieldName)"/>
            <x:text>}</x:text>

            <x:if test="position()!=last()">
                <x:text>/</x:text>
            </x:if>
        </x:for-each>
        <x:text>");
        }</x:text>
    </x:template>
</x:stylesheet>