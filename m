Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 22 May 2019 00:10:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc,rpmsg: add missing MAINTAINERS file entries
Message-ID: <20190522071005.GQ31596@builder>
References: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 14 May 04:02 PDT 2019, Robert P. J. Day wrote:

> Add a few missing file and directory entries related to both
> remoteproc and rpmsg.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Applied

Thanks,
Bjorn

> 
> ---
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb9f9d71f7a2..fa0958e23b97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13294,9 +13294,11 @@ L:	linux-remoteproc@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/remoteproc/
> +F:	Documentation/ABI/testing/sysfs-class-remoteproc
>  F:	Documentation/remoteproc.txt
>  F:	drivers/remoteproc/
>  F:	include/linux/remoteproc.h
> +F:	include/linux/remoteproc/
> 
>  REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
>  M:	Ohad Ben-Cohen <ohad@wizery.com>
> @@ -13306,8 +13308,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
>  S:	Maintained
>  F:	drivers/rpmsg/
>  F:	Documentation/rpmsg.txt
> +F:	Documentation/ABI/testing/sysfs-bus-rpmsg
>  F:	include/linux/rpmsg.h
>  F:	include/linux/rpmsg/
> +F:	include/uapi/linux/rpmsg.h
> +F:	samples/rpmsg/
> 
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
