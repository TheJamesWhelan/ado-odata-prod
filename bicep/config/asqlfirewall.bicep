param environment string
param location string
param firewallRules array = [
  {
    ruleName: 'NorthAmerica'
    startIP: '157.58.216.65'
    endIP: '157.58.216.127'
  }
  {
    ruleName: 'EMEA'
    startIP: '194.69.119.65'
    endIP: '194.69.119.127'
  }
  {
    ruleName: 'APAC'
    startIP: '167.220.249.129'
    endIP: '167.220.249.191'
  }
  {
    ruleName: 'NorthAmerica-CorpNet'
    startIP: '25.4.0.1'
    endIP: '25.4.255.255'
  }
  {
    ruleName: 'SouthAmerica-CorpNet'
    startIP: '25.5.0.1'
    endIP: '25.5.255.255'
  }
  {
    ruleName: 'EMEA-CorpNet'
    startIP: '25.6.0.1'
    endIP: '25.6.255.255'
  }
  {
    ruleName: 'APAC-CorpNet'
    startIP: '25.6.0.1'
    endIP: '25.6.255.255'
  }
  // Add more rules here
]

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: 'azcxppmo-udp-asql-${environment}'
  location: location
}

resource sqlFirewallRules 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = [for rule in firewallRules: {
  name: '${sqlServer.name}/${rule.ruleName}'
  properties: {
    startIpAddress: rule.startIP
    endIpAddress: rule.endIP
  }
}]
