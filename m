Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE0DC05027
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Feb 2023 21:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjBBVlC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Feb 2023 16:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjBBVlB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Feb 2023 16:41:01 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADA56EAE9
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Feb 2023 13:40:58 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id z1so3276337plg.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Feb 2023 13:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KUW0gJbxGJ6SWI3RJxvIbhZ/Rr+C0qIlnmg61VaF6so=;
        b=gBPFtJro8PgtCyLxb6o5kPenHhHM89tYVSfAlkTqxPfo75wtroY34q6thyVuvEr/wr
         r2s7ghqbUSH95I4RI0Q7x/puUKx7gg0cKPEuT6tQRHwEd5PrjSFW5R8JtArsc65YMeaJ
         m2aH4vnF1RZVsMPJLk660nu2zsMQS7zZfOayRNq3xAzv3PhTdQ+e40PmQ6ANIvlZfCaO
         jVNwgo1qYFv42DtS7iiHlA7uAUNPAz5W1NeD/PC4hqKX3siN27LmPgTMYLYpt3Z28VO0
         QSi5dstE2Hv3JsoULPy+vjdXgWGyz+rSpVXtlGMr5XdX1uiIaunr1P6qM0UeZ+uV6udq
         /2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUW0gJbxGJ6SWI3RJxvIbhZ/Rr+C0qIlnmg61VaF6so=;
        b=s+su8LyHeJ9XvdbGSJXFg4ct1z2RFD1YKM4sNa42HXAiGei6rqHDsBcjmk9RY3rv/p
         tQ7+a+wVbKyI7Nf46c4KuttlrzrBXlwsII3guLxh7LsjZKbhzjT/4uPB/iTHc4pF3jrp
         mSO8T/8X06INk9674hU012cOOFvZlg2HcjmbDmAou05LdRYYzJn9fFDOrP7b/2pu0iUl
         r2bvdP8UOIJKw6NGtF2EItLuwPImPPe9MgmWCjC2yi9CLbPnnrDov4mLaYg8gJ2SWP32
         uFTews8e22tv7ma5lKs274vXMGDY4UXST8Hn8+/X63oUG3Lm88DiMMkS4+qqsdIcetK9
         GPhw==
X-Gm-Message-State: AO0yUKVamAmTU6bC70kH+y26f1Gjhqegfv8U2n62v6OZhCo70CgSxBCw
        dTMfz/tDSPDrNWeT4mtAVzjCxA==
X-Google-Smtp-Source: AK7set/9oJsjU8/+4dB38Vt2Fk8PbMjQgP5u87gQgHKRTA3Vc1gkQKcOkNH1myYzo1g+LWqsGx7RlQ==
X-Received: by 2002:a17:902:e841:b0:198:a372:3e67 with SMTP id t1-20020a170902e84100b00198a3723e67mr8395871plg.27.1675374057632;
        Thu, 02 Feb 2023 13:40:57 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bb50:10cc:f6a5:2176])
        by smtp.gmail.com with ESMTPSA id p6-20020a170903248600b00198b0fd363bsm146426plw.45.2023.02.02.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 13:40:57 -0800 (PST)
Date:   Thu, 2 Feb 2023 14:40:54 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        arnaud.pouliquen@foss.st.com, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, iuliana.prodan@nxp.com,
        daniel.baluta@nxp.com
Subject: Re: [PATCH V2 2/6] remoteproc: imx_rproc: add devtype
Message-ID: <20230202214054.GB1147631@p14s>
References: <20230127092246.1470865-1-peng.fan@oss.nxp.com>
 <20230127092246.1470865-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127092246.1470865-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jan 27, 2023 at 05:22:42PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8M and i.MX93 devtype which will be used when parsing the
> firmware.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  drivers/remoteproc/imx_rproc.h | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 9fc978e0393c..8a282fb67a4d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -289,6 +289,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>  	.method		= IMX_RPROC_SMC,
> +	.devtype	= IMX_RPROC_IMX8M,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> @@ -299,6 +300,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
>  	.method		= IMX_RPROC_MMIO,
> +	.devtype	= IMX_RPROC_IMX8M,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> @@ -349,6 +351,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.att		= imx_rproc_att_imx93,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
>  	.method		= IMX_RPROC_SMC,
> +	.devtype	= IMX_RPROC_IMX93,
>  };
>  
>  static int imx_rproc_start(struct rproc *rproc)
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 1c7e2127c758..43b105ff0175 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -26,6 +26,11 @@ enum imx_rproc_method {
>  	IMX_RPROC_SCU_API,
>  };
>  
> +enum imx_rproc_devtype {
> +	IMX_RPROC_IMX8M,
> +	IMX_RPROC_IMX93,
> +};
> +

enum imx_rproc_devtype {
        IMX_RPROC_ANY,
	IMX_RPROC_IMX8M,
	IMX_RPROC_IMX93,
};

That way all the other boards entries where @devtype isn't specified don't
default to IMX_RPROC_IMX8M.


>  struct imx_rproc_dcfg {
>  	u32				src_reg;
>  	u32				src_mask;
> @@ -34,6 +39,7 @@ struct imx_rproc_dcfg {
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
> +	enum imx_rproc_devtype		devtype;
>  };
>  
>  #endif /* _IMX_RPROC_H */
> -- 
> 2.37.1
> 
