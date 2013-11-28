<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="main">
  <out>
  <xsl:stream href="snapshot-02.xml">
     <xsl:for-each select="snapshot(remove(works/department/employee(:[1]:)/empnum, 2))">
        <emp num="{.}" name="{../@name}" gender="{../@gender}" dept="{../../@name}"/>
     </xsl:for-each>
  </xsl:stream>
  </out>
</xsl:template>


</xsl:stylesheet>