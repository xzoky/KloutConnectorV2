KloutConnector
==============

by Camille Kander (@xzoky)

KloutConnector is a thin wrapper around Klout's API v2.

Usage
-----

XZKloutConnector is meant to be a singleton. Do **not** use ```[[XZKloutConnector alloc] init]```, use ```[XZKloutConnector sharedConnector]``` instead.

To set your Klout API key, use ```[[XZKloutConnector sharedConnector] setAPIKey:@"your_key"];```.

HTTP requests and JSON parsing are done asynchronously. Callback methods are described in *XZKloutConnectorDelegate.h*. They are called using ```dispatch_sync()```, so you can trigger UI changes within them. Usually, your delegate will be your view controller.
You have to implement all 7 methods, but you can leave blank those you don't want to use.

"Identity methods" return *NSStrings*, but "User methods" return *NSDictionary* objects structured like the JSON strings the API sends. Check out the Klout API Interative Console for details.
(In these dictionaries, strings are *NSStrings* and numbers such as the score or the deltas are *NSDecimalNumbers*.)

License
-------

"THE BEER-WARE LICENSE" (Revision 42):
<camille@kander.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return.
