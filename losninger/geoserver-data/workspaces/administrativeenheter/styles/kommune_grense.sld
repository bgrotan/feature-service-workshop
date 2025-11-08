<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld"
    xmlns:sld="http://www.opengis.net/sld"
    xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:gml="http://www.opengis.net/gml"
    version="1.0.0">
  <NamedLayer>
    <Name>kommune_grense</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <Rule>
          <Title>Kommunegrense</Title>          
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#8a3e4e</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">2 1</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>        
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>