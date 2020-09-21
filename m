Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0C4C43465
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 09:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3CF52151B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 09:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDvOlp0c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgIUJSU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUJSU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 05:18:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA19EC061755;
        Mon, 21 Sep 2020 02:18:19 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e11so11061397wme.0;
        Mon, 21 Sep 2020 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=loMmKVEcoIhprgY7qLwzPQGHqghUl/YZgw3ux8z4Mko=;
        b=lDvOlp0cAV3taZym9zLoB3Q+xfvKlaZNMx0QG+4jFmwMT/9hNyZnsraUg05RDEBL7S
         zA9BVan+cLcO7ayO4Hc9oxg4Y9zuqM+Qgxefh7v1Brrp475CPlOwKdpn6M/nFCVEJhGU
         Hv6mB0UUNBJfkOnaZRkrNHzlFnWmW771RdmadXz767064onsglENFZWpjGwXd9OFD8CU
         cUxFBiFfp4Ij4upPUgsHBZQ+Sak1c1Oi+DZ8Mp90Dge68n7I93cb+lRbc8FRb21USHWz
         P1kt0OXs2Ct2+BRt9/GhHY76YtLINTvD/KUPgYQf4IXaskmMnq8wHQGChXdjz3m04u2L
         3Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=loMmKVEcoIhprgY7qLwzPQGHqghUl/YZgw3ux8z4Mko=;
        b=AGihLEorZaj2HYzQoPOKjOyKfo6Euswb7okFziEZiwsUttXN80NeAHMpfssvBqDicr
         XkS1z7ULwfgLmECfmeQ0FurtVqEEjc7mNKF8KcREZlzwa6sTCzJhiachxHmcgo8Qgx2B
         DIU9qBK4EUsgPwPd7wxC+WgcXN2AD9DS5FgagvDW+zXbg4m7WUo1d4RmaBeTFQFwtZni
         D5lpmjhHa5sD+2/ye3UYl5mb33bjJo93sShWG085xlGHAngjsUXJHF3YNeh3nIrfJI3B
         CMRZ8bfOCJQv6D8pjJz5t+0YvQvQujxlSZ/hNTyTCYkcBb0Dzen2ypl/Mf6xUrygGJy9
         xCEw==
X-Gm-Message-State: AOAM532GB7m0i2PZzNSl9ofONuJ5kYpziti0EodJh48ujSM8kvBGSJiE
        Xw/iiZfy7Fnqnhgo9/EzWPNLQ6jWcHLhSg==
X-Google-Smtp-Source: ABdhPJyhGOeXP8q7acUChNscuLpU7v+TBxSFdMvmK9P4GAeb3TwEZrT8LTB1IJWr0wMoP+ENt+1mtQ==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr29122842wmg.179.1600679898312;
        Mon, 21 Sep 2020 02:18:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
        by smtp.gmail.com with ESMTPSA id d124sm19572508wmd.47.2020.09.21.02.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:18:17 -0700 (PDT)
