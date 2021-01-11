Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9BDC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A570222CE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404161AbhAKU0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403977AbhAKU0F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:26:05 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C57C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:25:25 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cq1so41461pjb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w8VxJX6beIhAXJc3acjjc3K/5zJDMwLuFMCXOElPpV8=;
        b=AdIXoH8Varp11aSBlBLuYXiWZTEFJdErFsu5hHuGiiQLuP29DPsIxueVLBt2ze5cct
         ZjakxAnwprNKncOMzdn8JzJLaKDdvIeeJGIyiaf+P/dw7lXKb+o+Xm4A0tJJfoyQIlWQ
         x4y7TYcd0d1SLKloHkMgwhdMGktlc95bLoixOlilynhthe6dZ+ytb/B/uowRCDe1MZes
         1krblwZ/X/3oDwdlfcPCetFyHmv2GhYSc8eg7RKlSeu+t0KEygwSi1L9bpQ1K1tl7Nzh
         v6doqtYsQnuibZoN3DDylYBiM8KCox3E9cKdnLKWm2Ugq8mzrI0/5WI2QQ4j1vCJfHcq
         N7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w8VxJX6beIhAXJc3acjjc3K/5zJDMwLuFMCXOElPpV8=;
        b=gnXHGyWNPOKZuglKKiWOcft7UkES4Cqz64ql7azHSYi1tFKG6FdrIpLkJF4dIEEkVA
         AWboImzrlXS80XVv0fLExRjzp9flwiILmxyasAk7DcTb5GNSllDv0MwzI1SS9W+Vl01r
         56qCgZAmTiBcFXUDNLZ5BqwSryaWM9DqpSU8/2KXc/qrcjJZ9yXzUfRViNJ0/C3GGdSh
         3qVEpvzgWwJxEOOKiaDVOS6IWQxUygCh5Jx0tdzcUM1Cho56NJAgCTXaNSuKibtluZOL
         dAolZG3kDR2xg0w4s1CxIdXgwQZ//5whaMQC+bZtGNDYmiHD02H8NH7j+LkzffRsb47O
         Ln5w==
X-Gm-Message-State: AOAM532d7MpxEO1YQrQji2RwN7dPHNi3pjkfo0KT6rcVsV9nAMIThOFU
        K8P2DUDxPzWActJVVjdYcWlgYg==
X-Google-Smtp-Source: ABdhPJxMcM5Rp5CfsYSymTYIKdtKpS/Eru+VJLuknNb9o9CFbmNPYg8rMTydjJbKsCefsb5JknyRMQ==
X-Received: by 2002:a17:90a:7142:: with SMTP id g2mr651175pjs.92.1610396724785;
        Mon, 11 Jan 2021 12:25:24 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y69sm465402pfb.64.2021.01.11.12.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 12:25:23 -0800 (PST)
