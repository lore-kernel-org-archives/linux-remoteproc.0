Return-Path: <sricharan@codeaurora.org>
Subject: Re: [RESEND: PATCH v4 2/4] remoteproc: qcom: refactor mss fw image
 loading sequence
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-3-git-send-email-akdwived@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <22b47349-9fe1-6d2d-d973-95bae7d5e5fb@codeaurora.org>
Date: Sat, 20 May 2017 08:25:24 +0530
MIME-Version: 1.0
In-Reply-To: <1494957722-13264-3-git-send-email-akdwived@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn/Avaneesh,

On 5/16/2017 11:32 PM, Avaneesh Kumar Dwivedi wrote:
> This patch refactor code to first load all firmware blobs
> and then update modem proc to authenticate and boot fw.
> Also make a trivial change in a error log.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 8fd697a..2626954 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -466,9 +466,10 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  
>  	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS, 1000);
>  	if (ret == -ETIMEDOUT)
> -		dev_err(qproc->dev, "MPSS header authentication timed out\n");
> +		dev_err(qproc->dev, "metadata authentication timed out\n");
>  	else if (ret < 0)
> -		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
> +		dev_err(qproc->dev,
> +			"metadata authentication failed: %d\n", ret);
>  
>  	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
>  
> @@ -503,7 +504,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	bool relocate = false;
>  	char seg_name[10];
>  	ssize_t offset;
> -	size_t size;
> +	size_t size = 0;
>  	void *ptr;
>  	int ret;
>  	int i;
> @@ -541,7 +542,9 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
> -
> +	/* Load firmware completely before letting mss to start
> +	 * authentication and then boot firmware
> +	 */
>  	for (i = 0; i < ehdr->e_phnum; i++) {
>  		phdr = &phdrs[i];
>  
> @@ -574,17 +577,13 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			memset(ptr + phdr->p_filesz, 0,
>  			       phdr->p_memsz - phdr->p_filesz);
>  		}
> -
> -		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> -		if (!size) {
> -			boot_addr = relocate ? qproc->mpss_phys : min_addr;
> -			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> -			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> -		}
> -
>  		size += phdr->p_memsz;
> -		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>  	}

So while moving this down, can we use qcom_mdt_load instead for the mpss
image loading part above ?

> +	/* Transfer ownership of modem region with modem fw */
> +	boot_addr = relocate ? qproc->mpss_phys : min_addr;
> +	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> +	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);

For ipq8074 [1], wcnss core has an Q6V5 version of the ip for which the
initialization/boot sequence is pretty much the same as that has been added
for msm8996 in this series. So wanted to understand if its better to
use this remoteproc itself by keeping the Q6 and mpss parts separately (or)
add a new remoteproc ?

[1] https://patchwork.kernel.org/patch/9711725/

Regards,
 Sricharan

>  
>  	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>  	if (ret == -ETIMEDOUT)
> 

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
