package;

import urals.web.BrowserHtmlInjector;
import js.Browser;
import sneaker.assertion.Asserter.*;

class Compile
{
    static function setBodyNominal(): Void {
        Browser.document.body.outerHTML = '<body>' 
            + '<h1>Header</h1>' 
            + '<div id="container">' 
            + '<div class="elem">Text 1</div>'
            + '<div class="elem">Text 2</div>'
            + '</div>'
            + '</body>';
    }

    static function testAppend1() {
        setBodyNominal();
        var injector = new BrowserHtmlInjector();
        var result = injector
            .append('.elem', '<h2>Preheader</h2>');
        var nominal = '<body>' 
            + '<h1>Header</h1>' 
            + '<div id="container">' 
            + '<div class="elem">Text 1<h2>Preheader</h2></div>'
            + '<div class="elem">Text 2<h2>Preheader</h2></div>'
            + '</div>'
            + '</body>';
        assert(Browser.document.body.outerHTML == nominal);
    }

    public static function main() {
        testAppend1();
    }
}