Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28D9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA5CA229C5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLVA02 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 19:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgLVA01 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 19:26:27 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EAAC061793
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:25:47 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 11so10446327oty.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cEaSTEHl+r5F9rYwrujCizE2t43irjHCi67SJ6r7WMQ=;
        b=jyU0j2Ro5/E0AENVR1ivC9ydX7+h5+0aQUVAl49q52lSlOecdowqIrB1fWsYzBW7uC
         RTf8GzyD3xCf4U3MS5BRqONHWVlKPJ6PXgANdzdPhwb8dW/s6c1FR7SbUhQzbcmvHh8c
         jETFZd6Tg2Z8yGoWRv0nOLUjwuCMXzcjnQNftXvyXFWREZY6/sF/A/wUmMNTyjnuAK2e
         odST0ziU/L2O1+Qxn3P8JeMmCjq2HJ1IuYjRExEjfWnbzAQTFgQX3cHM1v4CAOWf4xh3
         aSc1MQw2CZ4bp4veYso6in9JcT2s7BfayPFxrSQ9Y/ALyCZzfPvKiUwlndHseNWdUWiu
         +5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cEaSTEHl+r5F9rYwrujCizE2t43irjHCi67SJ6r7WMQ=;
        b=ca6lMGbBJU0p0dxaykSsQEmQqJnXyN89d9RrFXWQXvcwEfL42cukCnQni9inZ7vC7h
         edO8oLV5DoguZExjCtStjFM58bBslK8Cn5WM1v8zqKHvZNV70+3mnrNzLkZOm6lYkoQe
         Bbrp9NoxXte/EsovuTn3jpIGsE6mbofa3DM1nU4O0CgAadGmA4tfLpgR7aIpGeUnARu8
         yYJ2OHX8FT6jPiJrFAKJgnUby8y+0HzVUiQlpyfogpYd/yfe0KtHF9ma5/m9kDDU1OyO
         aPDzAnZkweviV9atLDREyQs+1RTGjJY0AOdoNp9kTcE5jPbX1DXs8g9IyguyjwGBbJvh
         6wzQ==
X-Gm-Message-State: AOAM5322OaHOZvSvpV2csUQa712kPb0qOQx2Xc512Ao6z6E6p/D9JnkO
        s3eLORCjlywaHgnmYVMXsukn7XE7RBsVmQ==
X-Google-Smtp-Source: ABdhPJwlD0J9XKtcmAenohDJVAgRnOS7jSix+ykmFp5FkJoLpM2eBtsg2esX7DbnN9kRlo2rds0eYg==
X-Received: by 2002:a9d:620f:: with SMTP id g15mr13502493otj.361.1608596746730;
        Mon, 21 Dec 2020 16:25:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r204sm4040952oif.0.2020.12.21.16.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:25:46 -0800 (PST)
Date:   Mon, 21 Dec 2020 18:25:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/8] remoteproc: add is_iomem to da_to_va
Message-ID: <X+E9B+sa+9Y/ToKt@builder.lan>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
 <20201221100632.7197-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221100632.7197-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 21 Dec 04:06 CST 2020, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Introduce an extra parameter is_iomem to da_to_va, then the caller
> could take the memory as normal memory or io mapped memory.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V4:
>  New patch
> 
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
