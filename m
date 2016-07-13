Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Jul 2016 12:16:19 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update hwspinlock paths
Message-ID: <20160713191619.GM23833@tuxbot>
References: <1467863293-3951-1-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467863293-3951-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Jul 20:48 PDT 2016, Bjorn Andersson wrote:

> Include all files in drivers/hwspinlock and hwlock related dt bindings
> in the hw spinlock section of MAINTAINERS.
> 
> Cc: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 87b956d492c8..697f797f9e06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5268,8 +5268,9 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
>  L:	linux-remoteproc@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/hwspinlock.git
> +F:	Documentation/devicetree/bindings/hwlock/
>  F:	Documentation/hwspinlock.txt
> -F:	drivers/hwspinlock/hwspinlock_*
> +F:	drivers/hwspinlock/
>  F:	include/linux/hwspinlock.h
>  
>  HARMONY SOUND DRIVER
> -- 
> 2.5.0
> 
