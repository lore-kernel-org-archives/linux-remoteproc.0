Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92295EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jul 2023 17:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjGQRmb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jul 2023 13:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjGQRma (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jul 2023 13:42:30 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57D71B0
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jul 2023 10:42:27 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b890e2b9b7so26522695ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jul 2023 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689615747; x=1692207747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2TPQLj+5bXU4oKqQgWi7jLjSmRDggaDn+c50v2mtwM=;
        b=kSMGYEW0Px1nJa3jtUFMmrwk2W5m3YtBYIr01lnHo7cnaCSGkqnhXm+LbF2t+noZ7q
         6dTfrYm1q/yMZ93vWgY5JVs4uCGo92vjVTxahjZeR19M2TzEhCROA8QIKq0cdX2EJ2P/
         dKw6FYSgTdjMHO2CeFvoCSqGRDOcJkJUU4K+Ady72ghThm/MNcuoR286/6qH4wF5KGMY
         4acG0oAg8zqfn2NMfptTG1IjSPufmceQwMTV9VvbtdNsei0Pn+BU36PQmbuiTkJSLg+w
         e+m1ptS7Qair7avArFw9qNHJaerAz++IJ1J9V0ycfawjfEQV5QbvVpSU8XYbwvoFHy4B
         NBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689615747; x=1692207747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2TPQLj+5bXU4oKqQgWi7jLjSmRDggaDn+c50v2mtwM=;
        b=hLyZssy2B8NmTGP6uQ3hzODxsntzdeVURlp4ARhPNFcLIbxY4j+5xOUZU+vo+aMcBA
         qkC4WEREgCFkgW4rKS8NZvRK1zCKB/VQE6XqMu7+3B3IvCXAE1Ub/sPzMPI4AjXNjfAZ
         b/3NfDc3VUPB2q0Xjy79MuY7wm7TBjsC3zv+K1iBInargVaoPaMrNUUG6tiEr0edy205
         so9PTZHciJgOqnbbu/c5gbEokUSgG5LHdn9+768fVr3PsNZ3uZDbjOOK2rujKyxIItKn
         D6D/zGkEGLuFHiH8jO9LK3SNQr7R0hVwGE7rtPhmmGiLNOREFOp2loeguTNOQRWwxceh
         L/Kw==
X-Gm-Message-State: ABy/qLawnEAQVru6fI4fdNILhoV/5eegCaZT1wfrwT1gST3ANmmJcZOv
        R173gK3EePT0O4T0ShJ6N3xK2w==
X-Google-Smtp-Source: APBJJlHETE8kXHKsIMYEy9FiSPyIeEwDiD+zln4n72/wHDGQDtnej9rSPpnFbub+R2K6sLk8S4Wrkw==
X-Received: by 2002:a17:902:f688:b0:1b8:987f:3eaa with SMTP id l8-20020a170902f68800b001b8987f3eaamr12728016plg.58.1689615747151;
        Mon, 17 Jul 2023 10:42:27 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3328:146c:de53:b695])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b89a6164desm173607plg.118.2023.07.17.10.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 10:42:26 -0700 (PDT)
Date:   Mon, 17 Jul 2023 11:42:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: add mandatory
 find_loaded_rsc_table op
Message-ID: <ZLV9gAmiDldlvIUR@p14s>
References: <20230712224220.26430-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712224220.26430-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 13, 2023 at 01:42:20AM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Add the .find_loaded_rsc_table operation for i.MX DSP.
> We need it for inter-process communication between DSP
> and main core.
> 
> This callback is used to find the resource table (defined
> in remote processor linker script) where the address of the
> vrings along with the other allocated resources (carveouts etc)
> are stored.
> If this is not found, the vrings are not allocated and
> the IPC between cores will not work.

Is there a constraint on the system memory the M4 can address?  If so there
will be a need to declare address ranges for vrings and buffers in reserved
memory in the DT.

Thanks,
Mathieu

> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d95fa5586189..b5634507d953 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -941,6 +941,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
> -- 
> 2.17.1
> 
