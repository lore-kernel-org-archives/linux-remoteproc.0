Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C796FC47080
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 16:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3B146139A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 16:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhFAQB7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 12:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhFAQB5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 12:01:57 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D08DC061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jun 2021 09:00:14 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so14580620oth.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jun 2021 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+EQc3xvG4vj4snpRMCUapfXHF8CpIpQCf2oacLZFBAk=;
        b=JeHyn8OpcfFeowio6lacRBlt7uKlEBVT0atacKuoMyyheIZe6HEZu8oJ/iBrO1DO1F
         OVCJhIf0AfES6MFJ+irIKqRLXlp/XbXYltlH4VO+ibPgl0QVSc6s78aPUXbuBvv8yocD
         afVNLPjC4HLPkk/Cd2qCIZFkpoGavJXHJcKUGfSV+NA/WryXTERG3dvjf/jL/PB9luFx
         98P38atSF+M/EjlnURCenI5RexCscTp24Gmkj7x8EuJmpnOTNKs8tAHj4TWY2bQiLmHO
         Bd34DwXpJQG3Rs2VW+ed0CMqgWICwIarye8SitaTgBtoCXoyOGcrt951KGkSrXriw2Dx
         IihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+EQc3xvG4vj4snpRMCUapfXHF8CpIpQCf2oacLZFBAk=;
        b=Li1RPjmRgiABeTeOwkvrd9/t3fQ1kOFTZfw5UPmQqkgArN567SAI7QiJB6RIlrGB61
         0wwqe4KtLoq9/Diee8B9qfRruJxvTrEjSZrdXsRRpIG6tCfECmpzSfgFi8VzLStnn/lD
         4zQ35M8aE1s66WolKdEpBT/OFd/8R1D4tMUu5PDk2jAtKDoEh+K8K7+zpTxtUF2FPZML
         SwWdVGUCF/OdWr8RZ/t0S3ZTi/CVonZcYf3gH43LWSEwivUlCIbkjRkmWuOeCLv8xaOs
         rXgDpSSfGS1JXfsDeg98QlfvLwyGh3NNC8t6QTCArEYuPrdSxkJD94ZJFcUuryo0Hz2u
         UJlg==
X-Gm-Message-State: AOAM5312jITCtegUC9+dV+Ln0vcCDPTZJ+xK2BmJrDcpHRMc89g2bXNN
        yxsmOmO9tnYNvce2cHpHsz6TsQ==
X-Google-Smtp-Source: ABdhPJwPbmwjUcUd/RkviTbfJMWI6W/96DM7lu5hzupA0RL0pKF638/dfu5fK+yefZmIG0F5nNmpqw==
X-Received: by 2002:a05:6830:a:: with SMTP id c10mr23699912otp.114.1622563213374;
        Tue, 01 Jun 2021 09:00:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a71sm3508262oib.20.2021.06.01.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:00:12 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:00:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, ohad@wizery.com,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: correct firmware reload
Message-ID: <YLZZinrEMaYHgsEe@yoga>
References: <20210601102939.16139-1-peng.fan@oss.nxp.com>
 <20210601153139.GB1759269@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601153139.GB1759269@xps15>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 01 Jun 10:31 CDT 2021, Mathieu Poirier wrote:

> On Tue, Jun 01, 2021 at 06:29:39PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > ENABLE_M4 should be set to 1 when loading code to TCM, otherwise
> > you will not able to replace the firmware after you stop m4.
> > 
> > Besides ENABLE_M4, we still need set SW_M4C_RST, because this bit
> > will be automatically set with SW_M4C_NON_SCLR_RST set.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > 
> > V1:
> >  Although this is an fix, but it is not critical, patch is based on
> >  https://patchwork.kernel.org/project/linux-remoteproc/cover/1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com/
> > 
> >  drivers/remoteproc/imx_rproc.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index cd2ca96a30e5..ce2ce42bee91 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -33,7 +33,8 @@
> >  
> >  #define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
> >  					 | IMX7D_SW_M4C_RST)
> > -#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_NON_SCLR_RST)
> > +#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
> > +					 IMX7D_SW_M4C_NON_SCLR_RST)
> >  
> >  /* Address: 0x020D8000 */
> >  #define IMX6SX_SRC_SCR			0x00
> > @@ -44,7 +45,8 @@
> >  
> >  #define IMX6SX_M4_START			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4P_RST \
> >  					 | IMX6SX_SW_M4C_RST)
> > -#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4C_NON_SCLR_RST)
> > +#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4C_RST | \
> > +					 IMX6SX_SW_M4C_NON_SCLR_RST)
> >  #define IMX6SX_M4_RST_MASK		(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4P_RST \
> >  					 | IMX6SX_SW_M4C_NON_SCLR_RST \
> >  					 | IMX6SX_SW_M4C_RST)
> > @@ -691,7 +693,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >  		return ret;
> >  	}
> >  
> > -	if (!(val & dcfg->src_stop))
> > +	if ((val & dcfg->src_mask) != dcfg->src_stop)
> >  		priv->rproc->state = RPROC_DETACHED;
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> Bjorn hasn't picked up this set yet so it is best to send a v7 of [1] with this
> change merged in it.
> 

Sorry I had missed that [1] was fully reviewed, so I figured I'll just
apply the series and squash this in. But afaict this patch isn't a fix
to any of the patches in [1].

More so, this patch doesn't apply on top of either v5.13-rc1, linux-next
or [1] - because neither IMX7D_M4_STOP nor IMX6SX_M4_STOP has
IMX6SX_ENABLE_M4 included.


Peng, I've applied [1] now, please let me know what to do about this
patch.

Regards,
Bjorn

> Thanks,
> Mathieu 
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/cover/1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com/
> 
> >  
> >  	return 0;
> > -- 
> > 2.30.0
> > 
