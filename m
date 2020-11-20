Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B4C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F46A208CA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b10ehEpQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgKTXuX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 18:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgKTXuX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 18:50:23 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D81C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:50:23 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 10so9410014pfp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eH+8BClJlchUh9mc0+qtluCUfW2GSRvPSQ/5/hUkK8E=;
        b=b10ehEpQ+ainrg2zyb4V48dYz94yuX6/yls3n7jnwfg/fYO8tmaxP96k+QwgAlGxS9
         FBS7ipOjBmFJVHYZDRNSnL+AGfimSqzXwlwVnPwSuveNxmp60l7CisQ71aGqNXPMQamY
         Hi21lN/Yzq7Zc9F5znGpyRz+CHkaH2NcLanrZgx/J+7VBdpei/qQ7Y0hpWbUViTYna8j
         rX8Tk2pfI0HxKicupKp/NDeHmeI0kzID1Dnx7RXg4GN2EIpACeSxAuduQi0TYe7ZDYJX
         ENzlrkbMxwttePM5Q/1z9AE9odjdhfbpIaVnD9TQg7y3/QsYPn3lgPQPKYiuJszcvjGv
         gKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eH+8BClJlchUh9mc0+qtluCUfW2GSRvPSQ/5/hUkK8E=;
        b=NMyBbo1V52IT6vEaZoAwArnvarXWHn2kfwXMgGFMQJF790u6FW0E9QO3dqHvR8K0RR
         TqSNoTo0BA1vTGu6TxBdjnXgBVLngFF+M2lmDr9HHYOlDi1SiUj0klLEDEhHmCzqWsHA
         ho9xbhISCCwApvk1NWJ2kaxS0I3fGeVs77Sa3v8mTi0Bg4n7/tVVkHgu/a/ldQOoGwa3
         lt5Jz+pvDTFEVMzJGBZrqkE6rswhA1T2lGQ/RFwF+Yhsl5rL0FB/VTjIUzbT/aNNUVoW
         dIuvy38qsFX4mKL6r9qMYsA/RsS0Yi0YTXQu6nrk4SE6Iwk3bE5hWZBiRklAJYmeGGhe
         ZsVQ==
X-Gm-Message-State: AOAM533o13wJohka+rymi/tgtehV2GXGTHMrTUM96pWkN3K/JkFCPpql
        NTkTUPMCLqrjpbYUoVmaeXgAWw==
X-Google-Smtp-Source: ABdhPJygr63Rf69nTFGQiBkC3FySLnZ0lfRnNHkIplWjSIy/NuXT2+tK6vSxlzjvxyC1WLOVGUGxrQ==
X-Received: by 2002:a17:90a:d355:: with SMTP id i21mr12723783pjx.235.1605916222932;
        Fri, 20 Nov 2020 15:50:22 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s21sm4184499pgk.52.2020.11.20.15.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 15:50:22 -0800 (PST)
Date:   Fri, 20 Nov 2020 16:50:20 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, pihsun@chromium.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] remoteproc/mediatek: read IPI buffer offset from
 FW
Message-ID: <20201120235020.GI4137289@xps15>
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-4-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116084413.3312631-4-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:44:13PM +0800, Tzung-Bi Shih wrote:
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
> 
> Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
> initialized only if the offset is clear.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 74ed675f61a6..0ea3427cddc6 100644
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
> @@ -119,16 +119,24 @@ static void scp_ipi_handler(struct mtk_scp *scp)
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
> +	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> +	if (ret)
> +		return ret;
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
> @@ -271,6 +279,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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

Here you are breaking all the current implementation with a firmware image that
doesn't have a .ipi_buffer section name.  I'm not against this change but you need
to make sure you don't break anything else with your changes.

Thanks,
Mathieu 

> +}
> +
>  static int mt8183_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* Clear SCP to host interrupt */
> @@ -350,11 +384,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
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
> +leave:
> +	clk_disable_unprepare(scp->clk);
>  	return ret;
>  }
>  
> @@ -680,19 +718,6 @@ static int scp_probe(struct platform_device *pdev)
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
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
