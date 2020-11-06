Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCADFC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50B0B22203
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r843aCJQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKFRxg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 12:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgKFRxf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 12:53:35 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46CFC0613D2
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2020 09:53:35 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id z24so1520248pgk.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2020 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5TMQVCNljoYFuIcGIa8R0xZ7bhBD1oFyjgSl29C7UwE=;
        b=r843aCJQdIeK6veUamZyT4x8F0NofnZMojaKQ0Ch7uG8gUppCLbvQambLJWmecH5EX
         /04FfcLGF7hnoUbPpOcKMiaG/ITcxBEZSNodVKrBn7Bf2TocGWnLTsIU4LVIpW7CZ8Mj
         ZVN9tnreu774u3TGaZQqrHDJdrWZ3E54LjgMxW7CNqVpz/NcoCyefP2luBzCg7xllyw6
         GHI8WaDiFDksSUzThDgRpBSBDf0JL6qYuwYxRrOn8BOG+chOLFsFJXfvrGqxj0wZdMF3
         s25Dk5dQpKB/mf0uUN/Rt6RrAEw3OyVmrlIk8LgoDPJZkwAc3JLRvkTJfiTzK+1OwiO8
         O04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5TMQVCNljoYFuIcGIa8R0xZ7bhBD1oFyjgSl29C7UwE=;
        b=YQdmmJZm5yWzxvdcqHCELJIK0M+qXLLqdSTvFpsX4tCqvWlfFEvoyrVfRMC+M6t2Dq
         Q1meGwegpytvARGeOoaSS4kv3PdsyQC+3iCXei90S/+xKOK9ja9Tf13QCufo6wONyC7h
         UMPxd64hC75j9iX3u/mETPeedNCcHa7JInXuoYIrmNQkba0zc+bi+t5oA+shy73WGdqO
         +1SA9QcbktET6D3VWXMUFTQn9xomUudaJ9ES2xgtP8KNtrreGDvE4KUlLvY52ohWxoq0
         3ctsvzajKa7SPw3X0GDGFUMUZrTLcwVzQA21gWe3w0mWLcaaCri9SlC26QrRAaXP05QC
         5l8Q==
X-Gm-Message-State: AOAM532cyGHPUZVpYdg5WUwDnPE6ZAtEPxcVAeZ6UAw6leMU9WSLrsxz
        xFJ8R/ZjB88UpmZ/h/uBbJgAgQ==
X-Google-Smtp-Source: ABdhPJzl06YEHrgQVSuXECQAbWSUXZn/uPA8xvoeuhi0T/5hgG+lKXZ4xbbTIWK0wYu1zHgohEXh+w==
X-Received: by 2002:a63:5509:: with SMTP id j9mr2643913pgb.3.1604685215106;
        Fri, 06 Nov 2020 09:53:35 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l190sm2644522pfl.205.2020.11.06.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 09:53:34 -0800 (PST)
Date:   Fri, 6 Nov 2020 10:53:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201106175332.GB3203364@xps15>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106140028.GB10889@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> > Hi Mathieu, Arnaud,
> > 
> > On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> > > From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > > 
> > > Make the RPMSG name service announcement a stand alone driver so that it
> > > can be reused by other subsystems.  It is also the first step in making the
> > > functionatlity transport independent, i.e that is not tied to virtIO.
> > 
> > Sorry, I just realised that my testing was incomplete. I haven't tested 
> > automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
> > it probes and it's working, but if it isn't loaded and instead the rpmsg 
> > bus driver is probed (e.g. virtio_rpmsg_bus), calling 
> > rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
> > rpmsg_ns to be loaded.
> 
> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
> but that alone doesn't fix the problem completely - the module does load then 
> but not quickly enough, the NS announcement from the host / remote arrives 
> before rpmsg_ns has properly registered. I think the best solution would be 
> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
> the module name, so you could rename them to just core.c and ns.c.

I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
before the kernel has finished loading the name space driver.  There has to be
a way to prevent that from happening - I will investigate further.

Thanks for reporting this,
Mathieu

> 
> Thanks
> Guennadi
