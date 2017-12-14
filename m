Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:21:10 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 08/16] remoteproc: add name in rproc_mem_entry struct
Message-ID: <20171214012110.GJ17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-9-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-9-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> Add name field in struc rproc_mem_entry.
> This new field will be used to match memory area
> requested in resource table with pre-registered carveout.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c    | 1 +
>  drivers/remoteproc/remoteproc_debugfs.c | 1 +
>  include/linux/remoteproc.h              | 2 ++
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index bdc99cd..cc53247 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -835,6 +835,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	carveout->da = rsc->da;
>  	carveout->release = rproc_release_carveout;
>  	carveout->priv = (void *)CARVEOUT_RSC_ALLOCATED;
> +	strncpy(carveout->name, rsc->name, sizeof(carveout->name));

Please ensure that this string is NUL terminated.

Regards,
Bjorn
