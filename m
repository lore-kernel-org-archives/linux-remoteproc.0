Return-Path: <rdunlap@infradead.org>
Subject: Re: [PATCH 2/2] rpmsg: add syslog redirection driver
References: <1550116097-29710-1-git-send-email-xiaoxiang@xiaomi.com>
 <1550116097-29710-2-git-send-email-xiaoxiang@xiaomi.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <242f03bc-ce43-7827-3621-57e052672dfe@infradead.org>
Date: Wed, 13 Feb 2019 20:08:28 -0800
MIME-Version: 1.0
In-Reply-To: <1550116097-29710-2-git-send-email-xiaoxiang@xiaomi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Xiang Xiao <xiaoxiang781216@gmail.com>, gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, andriy.shevchenko@linux.intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On 2/13/19 7:48 PM, Xiang Xiao wrote:
> From: Guiding Li <liguiding@pinecone.net>
> 
> This driver allows the remote processor redirect the output of

                                processor to redirect

> syslog/printf into the kernel log, which is very useful to see
> what happen in the remote side.
> 
> Signed-off-by: Guiding Li <liguiding@pinecone.net>
> ---
>  drivers/rpmsg/Kconfig        |  12 ++++
>  drivers/rpmsg/Makefile       |   1 +
>  drivers/rpmsg/rpmsg_syslog.c | 163 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index d0322b4..d701614 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -15,6 +15,18 @@ config RPMSG_CHAR
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_SYSLOG
> +	tristate "RPMSG syslog redirection"
> +	depends on RPMSG
> +	help
> +	  Say Y here to redirect the syslog/printf from remote processor into
> +	  the kernel log which is very useful to see what happen in the remote

	                                         see what happens
	or                                       see what happened

> +	  side.
> +
> +	  If the remote processor hang during bootup or panic at the runtime,

	                          hangs during bootup or panics during runtime,


> +	  We can even cat /sys/kernel/debug/remoteproc/remoteprocX/trace0 to

	  we

> +	  get the last log which doesn't output yet.

	  get the last log which hasn't been output yet.

> +
>  config RPMSG_QCOM_GLINK_NATIVE
>  	tristate
>  	select RPMSG

-- 
~Randy
