Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 10/17] remoteproc: add helper function to check
 carveout device address
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-11-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <2844874b-9484-aeee-c614-411d0ff38d12@ti.com>
Date: Tue, 23 Oct 2018 17:14:18 -0500
MIME-Version: 1.0
In-Reply-To: <1532697292-14272-11-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 7/27/18 8:14 AM, Loic Pallardy wrote:
> This patch introduces a function to verify that a specified carveout
> is fitting request device address and associated length
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 47 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1e0fe3e..5dd5edf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -259,6 +259,53 @@ struct rproc_mem_entry *
>  	return mem;
>  }
>  
> +/**
> + * rproc_check_carveout_da() - Check specified carveout da configuration
> + * @rproc: handle of a remote processor
> + * @mem: pointer on carveout to check
> + * @da: area device address
> + * @len: associated area size
> + *
> + * This function is a helper function to verify requested device area (couple
> + * da, len) is part of specified carevout.

%s/carevout/carveout/

> + *
> + * Return: 0 if carveout matchs request else -ENOMEM

%s/matchs/matches/

> + */
> +int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,

static int since this seems to be only a local function.

> +			    u32 da, u32 len)
> +{
> +	struct device *dev = &rproc->dev;
> +	int delta = 0;
> +
> +	/* Check requested resource length */
> +	if (len > mem->len) {
> +		dev_err(dev, "Registered carveout doesn't fit len request\n");
> +		return -ENOMEM;

ENOMEM not typically used for these kind of errors, you were probably
inclined to used this since it is dealing with memory.

> +	}
> +

Both the below codepaths are exercised only when da is not
FW_RSC_ADDR_ANY, and you are returning 0 otherwise (which is the case of
matches as per your description above). Is that what you really want -
should it be an error

> +	if (da != FW_RSC_ADDR_ANY && mem->da == FW_RSC_ADDR_ANY) {
> +		/* Update existing carveout da */
> +		mem->da = da;

Where would you need to update this?

regards
Suman

> +	} else if (da != FW_RSC_ADDR_ANY && mem->da != FW_RSC_ADDR_ANY) {
> +		delta = da - mem->da;
> +
> +		/* Check requested resource belongs to registered carveout */
> +		if (delta < 0) {
> +			dev_err(dev,
> +				"Registered carveout doesn't fit da request\n");
> +			return -ENOMEM;
> +		}
> +
> +		if (delta + len > mem->len) {
> +			dev_err(dev,
> +				"Registered carveout doesn't fit len request\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;


> +}
> +
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> 
