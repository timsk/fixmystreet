
package BarnetElements::Z_CRM_SERVICE_ORDER_CREATE::Exception;
use strict;
use warnings;

{ # BLOCK to scope variables

sub get_xmlns { 'urn:sap-com:document:sap:rfc:functions' }

__PACKAGE__->__set_name('Z_CRM_SERVICE_ORDER_CREATE.Exception');
__PACKAGE__->__set_nillable();
__PACKAGE__->__set_minOccurs();
__PACKAGE__->__set_maxOccurs();
__PACKAGE__->__set_ref();
use base qw(
    SOAP::WSDL::XSD::Typelib::Element
    BarnetTypes::Z_CRM_SERVICE_ORDER_CREATE::RfcException
);

}

1;


=pod

=head1 NAME

BarnetElements::Z_CRM_SERVICE_ORDER_CREATE::Exception

=head1 DESCRIPTION

Perl data type class for the XML Schema defined element
Z_CRM_SERVICE_ORDER_CREATE.Exception from the namespace urn:sap-com:document:sap:rfc:functions.







=head1 METHODS

=head2 new

 my $element = BarnetElements::Z_CRM_SERVICE_ORDER_CREATE::Exception->new($data);

Constructor. The following data structure may be passed to new():

 { # BarnetTypes::Z_CRM_SERVICE_ORDER_CREATE::RfcException
   Name => $some_value, # Z_CRM_SERVICE_ORDER_CREATE.RfcExceptions
   Text =>  $some_value, # string
   Message =>  { # BarnetTypes::RfcException::Message
     ID =>  $some_value, # string
     Number => $some_value, # RfcException.Message.Number
   },
 },

=head1 AUTHOR

Generated by SOAP::WSDL

=cut
