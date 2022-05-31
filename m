Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CC5C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 31 May 2022 17:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346553AbiEaR2t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 31 May 2022 13:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346552AbiEaR2s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 May 2022 13:28:48 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1035C939A3
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 May 2022 10:28:47 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id c14so136449pgu.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 May 2022 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tt/gOB9r37r5U7HxtgH6i80t5jbb5qgunubyztDkge0=;
        b=hkD/eBMGGcmdiFaBHu2BT3jb7UyDt9oVBtTZYhiizvoIp454sxeKhm8+MZKDbv5qFL
         ZK3rClkIYrmKjrTQ3GR3zWPw7A8PwXhkSr0llGzCp4uSt/YyXgQ2B2TfMu3F2r95GZic
         973EYm5DKFtaHEQHWfolFJc9yzYxhgHyg0dY24KEKLkZCIKUdh6seNpGH7VmmX6CQ4Fn
         zcIpW97bdp2OTI8bY4n/SkBR+hg+Q+4o8aL4iD9m8GvM0HpFcA0xRNZ2Ix7tdb0cnl6i
         Aosu07MgtKInzCiGImh4PiFPYbCRXVWQcIWd1l/jCL+BseXymrtdp40b1nm/K3tux1+r
         X5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tt/gOB9r37r5U7HxtgH6i80t5jbb5qgunubyztDkge0=;
        b=CiPVtqjEX4Tool3rs4wctnUBwcAQ0+ZpixjKYA6Gh1DtFVqbXJQO35UZ2+V5ha4NmE
         0LV6d8SL+EVMHGUWxiEFH9Otmdt0SPBW5sigy8+ozoAmgX4WsHsRKGfdKQMGHPU0ID4h
         yU2uN80tW4UqZrmHT/NwWxyaUXNzubLUiyV6vn7yrSZFFphw5wiIW17UF3WhXwvedHN0
         z6YWdEg+mioVmgMX7+N188ZW2mOE2pL0M2ocFAHnluzr92fpHgcGtMx418Gh2loGLxJ/
         4wFEw0QlLCzMiXKnTSM+jta4BIB8xQQhzAy+SqgYrspAZKLG5j6BDgSsuycC+TIM9mvp
         FntQ==
X-Gm-Message-State: AOAM531TU4W6hBxrJgbXOpiBMzgqCySair9huCMa2+Fex/dCSz8w4FSj
        penHO/18rqJYPQsHkiZKLjfyDw==
X-Google-Smtp-Source: ABdhPJxJiEl0UN3htJFLD1rtPCD0VDVXM6DoSobHaUqlamwlJFqyA3DDWZsqoE+HBihfRIGzg5IRBg==
X-Received: by 2002:a63:e5d:0:b0:3aa:3c53:537e with SMTP id 29-20020a630e5d000000b003aa3c53537emr53612711pgo.622.1654018126567;
        Tue, 31 May 2022 10:28:46 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u21-20020a056a00099500b0050dc76281bcsm11202370pfg.150.2022.05.31.10.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 10:28:45 -0700 (PDT)
Date:   Tue, 31 May 2022 11:28:43 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [RESEND PATCH] rpmsg: char: Add mutex protection for
 rpmsg_eptdev_open()
Message-ID: <20220531172843.GA531268@p14s>
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

This looks good.  I will fix the above typo and apply the patch when the 5.19 cycle
starts.

Thanks,
Mathieu

> ---
> changes in resend:
> - add fixes tag
> 
>  drivers/rpmsg/rpmsg_char.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
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
