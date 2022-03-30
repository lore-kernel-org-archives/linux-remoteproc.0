Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA4AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 10:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239965AbiC3KSq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Mar 2022 06:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238150AbiC3KSp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Mar 2022 06:18:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985B419E382
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Mar 2022 03:17:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37926B81BE2
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Mar 2022 10:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DC4C340EC;
        Wed, 30 Mar 2022 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648635416;
        bh=6kdp8lN1mCI7pDX5PtQ/Vo+adBzSxqa4JFXDPgjrpVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qI3npp0XOj7tfbPaI56RpqDFuHmO1iFXNYpaejeMn8kg08AAsQTcC6G06a3ysnHhi
         y2I8eyQ7GhyXvWXFulnb3srAKU/RBJl54L317yOPPQ0t+EayG1/VoPzkJdH8I7XkKq
         7xsgraEOYGvUY5ZrwCQrfb1lDrPkK7cC9OWYe02s=
Date:   Wed, 30 Mar 2022 12:16:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: Possible case of Race in kobject_get_path()
Message-ID: <YkQuFohIp2jSLCcz@kroah.com>
References: <0410ceda-cbdd-43a9-7d9b-4079bcdb6237@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0410ceda-cbdd-43a9-7d9b-4079bcdb6237@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 30, 2022 at 03:41:04PM +0530, Mukesh Ojha wrote:
> Hi All,
> 
> We are facing one issue where one driver (p1) is trying to register its
> device from driver probe
> and from another path (p2) dev_set_name(new name) done from driver probe of
> the added device whose
> new name length can be more than earlier done in (p1 path) which could
> result in redzone overwritten issue.

I do not understand, what specific driver is doing this so that we can
see an example of this problem?

> Can we get your suggestion here ? is this case of a race here ?
> 
>             p1                                                   p2
> 
>  device_register()
>     kobject_get_path()
>             =>  get_kobj_path_length
>             (length is calculated from this path)
> 
>                                                  dev_set_name()
> 
>             => fill_kobj_path
>               (path is copied here)
> 

I can not understand this example, any specific code you can point me
at?

thanks,

greg k-h
