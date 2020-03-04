Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 4 Mar 2020 14:38:52 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv7 13/15] remoteproc/omap: Report device exceptions and
 trigger recovery
Message-ID: <20200304213852.GA2799@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-14-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-14-t-kristo@ti.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Feb 21, 2020 at 12:19:34PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The OMAP remote processors send a special mailbox message
> (RP_MBOX_CRASH) when they crash and detect an internal device
> exception.
> 
> Add support to the mailbox handling function upon detection of
> this special message to report this crash to the remoteproc core.
> The remoteproc core can trigger a recovery using the prevailing
> recovery mechanism, already in use for MMU Fault recovery.
> 
> Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 1ac270df4d66..7dcb5da0d940 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -383,8 +383,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>  
>  	switch (msg) {
>  	case RP_MBOX_CRASH:
> -		/* just log this for now. later, we'll also do recovery */
> +		/*
> +		 * remoteproc detected an exception, notify the rproc core.
> +		 * The remoteproc core will handle the recovery.
> +		 */
>  		dev_err(dev, "omap rproc %s crashed\n", name);
> +		rproc_report_crash(oproc->rproc, RPROC_FATAL_ERROR);
>  		break;
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", name);
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
