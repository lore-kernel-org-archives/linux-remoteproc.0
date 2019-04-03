Return-Path: <jhovold@gmail.com>
Return-Path: <jhovold@gmail.com>
Date: Wed, 3 Apr 2019 10:44:20 +0200
From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] tty: add rpmsg driver
Message-ID: <20190403084420.GH6734@localhost>
References: <1553183239-13253-1-git-send-email-fabien.dessenne@st.com>
 <1553183239-13253-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1553183239-13253-3-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Mar 21, 2019 at 04:47:19PM +0100, Fabien Dessenne wrote:
> This driver exposes a standard tty interface on top of the rpmsg
> framework through the "rpmsg-tty-channel" rpmsg service.
> 
> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> per rpmsg endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/tty/Kconfig     |   9 ++
>  drivers/tty/Makefile    |   1 +
>  drivers/tty/rpmsg_tty.c | 309 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 319 insertions(+)
>  create mode 100644 drivers/tty/rpmsg_tty.c

> +static int rpmsg_tty_write(struct tty_struct *tty, const unsigned char *buf,
> +			   int total)
> +{
> +	int count, ret = 0;
> +	const unsigned char *tbuf;
> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> +	struct rpmsg_device *rpdev;
> +	int msg_size;
> +
> +	if (!cport) {
> +		dev_err(tty->dev, "cannot get cport\n");
> +		return -ENODEV;
> +	}
> +
> +	rpdev = cport->rpdev;
> +
> +	dev_dbg(&rpdev->dev, "%s: send message from tty->index = %d\n",
> +		__func__, tty->index);
> +
> +	if (!buf) {
> +		dev_err(&rpdev->dev, "buf shouldn't be null.\n");
> +		return -ENOMEM;
> +	}
> +
> +	msg_size = rpmsg_get_buf_payload_size(rpdev->ept);
> +	if (msg_size < 0)
> +		return msg_size;
> +
> +	count = total;
> +	tbuf = buf;
> +	do {
> +		/* send a message to our remote processor */
> +		ret = rpmsg_send(rpdev->ept, (void *)tbuf,
> +				 min(count, msg_size));

Just a drive-by comment; it looks like rpmsg_send() may block, but
the tty-driver write() callback must never sleep.

> +		if (ret) {
> +			dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (count > msg_size) {
> +			count -= msg_size;
> +			tbuf += msg_size;
> +		} else {
> +			count = 0;
> +		}
> +	} while (count > 0);
> +
> +	return total;
> +}

Johan
