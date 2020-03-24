Return-Path: <rdunlap@infradead.org>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
Date: Tue, 24 Mar 2020 10:44:52 -0700
MIME-Version: 1.0
In-Reply-To: <20200324170407.16470-3-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 3/24/20 10:04 AM, Arnaud Pouliquen wrote:
> This driver exposes a standard TTY interface on top of the rpmsg
> framework through a rpmsg service.
> 
> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> per rpmsg endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  Documentation/serial/tty_rpmsg.rst |  45 ++++
>  drivers/tty/Kconfig                |   9 +
>  drivers/tty/Makefile               |   1 +
>  drivers/tty/rpmsg_tty.c            | 417 +++++++++++++++++++++++++++++
>  4 files changed, 472 insertions(+)
>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>  create mode 100644 drivers/tty/rpmsg_tty.c
> 
> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> new file mode 100644
> index 000000000000..fc1d3fba73c5
> --- /dev/null
> +++ b/Documentation/serial/tty_rpmsg.rst
> @@ -0,0 +1,45 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============
> +The rpmsg TTY
> +=============
> +
> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for user-space programs to send and receive rpmsg messages as a standard tty protocol.

                                                                         to make it possible

> +
> +The remote processor can instantiate a new tty by requesting:
> +- a "rpmsg-tty-raw" RPMsg service, for TTY raw data support without flow control
> +- a "rpmsg-tty-ctrl" RPMSg service, for TTY support with flow control.
> +
> +Information related to the RPMsg and associated tty device is available in
> +/sys/bus/rpmsg/devices/.
> +
> +RPMsg TTY without control
> +---------------------

extend underline under "control"

> +
> +The default end point associated with the "rpmsg-tty-raw" service is directly
> +used for data exchange. No flow control is available.
> +
> +To be compliant with this driver, the remote firmware must create its data end point associated with the "rpmsg-tty-raw" service.
> +
> +RPMsg TTY with control
> +---------------------

extend underline length.

> +
> +The default end point associated with the "rpmsg-tty-ctrl" service is reserved for
> +the control. A second endpoint must be created for data exchange.
> +
> +The control channel is used to transmit to the remote processor the CTS status,
> +as well as the end point address for data transfer.
> +
> +To be compatible with this driver, the remote firmware must create or use its end point associated with "rpmsg-tty-ctrl" service, plus a second endpoint for the data flow.
> +On Linux rpmsg_tty probes, the data endpoint address and the CTS (set to disable)
> +is sent to the remote processor.
> +The remote processor has to respect following rules:

                               respect the following rules:

> +- It only transmits data when Linux remote cts is enable, otherwise message

                                              CTS is enabled,

> +  could be lost.
> +- It can pause/resume reception by sending a control message (rely on CTS state).
> +
> +Control message structure:
> +struct rpmsg_tty_ctrl {
> +	u8 cts;			/* remote reception status */
> +	u16 d_ept_addr;		/* data endpoint address */
> +};

Is that struct packed or padded?



-- 
~Randy
