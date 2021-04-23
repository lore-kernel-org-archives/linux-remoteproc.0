Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F560C433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 03:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC9C861458
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 03:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238306AbhDWDBw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237171AbhDWDBv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 23:01:51 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EE1C061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 20:01:15 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u80so14314844oia.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q7/+Vm7S6JlU3uOg3KyNYKjZINlNjTNIF8wF9Y1eVVY=;
        b=GZiFFh6xfBClbtScHcKT6KbX7WJbeesTioE5EkO2grjcJAoUq5BmMOGdsmy9d3yWyc
         j/M7e6wL6pnEx8qcS9699tRCV3U4WNW1I6hHdcNj19yQq38C3cDcRgbuTzy7VzeI4z4G
         fdYhqhVVcPva3lnEwrOlgFtAQnzgR9NAL2Oeg61UXafLKwD3KBmitowa84I4kGSQjNW6
         0qb1eZbAG+xkzbz2loNC38BntXPKxh5BfEDEfD5nnih1aePIwagTsR4nbZKKhGiJei8H
         RsxkYSkOX6/VJP84G7BAnDZKAZTp7YgtgKVEqWBdL1jLkEAQmz7UauXIiDWTPpyK2vVa
         CxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q7/+Vm7S6JlU3uOg3KyNYKjZINlNjTNIF8wF9Y1eVVY=;
        b=oYjDfz2rbjao1l1DLs+fpNiOu4Fts4Oyr+ijrQhbTFjIOYu1upjZH7yH+v3KMGPqFb
         bYnw8KVAMm/HxkkNxxXij01UAEJTtUUV5iu2TZYNdyjQYXiZLcEG1tG3lY+rnyB/INFQ
         d3uKXfD5waIf11+sbRX0u+ovH2sPVNvrK2e7q/AVtx+LUF25hQbclxri+AI7TZcothTR
         n0zl3iVWqtLxdxYpwojya1JjSYmeNTY/9a2vglE7w1unCozxBKzzXNXxVM5Y6dCJQu/1
         gJzTBzK4SlU7pbvHj7lMMD8SqViMP4hApowdHREEzAJUltd7tL9yeX+Ms8Z1q8w//SaL
         1geA==
X-Gm-Message-State: AOAM533UI71pt2XGAZPvnIDdA+FcPGATqEOgMOx0kvH498ffRpOjhUy/
        HIb7nKHnz5WoEmOkIT5RppK+8Q==
X-Google-Smtp-Source: ABdhPJz4whEFVcu0FZhcUdEIYZVHIZLsVPqUInzfsfr9BBti70aco4/ISEbgt9XnH3VbhE4ncNxh3w==
X-Received: by 2002:aca:5904:: with SMTP id n4mr2246680oib.25.1619146875250;
        Thu, 22 Apr 2021 20:01:15 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h81sm977629oif.53.2021.04.22.20.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 20:01:14 -0700 (PDT)
Date:   Thu, 22 Apr 2021 22:01:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, eberman@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Move cdev add before device add
Message-ID: <20210423030112.GE1908499@yoga>
References: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
 <20210422180455.GE1256950@xps15>
 <e1fa4482-4fc9-e67d-d6b1-3168188f3d18@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fa4482-4fc9-e67d-d6b1-3168188f3d18@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 22 Apr 21:12 CDT 2021, Siddharth Gupta wrote:

> 
> On 4/22/2021 11:04 AM, Mathieu Poirier wrote:
> > Hi Siddharth,
> > 
> > On Tue, Apr 20, 2021 at 12:26:45PM -0700, Siddharth Gupta wrote:
> > > When cdev_add is called after device_add has been called there is no
> > > way for the userspace to know about the addition of a cdev as cdev_add
> > > itself doesn't trigger a uevent notification, or for the kernel to
> > > know about the change to devt. This results in two problems:
> > >   - mknod is never called for the cdev and hence no cdev appears on
> > >     devtmpfs.
> > >   - sysfs links to the new cdev are not established.
> > > 
> > > Based on how cdev_device_add[1] is written, it appears that the correct
> > Please don't add this kind of reference to the change log as it will become
> > invalid with time.
> Okay sure, I will remove it.
> > 
> > > way to use these APIs is to call cdev_add before device_add is called.
> > > Since the cdev is an optional feature for remoteproc we cannot directly
> > > use the existing API.
> > Please explain why the existing API can't be used directly.
> Not sure what you mean here Mathieu? The reason why we can't use
> it is because cdev is an optional feature. We would either have to move
> device_add inside rproc_char_dev_add or the other way around and
> make cdev a regular feature. Since device_add can't be called on the
> same device struct twice[1], we have to do things this way. Also this
> way we don't have to rely on the userspace to call mknod as it will
> be called[2] as a part of the device_add call in devtmpfs_create_node.
> 
> Now that I think about it, is the above what you want me to put in the
> commit text? :)
> 

Your patch is correct, we need to cdev_add() and in particular assign
dev->devt before calling device_add(). Given how the code is split in
core and cdev there's no way to use cdev_device_add(), but I don't think
anyone is suggesting that - except for your commit message.

So while everything you mention in your commit message seems correct,
you should be able to make it more to the point by distilling it down to
something like:

  The cdev needs to be added and devt assigned before device_add() is
  called in order for the relevant sysfs and devtmpfs entries to be
  created and the uevent to be properly populated.

> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/core.c#n3105
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/devtmpfs.c#n215
> > 
> > > Hence moving rproc_char_device_add() before
> > > device_add() in rproc_add().
> > > 
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/char_dev.c#n537
> > > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 626a6b90f..562355a 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -2316,6 +2316,11 @@ int rproc_add(struct rproc *rproc)
> > >   	struct device *dev = &rproc->dev;
> > >   	int ret;
> > > +	/* add char device for this remoteproc */
> > > +	ret = rproc_char_device_add(rproc);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > I have tested this change and it works.  So how did it work before?
> It is a sporadic issue due to a race between the userspace uevent handler
> and cdev_add. If the uevent for the device is received/processed after
> cdev_add the cdev is created.
> 
> If "add" is written to the uevent file or mknod is manually called for devt
> the cdev works as expected, just that the sysfs links won't be created.

So it works for e.g. systemd based systems (most of the time), while in
a system based on devtmpfs the dev node would never show up.

Regards,
Bjorn

> > 
> > >   	ret = device_add(dev);
> > >   	if (ret < 0)
> > >   		return ret;
> > > @@ -2329,11 +2334,6 @@ int rproc_add(struct rproc *rproc)
> > >   	/* create debugfs entries */
> > >   	rproc_create_debug_dir(rproc);
> > > -	/* add char device for this remoteproc */
> > > -	ret = rproc_char_device_add(rproc);
> > > -	if (ret < 0)
> > > -		return ret;
> > > -
> > While reviewing this patch I had another look at rproc_add() and noticed it
> > doesn't clean up after itself in case of failure.  If any of the conditions
> > aren't met the function returns but rproc_delete_debug_dir(),
> > rproc_char_device_remove() and device_del() aren't called.  Please fix that as
> > part of your next revision.
> Sure. I'll make those changes.
> 
> Thanks,
> Sid
> > 
> > Thanks,
> > Mathieu
> > 
> > 
> > >   	/* if rproc is marked always-on, request it to boot */
> > >   	if (rproc->auto_boot) {
> > >   		ret = rproc_trigger_auto_boot(rproc);
> > > -- 
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