Subject: Re: [PATCH v2] remoteproc/mediatek: Add support for mt8192 SCP
To:     Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Tzung-Bi Shih <tzungbi@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200918064432.3117955-1-pihsun@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d3da1c47-02ae-7873-2601-86a782a5bc74@gmail.com>
Date:   Mon, 21 Sep 2020 11:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918064432.3117955-1-pihsun@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 18/09/2020 08:44, Pi-Hsun Shih wrote:
> Add support for mt8192 SCP.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> 
> Change since v1:
> * Remove unused register definitions.
> 
> ---
>   drivers/remoteproc/mtk_common.h  |  32 +++++
>   drivers/remoteproc/mtk_scp.c     | 207 ++++++++++++++++++++++++++-----
>   drivers/remoteproc/mtk_scp_ipi.c |   5 +-
>   3 files changed, 211 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 0066c83636d0..47b4561443a9 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -32,6 +32,23 @@
>   #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
>   #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
>   
> +#define MT8192_L2TCM_SRAM_PD_0		0x210C0
> +#define MT8192_L2TCM_SRAM_PD_1		0x210C4
> +#define MT8192_L2TCM_SRAM_PD_2		0x210C8
> +#define MT8192_L1TCM_SRAM_PDN		0x2102C
> +#define MT8192_CPU0_SRAM_PD		0x21080
> +
> +#define MT8192_SCP2APMCU_IPC_SET	0x24080
> +#define MT8192_SCP2APMCU_IPC_CLR	0x24084
> +#define MT8192_SCP_IPC_INT_BIT		BIT(0)
> +#define MT8192_SCP2SPM_IPC_CLR		0x24094
> +#define MT8192_GIPC_IN_SET		0x24098
> +#define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +
> +#define MT8192_CORE0_SW_RSTN_CLR	0x30000
> +#define MT8192_CORE0_SW_RSTN_SET	0x30004
> +#define MT8192_CORE0_WDT_CFG		0x30034
> +
>   #define SCP_FW_VER_LEN			32
>   #define SCP_SHARE_BUFFER_SIZE		288
>   
> @@ -50,6 +67,19 @@ struct scp_ipi_desc {
>   	void *priv;
>   };
>   
> +struct mtk_scp;
> +
> +struct mtk_scp_of_data {
> +	int (*scp_before_load)(struct mtk_scp *scp);
> +	void (*scp_irq_handler)(struct mtk_scp *scp);
> +	void (*scp_reset_assert)(struct mtk_scp *scp);
> +	void (*scp_reset_deassert)(struct mtk_scp *scp);
> +	void (*scp_stop)(struct mtk_scp *scp);
> +
> +	u32 host_to_scp_reg;
> +	u32 host_to_scp_int_bit;
> +};
> +
>   struct mtk_scp {
>   	struct device *dev;
>   	struct rproc *rproc;
> @@ -58,6 +88,8 @@ struct mtk_scp {
>   	void __iomem *sram_base;
>   	size_t sram_size;
>   
> +	const struct mtk_scp_of_data *data;
> +
>   	struct mtk_share_obj __iomem *recv_buf;
>   	struct mtk_share_obj __iomem *send_buf;
>   	struct scp_run run;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ac13e7b046a6..f5f226a7b34c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -124,9 +124,6 @@ static int scp_ipi_init(struct mtk_scp *scp)
>   	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
>   	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
>   
> -	/* Disable SCP to host interrupt */
> -	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
> -
>   	/* shared buffer initialization */
>   	scp->recv_buf =
>   		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
> @@ -138,7 +135,7 @@ static int scp_ipi_init(struct mtk_scp *scp)
>   	return 0;
>   }
>   
> -static void scp_reset_assert(const struct mtk_scp *scp)
> +static void mt8183_scp_reset_assert(struct mtk_scp *scp)
>   {
>   	u32 val;
>   
> @@ -147,7 +144,7 @@ static void scp_reset_assert(const struct mtk_scp *scp)
>   	writel(val, scp->reg_base + MT8183_SW_RSTN);
>   }
>   
> -static void scp_reset_deassert(const struct mtk_scp *scp)
> +static void mt8183_scp_reset_deassert(struct mtk_scp *scp)
>   {
>   	u32 val;
>   
> @@ -156,17 +153,29 @@ static void scp_reset_deassert(const struct mtk_scp *scp)
>   	writel(val, scp->reg_base + MT8183_SW_RSTN);
>   }
>   
> -static irqreturn_t scp_irq_handler(int irq, void *priv)
> +static void mt8192_scp_reset_assert(struct mtk_scp *scp)
>   {
> -	struct mtk_scp *scp = priv;
> -	u32 scp_to_host;
> -	int ret;
> +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
> +}
>   
> -	ret = clk_prepare_enable(scp->clk);
> -	if (ret) {
> -		dev_err(scp->dev, "failed to enable clocks\n");
> -		return IRQ_NONE;
> -	}
> +static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
> +{
> +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
> +}
> +
> +static void scp_reset_assert(struct mtk_scp *scp)
> +{
> +	scp->data->scp_reset_assert(scp);

I think we can call scp->data->scp_reset_assert(scp) directly.

> +}
> +
> +static void scp_reset_deassert(struct mtk_scp *scp)
> +{
> +	scp->data->scp_reset_deassert(scp);

Same here.

Regards,
Matthias
