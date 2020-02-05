Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37238 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgBEXVv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 18:21:51 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so1716182pgl.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Feb 2020 15:21:51 -0800 (PST)
Date: Wed, 5 Feb 2020 16:21:48 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: How to get src and dst for pru_rpmsg_send?
Message-ID: <20200205232148.GC25901@xps15>
References: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: "Andrew P. Lentvorski" <bsder@allcaps.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Andrew,

On Wed, Feb 05, 2020 at 02:24:07AM -0800, Andrew P. Lentvorski wrote:
> I seem to be missing something obvious: Where do I get the values for
> src and dst in the pru_rpmsg_send() function?
> 
> The TI examples do a pru_rpmsg_receive() first and then echo back to the
> same src and dst.  That seems ... odd.  What's the point of having a
> variable src and dst if they are effectively hardwired to a single
> communication channel?

Since pru_rpmsg_send/receive() don't exist in the mainline kernel you will have
to be more specific... What TI examples are you referring to?  Where can we find
them? 

There are other rpmsg_sendxyz() functions that allow you to send messages to
different addresses[1].  Given the amount of information, I'm afraid there isn't
much else I can add at this time.

Thanks,
Mathieu  

[1]. https://elixir.bootlin.com/linux/latest/source/include/linux/rpmsg.h#L125


> 
> Thanks.
