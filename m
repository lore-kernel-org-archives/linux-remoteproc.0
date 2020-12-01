Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD46C64E7A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Dec 2020 19:04:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA71C2151B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Dec 2020 19:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0OwCKEK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgLATD4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Dec 2020 14:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730068AbgLATDz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Dec 2020 14:03:55 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6477BC0613CF
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Dec 2020 11:03:15 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so1743833pge.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Dec 2020 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dtf455/t34x5CwfMQp7oSe523N3AnWbHqI9Sms1Ad9Q=;
        b=O0OwCKEKjtUDkcYZoew6BD4OTP1hfydMfTg2SBCmKALnrBevpHRMdC38nkQXP2VC8d
         u/0sRcHD/7yR0gd8MvcDqgBfIt9fI6Hv09KxXv8N5v59LmuLVudIfnRYs4yeeZhS9YCi
         MpacYUSmCmHQT9FJT/VVd7VUwbzJ0/0lzQSx7XlT4zoZKbhNecXaX+ntT0x+d6WKmI2S
         E1CIaHlZuYOuMVp9qfUEufbNZiWTwQ6+2A5yVd+Txz6QzFMY5uYcHUTp5m3/7+Ub+Uud
         4d2zUbiEukAQkoWFnk3VNy4lbSFjPaHu79yVnSw0GtrxKINViGKzj03V1asywKCBsuIZ
         CvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dtf455/t34x5CwfMQp7oSe523N3AnWbHqI9Sms1Ad9Q=;
        b=Tp6sAI5Qt/yhp4rM3gn12+agEMqxYISWWxpzHEj28yGABkQBosXtabIpc/srBjIZjA
         P4g2jhVndwxQtlc0zhGEJaZrSk3dPmyhbhtVtVg2pQGtLL+tTCgEDET82XnqzvoFVjTb
         /LRabpQ9IpBE9WUQBzIepu6CBFLRH477VVPm9/meSgV2XWfgwL3IxVI5HBF74QzJULnb
         lqbO6+WqPsHnJ38o6KdtrN0BjV2kmzKD2bMvP7f51xO6qSTmA1xdetU0rwE7a0UrFhE7
         oKkKvLRUpiFOtDfBhYBSnKwq0t5kNW3jH2Wz97mjpYQavKvUrOzXV4tvUAs6pZLPAJIl
         gZLg==
X-Gm-Message-State: AOAM531s1uR+HIOdGkBn7SA4ksrNVA4o2jbji5zmSCtUMD2N2pDGZZCi
        t9OANgx/w2bnzXMYqwBchN2m8g==
X-Google-Smtp-Source: ABdhPJy800xS/+1S4z3Avm+17m3LdNjcXDQ5fBEZDpXz/zVxlLXrh+xOAa1k1exkMU2sOx5IHDmpPg==
X-Received: by 2002:a62:fb01:0:b029:19a:f68a:49bf with SMTP id x1-20020a62fb010000b029019af68a49bfmr4090989pfm.64.1606849394874;
        Tue, 01 Dec 2020 11:03:14 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 5sm335634pgm.57.2020.12.01.11.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:03:14 -0800 (PST)
Date:   Tue, 1 Dec 2020 12:03:12 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org,
        erin.lo@mediatek.com
Subject: Re: [PATCH v3] remoteproc/mediatek: read IPI buffer offset from FW
Message-ID: <20201201190312.GA1240310@xps15>
References: <20201130034025.3232229-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130034025.3232229-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 30, 2020 at 11:40:25AM +0800, Tzung-Bi Shih wrote:
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
> 
> Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
> initialized only if the offset is clear.
> 
> To backward compatible to MT8183 SCP, specify the offset in the board
> specific mtk_scp_of_data.  Reads the default offset if the firmware
> doesn't have it.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Previous discussion:
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20201127092941.1646260-1-tzungbi@google.com/
> 
> Changes from v2:
> - to backward-compatible, reads the default offset if the firmware doesn't
>   have it
> 
>  drivers/remoteproc/mtk_common.h |  2 +
>  drivers/remoteproc/mtk_scp.c    | 79 +++++++++++++++++++++++----------
>  2 files changed, 57 insertions(+), 24 deletions(-)
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
> index 5f42b9ce7185..5392c2fff682 100644
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
> @@ -350,11 +389,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> -	clk_disable_unprepare(scp->clk);
> +	if (ret)
> +		goto leave;
>  
> +	ret = scp_ipi_init(scp, fw);

This version is much better.  Since this is effectively what is going on,
please put this (along with clock related requirements) in rproc_ops::parse_fw.

Thanks,
Mathieu

> +leave:
> +	clk_disable_unprepare(scp->clk);
>  	return ret;
>  }
>  
> @@ -680,19 +723,6 @@ static int scp_probe(struct platform_device *pdev)
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
> @@ -760,6 +790,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
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
