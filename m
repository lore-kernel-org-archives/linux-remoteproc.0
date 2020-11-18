Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7AAC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 00:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3334C221FB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 00:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYKoNr7a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgKRAGu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 19:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgKRAGu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 19:06:50 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E479C0617A6
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2020 16:06:50 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id h12so91687pjv.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2020 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LbHoYkDshsZNDnVClBGFOLqaI4R4jBMVshvMjXXS/SE=;
        b=sYKoNr7a0tDbSEHIPgnmUJvh5wuPFq7BuhpbIsvk5MbdedI1K4AY1d5kJ0F0UzHH2u
         VoL7b0W+czcz8FNRWscvjogwdoa1xogZLEVWEW69P3QBHk7WrBM6zJ/oiT4PxA00rIxM
         R3Tre+W3SY8EFuaBEhrCiUXMtoSPk78bxz8BtTLOlNicEEhMYKbfs2Fbq9tq9Tg+ovOd
         6NOporZbyLb99nkfRHlQYgQf/DzxcP9olswA868ClDX1GuXHm026eNKl6J6TWLMU63ci
         42tPX9GNXr9a3ZxlcLFrCaIt6hibXFj5zsdMKzxOuwp+/rOB7oRkA8F/kK1A8YWoJZn3
         hfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LbHoYkDshsZNDnVClBGFOLqaI4R4jBMVshvMjXXS/SE=;
        b=h1TIWBVLkMAO0bBl75Yu4p2j7V4uS/ndLA7RqNc7vfDggJhFLEYwKtubtvEZsGFh/j
         pnO+2uAoCoTH2nf0gMAaccMf4PAWuPYmbR3GcJvmM5DoVK3C38+6TeACv/F+wiF0RA3q
         v6Fch0rea/gX9HkkuJE3+9R58z5zaNw9ABlcgk36Vq/hQdqp9QGInMSPfcX1e+1OVLph
         S9bDdNZ4wMbQGfnG7fm+tm9srdGY+ARpznbEM1Oq2JUqlEJ49s0zaNoKFRdGmzkaxouF
         wQhWgFQga/FRx1QmM3KD0K3+vpJNVV9F4Ztc0WwFeETI0NNrY/kQt1jjr+autZ6I2IyP
         SAuw==
X-Gm-Message-State: AOAM53076hVZtX38fpL9JlniFYooWIHxPtQQskyprSq3fpNpQujavgiG
        FlNVC1SAGFPVUvDWcODMzh35FQ==
X-Google-Smtp-Source: ABdhPJwGg8xThv48+1ANtylzltaxVEheW1K+481DJrc8Aj6pOPtjN7C7oCLqNDFUIGIriYtGavz8LA==
X-Received: by 2002:a17:90a:c0f:: with SMTP id 15mr1457749pjs.148.1605658009680;
        Tue, 17 Nov 2020 16:06:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l1sm1519511pgg.4.2020.11.17.16.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 16:06:48 -0800 (PST)
Date:   Tue, 17 Nov 2020 17:06:47 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201118000647.GA4113759@xps15>
References: <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
 <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
 <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
 <50549519-d9ff-9048-a3d8-dab02bfda096@st.com>
 <20201117160330.GA15538@ubuntu>
 <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 17, 2020 at 05:44:05PM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 11/17/20 5:03 PM, Guennadi Liakhovetski wrote:
> > On Tue, Nov 17, 2020 at 12:42:30PM +0100, Arnaud POULIQUEN wrote:
> > 
> > [snip]
> > 
> >> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> >> index 5bda7cb44618..80c2cc23bada 100644
> >> --- a/drivers/rpmsg/rpmsg_ns.c
> >> +++ b/drivers/rpmsg/rpmsg_ns.c
> >> @@ -55,6 +55,39 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void
> >> *data, int len,
> >>  	return 0;
> >>  }
> >>
> >> +/**
> >> + * rpmsg_ns_register_device() - register name service device based on rpdev
> >> + * @rpdev: prepared rpdev to be used for creating endpoints
> >> + *
> >> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> >> + * basis for the rpmsg name service device.
> >> + */
> >> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> >> +{
> >> +#ifdef MODULES
> >> +	int ret;
> >> +	struct module *rpmsg_ns;
> >> +
> >> +	mutex_lock(&module_mutex);
> >> +	rpmsg_ns = find_module(KBUILD_MODNAME);
> >> +	mutex_unlock(&module_mutex);
> >> +
> >> +	if (!rpmsg_ns) {
> >> +		ret = request_module(KBUILD_MODNAME);
> > 
> > Is this code requesting the module in which it is located?.. I must be missing 
> > something...
> 
> Right this is stupid...Thanks to highlight this!
> 
> That being said, your remark is very interesting: we need to load the module to
> access to this function. This means that calling this function ensures that the
> module is loaded. In this case no need to add the piece of code to find
> module... here is the call stack associated (associated patch is available below):
> 
> 
> (rpmsg_ns_probe+0x5c/0xe0 [rpmsg_ns])
> [   11.858748] [<bf00a0a0>] (rpmsg_ns_probe [rpmsg_ns]) from [<bf0005cc>]
> (rpmsg_dev_probe+0x14c/0x1b0 [rpmsg_core])
> [   11.869047] [<bf0005cc>] (rpmsg_dev_probe [rpmsg_core]) from [<c067cd44>]
> (really_probe+0x208/0x4f0)
> [   11.878117] [<c067cd44>] (really_probe) from [<c067d1f4>]
> (driver_probe_device+0x78/0x16c)
> [   11.886404] [<c067d1f4>] (driver_probe_device) from [<c067ad48>]
> (bus_for_each_drv+0x84/0xd0)
> [   11.894887] [<c067ad48>] (bus_for_each_drv) from [<c067ca9c>]
> (__device_attach+0xf0/0x188)
> [   11.903142] [<c067ca9c>] (__device_attach) from [<c067bb10>]
> (bus_probe_device+0x84/0x8c)
> [   11.911314] [<c067bb10>] (bus_probe_device) from [<c0678094>]
> (device_add+0x3b0/0x7b0)
> [   11.919227] [<c0678094>] (device_add) from [<bf0003dc>]
> (rpmsg_register_device+0x54/0x88 [rpmsg_core])
> [   11.928541] [<bf0003dc>] (rpmsg_register_device [rpmsg_core]) from
> [<bf011b58>] (rpmsg_probe+0x298/0x3c8 [virtio_rpmsg_bus])
> [   11.939748] [<bf011b58>] (rpmsg_probe [virtio_rpmsg_bus]) from [<c05cd648>]
> (virtio_dev_probe+0x1f4/0x2c4)
> [   11.949377] [<c05cd648>] (virtio_dev_probe) from [<c067cd44>]
> (really_probe+0x208/0x4f0)
> [   11.957454] [<c067cd44>] (really_probe) from [<c067d1f4>]
> (driver_probe_device+0x78/0x16c)
> [   11.965710] [<c067d1f4>] (driver_probe_device) from [<c067d548>]
> (device_driver_attach+0x58/0x60)
> [   11.974574] [<c067d548>] (device_driver_attach) from [<c067d604>]
> (__driver_attach+0xb4/0x154)
> [   11.983177] [<c067d604>] (__driver_attach) from [<c067ac68>]
> (bus_for_each_dev+0x78/0xc0)
> [   11.991344] [<c067ac68>] (bus_for_each_dev) from [<c067bdc0>]
> (bus_add_driver+0x170/0x20c)
> [   11.999600] [<c067bdc0>] (bus_add_driver) from [<c067e12c>]
> (driver_register+0x74/0x108)
> [   12.007693] [<c067e12c>] (driver_register) from [<bf017010>]
> (rpmsg_init+0x10/0x1000 [virtio_rpmsg_bus])
> [   12.017168] [<bf017010>] (rpmsg_init [virtio_rpmsg_bus]) from [<c0102090>]
> (do_one_initcall+0x58/0x2bc)
> [
> 
> This would make the patch very simple. I tested following patch on my platform,
> applying it, i do not reproduce the initial issue.
> 
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index c3fc75e6514b..1394114782d2 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -71,5 +71,6 @@ config RPMSG_VIRTIO
>  	depends on HAS_DMA
>  	select RPMSG
>  	select VIRTIO
> +	select RPMSG_NS
> 
>  endmenu
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index 5bda7cb44618..5867281188de 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -55,6 +55,24 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void
> *data, int len,
>  	return 0;
>  }
> 
> +/**
> + * rpmsg_ns_register_device() - register name service device based on rpdev
> + * @rpdev: prepared rpdev to be used for creating endpoints
> + *
> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> + * basis for the rpmsg name service device.
> + */
> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> +{
> +	strcpy(rpdev->id.name, KBUILD_MODNAME);
> +	rpdev->driver_override = KBUILD_MODNAME;
> +	rpdev->src = RPMSG_NS_ADDR;
> +	rpdev->dst = RPMSG_NS_ADDR;
> +
> +	return rpmsg_register_device(rpdev);
> +}
> +EXPORT_SYMBOL(rpmsg_ns_register_device);
> +
>  static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>  {
>  	struct rpmsg_endpoint *ns_ept;
> @@ -80,7 +98,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>  }
> 
>  static struct rpmsg_driver rpmsg_ns_driver = {
> -	.drv.name = "rpmsg_ns",
> +	.drv.name = KBUILD_MODNAME,
>  	.probe = rpmsg_ns_probe,
>  };
> 
> @@ -104,5 +122,5 @@ module_exit(rpmsg_ns_exit);
> 
>  MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> -MODULE_ALIAS("rpmsg_ns");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
> index bdc1ea278814..68eac2b42075 100644
> --- a/include/linux/rpmsg/ns.h
> +++ b/include/linux/rpmsg/ns.h
> @@ -41,21 +41,6 @@ enum rpmsg_ns_flags {
>  /* Address 53 is reserved for advertising remote services */
>  #define RPMSG_NS_ADDR			(53)
> 
> -/**
> - * rpmsg_ns_register_device() - register name service device based on rpdev
> - * @rpdev: prepared rpdev to be used for creating endpoints
> - *
> - * This function wraps rpmsg_register_device() preparing the rpdev for use as
> - * basis for the rpmsg name service device.
> - */
> -static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> -{
> -	strcpy(rpdev->id.name, "rpmsg_ns");
> -	rpdev->driver_override = "rpmsg_ns";
> -	rpdev->src = RPMSG_NS_ADDR;
> -	rpdev->dst = RPMSG_NS_ADDR;
> -
> -	return rpmsg_register_device(rpdev);
> -}
> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev);

I confirm that all this is working as expected - I will send a new revision of
this set tomorrow afternoon.  

Guennadi, can I add a Co-developed-by and Signed-off-by with your name on the
patch?

> 
>  #endif
> 
> Thanks,
> Arnaud
> 
> > 
> > Thanks
> > Guennadi
> > 
