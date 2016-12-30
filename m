Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 30 Dec 2016 04:01:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: add some kind of help
Message-ID: <20161230120116.GA9118@builder>
References: <20161219092250.GA13640@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161219092250.GA13640@amd>
To: Pavel Machek <pavel@ucw.cz>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 19 Dec 01:22 PST 2016, Pavel Machek wrote:

> 
> Top level config option without any kind of help... is kind of
> strange. Remote processors could also mean some kind of distributed
> computing...
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

Thanks, applied.

Regards,
Bjorn

> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 8f9cf0b..a5e8880 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -7,6 +7,9 @@ config REMOTEPROC
>  	select FW_LOADER
>  	select VIRTIO
>  	select VIRTUALIZATION
> +	help
> +	  Support for remote processors (such as DSP coprocessors). These
> +	  are mainly used on embedded systems.
>  
>  if REMOTEPROC
>  
> @@ -25,11 +28,11 @@ config OMAP_REMOTEPROC
>  
>  	  Currently only supported on OMAP4.
>  
> -	  Usually you want to say y here, in order to enable multimedia
> +	  Usually you want to say Y here, in order to enable multimedia
>  	  use-cases to run on your platform (multimedia codecs are
>  	  offloaded to remote DSP processors using this framework).
>  
> -	  It's safe to say n here if you're not interested in multimedia
> +	  It's safe to say N here if you're not interested in multimedia
>  	  offloading or just want a bare minimum kernel.
>  
>  config WKUP_M3_RPROC
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
