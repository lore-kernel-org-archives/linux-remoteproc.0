Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA4BC6369E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7E6021527
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgLBU3k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLBU3j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:29:39 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375F5C0613D6
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Dec 2020 12:28:59 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id j13so1602473pjz.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Dec 2020 12:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nSWAtYQ2cPldpZRFHhi5hWOZUD0rXvqmkiZuYGuY/Y8=;
        b=GGHWiNkvEo01QJlHAMi3XoAhKCkEpiiXk9pjyBNAbgbLs54aRoH/HVjZ2mUgqBPcCS
         LhrbLyY3PaEQOuOcltjGiPq0PJyti8jzv3/V+/R3MINP6CTHWWeXKVY5+DckzoAVh4to
         p8GlYLBsC0LFjjr7EUzeBs084RVPmI8PFxpcfg/h6VUH5ZWbLFVox9LlccO/iAAnzyjq
         RV60WUNgwkDJ4l0W4ZdCYRWvcrlDpUIVX8oxwXq4hqkhhNYwGk3/BYjDfdbwCaorr01a
         2A78kJM/vL2YOEIjzwou0YnEN2X2H4kMZOSlHUW/Jlms59vZPLxNz1xHH1+KItaHY/Nf
         xSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nSWAtYQ2cPldpZRFHhi5hWOZUD0rXvqmkiZuYGuY/Y8=;
        b=eg6QHzBIcRPKu7nNqtaxSWVzCnccm4ikz3ocpq1txgEqNvz1g8YtVYRXFN+IN94FK3
         BeLCdVbDCt1vfDEZkiqQLGfr5Pf0sBxi1UOcO5G71IkCICKrB2yuRmoaQnINHoKKa0dy
         3Up7TTtXXjk3G2YuZHJk+gYsLd9/cZDkTlIuSOHEYAyGPmgWvsySUFYSFXMfwg9WGG7f
         6PZldUNCecS3ZbFY9m1mmtRKnLD600iwW2+/k7LcpffED4hmax69sBbUGgZx0tSKLpKi
         6YByprW09Uaud5etssqapNmjlM/msyjbMN1IRqhn10Axr6FK2BtuwaCPrudc7xG34ET3
         E6oQ==
X-Gm-Message-State: AOAM530tr7yOehp8tjHMCW06lqy42Q7d9RZahk7K6+oT3xZhIWlCxMwI
        jNH70ZqD9fEtcAl2qJernsL44g==
X-Google-Smtp-Source: ABdhPJzVzMfFi95np5MrTSTVG923y2OSAugDzS6/asyukqdqPpksxmf1LgWtsCJ2+FnE4PjY83xa9Q==
X-Received: by 2002:a17:902:b983:b029:da:8c9a:6ac6 with SMTP id i3-20020a170902b983b02900da8c9a6ac6mr4127668pls.54.1606940938683;
        Wed, 02 Dec 2020 12:28:58 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d2sm437872pji.7.2020.12.02.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:28:57 -0800 (PST)
Date:   Wed, 2 Dec 2020 13:28:56 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org
Subject: Re: [PATCH v4] remoteproc/mediatek: read IPI buffer offset from FW
Message-ID: <20201202202856.GA1282360@xps15>
References: <20201202044609.2501913-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202044609.2501913-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 02, 2020 at 12:46:09PM +0800, Tzung-Bi Shih wrote:
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
> 
> Moves scp_ipi_init() to rproc_ops::parse_fw() phase.  The IPI buffer can
> be initialized only if the offset is clear.
> 
> To backward compatible to MT8183 SCP, specify the offset in the board
> specific mtk_scp_of_data.  Reads the default offset if the firmware
> doesn't have it.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v3[2]:
> - move scp_ipi_init() to rproc_ops::parse_fw()
> - separate error handling fixing if scp_before_load() fails to standalone
>   patch

There is no reference to scp_before_load() in this patch so why is the comment
there?  I have to go back to my Inbox and look a the other patch you sent to
understand what this comment is about.  Next time please add a cover letter to
explain what you are doing.

