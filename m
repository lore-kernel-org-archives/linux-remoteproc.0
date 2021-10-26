Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9639FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Oct 2021 00:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77CAC60FC2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Oct 2021 00:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbhJZAbj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Oct 2021 20:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhJZAbi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Oct 2021 20:31:38 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CD1C061745
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 17:29:15 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gn3so9588439pjb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 17:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kzA4EpTi7z77s3KOJZLkB0akISy0U4YTxQuvmocFUgU=;
        b=OTupR3eFronvQywS7qKloj2ZVgcgrUGU/A/27Yw2/EU5C9UbHbGZucQzrCf2ptOXdz
         JExxVRam2bJbStJtkTgcgv3YR0cZYtk9mNJ27PLJ5JQtLcoUt+aNeh0/qa03koQNa6Nl
         V4YDAax5mWX2epn6cq3yjiQTCAl/s/72/ZXfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kzA4EpTi7z77s3KOJZLkB0akISy0U4YTxQuvmocFUgU=;
        b=rErIsNYTof+IER/ylpt0zF1kQ4oXdEloLlwHVYZhaaXGvcgTP4YqvJAVU5FTPewNuh
         pnJqFK9jKqKYzKRia72L7HdjuO8qpdJuOEAlUC961UynyK3Boi+Q7WqyEhHpZ+eICjDB
         4hEyPBdqXX+4UI8+D4E7qdHwx8NvsaUXYrCm+fM5g7Ui449FFpwAxPj2Rcg5VY9npuoH
         qGZdccoxS+D/l2BREnXd8prMdWp63cITgPFrdw5v0S4iHpGLvUlx0hSJQlOdTlywqOVq
         2qQTin9SvBSAWADXBvh6QUHCUYFBKkyguhF0R485faMI6jc4MDoanHj59WAemiA6Bux1
         PGFw==
X-Gm-Message-State: AOAM5324pqsUrcUkDr+T7Oc4N93BNzaQR5MqvhZxhvI77fgLMJLoeVAL
        PdPArUGfp4/G37mERfXgHPkPMpNDF80=
X-Google-Smtp-Source: ABdhPJwYnSMKPYjmI8QhrAgLoT1GbHwUyZJLSvXqMzWfZiE7NSs2GXs7skPU1ESitnVKLZoPFaldrQ==
X-Received: by 2002:a17:90a:e505:: with SMTP id t5mr14530311pjy.33.1635208155201;
        Mon, 25 Oct 2021 17:29:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5822:765c:9f84:e1b3])
        by smtp.gmail.com with UTF8SMTPSA id l14sm23244442pjq.13.2021.10.25.17.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 17:29:14 -0700 (PDT)
Date:   Mon, 25 Oct 2021 17:29:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rpmsg: glink: Fix use-after-free in
 qcom_glink_rpdev_release()
Message-ID: <YXdL2RfdYwy2g+kr@google.com>
References: <20211025233751.1777479-1-sujitka@chromium.org>
 <20211025163739.v2.1.Id19324ea36b4cf89faf98bf520bc6b6f01240433@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211025163739.v2.1.Id19324ea36b4cf89faf98bf520bc6b6f01240433@changeid>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 25, 2021 at 04:37:52PM -0700, Sujit Kautkar wrote:
> qcom_glink_rpdev_release() sets channel->rpdev to NULL. However, with
> debug enabled kernel, qcom_glink_rpdev_release() gets delayed due to
> delayed kobject release and channel gets released by that time and
> triggers below kernel warning. To avoid this use-after-free, add a
> condition to checks if channel was already released.
> 
> | BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
> | Write of size 8 at addr ffffffaba438e8d0 by task kworker/6:1/54
> |
> | CPU: 6 PID: 54 Comm: kworker/6:1 Not tainted 5.4.109-lockdep #16
> | Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> | Workqueue: events kobject_delayed_cleanup
> | Call trace:
> |  dump_backtrace+0x0/0x284
> |  show_stack+0x20/0x2c
> |  dump_stack+0xd4/0x170
> |  print_address_description+0x3c/0x4a8
> |  __kasan_report+0x144/0x168
> |  kasan_report+0x10/0x18
> |  __asan_report_store8_noabort+0x1c/0x24
> |  qcom_glink_rpdev_release+0x54/0x70
> |  device_release+0x68/0x14c
> |  kobject_delayed_cleanup+0x158/0x2cc
> |  process_one_work+0x7cc/0x10a4
> |  worker_thread+0x80c/0xcec
> |  kthread+0x2a8/0x314
> |  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/rpmsg/qcom_glink_native.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index e1444fefdd1c0..cc3556a9385a9 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -270,6 +270,7 @@ static void qcom_glink_channel_release(struct kref *ref)
>  	spin_unlock_irqrestore(&channel->intent_lock, flags);
>  
>  	kfree(channel->name);
> +	channel = NULL;

This doesn't make much sense, 'channel' is a local variable, the only effect
this has is that the memory of 'channel' isn't freed by the 'kfree' below.

Maybe this is debug code and wasn't intended to be part of this patch?

>  	kfree(channel);
>  }
>  
> @@ -1372,8 +1373,10 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  {
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +	if (channel) {
> +		channel->rpdev = NULL;
> +	}

Remove curly braces for single line branch.

>  
> -	channel->rpdev = NULL;
>  	kfree(rpdev);
>  }
>  
> -- 
> 2.31.0
> 
