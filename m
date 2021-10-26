Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04431C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Oct 2021 00:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C628261073
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Oct 2021 00:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbhJZAmX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Oct 2021 20:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235619AbhJZAmT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Oct 2021 20:42:19 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9EBC061767
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 17:39:56 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id r2so12331715pgl.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 17:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YzYDFlVO4yRtUtstyuZjtTCfaHeLtxBbXFUEMFl50gE=;
        b=I4eh9zJO0VLnLMuN830zfiQzAYRDYtuGSr1IieUbZQMbcEFUavGlzVO73hgMCovAH/
         WFeFD67omMoSYxzPgBhVZ3e4GFYFyzm5+MxSGqr2aq8+5EKGRaIoglIyx4KddyGuE+ou
         Ebv5lhIXDPzE+xnOSZv0cxvYh7FUIfrZmcghA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YzYDFlVO4yRtUtstyuZjtTCfaHeLtxBbXFUEMFl50gE=;
        b=jBkRDM85gGLRKChCUn4zovlcWb4ECbmz9JT7PV3a09OWizWWR8/varQtxrgS677QQL
         WbBTDok2k6EG8sR5G7eF9HOgFAEU5+ZySB0xKrUquqCXmufcw3ZEEf6aocLYKp6erHPd
         YYrDmOtE7xLCvc6Z0a1iX6HW2bCbpFdr6jiw+Gr43+LVezap5HLw3rqrR7CNMWsL7gVi
         XJjnOqTZ3eDlFseiCRSS//epZPKSg5o/A9MPeTvxzu9ASKENEzl6UDG24+6lrKIy4ugS
         RKiRQqi3hL+ICssR+Uj8X8nrQsvPpK/IpS05HXWnkujDchuxinzhTKtbMzLeHzVBeYgh
         AbLQ==
X-Gm-Message-State: AOAM533prRLLB5eOPEUhxvUPbZ5WWGjzH4wd6txykONLJ047KSffXwNZ
        ZOU1WUufgP8xW6qR9RmAIBJKdg==
X-Google-Smtp-Source: ABdhPJxNGQkKAn0VvFUMEC9gGI3s88Scz933Ih3dJHUfyERI4UGSRzlq/cWVGxOHVMAcydKqNeBoeg==
X-Received: by 2002:a05:6a00:2443:b0:44e:ec:f388 with SMTP id d3-20020a056a00244300b0044e00ecf388mr21933464pfj.7.1635208795789;
        Mon, 25 Oct 2021 17:39:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5822:765c:9f84:e1b3])
        by smtp.gmail.com with UTF8SMTPSA id np17sm24814905pjb.7.2021.10.25.17.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 17:39:55 -0700 (PDT)
Date:   Mon, 25 Oct 2021 17:39:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rpmsg: glink: Update cdev add/del API in
 rpmsg_ctrldev_release_device()
Message-ID: <YXdOWrY3xcAaI9Ih@google.com>
References: <20211025233751.1777479-1-sujitka@chromium.org>
 <20211025163739.v2.2.I507c5cea0cf97db4cedfa0e47029e711e7edd0df@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211025163739.v2.2.I507c5cea0cf97db4cedfa0e47029e711e7edd0df@changeid>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 25, 2021 at 04:37:54PM -0700, Sujit Kautkar wrote:
> Replace cdev add/del APIs with cdev_device_add/cdev_device_del to avoid
> below kernel warning. This correctly takes a reference to the parent
> device so the parent will not get released until all references to the
> cdev are released.
> 
> | ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x7c
> | WARNING: CPU: 7 PID: 19892 at lib/debugobjects.c:488 debug_print_object+0x13c/0x1b0
> | CPU: 7 PID: 19892 Comm: kworker/7:4 Tainted: G        W         5.4.147-lockdep #1
> | ==================================================================
> | Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
> | Workqueue: events kobject_delayed_cleanup
> | pstate: 60c00009 (nZCv daif +PAN +UAO)
> | pc : debug_print_object+0x13c/0x1b0
> | lr : debug_print_object+0x13c/0x1b0
> | sp : ffffff83b2ec7970
> | x29: ffffff83b2ec7970 x28: dfffffd000000000
> | x27: ffffff83d674f000 x26: dfffffd000000000
> | x25: ffffffd06b8fa660 x24: dfffffd000000000
> | x23: 0000000000000000 x22: ffffffd06b7c5108
> | x21: ffffffd06d597860 x20: ffffffd06e2c21c0
> | x19: ffffffd06d5974c0 x18: 000000000001dad8
> | x17: 0000000000000000 x16: dfffffd000000000
> | BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
> | x15: ffffffffffffffff x14: 79616c6564203a74
> | x13: 0000000000000000 x12: 0000000000000080
> | Write of size 8 at addr ffffff83d95768d0 by task kworker/3:1/150
> | x11: 0000000000000001 x10: 0000000000000000
> | x9 : fc9e8edec0ad0300 x8 : fc9e8edec0ad0300
> |
> | x7 : 0000000000000000 x6 : 0000000000000000
> | x5 : 0000000000000080 x4 : 0000000000000000
> | CPU: 3 PID: 150 Comm: kworker/3:1 Tainted: G        W         5.4.147-lockdep #1
> | x3 : ffffffd06c149574 x2 : ffffff83f77f7498
> | x1 : ffffffd06d596f60 x0 : 0000000000000061
> | Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
> | Call trace:
> |  debug_print_object+0x13c/0x1b0
> | Workqueue: events kobject_delayed_cleanup
> |  __debug_check_no_obj_freed+0x25c/0x3c0
> |  debug_check_no_obj_freed+0x18/0x20
> | Call trace:
> |  slab_free_freelist_hook+0xb4/0x1bc
> |  kfree+0xe8/0x2d8
> |  dump_backtrace+0x0/0x27c
> |  rpmsg_ctrldev_release_device+0x78/0xb8
> |  device_release+0x68/0x14c
> |  show_stack+0x20/0x2c
> |  kobject_cleanup+0x12c/0x298
> |  kobject_delayed_cleanup+0x10/0x18
> |  dump_stack+0xe0/0x19c
> |  process_one_work+0x578/0x92c
> |  worker_thread+0x804/0xcf8
> |  print_address_description+0x3c/0x4a8
> |  kthread+0x2a8/0x314
> |  ret_from_fork+0x10/0x18
> |  __kasan_report+0x100/0x124
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/rpmsg/rpmsg_char.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 876ce43df732b..b63a5c396da57 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -458,7 +458,7 @@ static void rpmsg_ctrldev_release_device(struct device *dev)
>  
>  	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
>  	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> +	cdev_device_del(&ctrldev->cdev, &ctrldev->dev);
>  	kfree(ctrldev);
>  }
>  
> @@ -493,14 +493,13 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev->id = ret;
>  	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
>  
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> +	ret = cdev_device_add(&ctrldev->cdev, &ctrldev->dev);
>  	if (ret)
>  		goto free_ctrl_ida;
>  
>  	/* We can now rely on the release function for cleanup */
>  	dev->release = rpmsg_ctrldev_release_device;
>  
> -	ret = device_add(dev);
>  	if (ret) {
>  		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
>  		put_device(dev);

Also remove the error check? There is already a check above for the
status of 'cdev_device_add'.
