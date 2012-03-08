class jenkins::firewall ($jenkins_port = '8080') {
  if defined('::firewall') {
    ::firewall {
      '500 allow Jenkins inbound traffic':
        action => 'accept',
        state  => 'NEW',
        dport  => [$jenkins_port],
        proto  => 'tcp',
    }
  }
}

