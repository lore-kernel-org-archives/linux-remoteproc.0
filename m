Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D6AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 17:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64467604AC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 17:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbhJKRYD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 13:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhJKRYD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 13:24:03 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C35C06161C
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Oct 2021 10:22:03 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id z126so11287618oiz.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Oct 2021 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HmEokn5oUdJqWXRoigMGBMDU0hXxS+4uBuxS3ZcINxM=;
        b=HWG22c1i7wrXnbbUxNqP0GHByQbqHrpCQ9uBz2JGkqyvFn+qNXPaX/ofKK/2zDb9wV
         k8m9YtNdJeHBPpQpvMYTpL420BuMUzo+ihnJARKQz72AF+LjHSrYQZ2oe4q68WisiOzc
         /JEtbiU1rPu5UMpvkqoY2d8M2LvxemL3g1do7ma8MOEVSzdUoBuCMSyg/L4G8ADl7Vv4
         ZlBTJX14Ao0cu5Vu5jTq1DEnIU113RrIYZPWuJe31JHmIRrT887KU4xz1yqpQ7T6mYbc
         wCsv1jKQqL/JUrEzyfyIjQrAQD9ZGOstplnB2HBmL1QHMykf53J3vIo0pKIEzpCAD2d5
         /SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HmEokn5oUdJqWXRoigMGBMDU0hXxS+4uBuxS3ZcINxM=;
        b=jSadiEAW4Y/nqd/mKaPIWce0rYzQO9M8CQiPvmGFbEcX6m0ZA3hSlZfcl3Jo2gUJ56
         B8Q+qdWDo/aqgJebGKZ1Lo9/gjj5+tl4JIBJomDw1G/FAOdOsQ7yq3EWKNJgL9uYBtX5
         kDwTIlAz1B00dHdHg5NHYqD24N7LCli8tRbUFEU4gWN2RSc5IYQtg8DHtUA0jWkHSe/I
         t0tnpAiAhn6FQ5xfZ7yXoCgWg2j9GXCBRO3O4JhxH2JUwtXhMPRWhObjbyQFIocMC29S
         2wNIGhhlglIsbTx1eKr8jTcJFdkWn+uCphLtmfMD1XNo6JapFLS6Cdpt9o9DZYRFR2Fg
         lUJg==
X-Gm-Message-State: AOAM531Don1iVnYQPRK07u43vlqZ/8XuwecNiLLVcVXhyGf+d0OvqJqm
        pwLYD9KI6KZ9MFhAUE/LrF+YXplucAsRzg==
X-Google-Smtp-Source: ABdhPJwlzOLG1W4ub2KbV14y6v+gpH90jywxXp37DBQhUdP75EU/sPsEI8FpAo2YyRWcehb3ZZte3A==
X-Received: by 2002:a05:6808:1141:: with SMTP id u1mr135628oiu.123.1633972922358;
        Mon, 11 Oct 2021 10:22:02 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n12sm1596854otq.32.2021.10.11.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:22:01 -0700 (PDT)
Date:   Mon, 11 Oct 2021 10:23:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 4/7] remoteproc: create the REMOTEPROC_VIRTIO config
Message-ID: <YWRzFyS5WX6m5rNd@ripper>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
 <YWEOIHrp4Z8+MHaE@builder.lan>
 <c16ca06a-96da-ac04-5ae7-bbbdf4b48ee5@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c16ca06a-96da-ac04-5ae7-bbbdf4b48ee5@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 11 Oct 08:58 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/9/21 5:36 AM, Bjorn Andersson wrote:
> > On Fri 01 Oct 05:12 CDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Create the config to associate to the remoteproc virtio.
> >>
> >> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> >> is that it defines API that is used by the built-in remote proc core.
> >> Functions such are rproc_add_virtio_dev can be called during the
> >> Linux boot phase.
> >>
> > 
> > Please don't introduce new Kconfig options for everything. Consider that
> > the expectation should be that everyone runs the default defconfig on
> > their boards - and if someone actually needs this level of control, they
> > are welcome to present patches with numbers showing the benefit of the
> > savings.
> 
> My goal here was to decorrelate the remote virtio from the remote proc,
> so that platforms based on a non-virtio solution do not embed the code.
> By reading your commentary it jumps out at me that that's stupid.

I definitely don't think it's stupid. In a resource constraint
environment that want to use remoteproc but won't use virtio this makes
total sense.

But the added Kconfig creates complexity and people run into issues
because the default defconfig is incomplete, they got their defconfig
"wrong" or "make olddefconfig" misses the new config.

As such, I simply would like us to postpone the introduction of
configurability until there's someone that can show it's worth the
complexity.

> The REMOTEPROC_VIRTIO config is useless as the remoteproc_virtio must
> be kept built-in for legacy compatibility.
> 

Right, so we would have to make sure that in all "standard"
configurations REMOTEPROC_VIRTIO is included.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Bjorn
> > 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/Kconfig               | 11 +++++++++-
> >>  drivers/remoteproc/Makefile              |  2 +-
> >>  drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
> >>  3 files changed, 39 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index 9a6eedc3994a..f271552c0d84 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -6,7 +6,7 @@ config REMOTEPROC
> >>  	depends on HAS_DMA
> >>  	select CRC32
> >>  	select FW_LOADER
> >> -	select VIRTIO
> >> +	select REMOTEPROC_VIRTIO
> >>  	select WANT_DEV_COREDUMP
> >>  	help
> >>  	  Support for remote processors (such as DSP coprocessors). These
> >> @@ -14,6 +14,15 @@ config REMOTEPROC
> >>  
> >>  if REMOTEPROC
> >>  
> >> +config REMOTEPROC_VIRTIO
> >> +	bool "Remoteproc virtio device "
> >> +	select VIRTIO
> >> +	help
> >> +	  Say y here to have a virtio device support for the remoteproc
> >> +	  communication.
> >> +
> >> +	  It's safe to say N if you don't use the virtio for the IPC.
> >> +
> >>  config REMOTEPROC_CDEV
> >>  	bool "Remoteproc character device interface"
> >>  	help
> >> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >> index bb26c9e4ef9c..73d2384a76aa 100644
> >> --- a/drivers/remoteproc/Makefile
> >> +++ b/drivers/remoteproc/Makefile
> >> @@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
> >>  remoteproc-y				+= remoteproc_coredump.o
> >>  remoteproc-y				+= remoteproc_debugfs.o
> >>  remoteproc-y				+= remoteproc_sysfs.o
> >> -remoteproc-y				+= remoteproc_virtio.o
> >>  remoteproc-y				+= remoteproc_elf_loader.o
> >> +obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
> >>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> >>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
> >>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 152fe2e8668a..4ce012c353c0 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
> >>  			    const char **fw_name);
> >>  
> >>  /* from remoteproc_virtio.c */
> >> +#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
> >> +
> >>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
> >>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> >>  void rproc_vdev_release(struct kref *ref);
> >>  
> >> +#else
> >> +
> >> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return -ENXIO;
> >> +}
> >> +
> >> +static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return IRQ_NONE;
> >> +}
> >> +
> >> +static inline void rproc_vdev_release(struct kref *ref)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +}
> >> +
> >> +#endif
> >> +
> >>  /* from remoteproc_debugfs.c */
> >>  void rproc_remove_trace_file(struct dentry *tfile);
> >>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
> >> -- 
> >> 2.17.1
> >>
