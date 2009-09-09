#!/usr/bin/perl -w
#
# Page.t:
# Tests for the Page functions
#
#  Copyright (c) 2009 UK Citizens Online Democracy. All rights reserved.
# Email: louise@mysociety.org; WWW: http://www.mysociety.org/
#
# $Id: Page.t,v 1.2 2009-09-03 13:54:13 louise Exp $
#

use strict;
use warnings; 
use Test::More tests => 9;
use Test::Exception; 

use FindBin;
use lib "$FindBin::Bin";
use lib "$FindBin::Bin/../perllib";
use lib "$FindBin::Bin/../../perllib";

use Page;
use MockQuery;
use mySociety::Locale;

sub mock_query(){
    my $q  = new MockQuery('mysite');
    return $q;
}

sub set_lang($) {
    my $lang = shift;
    mySociety::Locale::negotiate_language($lang);
    mySociety::Locale::gettext_domain('FixMyStreet');
    mySociety::Locale::change();
}

sub test_header(){
    my $q = mock_query();
    my $html;
    my %params = (title => 'test title');
    set_lang('en-gb,English,en_GB');
   
    # Test that param that isn't explicitly allowed raises error
    $params{'test-param'} = 'test';
    throws_ok { Page::header($q, %params); } qr/bad parameter/, 'bad parameter caught ok';
    delete $params{'test-param'};

    # Test that template passed is rendered 
    $params{'template'} = 'test';    
    $html = Page::template_header('My test title', 'test', $q, 'en-gb', '/../t/templates/');	
    like  ($html, qr/My test header template/, 'named template rendered ok');
 

    return 1;
}

sub test_footer(){
    return 1;
}

sub test_base_url_with_lang {
    $ENV{HTTP_HOST}='test.com';
    set_lang('en-gb,English,en_GB');
    my $q = mock_query();
    my $url = Page::base_url_with_lang($q);
    ok($url eq 'http://test.com', 'Basic url rendered ok');

    $q = new MockQuery('emptyhomes'); 
    $url = Page::base_url_with_lang($q);
    ok($url eq 'http://en.test.com', 'Empty homes url with lang returned ok');	

    $url = Page::base_url_with_lang($q, 1);
    ok($url eq 'http://cy.test.com', 'Empty homes url with lang reversed returned ok');	
 
    $q = new MockQuery('emptyhomes');
    $ENV{HTTP_HOST}='en.test.com';
    $url = Page::base_url_with_lang($q);
    ok($url eq 'http://en.test.com', 'No extra lang part for emptyhomes url with lang part');
}

ok(test_base_url_with_lang() == 1, 'Ran all tests for base_url_with_lang');
ok(test_footer() == 1, 'Ran all tests for the footer function');
ok(test_header() == 1, 'Ran all tests for the header function'); 