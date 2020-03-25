Return-Path: <jslaby@suse.cz>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <e458f805-c746-c88e-98f4-d874a7552933@suse.cz>
 <1e4ce821-dd9b-bb04-774b-58a255834cf5@st.com>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <ec061c30-eace-1df9-fa7b-71a61e5710a2@suse.cz>
Date: Wed, 25 Mar 2020 14:31:36 +0100
MIME-Version: 1.0
In-Reply-To: <1e4ce821-dd9b-bb04-774b-58a255834cf5@st.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 25. 03. 20, 14:15, Arnaud POULIQUEN wrote:
>>> +		if (copied != len)
>>> +			dev_dbg(&rpdev->dev, "trunc buffer: available space is %d\n",
>>> +				copied);
>>> +		tty_flip_buffer_push(&cport->port);
>>> +	} else {
>>> +		/* control message */
>>> +		struct rpmsg_tty_ctrl *msg = data;
>>> +
>>> +		if (len != sizeof(*msg))
>>> +			return -EINVAL;
>>> +
>>> +		cport->data_dst = msg->d_ept_addr;
>>> +
>>> +		/* Update remote cts state */
>>> +		cport->cts = msg->cts ? 1 : 0;
>>
>> Number to bool implicit conversion needs no magic, just do:
>> cport->cts = msg->cts;
> 
> In this case i would prefer  cport->cts = (msg->cts != 1);
> for the conversion

That still looks confusing. In the ternary operator above, you used
msg->cts as a bool implicitly and now you are trying to artificially
create one :)?

IOW in a bool context, "msg->cts ? 1 : 0" is the same as "msg->cts".

>>> +	/*
>>> +	 * Try to send the message to remote processor, if failed return 0 as
>>> +	 * no data sent
>>> +	 */
>>> +	ret = rpmsg_trysendto(cport->d_ept, tmpbuf, msg_size, cport->data_dst);
>>
>> data of rpmsg_trysendto is not const. OK, you seem you need to change
>> that first, I see no blocker for that.
> 
> I created a temporary buffer to ensure that buffer to sent does not exceed the 
> MTU size.
> But perhaps this is an useless protection as the rpmsg_tty_write_room already
> return the MTU value, and so the 'len' variable can not be higher that value
> returned by the write_room?

You still can limit it by msg_size without cloning the buffer, right?

>>> +static int rpmsg_tty_port_activate(struct tty_port *p, struct tty_struct *tty)
>>> +{
>>> +	p->low_latency = (p->flags & ASYNC_LOW_LATENCY) ? 1 : 0;
>>> +
>>> +	/* Allocate the buffer we use for writing data */
>>
>> Where exactly -- am I missing something?
> 
> in tty_port_alloc_xmit_buf. it's a copy past from mips_ejtag_fdc.c,
> I will clean this line if it's confusing.

No, I mean where do you use the allocated buffer? mips_ejtag_fdc.c uses it.

>>> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
>>> +{
>>> +	struct rpmsg_tty_port *cport;
>>> +	struct device *dev = &rpdev->dev;
>>> +	struct rpmsg_channel_info chinfo;
>>> +	struct device *tty_dev;
>>> +	int ret;
>>> +
>>> +	cport = rpmsg_tty_alloc_cport();
>>> +	if (IS_ERR(cport)) {
>>> +		dev_err(dev, "failed to alloc tty port\n");
>>> +		return PTR_ERR(cport);
>>> +	}
>>> +
>>> +	if (!strncmp(rpdev->id.name, TTY_CH_NAME_WITH_CTS,
>>> +		     sizeof(TTY_CH_NAME_WITH_CTS))) {
>>
>> sizeof of a string feels unnatural, but will work in this case. Can a
>> compiler optimize strlen of a static string?
> 
> I don't know if a compiler can do this...
> what about replacing sizeof by strlen function? 
> i saw some code example that use strlen with static string...
> (e.g  https://elixir.bootlin.com/linux/latest/source/drivers/edac/edac_mc.c#L1193)

The question was exactly about that: can a compiler optimize it to a
bare number or will strlen call remain there?

thanks,
-- 
js
suse labs
