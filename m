Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2 2/2] tty: add rpmsg driver
References: <1557500577-22366-1-git-send-email-arnaud.pouliquen@st.com>
 <1557500577-22366-3-git-send-email-arnaud.pouliquen@st.com>
 <20190516182058.2a565748@alans-desktop>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <28d67a7b-4b75-f2fc-3058-776b37d90622@st.com>
Date: Fri, 17 May 2019 15:21:24 +0200
MIME-Version: 1.0
In-Reply-To: <20190516182058.2a565748@alans-desktop>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao <xiaoxiang781216@gmail.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Alan,

On 5/16/19 7:20 PM, Alan Cox wrote:
> 
>> +static int rpmsg_tty_data_handler(struct rpmsg_device *rpdev, void *data,
>> +				  int len, void *priv, u32 src)
>> +{
>> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
>> +	u8 *cbuf;
>> +	int space;
>> +
>> +	dev_dbg(&rpdev->dev, "msg(<- src 0x%x) len %d\n", src, len);
>> +
>> +	if (!len)
>> +		return 0;
>> +
>> +	dev_dbg(&rpdev->dev, "space available: %d\n",
>> +		tty_buffer_space_avail(&cport->port));
>> +
>> +	space = tty_prepare_flip_string(&cport->port, &cbuf, len);
>> +	if (space <= 0) {
>> +		dev_err(&rpdev->dev, "No memory for tty_prepare_flip_string\n");
>> +		return -ENOMEM;
>> +	}
> 
> Really bad idea.
> 
> 1. It's not an 'error'. It's normal that in the case the consumer is
> blocked you can run out of processing space
> 
> 2. You will trigger this when being hit by a very large fast flow of data
> so responding by burning CPU spewing messages (possibly even out of this
> tty) is bad.
> 
> It's not a bug - just keep statistics and throw it away. If anyone cares
> they will do flow control.

Indeed,and there is a similar issue in the rpmsg_tty_write_control (on
rpmsg_trysend failure), i will change message level to debug.
Furthermore  there is a nonsense to return error to rpmsg framework as
rpmsg reception is ok...

> 
> 
>> +
>> +static int rpmsg_tty_write_control(struct tty_struct *tty, u8 ctrl, u8 *values,
>> +				   unsigned int n_value)
>> +{
>> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
>> +	struct rpmsg_tty_payload *msg;
>> +	struct rpmsg_tty_ctrl *m_ctrl;
>> +	struct rpmsg_device *rpdev;
>> +	unsigned int msg_size;
>> +	int ret;
>> +
>> +	if (!cport) {
>> +		dev_err(tty->dev, "cannot get cport\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	rpdev = cport->rpdev;
>> +
>> +	msg_size = sizeof(*msg) + sizeof(*m_ctrl) + n_value;
>> +	msg = kzalloc(msg_size, GFP_KERNEL);
> 
> 
> Out of memory check ?
> 
>> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
>> +{
>> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
>> +	struct rpmsg_device *rpdev;
>> +	int msg_size, msg_max_size, ret = 0;
>> +	int cmd_sz = sizeof(struct rpmsg_tty_payload);
>> +	u8 *tmpbuf;
>> +
>> +	if (!cport) {
>> +		dev_err(tty->dev, "cannot get cport\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* If cts not set, the message is not sent*/
>> +	if (!cport->cts)
>> +		return 0;
>> +
>> +	rpdev = cport->rpdev;
>> +
>> +	dev_dbg(&rpdev->dev, "%s: send msg from tty->index = %d, len = %d\n",
>> +		__func__, tty->index, len);
>> +	if (!buf) {
>> +		dev_err(&rpdev->dev, "buf shouldn't be null.\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	msg_max_size = rpmsg_get_buf_payload_size(rpdev->ept);
>> +	if (msg_max_size < 0)
>> +		return msg_max_size;
>> +
>> +	msg_size = min(len + cmd_sz, msg_max_size);
>> +	tmpbuf = kzalloc(msg_size, GFP_KERNEL);
> 
> Allocation failure check ?
> 

Thanks for your comments, i will fix in a v3.

Regards
Arnaud
