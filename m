Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: Make rpmsg sample selectable
References: <1462557972-32699-1-git-send-email-bjorn.andersson@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <572CEF9B.7090503@ti.com>
Date: Fri, 6 May 2016 14:25:15 -0500
MIME-Version: 1.0
In-Reply-To: <1462557972-32699-1-git-send-email-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 05/06/2016 01:06 PM, Bjorn Andersson wrote:
> rpmsg is not user selectable so the rpmsg sample should not depend on
> it, as this limits the possibility of compiling the sample client
> without any other clients.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  samples/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/samples/Kconfig b/samples/Kconfig
> index d54f28c6dc5e..61a251e579ed 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -57,7 +57,8 @@ config SAMPLE_KDB
>  
>  config SAMPLE_RPMSG_CLIENT
>  	tristate "Build rpmsg client sample -- loadable modules only"
> -	depends on RPMSG && m
> +	select RPMSG
> +	depends on m

Well, I believe this has to do with the fact that we also need to have a
remoteproc driver enabled, as you cannot have the sample running by
itself. A remoteproc driver implementing RPMSG would select it, and then
this sample can be enabled. In fact, I follow this for all rpmsg bus
drivers.

regards
Suman

>  	help
>  	  Build an rpmsg client sample driver, which demonstrates how
>  	  to communicate with an AMP-configured remote processor over
> 
