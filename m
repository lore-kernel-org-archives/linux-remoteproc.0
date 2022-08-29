Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27ACECAAA2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 29 Aug 2022 17:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiH2Rqq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 29 Aug 2022 13:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiH2Rqo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 29 Aug 2022 13:46:44 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A47258B57
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Aug 2022 10:46:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r22so8337164pgm.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Aug 2022 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=aP8hdsX7w+lAko8aJQsw+FTPWreKWJ2EVj6LyJvUNh0=;
        b=VwYCcxEf5UykaTaEGbwdLPWk3ws3rUXSTUcxdbBe8d2AqIPcT7lgI7CaGsFQdvNMtB
         jKhpVlfEJ+nJsizNCDaP63n5XPBS0w9V7BMGkPAdAjj0DmzwAb516anjc2665EqDnZQi
         UksP91Twx00G3j5ZThFpWYEcPTr02IX+keje+1Ry63LiK6qREy5wMeY2IOUZcvVMxfkP
         dLUqPy7/RzlcKR1KZUlN8DipmtWLN2zOJumJhpWFg5Hg4AHKNl4MZuvrW+GDFxgiI8Nd
         +Sm0lxCV6DpFzKSMoGs/P/t2FpEB7C7/emCoZSX9S9yce8Jk6eG2aCedJI8MSHbh0bSg
         cU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=aP8hdsX7w+lAko8aJQsw+FTPWreKWJ2EVj6LyJvUNh0=;
        b=TV0pIMScMwpmC2KsZ7Xk4qBNmyb6tt5aEZKSZQ04zksyBcpdqZPCwZcj+TTVIwcRRW
         MeYD4Eq5NAh8VOu00tnZlOzCC2ECDysG7ve57JriEaKjb5lYTAHC4iqCJ7QWuQjpIpsL
         ws5T+ajTT27vHdVQ/aZ4FmKCMQ1OOBscDANdu1Ja4QkMCyrcLV/HMrYi1ugLEywjM4fJ
         ef2tcuijdusuzXmdDDgqtuFWu/6HZ+XHrhHTcluPV+d+Wr+k8zQtlaona3hBDXOXB+0B
         pw88xZitBOE1APbskVnbF/VBDhhwnoNn2upxbE5pf+KolGgloizRg/xXDwDwk2qXYwRI
         7gJw==
X-Gm-Message-State: ACgBeo3e9mdcH/+9tiJPtWVwcBL23NMmtz1Xo7e3nxfKdh6Cge/SDByQ
        jd2ZIeYT0maA+VlBshv52cBt/w==
X-Google-Smtp-Source: AA6agR5zgWfQgTrxIOf8Ia3na5HyhsYLWrqsHU9Njtdw1MGbp9RefMUARzblYmeTR6HLM/kev46Weg==
X-Received: by 2002:a63:91c1:0:b0:42b:50f8:774c with SMTP id l184-20020a6391c1000000b0042b50f8774cmr14896896pge.496.1661795202958;
        Mon, 29 Aug 2022 10:46:42 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902a38900b0016f154c8910sm5644434pla.204.2022.08.29.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:46:42 -0700 (PDT)
Date:   Mon, 29 Aug 2022 11:46:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        weishunc@google.com
Subject: Re: [PATCH v2 3/9] remoteproc: mediatek: Add SCP core 1 register
 definitions
Message-ID: <20220829174638.GB2264818@p14s>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-4-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 08, 2022 at 04:35:47PM +0800, Tinghan Shen wrote:
> Add MT8195 SCP core 1 related register definitions.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 73e8adf00de3..5582f4207fbf 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>  #define MT8192_SCP2SPM_IPC_CLR		0x4094
>  #define MT8192_GIPC_IN_SET		0x4098
>  #define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +#define MT8195_CORE1_HOST_IPC_INT_BIT	BIT(4)
>  
>  #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>  #define MT8192_CORE0_SW_RSTN_SET	0x10004
> @@ -60,6 +61,26 @@
>  
>  #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>  
> +#define MT8195_CPU1_SRAM_PD			0x1084
> +#define MT8195_SSHUB2APMCU_IPC_SET		0x4088
> +#define MT8195_SSHUB2APMCU_IPC_CLR		0x408C
> +#define MT8195_CORE1_SW_RSTN_CLR		0x20000
> +#define MT8195_CORE1_SW_RSTN_SET		0x20004
> +#define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
> +#define MT8195_CORE1_WDT_IRQ			0x20030
> +#define MT8195_CORE1_WDT_CFG			0x20034
> +
> +#define MT8195_SEC_CTRL				0x85000
> +#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
> +#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
> +#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
> +#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
> +#define MT8195_L2TCM_OFFSET			0x850d0
> +#define SCP_SRAM_REMAP_LOW			0
> +#define SCP_SRAM_REMAP_HIGH			1
> +#define SCP_SRAM_REMAP_OFFSET			2
> +#define SCP_SRAM_REMAP_SIZE			3
> +
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
> -- 
> 2.18.0
> 