> 
> Changes from v2[1]:
> - to backward-compatible, reads the default offset if the firmware doesn't
>   have it
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201127092941.1646260-1-tzungbi@google.com/
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201130034025.3232229-1-tzungbi@google.com/
> 
>  drivers/remoteproc/mtk_common.h |  2 +
>  drivers/remoteproc/mtk_scp.c    | 89 +++++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 22 deletions(-)

Despite the above I am good with the code in this patch.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index b3397d327786..5169ddce2dc7 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -78,6 +78,8 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +
> +	size_t ipi_buf_offset;
>  };
>  
>  struct mtk_scp {
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index c7d49c861adb..7c2dd1b5dd12 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -21,7 +21,7 @@
>  #include "remoteproc_internal.h"
>  
>  #define MAX_CODE_SIZE 0x500000
> -#define SCP_FW_END 0x7C000
> +#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
>  /**
>   * scp_get() - get a reference to SCP.
> @@ -119,16 +119,29 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>  	wake_up(&scp->ack_wq);
>  }
>  
> -static int scp_ipi_init(struct mtk_scp *scp)
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +				     const struct firmware *fw,
> +				     size_t *offset);
> +
> +static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>  {
> -	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
> -	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
> +	int ret;
> +	size_t offset;
> +
> +	/* read the ipi buf addr from FW itself first */
> +	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> +	if (ret) {
> +		/* use default ipi buf addr if the FW doesn't have it */
> +		offset = scp->data->ipi_buf_offset;
> +		if (!offset)
> +			return ret;
> +	}
> +	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
>  
> -	/* shared buffer initialization */
> -	scp->recv_buf =
> -		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
> -	scp->send_buf =
> -		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> +	scp->recv_buf = (struct mtk_share_obj __iomem *)
> +			(scp->sram_base + offset);
> +	scp->send_buf = (struct mtk_share_obj __iomem *)
> +			(scp->sram_base + offset + sizeof(*scp->recv_buf));
>  	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
>  	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
>  
> @@ -271,6 +284,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +				     const struct firmware *fw,
> +				     size_t *offset)
> +{
> +	struct elf32_hdr *ehdr;
> +	struct elf32_shdr *shdr, *shdr_strtab;
> +	int i;
> +	const u8 *elf_data = fw->data;
> +	const char *strtab;
> +
> +	ehdr = (struct elf32_hdr *)elf_data;
> +	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> +	shdr_strtab = shdr + ehdr->e_shstrndx;
> +	strtab = (const char *)(elf_data + shdr_strtab->sh_offset);
> +
> +	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> +		if (strcmp(strtab + shdr->sh_name,
> +			   SECTION_NAME_IPI_BUFFER) == 0) {
> +			*offset = shdr->sh_addr;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  static int mt8183_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* Clear SCP to host interrupt */
> @@ -358,6 +397,23 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +	struct device *dev = scp->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(scp->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	ret = scp_ipi_init(scp, fw);
> +	clk_disable_unprepare(scp->clk);
> +	return ret;
> +}
> +
>  static int scp_start(struct rproc *rproc)
>  {
>  	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
> @@ -461,6 +517,7 @@ static const struct rproc_ops scp_ops = {
>  	.stop		= scp_stop,
>  	.load		= scp_load,
>  	.da_to_va	= scp_da_to_va,
> +	.parse_fw	= scp_parse_fw,
>  };
>  
>  /**
> @@ -680,19 +737,6 @@ static int scp_probe(struct platform_device *pdev)
>  		goto release_dev_mem;
>  	}
>  
> -	ret = clk_prepare_enable(scp->clk);
> -	if (ret) {
> -		dev_err(dev, "failed to enable clocks\n");
> -		goto release_dev_mem;
> -	}
> -
> -	ret = scp_ipi_init(scp);
> -	clk_disable_unprepare(scp->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to init ipi\n");
> -		goto release_dev_mem;
> -	}
> -
>  	/* register SCP initialization IPI */
>  	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
>  	if (ret) {
> @@ -760,6 +804,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  	.scp_stop = mt8183_scp_stop,
>  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> +	.ipi_buf_offset = 0x7bdb0,
>  };
>  
>  static const struct mtk_scp_of_data mt8192_of_data = {
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
