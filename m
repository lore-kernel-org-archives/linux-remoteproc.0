Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F78C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Feb 2022 17:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbiBCRfR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Feb 2022 12:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240791AbiBCRfP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Feb 2022 12:35:15 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B64C06173B
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Feb 2022 09:35:15 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id y5-20020a17090aca8500b001b8127e3d3aso3684687pjt.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Feb 2022 09:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9e0oxCku0Awg8Sfq6RwVv/SH5AvdTEcLXDJ8KHAWSBI=;
        b=taFBh+thCKl5Jv/LEOX1LgoAt1cWwIlDf2gcDD57Hl8dOAegKbyMp4wwejfdITEY6n
         aRhE9cCKXTHjAjDxE2ms/2VVej2/Z3Nal7SC6V0aVlyjoQRfTYQkTWolE3o94pJppD33
         4DIBpeM8/8m4dD9OyiuPIyS6tXloCSJrPvkvcbaffucKQ+ullmkKYeCdT8k5yzOM4Cef
         OU2QLpM8gynxD27x9GvTAXlQOaqufYtIfqGAKfaeZiBmPYYJuWLWjapuJ9f8ozDMgYE+
         5LjhCpz2B84WMwZ/W4+EcqCMDKr6kqpVgf3UUpvNfbrOKc9ncVSuX7Pds/rggeqYYwdW
         PQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9e0oxCku0Awg8Sfq6RwVv/SH5AvdTEcLXDJ8KHAWSBI=;
        b=kOYWvULbXgxisuES8E9xFjkn3wWvq9HG3UE2UrT1FXzhPRKRfaDiJhQqLGaPwcvx/r
         OFzHvqiZ3h4vTSvQGjGWmTdNGKnVgNcV1juMz9aKDiqp+kZ5bcP94txK1yjem7gEqzyS
         /NOp+blwtzyFsNVjtNVhB9qi3MUtUb/6lhZBX6kOE5XVQ+zJqltrFcPrd9Vwrm+FjLtc
         AqnpezWOjBEr/wcJaiPEI+PqRJG4HkJhPijHGsZvldP/ouYcnjstQB/elDAHRClbcvnm
         MABvuI272WCRmU9umOeZEPNKK1bOOYsYJrh88Ay7A30Jtln3oU+X8YE0/OeiFaafzwl3
         KVMg==
X-Gm-Message-State: AOAM533YFljzHjPQ7vHEWnq4lV/FzWG1MElo/jI6psC5usu/mg8MxfjU
        2X2tWV5P5RO17IGzCU4LGRjHrCcq+C8Lew==
X-Google-Smtp-Source: ABdhPJzVjXtIyaIqU4Iftz/N5PHRDNQvMN/XP/gzP+j0ZLSMhFFIngn16sdHfs8mtnP17sR4rnss+w==
X-Received: by 2002:a17:903:22d1:: with SMTP id y17mr36826313plg.107.1643909715150;
        Thu, 03 Feb 2022 09:35:15 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id me4sm11085727pjb.26.2022.02.03.09.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:35:13 -0800 (PST)
Date:   Thu, 3 Feb 2022 10:35:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        quic_clew@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 1/3] rpmsg: glink: Free device context only when cdev
 not in use
Message-ID: <20220203173510.GA2982815@p14s>
References: <1643223886-28170-1-git-send-email-quic_deesin@quicinc.com>
 <1643223886-28170-2-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643223886-28170-2-git-send-email-quic_deesin@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Deepak,

On Thu, Jan 27, 2022 at 12:34:44AM +0530, Deepak Kumar Singh wrote:
> Struct device holding cdev should not be freed unless cdev
> is not in use. It is possible that user space has opened
> char device while kernel has freed the associated struct
> device context.
> 
> Mark dev kobj as parent of cdev, so that chardev_add gets
> an extra reference to dev. This ensures device context is not
> freed until cdev is is not in uses.
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index c03a118..72ee101 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -417,6 +417,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	dev->id = ret;
>  	dev_set_name(dev, "rpmsg%d", ret);
>  
> +	cdev_set_parent(&eptdev->cdev, &dev->kobj);
>  	ret = cdev_add(&eptdev->cdev, dev->devt, 1);

This issue should have been fixed when cdev_add() was replaced by
cdev_device_add(), something you will find on v5.17-rc2.

Also, this set is generating checkpatch warnings and as such I will not review
the other patches in it. 

Thanks,
Mathieu

>  	if (ret)
>  		goto free_ept_ida;
> @@ -533,6 +534,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev->id = ret;
>  	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
>  
> +	cdev_set_parent(&ctrldev->cdev, &dev->kobj);
>  	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
>  	if (ret)
>  		goto free_ctrl_ida;
> -- 
> 2.7.4
> 
