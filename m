Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Jul 2018 21:15:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: Reset table_ptr in rproc_start() failure
 paths
Message-ID: <20180731041559.GC5090@builder>
References: <20180727011535.21729-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727011535.21729-1-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 26 Jul 18:15 PDT 2018, Suman Anna wrote:

> Unwind the modified table_ptr and restore it to the local copy
> upon any subsequent failures in the rproc_start() function. This
> keeps the function to remain balanced on failures without the need
> to balance any modified variables elsewhere.
> 

Good catch.

> While at this, do some minor cleanup of the extra lines between
> the failure labels as well.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index eadff6ce2f7f..afef2d491c5b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -953,7 +953,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		return ret;
> +		goto reset_table_ptr;
>  	}
>  
>  	/* power up the remote processor */
> @@ -979,10 +979,11 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  
>  stop_rproc:
>  	rproc->ops->stop(rproc);
> -
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
> -
> +reset_table_ptr:
> +	if (loaded_table)

Regardless of us having a loaded_table it should have the same value as
cached_table when we return - which might be NULL if we don't have a
resource table.

So I applied this without the conditional, please object if I missed
something.

Regards,
Bjorn

> +		rproc->table_ptr = rproc->cached_table;
>  	return ret;
>  }
>  
> -- 
> 2.18.0
> 
