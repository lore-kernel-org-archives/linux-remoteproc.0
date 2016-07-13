Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Jul 2016 09:51:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 44/46] remoteproc: qcom: Use unsigned long for
 dma_attrs
Message-ID: <20160713165131.GK23833@tuxbot>
References: <1468399300-5399-35-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-36-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-37-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-38-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-39-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-40-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-41-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-42-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-43-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-44-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1468399300-5399-44-git-send-email-k.kozlowski@samsung.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, hch@infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 13 Jul 01:41 PDT 2016, Krzysztof Kozlowski wrote:

> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes since v5:
> New patch.
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index fb4c56cc6dfc..4913ec6f9d00 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -349,13 +349,12 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
>  
>  static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  {
> -	DEFINE_DMA_ATTRS(attrs);
> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>  	dma_addr_t phys;
>  	void *ptr;
>  	int ret;
>  
> -	dma_set_attr(DMA_ATTR_FORCE_CONTIGUOUS, &attrs);
> -	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, &attrs);
> +	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, dma_attrs);
>  	if (!ptr) {
>  		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
>  		return -ENOMEM;
> @@ -372,7 +371,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  	else if (ret < 0)
>  		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
>  
> -	dma_free_attrs(qproc->dev, fw->size, ptr, phys, &attrs);
> +	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
>  
>  	return ret < 0 ? ret : 0;
>  }
> -- 
> 1.9.1
> 
