Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 3/5] remoteproc: qcom: mdt_loader: Refactor MDT loader
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
 <20170130165547.4344-3-bjorn.andersson@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f4f469ae-f4ac-fd74-4085-4092d0902a2e@linaro.org>
Date: Thu, 2 Feb 2017 17:21:11 +0200
MIME-Version: 1.0
In-Reply-To: <20170130165547.4344-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Thanks for the patch!

On 01/30/2017 06:55 PM, Bjorn Andersson wrote:
> Pushing the SCM calls into the MDT loader reduces duplication in the
> callers and allows for non-remoteproc clients to use the helper for
> parsing and loading MDT files.
> 
> Cc: Andy Gross <andy.gross@linaro.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_adsp_pil.c   |  29 +-------
>  drivers/remoteproc/qcom_mdt_loader.c | 134 +++++++++++++++++++++++------------
>  drivers/remoteproc/qcom_mdt_loader.h |   6 +-
>  drivers/remoteproc/qcom_q6v5_pil.c   |   4 +-
>  drivers/remoteproc/qcom_wcnss.c      |  29 +-------
>  5 files changed, 100 insertions(+), 102 deletions(-)
> 

<snip>

> diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
> index 2393398f63ea..f239f6fddbb7 100644
> --- a/drivers/remoteproc/qcom_mdt_loader.c
> +++ b/drivers/remoteproc/qcom_mdt_loader.c
> @@ -19,6 +19,7 @@
>  #include <linux/firmware.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/qcom_scm.h>
>  #include <linux/remoteproc.h>

Please delete remoteproc.h it is not needed anymore.

>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -45,24 +46,33 @@ struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
>  }
>  EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
>  
> +static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
> +{
> +	if (phdr->p_type != PT_LOAD)
> +		return false;
> +
> +	if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
> +		return false;
> +
> +	if (!phdr->p_memsz)
> +		return false;
> +
> +	return true;
> +}
> +

<snip>

-- 
regards,
Stan
