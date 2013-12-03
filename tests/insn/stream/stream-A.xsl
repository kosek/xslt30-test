<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="CATEGORIES"/>
    
    <!-- Empty xsl:stream instruction -->
    
    <xsl:template name="s-001" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml"/>
      </out>
    </xsl:template>
    
    <!-- Non-existent document -->
    
    <xsl:template name="s-002" use-when="$RUN">
      <out>
        <xsl:stream href="absent.xml">
          <in/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Computed URI -->
    
    <xsl:param name="u" select="'books.xml'"/>
    <xsl:template name="s-003" use-when="$RUN">
      <out>
        <xsl:stream href="{$u}">
          <xsl:for-each select="*">
            <xsl:copy/>
          </xsl:for-each>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- use Base URI -->
    
    <xsl:template name="s-004" use-when="$RUN" xml:base="../../..">
      <out>
        <xsl:stream href="catalog.xml">
          <xsl:for-each select="*">
            <xsl:copy/>
          </xsl:for-each>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Context position is 1, context item is document node -->
    
    <xsl:template name="s-005" use-when="$RUN">
        <xsl:stream href="books.xml">
          <out base-uri="{base-uri(.)}" position="{position()}" is-doc="{. instance of document-node()}"/>
        </xsl:stream>
    </xsl:template>
    
    <!-- Invalid URI -->
    
    <xsl:template name="s-006" use-when="$RUN">
      <out>
        <xsl:stream href="c:\my\doc\{$u}">
          <in/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- strip-space -->
    
    <xsl:template name="s-007" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml">
          <xsl:value-of select="count(/BOOKLIST/BOOKS/text())"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- preserve-space -->
    
    <xsl:template name="s-008" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml">
          <xsl:value-of select="count(/BOOKLIST/CATEGORIES/text())"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- fallback is ignored -->
    
    <xsl:template name="s-009" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" version="3.0">
          <xsl:fallback>(((</xsl:fallback>
          <xsl:value-of select="count(/BOOKLIST/CATEGORIES/text())"/>
          <xsl:fallback>)))</xsl:fallback>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- two nested streams over the same document -->
    
    <xsl:template name="s-010" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml">
          <xsl:for-each select="/BOOKLIST/CATEGORIES/CATEGORY">
            <xsl:variable name="category" select="string(@CODE)"/>
            <xsl:stream href="books.xml">
              <cat code="{$category}" count="{count(/BOOKLIST/BOOKS/ITEM[@CAT = $category])}"/>
            </xsl:stream>
          </xsl:for-each>  
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- validation = strip -->
    
    <xsl:template name="s-011" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" validation="strip">
          <xsl:value-of select="/BOOKLIST/CATEGORIES/CATEGORY instance of element(*, xs:untyped)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- validation = preserve -->
    
    <xsl:template name="s-012" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" validation="preserve">
          <xsl:value-of select="/BOOKLIST/CATEGORIES/CATEGORY/@CODE instance of attribute(*, xs:untypedAtomic)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- validation = lax -->
    
    <xsl:template name="s-013" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" validation=" lax ">
          <xsl:value-of select="/BOOKLIST/CATEGORIES/CATEGORY instance of element(*, xs:untyped)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    

              
    
</xsl:stylesheet>