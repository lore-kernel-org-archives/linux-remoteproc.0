Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <1dff1b277e5d2c95ce100a2daff4967f98d074ba.camel@perches.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <66fe1087-1a6d-1a96-a043-8013bfb6f2c1@st.com>
Date: Wed, 25 Mar 2020 12:36:30 +0100
MIME-Version: 1.0
In-Reply-To: <1dff1b277e5d2c95ce100a2daff4967f98d074ba.camel@perches.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 3/24/20 6:23 PM, Joe Perches wrote:
> On Tue, 2020-03-24 at 18:04 +0100, Arnaud Pouliquen wrote:
>> This driver exposes a standard TTY interface on top of the rpmsg
>> framework through a rpmsg service.
>>
>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
>> per rpmsg endpoint.
> 
> trivial notes:
> 
>> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> []
>> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for user-space programs to send and receive rpmsg messages as a standard tty protocol.
> 
> Very long text lines missing newlines?
> 
> []
>> +To be compliant with this driver, the remote firmware must create its data end point associated with the "rpmsg-tty-raw" service.
> []
>> +To be compatible with this driver, the remote firmware must create or use its end point associated with "rpmsg-tty-ctrl" service, plus a second endpoint for the data flow.
>> +On Linux rpmsg_tty probes, the data endpoint address and the CTS (set to disable)
> 
> []
> 
>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> []
>> +typedef void (*rpmsg_tty_rx_cb_t)(struct rpmsg_device *, void *, int, void *,
>> +				  u32);
> 
> unused typedef?

yes i will clean it.

> 
> []
> 
>> +static int __init rpmsg_tty_init(void)
>> +{
> []
>> +	err = tty_register_driver(rpmsg_tty_driver);
>> +	if (err < 0) {
>> +		pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
>> +		goto error_put;
>> +	}
> 
> Might use vsprintf extension %pe
> 
> 		pr_err("Couldn't install rpmsg tty driver: %pe\n", ERR_PTR(err));

Seems not possible here as err is an integer value and not a pointer cast to an integer,
or I missed something?


Thanks for the review,
Arnaud
> 
>> +	err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
>> +	if (err < 0) {
>> +		pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
> 
> etc.
> 
> 
