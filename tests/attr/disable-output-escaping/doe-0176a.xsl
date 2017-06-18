<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="3.0">
  <xsl:output method="xhtml" encoding="UTF-8" indent="no"/>

  <!-- Purpose: Test for disabling-output-escaping="true" in xsl:text -->

<xsl:template match="/">
  <html>
    <body>
      <xsl:text disable-output-escaping="true"><![CDATA[<p>&nbsp;</p>]]></xsl:text>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>