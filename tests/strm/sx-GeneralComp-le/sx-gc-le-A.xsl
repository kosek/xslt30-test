<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test of xsl:stream with "&lt;=" -->
    
    <xsl:template name="s-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/ITEM/PRICE) &lt;= 6.58"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered with a motionless predicate -->
    
    <xsl:template name="s-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/ITEM[@CAT='P']/PRICE) &lt;= 6.58"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered with a positional predicate -->
    
    <xsl:template name="s-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/ITEM[position() lt 4]/PRICE) &lt;= 6.58"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered with a positional predicate -->
    
    <xsl:template name="s-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/*[position() lt 4]/PRICE) &lt;= 6.58"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered with a positional predicate -->
    
    <xsl:template name="s-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="(./BOOKLIST/BOOKS/*:ITEM[position() lt 4]/PRICE) &lt;= 6.58"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered using data() to make it streamable -->
    
    <xsl:template name="s-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(./BOOKLIST/BOOKS/ITEM/PAGES/data()[. &lt; 1000][. &gt; 0]) &lt;= 346"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered using text() to make it streamable -->
    
    <xsl:template name="s-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(./BOOKLIST/BOOKS/ITEM/PAGES/text()[. &lt; 1000][. &gt; 0]) &lt;= 346"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered using number() to make it streamable -->
    
    <xsl:template name="s-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(./BOOKLIST/BOOKS/ITEM/PAGES/number()[. &lt; 1000][. &gt; 0]) &lt;= 346"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", selecting nothing and returning false -->
    
    <xsl:template name="s-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(ITEM/PAGES) &lt;= 23"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of "&lt;=" selecting both streamed nodes and literals -->
    
    <xsl:template name="s-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="((./BOOKLIST/BOOKS/ITEM/PAGES/number(), 31, 32)) &lt;= 346"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of "&lt;=" selecting both streamed nodes and literals while also filtering -->
    
    <xsl:template name="s-013" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="((tail(./BOOKLIST/BOOKS/ITEM/PAGES)/number(), 31, 32)) &lt;= 31"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
    <!-- Test of xsl:stream with "&lt;=" of a computed value -->
    
    <xsl:template name="s-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(for $d in data(//DIMENSIONS) return tokenize($d, '\s')!number()) &lt;= 22.5"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=" of a computed value -->
    
    <xsl:template name="s-016" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/(@value*2)) &lt;= 8.64"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=", filtered using copy-of() to make it streamable -->
    
    <xsl:template name="s-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(./BOOKLIST/BOOKS/ITEM/PAGES/copy-of()[. &lt; 1000][. &gt; 0]) &lt;= 346"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=" applied to an attribute -->
    
    <xsl:template name="s-018" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/@value) &lt;= 4.32"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "&lt;=" over attribute values, filtered -->
    
    <xsl:template name="s-019" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/@value[xs:decimal(.) gt 0]) &lt;= 4.32"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Test of xsl:stream with "&lt;=" over attribute values, computed -->
    
    <xsl:template name="s-020" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/abs(@value)) &lt;= 4.32"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "&lt;=" of a conditional value -->
    
    <xsl:template name="s-021" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/
                (if (xs:date(@date) lt xs:date('2020-01-01')) then +@value else (@value+1))) &lt;= 4.32"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "&lt;=" with a loop used to compute each item -->
    
    <xsl:template name="s-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKLIST/BOOKS/ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.)) &lt;= 5.0"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream calling "&lt;=" using //x/y -->
    <!-- Saxon makes this streamable by rewriting //X/Y as .//Y[parent::X] -->
    
    <xsl:template name="s-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(//ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.)) &lt;= 5.0"/>
        </out>
      </xsl:stream>
    </xsl:template>                            
    
</xsl:stylesheet>