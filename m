Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52761C43334
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jun 2022 22:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbiFNW3K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jun 2022 18:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbiFNW3A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jun 2022 18:29:00 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EE352522
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 15:28:59 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id o6so8917618plg.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KRnsDnmzLVNJLD4XQT4OOkfWd3Wv3kaVliobD56LDKY=;
        b=eeK29CNLmpmnGvffPElFI3R5kizjdYTm2bmjh3/DAtzRv4bxOEbQtqE0k+ChAX8hPf
         BdhRkSeyr0admaHZEvD8srfe/iRbFt2VSGfoVBL/CepvGCqAde+/m2WJSuQTyzMSSKWI
         bm2R37DaoGnSuaDulrkvjmT4YcyK9tZN5f+4xihtv73rOLWxgheTePZyjXVafO3kRfDx
         KbIgjzGONeT6zfgdCRJoamh5GQ1+eM6MgqzhoQK2nLq/QIG3PY6DCHU/3Av+ZHxHHPo+
         9wiIlwS1ynUbq7L9V2zB9dD37ek9s2NoG5NgEbUPyqqctLiGbCiHE5EctHu9GckDdfH+
         v5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRnsDnmzLVNJLD4XQT4OOkfWd3Wv3kaVliobD56LDKY=;
        b=hmHcfPftZhXbfDP7RjZUytuzrgbDUu597czyX7fsRUjUn19INqkP5hL8zjaEkNFPVH
         3Lpv9rWG7BQH55OFdm++jiQh1rqGv0W4f1IJ4D2/d+5T3IynvJk3VGRtUTgesz+BLao/
         Pq0k/dmAfPqpXoEon3Vxl/+hGq76alqoiylX3njDLYqGOsmUIEOk1hNNi18KDaQed7GD
         78OHvl0i6X4BDTXKxPSN1aj4x57T57pGjI+A8EadOcRJnKCxped0NNtjs7cWpm5WCb9V
         D1+oZ2aiOf3+Fy1S9YQRgQm9tYmzvkwfPBcktUUfQ1t+vU/MX80QBZxjWdi6AEpu162F
         STHg==
X-Gm-Message-State: AJIora+Q5JnFBTZp/6A/ErKxUILA4i3WztP52AzCQiFxNlsJBaRUNSpj
        x0NxmcR2F1YExkUxPMbtEGvAVA==
X-Google-Smtp-Source: AGRyM1v+i/wHlb7BJZUwkeZoDYuk2cZeUxb+qwT1JnX5NVO7/5IejyC4N3W0/iW3bCy4FUzjTlNAtQ==
X-Received: by 2002:a17:90b:4c0c:b0:1ea:87ef:546a with SMTP id na12-20020a17090b4c0c00b001ea87ef546amr6724342pjb.209.1655245738693;
        Tue, 14 Jun 2022 15:28:58 -0700 (PDT)
Received: from p14s ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b00163c0a1f718sm7746920plz.303.2022.06.14.15.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 15:28:57 -0700 (PDT)
Date:   Tue, 14 Jun 2022 16:28:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [RESEND PATCH] rpmsg: char: Add mutex protection for
 rpmsg_eptdev_open()
Message-ID: <20220614222854.GA1236509@p14s>
References: <1653104105-16779-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653104105-16779-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, May 21, 2022 at 11:35:05AM +0800, Shengjiu Wang wrote:
> There is no mutex protection for rpmsg_eptdev_open(),
> especially for eptdev->ept read and write operation.
> It may cause issues when multiple instances call
> rpmsg_eptdev_open() in parallel,the return state
> may be success or EBUGY.
> 
> Fixes: 964e8bedd5a1 ("rpmsg: char: Return an error if device already open")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in resend:
> - add fixes tag
> 
>  drivers/rpmsg/rpmsg_char.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I have applied your patch.

Thanks,
Mathieu

> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b6183d4f62a2..4f2189111494 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -120,8 +120,11 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> -	if (eptdev->ept)
> +	mutex_lock(&eptdev->ept_lock);
> +	if (eptdev->ept) {
> +		mutex_unlock(&eptdev->ept_lock);
>  		return -EBUSY;
> +	}
>  
>  	get_device(dev);
>  
> @@ -137,11 +140,13 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> +		mutex_unlock(&eptdev->ept_lock);
>  		return -EINVAL;
>  	}
>  
>  	eptdev->ept = ept;
>  	filp->private_data = eptdev;
> +	mutex_unlock(&eptdev->ept_lock);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