Date:   Mon, 11 Jan 2021 13:25:21 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V5 2/8] remoteproc: add is_iomem to da_to_va
Message-ID: <20210111202521.GE144935@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-3-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-3-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 29, 2020 at 11:30:13AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Introduce an extra parameter is_iomem to da_to_va, then the caller
> could take the memory as normal memory or io mapped memory.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c             |  2 +-
>  drivers/remoteproc/ingenic_rproc.c         |  2 +-
>  drivers/remoteproc/keystone_remoteproc.c   |  2 +-
>  drivers/remoteproc/mtk_scp.c               |  6 +++---
>  drivers/remoteproc/omap_remoteproc.c       |  2 +-
>  drivers/remoteproc/pru_rproc.c             |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c         |  2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c        |  2 +-
>  drivers/remoteproc/qcom_wcnss.c            |  2 +-
>  drivers/remoteproc/remoteproc_core.c       |  7 +++++--
>  drivers/remoteproc/remoteproc_coredump.c   |  8 ++++++--
>  drivers/remoteproc/remoteproc_debugfs.c    |  2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c | 21 +++++++++++++++------
>  drivers/remoteproc/remoteproc_internal.h   |  2 +-
>  drivers/remoteproc/st_slim_rproc.c         |  2 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c  |  2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c   |  2 +-
>  drivers/remoteproc/wkup_m3_rproc.c         |  2 +-
>  include/linux/remoteproc.h                 |  2 +-
>  20 files changed, 45 insertions(+), 29 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 8957ed271d20..6603e00bb6f4 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -208,7 +208,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	return -ENOENT;
>  }
>  
> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	void *va = NULL;
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 26e19e6143b7..bb5049295576 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -116,7 +116,7 @@ static void ingenic_rproc_kick(struct rproc *rproc, int vqid)
>  	writel(vqid, vpu->aux_base + REG_CORE_MSG);
>  }
>  
> -static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct vpu *vpu = rproc->priv;
>  	void __iomem *va = NULL;
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index cd266163a65f..54781f553f4e 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
>   * can be used either by the remoteproc core for loading (when using kernel
>   * remoteproc loader), or by any rpmsg bus drivers.
>   */
> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct keystone_rproc *ksproc = rproc->priv;
>  	void __iomem *va = NULL;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e0c235690361..535175f013e4 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -270,7 +270,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		}
>  
>  		/* grab the kernel address for this device address */
> -		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz);
> +		ptr = (void __iomem *)rproc_da_to_va(rproc, da, memsz, NULL);
>  		if (!ptr) {
>  			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
>  			ret = -EINVAL;
> @@ -458,7 +458,7 @@ static int scp_start(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
>  	int offset;
> @@ -587,7 +587,7 @@ void *scp_mapping_dm_addr(struct mtk_scp *scp, u32 mem_addr)
>  {
>  	void *ptr;
>  
> -	ptr = scp_da_to_va(scp->rproc, mem_addr, 0);
> +	ptr = scp_da_to_va(scp->rproc, mem_addr, 0, NULL);
>  	if (!ptr)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index d94b7391bf9d..43531caa1959 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -728,7 +728,7 @@ static int omap_rproc_stop(struct rproc *rproc)
>   * Return: translated virtual address in kernel memory space on success,
>   *         or NULL on failure.
>   */
> -static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct omap_rproc *oproc = rproc->priv;
>  	int i;
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 2667919d76b3..2dcaa274e266 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -465,7 +465,7 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>   * core for any PRU client drivers. The PRU Instruction RAM access is restricted
>   * only to the PRU loader code.
>   */
> -static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct pru_rproc *pru = rproc->priv;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e02450225e4a..8b0d8bbacd2e 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -281,7 +281,7 @@ static int adsp_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ee586226e438..333a1e389fcd 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -242,7 +242,7 @@ static int adsp_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 78ebe1168b33..704cd63c9af4 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -410,7 +410,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index f95854255c70..1bf60dc84f69 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -320,7 +320,7 @@ static int wcnss_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>  	int offset;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 2394eef383e3..9bec422ccce3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -189,13 +189,13 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>   * here the output of the DMA API for the carveouts, which should be more
>   * correct.
>   */
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct rproc_mem_entry *carveout;
>  	void *ptr = NULL;
>  
>  	if (rproc->ops->da_to_va) {
> -		ptr = rproc->ops->da_to_va(rproc, da, len);
> +		ptr = rproc->ops->da_to_va(rproc, da, len, is_iomem);
>  		if (ptr)
>  			goto out;
>  	}
> @@ -217,6 +217,9 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  
>  		ptr = carveout->va + offset;
>  
> +		if (is_iomem)
> +			*is_iomem = carveout->is_iomem;
> +
>  		break;
>  	}
>  
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index 81ec154a6a5e..aee657cc08c6 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -153,18 +153,22 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
>  			       size_t offset, size_t size)
>  {
>  	void *ptr;
> +	bool is_iomem;
>  
>  	if (segment->dump) {
>  		segment->dump(rproc, segment, dest, offset, size);
>  	} else {
> -		ptr = rproc_da_to_va(rproc, segment->da + offset, size);
> +		ptr = rproc_da_to_va(rproc, segment->da + offset, size, &is_iomem);
>  		if (!ptr) {
>  			dev_err(&rproc->dev,
>  				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
>  				&segment->da, offset, size);
>  			memset(dest, 0xff, size);
>  		} else {
> -			memcpy(dest, ptr, size);
> +			if (is_iomem)
> +				memcpy_fromio(dest, ptr, size);
> +			else
> +				memcpy(dest, ptr, size);
>  		}
>  	}
>  }
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 7e5845376e9f..b5a1e3b697d9 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -132,7 +132,7 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
>  	char buf[100];
>  	int len;
>  
> -	va = rproc_da_to_va(data->rproc, trace->da, trace->len);
> +	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
>  
>  	if (!va) {
>  		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index df68d87752e4..c02d4fec93a9 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -175,6 +175,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		u64 offset = elf_phdr_get_p_offset(class, phdr);
>  		u32 type = elf_phdr_get_p_type(class, phdr);
>  		void *ptr;
> +		bool is_iomem;
>  
>  		if (type != PT_LOAD)
>  			continue;
> @@ -204,7 +205,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		}
>  
>  		/* grab the kernel address for this device address */
> -		ptr = rproc_da_to_va(rproc, da, memsz);
> +		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
>  		if (!ptr) {
>  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
>  				memsz);
> @@ -213,8 +214,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (filesz)
> -			memcpy(ptr, elf_data + offset, filesz);
> +		if (filesz) {
> +			if (is_iomem)
> +				memcpy_fromio(ptr, elf_data + offset, filesz);
> +			else
> +				memcpy(ptr, elf_data + offset, filesz);
> +		}
>  
>  		/*
>  		 * Zero out remaining memory for this segment.
> @@ -223,8 +228,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		 * did this for us. albeit harmless, we may consider removing
>  		 * this.
>  		 */
> -		if (memsz > filesz)
> -			memset(ptr + filesz, 0, memsz - filesz);
> +		if (memsz > filesz) {
> +			if (is_iomem)
> +				memset_io(ptr + filesz, 0, memsz - filesz);
> +			else
> +				memset(ptr + filesz, 0, memsz - filesz);
> +		}
>  	}
>  
>  	return ret;
> @@ -377,6 +386,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  		return NULL;
>  	}
>  
> -	return rproc_da_to_va(rproc, sh_addr, sh_size);
> +	return rproc_da_to_va(rproc, sh_addr, sh_size, NULL);
>  }
>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index c34002888d2c..9ea37aa687d2 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -84,7 +84,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>  
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 09bcb4d8b9e0..22096adc1ad3 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct st_slim_rproc *slim_rproc = rproc->priv;
>  	void *va = NULL;
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 863c0214e0a8..fd4eb67a6681 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -354,7 +354,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>   * can be used either by the remoteproc core for loading (when using kernel
>   * remoteproc loader), or by any rpmsg bus drivers.
>   */
> -static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct k3_dsp_rproc *kproc = rproc->priv;
>  	void __iomem *va = NULL;
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 62b5a4c29456..5cf8d030a1f0 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -590,7 +590,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   * present in a DSP or IPU device). The translated addresses can be used
>   * either by the remoteproc core for loading, or by any rpmsg bus drivers.
>   */
> -static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct k3_r5_rproc *kproc = rproc->priv;
>  	struct k3_r5_core *core = kproc->core;
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 92d387dfc03b..484f7605823e 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -89,7 +89,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>  	return error;
>  }
>  
> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
>  	void *va = NULL;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a5f6d2d9cde2..1b7d56c7a453 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -386,7 +386,7 @@ struct rproc_ops {
>  	int (*stop)(struct rproc *rproc);
>  	int (*attach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
> -	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
> +	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> -- 
> 2.28.0
> 
