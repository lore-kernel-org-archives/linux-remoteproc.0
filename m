Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73691C61DA4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Feb 2023 22:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbjBBWGD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Feb 2023 17:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjBBWGC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Feb 2023 17:06:02 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F1D2112
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Feb 2023 14:06:01 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id m13so3320842plx.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Feb 2023 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1ye01WI+eBlxGiG8i4OkUQCbltzh8nKDNLaIpK8ceY=;
        b=ik1o9/JtrPKMKusKTI46qe0qj4LftbwYR8nDPq8BCbTLl9Ze/qHTMyyYgNvcmtJ7Rk
         zJ5IAiKEkRoqK89qcvZxGzgIl0K/d9hmeck54vr+zFdA8iKNVPBi/dYfODJWYn2nJBso
         dY7B03cqi3bFxGH9dpHXE3M0Axj0PrN4oEbxN+6XGnd4ScQDA46bQtkitEhE1vsdGxN0
         5xklxDJPnlGiCFT+07iQMQnpbpbe4rumxYfNH8QQjYmzdIZYIylF7JwimRV4U34UOZnf
         4OuCYH/0DxCoz4daQzt8SwJmVLD/33YO0GN9TPlqYxU9CCXXetNH49/OFduzLummQzmQ
         0nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1ye01WI+eBlxGiG8i4OkUQCbltzh8nKDNLaIpK8ceY=;
        b=BdoXHU0oy+4stKBu2Ue0atd7OCEi0Nyk6m5/5cQeq/EDSV3MONSiiYHNgRI94P9/HZ
         Jii2pQtABy97UYUT1EKGDLXKJ3gwy/RAKwgqkkuz88xCY/VKza+zzOnFQbdU/LtJeg3a
         fTN64+hECKgngOd57mnQComHtJYZhxR71Np9KqbwNq46wRQu1uioFon2LI/uslKeBKMc
         3CC/vYVg9Kf/WSJGFrsrvRNrkIDQ7Q2VJ85p02n2c3FE2yTy/A+RdM0ZbzLv2OjRgZA0
         Du/ikPmYl1Er3CG4XFjSvNAJvbGl9xVq5nsh3XjVSmMMdsnU6I3n7YRZp3t4mMCvqKoH
         UnBg==
X-Gm-Message-State: AO0yUKUYcV/L5xQ7iiifVEub6jkzfqIocaYG8apsuaSW7CK4Auh/oRWg
        6vGGgo6gXQ0/4qBiRSG7w2VGVg==
X-Google-Smtp-Source: AK7set81S39Ao6gE5/Hxr9lmLg/eu9AraFlQtH80ai7THAwFkPtKdNOlr3O7FnoGOJ1ndeFVf9OGeA==
X-Received: by 2002:a17:903:3307:b0:198:adc4:228e with SMTP id jk7-20020a170903330700b00198adc4228emr2526252plb.9.1675375560570;
        Thu, 02 Feb 2023 14:06:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bb50:10cc:f6a5:2176])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709028a8400b00177efb56475sm159532plo.85.2023.02.02.14.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 14:06:00 -0800 (PST)
Date:   Thu, 2 Feb 2023 15:05:57 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        arnaud.pouliquen@foss.st.com, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, iuliana.prodan@nxp.com,
        daniel.baluta@nxp.com
Subject: Re: [PATCH V2 6/6] remoteproc: imx_rproc: set address of .interrupts
 section as bootaddr
Message-ID: <20230202220557.GD1147631@p14s>
References: <20230127092246.1470865-1-peng.fan@oss.nxp.com>
 <20230127092246.1470865-7-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127092246.1470865-7-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jan 27, 2023 at 05:22:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX93 M33 has ROM, it needs the ".interrupts" section address to start
> M33 firmware. In current design, the Arm Trusted Firmware(ATF) use TCML
> start address when the 2nd arg is 0 when SMC call. So When the M33 firmware
> is built with TCML address, it works well.
> 
> However when M33 firmware is built to run in DDR, we need pass the
> ".interrupts" address as 2nd arg to ATF to start M33 firmwrae.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5ee0c9bb09d..59cca5ac3045 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -374,7 +374,8 @@ static int imx_rproc_start(struct rproc *rproc)
>  					 dcfg->src_start);
>  		break;
>  	case IMX_RPROC_SMC:
> -		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
> +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, rproc->bootaddr,
> +			      0, 0, 0, 0, 0, &res);
>  		ret = res.a0;
>  		break;
>  	case IMX_RPROC_SCU_API:
> @@ -664,6 +665,13 @@ static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *f
>  		 */
>  		writel(*(u32 *)(elf_data + offset), va);
>  		writel(*(u32 *)(elf_data + offset + 4), va + 4);
> +	} else if (priv->dcfg->devtype == IMX_RPROC_IMX93) {
> +		/* i.MX93 Cortex-M33 has ROM, it only needs the section address */
> +		shdr = rproc_elf_find_shdr(rproc, fw, ".interrupts");
> +		if (!shdr)
> +			return bootaddr;

This contradicts what you wrote in the cover letter of the patchset about an
".interrupts" section always being present.

There is enough in this patchset to make me look for a second opinion.  As such
I am CC'ing Iuliana and Daniel.  Please respin this, adding both of them to the
recipient list.  I will do another revision only when they have provided an RB
tag.  

Thanks,
Mathieu

> +
> +		return elf_shdr_get_sh_addr(class, shdr);
>  	}
>  
>  	return bootaddr;
> -- 
> 2.37.1
> 
