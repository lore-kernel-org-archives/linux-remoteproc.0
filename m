Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2 2/2] tty: add rpmsg driver
References: <1557500577-22366-1-git-send-email-arnaud.pouliquen@st.com>
 <1557500577-22366-3-git-send-email-arnaud.pouliquen@st.com>
 <20190701060039.GD1263@builder>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <ed383111-01f7-21ac-4ec5-de80776394a4@st.com>
Date: Tue, 2 Jul 2019 16:56:56 +0200
MIME-Version: 1.0
In-Reply-To: <20190701060039.GD1263@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao <xiaoxiang781216@gmail.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 7/1/19 8:00 AM, Bjorn Andersson wrote:
> On Fri 10 May 08:02 PDT 2019, Arnaud Pouliquen wrote:
> 
>> This driver exposes a standard tty interface on top of the rpmsg
>> framework through the "rpmsg-tty-channel" rpmsg service.
>>
>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
>> per rpmsg endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>>  Documentation/serial/tty_rpmsg.txt |  38 +++
>>  drivers/tty/Kconfig                |   9 +
>>  drivers/tty/Makefile               |   1 +
>>  drivers/tty/rpmsg_tty.c            | 479 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 527 insertions(+)
>>  create mode 100644 Documentation/serial/tty_rpmsg.txt
>>  create mode 100644 drivers/tty/rpmsg_tty.c
>>
>> diff --git a/Documentation/serial/tty_rpmsg.txt b/Documentation/serial/tty_rpmsg.txt
>> new file mode 100644
>> index 000000000000..e069ed268a2b
>> --- /dev/null
>> +++ b/Documentation/serial/tty_rpmsg.txt
>> @@ -0,0 +1,38 @@
>> +
>> +			The rpmsg TTY
>> +
>> +The rpmsg tty driver implements a serial communication on the rpmsg bus,
>> +to communicate with a remote processor devices in asymmetric multiprocessing
>> +(AMP) configurations.
>> +
>> +The remote processor can instantiate a new tty by requesting a new "rpmsg-tty-channel" RPMsg service. Information related to the RPMsg and
>> +associated tty device is available in /sys/bus/rpmsg/devices/virtio0.rpmsg-tty-channel.-1.<X>, with
>> +<X> corresponding to the ttyRPMSG instance.
>> +
>> +RPMsg data/control structure
>> +----------------------------
>> +
>> +The RPMsg is used to send data or control messages. Differentiation between the
>> +stream and the control messages is done thanks to the first byte of the
>> +RPMsg payload:
>> +
>> +
>> +RPMSG_DATA	- rest of messages contains data
>> +
>> +RPMSG_CTRL 	- message contains control.
>> +
>> +
>> +To be compliant with this driver, the remote firmware has to respect this RPMsg
>> +payload structure. At least the RPMSG_DATA type has to be supported. The
>> +RPMSG_CTRL is optional.
>> +
> 
> This scheme prevents us from using this driver to expose any existing
> tty-like channels without having to modify such firmware.

An alternative could be to define a channel for the control and another
for the data. This would avoid to reserved the first bytes for message type.

> 
>> +Flow control type
>> +-----------------
>> +
>> +A minimum flow control can be implemented to allow/block communication with the remote processor.
>> +
>> +DATA_TERM_READY	-	one parameter:
>> +			- u8 state
>> +				Set to indicate to remote side that terminal is
>> +				ready for communication.
>> +				Reset to block communication with remote side.
> 
> And as shown in discussions following Qualcomm's proposed flow-control
> addition to the rpmsg API the need for flow control is not limited to
> this custom tty like interface

Yes i remember discussions around the flow control, how to set
priorities, bandwidth, etc...
Did you start something on Qualcomm side to support flow control?

RPMsg flow control would also impact the remote side (a.e. OpenAMP).
This subject can be quite extensive, so perhaps, it should be better to
treat it in a separate thread to be sure that design integrate all
requirements.

What about integrating rpmsg tty in a first step (with flow control in
rpmsg tty)? Then in a second step, adapt it on the rpmsg flow control,
and so use it to validate the feature.
This would avoid to block the rpmsg_tty integration... As you mention
seems that several companies have already their own rpmsg tty
implementation...

> 
> 
> So I really would like to see an implementation of a side-band flow
> control mechanism in the virtio rpmsg bus.
> 
>> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
>> index e0a04bfc873e..d7b426939f69 100644
>> --- a/drivers/tty/Kconfig
>> +++ b/drivers/tty/Kconfig
>> @@ -442,6 +442,15 @@ config VCC
>>  	help
>>  	  Support for Sun logical domain consoles.
>>  
>> +config RPMSG_TTY
>> +	tristate "RPMSG tty driver"
>> +	depends on RPMSG
>> +	help
>> +	  Say y here to export rpmsg endpoints as tty devices, usually found
>> +	  in /dev/ttyRPMSGx.
>> +	  This makes it possible for user-space programs to send and receive
>> +	  rpmsg messages as a standard tty protocol.
>> +
>>  config LDISC_AUTOLOAD
>>  	bool "Automatically load TTY Line Disciplines"
>>  	default y
>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
>> index c72cafdf32b4..90a98a20714d 100644
>> --- a/drivers/tty/Makefile
>> +++ b/drivers/tty/Makefile
>> @@ -33,5 +33,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>>  obj-$(CONFIG_VCC)		+= vcc.o
>> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>>  
>>  obj-y += ipwireless/
>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> [..]
>> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
>> +	{ .name	= "rpmsg-tty-channel" },
> 
> I really would like a mechanism that does not depend on a fixed channel
> name, as this required that firmware is written specifically for being
> paired with this driver.
> 
> In other words this is exactly the same problem that we worked around in
> rpmsg_charTo be sure... What you propose here is to implement an attribute for the
channel (as rpmsg_eptdevd defined in rpmsg_char), allowing application
could define the channel name?

This point is similar to the one we discussed with Xiang. What should we
consider: the tty service associated to a tty channel or the service on
top of the tty which would be in this case based on rpmsg?

I considered that the service is the tty, as we create a /dev/tty when
service is requested by the remoteproc firmware, so that the service
name is fixed in consequence.

Using attribute for channel name would mean that user registers a
service that will be on top of a tty. In this case, is the TTY is the
good communication channel? why not directly use rpmsg_char?

So perhaps could be better to extend the rpmsg char device for this kind
of requirement, allowing to probe it without associate it to an existing
rpmsg device...?

Thank,
Arnaud

> 
> Regards,
> Bjorn
> 
