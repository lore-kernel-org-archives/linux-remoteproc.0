Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD23C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 23:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B7F6128E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 23:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241599AbhKQXcM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Nov 2021 18:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhKQXcL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Nov 2021 18:32:11 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECBDC061570
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Nov 2021 15:29:12 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso7634868otr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Nov 2021 15:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gVOidswxtyfjR15IzCo616YI0K9jYAoJlUzTrw9zeVk=;
        b=wKLZkJ7rMo1SswUXumI205EwZ1TFYlvtdqcLUGm7rCCxPuLM213bq1U4pPnI3p4+sr
         ajAWMxrOKbvu+naOwhiNf/DxgMvazJQACKgagOyrG0tiKHWSKzMLYGmFMnlFKsi6CSKn
         Hcs/P1528Lyro2Cs8BZd+C7eq09QJif3+EAPlqPY99s2TN5QsZYI8X8fzNOKlRk/3zDi
         7LeyqSBmegqrtcjGktpqJfYvJM5UiLwy7SWtoHygC6Zpezh3e8WUlnEbaeUIsvVEFa94
         fPmSs6D3NkklijqdZFeQ4cvMscvtf1RhFTmXp9FV8grkvfh7phCy9sHgPr+oH3rMNzUL
         vXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gVOidswxtyfjR15IzCo616YI0K9jYAoJlUzTrw9zeVk=;
        b=uYkLAZRf8076gkq4EC6YPW/WO5qb+DLi1qXY4dcs5PCzrx/emUO6ibbMF+tH3nfY3L
         FiFcF3OesoS+z6I10gxB9d3bEYRgUEy4FB2mVzMpuPFN8kyN/jNi3ofsSWGjUPy/V6Tl
         WE9ZWyrHJMkQ5+4xEGR7O9chinvEspimZyd37H5vTdcQsZWK1g0v5kihaIcR9ohQilQG
         VDrhdBy6I2kPJ33SXaWm/uNSfbCL4zPgCCkBu/XHBBbUXKNKmoBUPFdYOJO6WGxvXjRf
         DEe+iuSOMog3ftDSPnQ5DHFpxZd7o+UZUxIB35C7RA1lwgljfpb6CqBvs5CY7HEPAdrP
         qLBQ==
X-Gm-Message-State: AOAM532esQmMfDyN1vPvbRzBahxlvWQ3zofnQnTzpDhuwXYz2cwGdgVQ
        2ODIW5qfHs3jv9RRle1FhZmvvQ==
X-Google-Smtp-Source: ABdhPJzvQuRWdUtu/2FcRKGyc+2L2t05Gl+t1fCx0w3DTUnUY6XfhkrBkm+4yLRyDTwzX1is5/ScdA==
X-Received: by 2002:a05:6830:2681:: with SMTP id l1mr17387416otu.378.1637191752089;
        Wed, 17 Nov 2021 15:29:12 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m5sm212638oon.45.2021.11.17.15.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 15:29:11 -0800 (PST)
Date:   Wed, 17 Nov 2021 17:29:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rpmsg: glink: Update cdev add/del API in
 rpmsg_ctrldev_release_device()
Message-ID: <YZWQQ6XPIdMLtZEy@builder.lan>
References: <20211102235147.872921-1-sujitka@chromium.org>
 <20211102165137.v3.2.Ie09561c5b453a91f10ecc7e1974c602c4ff78245@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102165137.v3.2.Ie09561c5b453a91f10ecc7e1974c602c4ff78245@changeid>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 02 Nov 18:51 CDT 2021, Sujit Kautkar wrote:

I like Stephen's suggestion about modifying the $subject.
Also note that the change isn't in the glink driver, so prefix should
reflect that:

$ git log --oneline --no-decorate -- drivers/rpmsg/rpmsg_char.c
f998d48f9b3c rpmsg: glink: Update cdev add/del API in rpmsg_ctrldev_release_device()
bc774a3887cb rpmsg: char: Remove useless include
964e8bedd5a1 rpmsg: char: Return an error if device already open
...

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

Why is dump_backtrace in the callstack here inbetween
rpmsg_ctrldev_release_device() and kfree()? Isn't the error that we're
calling kfree() on an chunk of memory that contains a live object?

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
> Changes in v3:
> - Remove unecessary error check as per Matthias's comment
> 
> Changes in v2:
> - Fix typo in commit message
> 
>  drivers/rpmsg/rpmsg_char.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 876ce43df732b..a6a33155ca859 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -458,7 +458,7 @@ static void rpmsg_ctrldev_release_device(struct device *dev)
>  
>  	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
>  	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> +	cdev_device_del(&ctrldev->cdev, &ctrldev->dev);

I am not able to find any other instance where cdev_device_del() is
called from the device's release function itself, which tells me that
this probably is not the right thing to do. Instead the appropriate way
seem to put the cdev_device_del() in rpmsg_chrdev_remove().


That said, we already do device_del() in rpmsg_chrdev_remove() so if the
warning is trying to tell us that ctrldev->dev is not deleted I think we
have an unbalanced put_device()?

Regards,
Bjorn

>  	kfree(ctrldev);
>  }
>  
> @@ -493,19 +493,13 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
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
> -	if (ret) {
> -		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> -		put_device(dev);
> -	}
> -
>  	dev_set_drvdata(&rpdev->dev, ctrldev);
>  
>  	return ret;
> -- 
> 2.31.0
> 
