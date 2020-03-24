Return-Path: <gregkh@linuxfoundation.org>
Date: Tue, 24 Mar 2020 18:18:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
Message-ID: <20200324171806.GB2522961@kroah.com>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324170407.16470-3-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 24, 2020 at 06:04:07PM +0100, Arnaud Pouliquen wrote:
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

Can you wrap your lines properly for this file?

thanks,

greg k-h
