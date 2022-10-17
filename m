Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E02C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Oct 2022 17:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiJQRpW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Oct 2022 13:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiJQRpT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Oct 2022 13:45:19 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A0361729
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Oct 2022 10:45:17 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id h2so4094670plb.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Oct 2022 10:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6Wfy0RYVL3RN1cfoJ/HVQtYpR+YDnGcHz/3eX5V1/k=;
        b=JfzwFAfyinAh0vRLDe9xOnkD+DU5oRWkOSCGmAJkEKihnY2r3nj6gUkN/UXZxCLLNh
         K4lxmUp3bqzN9c3kNCoelbcDolLptdw0aGExFprpJVTyFSmDyBjwbWye8a73T4ACFAB/
         IHXtzTFzLbslj1FPe9V+sIgB5HZWHHKP44E+2s9LOuctEr6bIAR3Dp6tQyDRMrLKdJTQ
         rdNj0RbHkrgvSBxHb8Qsa4YQze2huOKWHqk/KzVftdwIv85h5dwPBuJwnipmQAmWKg2h
         EpHSQ1X7ClkKPb5/jYm/ZnSntxcohHBlTsjQ0+7vpHXPBQ8cnHZuHM3euZ01svAXAm6z
         zHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6Wfy0RYVL3RN1cfoJ/HVQtYpR+YDnGcHz/3eX5V1/k=;
        b=DwCDh0o/y1Sa6AkF5chJSUyruMiImZ7OCus7vQ3//uHc1gu+JEn/cVQC44DuJaW3el
         pJEKqLJgGdsPEHY4Xv3ChaDjJ3EJDm93Pl0yNs2wV7vwacLfvhPa0PbO6Jlrf5pyKejU
         yZ+NVAiY/Fuj5MxIKu4n56f5jzKweAgj5Z1yjSCmNjBeQCjgP9f5eESxUCxivNL5SGbi
         zcxleplSgc9pmVVIWvMxww+tbla+rbfLat+JOFbuW4m5UgWl64Q9NVSAWeND6YuUDtPA
         q5kaP9WscIL7jys3n8yL8Sge3amB34l4DyjfKw0AtuQcMH+yByLBkh1nabdYKZwmHKPQ
         NJTQ==
X-Gm-Message-State: ACrzQf3zw/M9IwMsmhTzBaTJoiZ9rvKM8WdY/eCnoeq324RkmNkqEnF9
        ZSZsu7st88QtmC/TwoBESTMY7g==
X-Google-Smtp-Source: AMsMyM68sJl2iYftd96ocIS3Mh2Eh9yE0P8YIDsl0O7//LXxkqmlsSGEYr4Sa7+OeSpXwPMzRmb3Mg==
X-Received: by 2002:a17:902:f312:b0:17d:79e9:1181 with SMTP id c18-20020a170902f31200b0017d79e91181mr13331930ple.173.1666028716560;
        Mon, 17 Oct 2022 10:45:16 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w186-20020a6262c3000000b00561d79f1064sm7379582pfb.57.2022.10.17.10.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 10:45:15 -0700 (PDT)
Date:   Mon, 17 Oct 2022 11:45:14 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     andersson@kernel.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v2] remoteproc: core: Auto select rproc-virtio device id
Message-ID: <20221017174514.GB121862@p14s>
References: <1665718851-22341-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1665718851-22341-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey guys,

On Fri, Oct 14, 2022 at 11:40:51AM +0800, Shengjiu Wang wrote:
> With multiple remoteproc device, there will below error:
> 
> sysfs: cannot create duplicate filename '/bus/platform/devices/rproc-virtio.0'
> 
> The rvdev_data.index is duplicate, that cause issue, so
> need to use the PLATFORM_DEVID_AUTO instead. After fixing
> device name it becomes something like:
> /bus/platform/devices/rproc-virtio.2.auto
> 
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Tested-by: Peng Fan <peng.fan@nxp.com>
> ---
> changes in v2:
> - update commit message
> 
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8768cb64f560..03a26498e879 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -509,7 +509,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	rvdev_data.rsc_offset = offset;
>  	rvdev_data.rsc = rsc;
>  
> -	pdev = platform_device_register_data(dev, "rproc-virtio", rvdev_data.index, &rvdev_data,
> +	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
>  					     sizeof(rvdev_data));

Just to clarify here...  This condition happens on systems where there is more
than one remote processor.  In those cases we get dupliation in sysfs because
virtio devices on each seperate instances of "rproc" are getting the same
rproc->nb_vdev number.

If that is the case, please add a comment in the code that clearly highlight
this condition.

Thanks,
Mathieu


>  	if (IS_ERR(pdev)) {
>  		dev_err(dev, "failed to create rproc-virtio device\n");
> -- 
> 2.34.1
> 
