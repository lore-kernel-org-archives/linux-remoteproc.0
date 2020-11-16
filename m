Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08F8C5519F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 15:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5688223C7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 15:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729850AbgKPPKq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 10:10:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:28830 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728836AbgKPPKp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 10:10:45 -0500
IronPort-SDR: 5xYl0LV9oTbYV3rQKqNRQcRROi3ZVbpEQTV3n0T1pFngAOxSv6mjVXiThdkSP6CXtJ1kWUKKgE
 AC7ZUWkAxFjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="157784719"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="157784719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 07:10:45 -0800
IronPort-SDR: ED5afoyjF15nhY7+mtzhXGy0sK1C+G0/RkWPFIbZMV/51b2OHC5eEKypb9a3RJaX4WBg8ZDr89
 e78MoRojIsDA==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="543633204"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.49.4])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 07:10:43 -0800
Date:   Mon, 16 Nov 2020 16:10:29 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201116151028.GA1519@ubuntu>
References: <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
 <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
 <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
 <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Mon, Nov 16, 2020 at 03:43:35PM +0100, Arnaud POULIQUEN wrote:
> Hi Guennadi, Mathieu,

[snip]

> I tried the find_module API, it's quite simple and seems to work well. just need
> to be protected by #ifdef MODULE
> 
> I also added a select RMPS_NS in the RPMSG_VIRTIO for compatibility with the legacy.
> 
> look to me that this patch is a simple fix that should work also for the vhost...
> that said, the question is can we use this API here?
> 
> I attached the patch at the end of the mail.

Thanks for the patch. Yes, this would guarantee, that the NS module is loaded. But 
does it also guarantee, that the NS probing completes faster than an NS announcement 
arrives? We have a race here:

rpmsg_ns_register_device() -----------------\
     |                                      |
virtio_device_ready()                       |
     |                                      |
remote sends NS announcement      rpmsg_register_device()
     |                                      |
     |                            rpmsg_ns_probe()
     |                                      |
     |                            rpmsg_create_ept()
rpmsg_ns_cb()

In practice we *should* be fine - maybe the whole probing (the right branch) happens 
synchronously on the same core as where rpmsg_ns_register_device() was called, or 
even if not, the probing runs locally and the NS announcement either talks to a 
remote core or a VM. So, it *should* be safe, but unless we can make guarantee, that 
the probing is synchronous, I wouldn't rely on this. So, without a completion this 
still seems incomplete to me.

Thanks
Guennadi

> >> Why can it not be called in rpmsg_ns_probe()? The only purpose of this completion 
> >> is to make sure that rpmsg_create_ept() for the NS endpoint has completed before 
> >> we begin communicating with the remote / host, e.g. by calling 
> >> virtio_device_ready() in case of the VirtIO backend, right?
> > 
> > How the module driver are probed during device registration is not cristal clear
> > for me here...
> > Your approach looks to me a good compromize, I definitively need to apply and
> > test you patch to well understood the associated scheduling...
> 
> I looked in code, trying to understand behavior on device registration.
> 
> my understanding is: if driver is already registered (basic built-in or module
> previously loaded) the driver is probed on device registration. No asynchronous
> probing through a work queue or other.
> 
> So it seems, (but i'm not enough expert to be 100% sure) that ensuring that the
> rmpsg_ns module is loaded (and so driver registered) before the device register
> is enough, no completion mechanism is needed here.
> 
> Regards,
> Arnaud
> 
> > 
> > Thanks,
> > Arnaud
> > 
> >>
> >> Thanks
> >> Guennadi
> >>
> >>> Thanks,
> >>> Arnaud
> >>>
> 
> [...]
> 
> From 2629298ef1b7eea7a3a7df245abba03914c09e6b Mon Sep 17 00:00:00 2001
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Date: Mon, 16 Nov 2020 15:07:14 +0100
> Subject: [PATCH] rpmsg: specify dependency between virtio rpmsg and virtio_ns
> 
> The rpmsg_ns service has to be registered before the first
> message reception. When used as module, this imply and
> dependency of the rpmsg virtio on the rpmsg_ns module.
> this patch solve the dependency issue.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/Kconfig            |  1 +
>  drivers/rpmsg/rpmsg_ns.c         |  2 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
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
> index 5bda7cb44618..f19f3cbd2526 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -104,5 +104,5 @@ module_exit(rpmsg_ns_exit);
> 
>  MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> -MODULE_ALIAS("rpmsg_ns");
> +MODULE_ALIAS("rpmsg:rpmsg_ns");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 338f16c6563d..f032e6c3f9a9 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1001,6 +1001,28 @@ static int __init rpmsg_init(void)
>  {
>  	int ret;
> 
> +#ifdef MODULE
> +	static const char name[] = "rpmsg_ns";
> +	struct module *ns;
> +
> +	/*
> +	 * Make sur that the rpmsg ns module is loaded in case of module.
> +	 * This ensures that the rpmsg_ns driver is probed immediately when the
> +	 * associated device is registered during the rpmsg virtio probe.
> +	 */
> +	mutex_lock(&module_mutex);
> +	ns = find_module(name);
> +	mutex_unlock(&module_mutex);
> +
> +	if (!ns) {
> +		ret = request_module(name);
> +		if (ret) {
> +			pr_err("can not find %s module (err %d)\n", name, ret);
> +			return ret;
> +		}
> +	}
> +#endif
> +
>  	ret = register_virtio_driver(&virtio_ipc_driver);
>  	if (ret)
>  		pr_err("failed to register virtio driver: %d\n", ret);
> -- 
> 2.17.1
