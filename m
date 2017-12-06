Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 6 Dec 2017 13:59:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 16/45] drivers: rpmsg: remove duplicate includes
Message-ID: <20171206215940.GB17344@builder>
References: <1512579761-5613-1-git-send-email-pravin.shedge4linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512579761-5613-1-git-send-email-pravin.shedge4linux@gmail.com>
To: Pravin Shedge <pravin.shedge4linux@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Dec 09:02 PST 2017, Pravin Shedge wrote:

> These duplicate includes have been found with scripts/checkincludes.pl but
> they have been removed manually to avoid removing false positives.
> 

Applied.

Thanks,
Bjorn

> Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 5cdaa5f..057528e 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -29,8 +29,6 @@
>  #include <linux/workqueue.h>
>  #include <linux/list.h>
>  
> -#include <linux/delay.h>
> -#include <linux/rpmsg.h>
>  #include <linux/rpmsg/qcom_glink.h>
>  
>  #include "qcom_glink_native.h"
> -- 
> 2.7.4
> 
