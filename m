Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF8DC48BE5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 05:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E0F66109D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 05:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhFPGA6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Jun 2021 02:00:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:57486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231200AbhFPGA5 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 02:00:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 750176128C;
        Wed, 16 Jun 2021 05:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623823132;
        bh=mbCodwMIm1uO6V8GxochPay+jWIcegWFL544VUVwHXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M5vdOsIe2Zer92PkoDT5IunwubV5UQ1Vs7rNcq2Ea3wSGn7LJIEZLsHqaSeh7Q2wh
         UYg+Pvtp6gWzOE79brNsTv5CW5vKJV7rMKwVIl6VoHMMs12qrEdR6Sr0L172tju/Fd
         pPcZ2MXA+slC0xJ12ww6k0enzlONfls4e+4MJJWY=
Date:   Wed, 16 Jun 2021 07:58:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] remoteproc: core: Move cdev add before device add
Message-ID: <YMmTGD6hAKbpGWMp@kroah.com>
References: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
 <1623723671-5517-2-git-send-email-sidgup@codeaurora.org>
 <YMgy7eg3wde0eVfe@kroah.com>
 <0a196786-f624-d9bb-8ef9-55c04ed57497@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a196786-f624-d9bb-8ef9-55c04ed57497@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 15, 2021 at 12:03:26PM -0700, Siddharth Gupta wrote:
> 
> On 6/14/2021 9:56 PM, Greg KH wrote:
> > On Mon, Jun 14, 2021 at 07:21:08PM -0700, Siddharth Gupta wrote:
> > > When cdev_add is called after device_add has been called there is no
> > > way for the userspace to know about the addition of a cdev as cdev_add
> > > itself doesn't trigger a uevent notification, or for the kernel to
> > > know about the change to devt. This results in two problems:
> > >   - mknod is never called for the cdev and hence no cdev appears on
> > >     devtmpfs.
> > >   - sysfs links to the new cdev are not established.
> > > 
> > > The cdev needs to be added and devt assigned before device_add() is
> > > called in order for the relevant sysfs and devtmpfs entries to be
> > > created and the uevent to be properly populated.
> > So this means no one ever ran this code on a system that used devtmpfs?
> > 
> > How was it ever tested?
> My testing was done with toybox + Android's ueventd ramdisk.
> As I mentioned in the discussion, the race became evident
> recently. I will make sure to test all such changes without
> systemd/ueventd in the future.

It isn't an issue of systemd/ueventd, those do not control /dev on a
normal system, that is what devtmpfs is for.

And devtmpfs nodes are only created if you create a struct device
somewhere with a proper major/minor, which you were not doing here, so
you must have had a static /dev on your test systems, right?

thanks,

greg k-h
