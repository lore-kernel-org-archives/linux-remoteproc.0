Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2D3DBD4D
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312337; cv=none; b=jj/qyGreO7RVwg/sWMVfd/Jye38tc/ffkGTilKvXGNFzMv7rDMwRWIz2l+/eaGEUnxEcvmsvlbAl7/55rHEJIhiiGhPfcaqD0LsiV5JuDinwRS702aGu8+hzYs76++KUzKXU976TnQsLDqL0AOJkreXxSfu3rZnDDz552Z2Kzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312337; c=relaxed/simple;
	bh=YAXur/562b/UbMcLq5DBUXYkpoJBho4ufrLN2/+G/Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf8VGtaNSMGud72IVXQ9Ma+5x50kH5sGvsF/Sl/iUBsrEeYEJ5b2uAm36/b1bCHaY0BYOCk4/eF3jqRk0uBK7S0ntdzyZyfw1MMN+rQw2GKvnTT1TtqwoOXaFw/7vvXH57uvC7YAZp0mZKt9lEbdSlcZaCB8tcmritz5Hzehz1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHGMcan2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHGMcan2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso6571153b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777312336; x=1777917136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qxZGUpn4MvoHBLfisdbbKtNH3JEOoB45Qqjjg7y6hXk=;
        b=sHGMcan2MJJTU0d7no3D0ujBSy5rhkY39LFhoVPYNHnUveIfqmclPoM6yptCraQXG/
         C68BIojb98bgNa29xUam4c+1PGvGF8+giBQ86BewDTRA2G8Zp2brHhJz/Dv/xZIErk0z
         E+SLhhvoSY1x6J8W2+GR5V/WXKcjw0CsXSlSTHbMKt/g0kKIibeEd3cynhwpb9dt/q/J
         oH6H52ov3NA+jXYwHBphku/W7DwmKsdG57uzn9+L8QVr3bWmtLnnopQVy1H29W58q6fz
         rtJ5vcM5z5YUtpDMjvuBanvzJfx376CqH7fHB29jdJb7YuI82m3Px/5IbT2Sma6kpl/g
         Hmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312336; x=1777917136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxZGUpn4MvoHBLfisdbbKtNH3JEOoB45Qqjjg7y6hXk=;
        b=pnZRzv4/vSzvTgyiq3gwmpeMC2YLAzJ1VBqmiM3i8pnnOSHCrA+gF7xclJAIVZp0Of
         uC3oQ9KeYy33BsMS8PjJU3a3XpA3S2ITBeUT3SAs6bJ4kBWM04nckVWGEsWz7xfdpCLZ
         JQWB1Yl0pdAQjGij2wGkt6qu/YEC+yvVUb0k4qOsWrewfkJIUQmJdutOKAoEK3fKFBOP
         V2Z15Zl4UP+vzbXEzlGxPTnT7mavVC5Uz+fpcEiO6+oVBuINU/W3i9oDhpPYP7IWB5L1
         VW8gEzeTMhck11YXEcI+H7M6OJCvvtbNm5v5w4ceUWN4L3QxXHGBlL+sXFAbOiELNUkE
         Plug==
X-Forwarded-Encrypted: i=1; AFNElJ8prdVEVMBhdQ3/67fbrzKgP/VGB402fobe9V+Hgr14Bpi2G7KgQAElLUWed4/Nofk+qvV1zNbzOTac9KY9i4ca@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlwdJ1VzGHlJDNbPsSBXF5RKI+clz41LK6cOgDdO3U9f7F3mo
	y/YM9VCx9C50WV+EZtrPw0WuotxHOoGRJFn3e6BMyZ0VyEWYXOLPyXD/E6wnPrpw7qI=
X-Gm-Gg: AeBDiesMO2geJqSN+9GjJHElvRL00cIRUaZzF9wJuMK+sx8HcGDBp++iVmgPEkHtjK/
	qObe9HSqVIY2PTCdL7xYwC/gzdiHtKGpu4cjJ7DeU0HP0ET6zvLAGj3/nJ9Xqkbfk5jFqrkETg2
	lYHrvutVneFmJl3NUr5MCr14nug1UVMmHAWC1uP4mCi1CN9v+YBAa2si4s1RQ2M8RNRtPhUdkgJ
	g4Z7G7ua7ymm823EPxCUBLOXnKH7x1JqAdDkDx34/3wADuMk2Lfn+Ig2CIA9EAc+Leo+G7CYhvv
	mzjwm4tQlHz2nEYr4f1SIA6KklXTvsWgoDSdJ7rrku8kt3/4vKRgQT4wYF4tT5tfYUgJI7YR5jh
	RZVZG3B3bUkTSBmIA10piv6MgtyAwiou6b4mMSrzGGdfFSxWeOaaT3CsIM6n+ZXbnFFPPfQPG43
	K5VQkWOQXO+lVJAkBLQcLt8x2MRKHuT+IlnsPv
X-Received: by 2002:a05:6a00:a254:b0:82f:6c51:a246 with SMTP id d2e1a72fcca58-834daecf158mr106298b3a.2.1777312335449;
        Mon, 27 Apr 2026 10:52:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9a8:9d0b:56bb:d830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf79e5bsm65718b3a.56.2026.04.27.10.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:52:14 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:52:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, michal.simek@amd.com,
	andersson@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: check remote node state
Message-ID: <ae-iTAk0KvtPvMSB@p14s>
References: <20260425030231.3145225-1-tanmay.shah@amd.com>
 <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
 <5aabddce-eeee-43de-be30-115bc58040dc@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aabddce-eeee-43de-be30-115bc58040dc@amd.com>

Good morning

On Mon, Apr 27, 2026 at 11:15:29AM -0500, Shah, Tanmay wrote:
> Hello Beleswar,
> 
> Thanks for reviews. Please find my answer below:
> 
> On 4/24/2026 10:51 PM, Padhi, Beleswar wrote:
> > Hi Tanmay,
> > 
> > In $subject-line, s/remote node/remoteproc
> > 
> 
> Ack. 'node' is platform management firmware term, which might not be
> right here. subject line already contains remoteproc so no need to have
> it again. Instead, will replace 'node' with 'core'. new subject:
> 
> remoteproc: xlnx: check remote core state.
>

Much better.
 
> > On 4/25/2026 8:32 AM, Tanmay Shah wrote:
> >> The remote state is set to RPROC_DETACHED if the resource table is found
> >> in the memory. However, this can be wrong if the remote is not started,
> >> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> >> to the firmware to request the state of the RPU node. If the RPU is
> >> actually out of reset and running, only then move the remote state to
> >> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> > 
> > 
> > This is a good additional check. However, one thing to note is
> > remoteproc core
> > framework will load the firmware if the state is set to RPROC_OFFLINE. This
> > will override the existing firmware in the memory, I hope that is not
> > fatal for
> > your usecase?
> > 
> 
> That is expected. If remote core is 'offline' during driver probe then
> any firmware already in the memory becomes irrelevant and new firmware
> can be loaded.
> 
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>   drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++++++
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c | 37 ++++++++++++++++++-------
> >>   include/linux/firmware/xlnx-zynqmp.h    | 21 ++++++++++++++
> >>   3 files changed, 76 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
> >> xilinx/zynqmp.c
> >> index fbe8510f4927..af838b2dc327 100644
> >> --- a/drivers/firmware/xilinx/zynqmp.c
> >> +++ b/drivers/firmware/xilinx/zynqmp.c
> >> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node,
> >> u32 *const status,
> >>   }
> >>   EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
> >>   +/**
> >> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's
> >> current power state
> >> + * @node:        ID of the RPU component or sub-system in question
> >> + * @status:        Current operating state of the requested RPU node.
> >> + * @requirements:    Current requirements asserted on the RPU node.
> >> + * @usage:        Usage information, used for RPU slave nodes only:
> >> + *            PM_USAGE_NO_MASTER    - No master is currently using
> >> + *                          the node
> >> + *            PM_USAGE_CURRENT_MASTER    - Only requesting master is
> >> + *                          currently using the node
> >> + *            PM_USAGE_OTHER_MASTER    - Only other masters are
> >> + *                          currently using the node
> >> + *            PM_USAGE_BOTH_MASTERS    - Both the current and at least
> >> + *                          one other master is currently
> >> + *                          using the node
> >> + *
> >> + * Return:        Returns status, either success or error+reason
> >> + */
> >> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> >> +                  u32 *const requirements, u32 *const usage)
> >> +{
> >> +    if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> >> +        return -EOPNOTSUPP;
> >> +
> >> +    return zynqmp_pm_get_node_status(node, status, requirements, usage);
> >> +}
> >> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> >> +
> >>   /**
> >>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or
> >> subsystem to
> >>    *             be powered down forcefully
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/
> >> remoteproc/xlnx_r5_remoteproc.c
> >> index 50a9974f3202..e2f25d94177d 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core
> >> *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>           goto free_rproc;
> >>       }
> >>   -    /*
> >> -     * If firmware is already available in the memory then move rproc
> >> state
> >> -     * to DETACHED. Firmware can be preloaded via debugger or by any
> >> other
> >> -     * agent (processors) in the system.
> >> -     * If firmware isn't available in the memory and resource table
> >> isn't
> >> -     * found, then rproc state remains OFFLINE.
> >> -     */
> >> -    if (!zynqmp_r5_get_rsc_table_va(r5_core))
> >> -        r5_rproc->state = RPROC_DETACHED;
> >> -
> >>       r5_core->rproc = r5_rproc;
> >>       return r5_core;
> >>   @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct
> >> zynqmp_r5_cluster *cluster,
> >>   {
> >>       struct device *dev = cluster->dev;
> >>       struct zynqmp_r5_core *r5_core;
> >> +    u32 req, usage, status;
> >>       int ret = -EINVAL, i;
> >>         r5_core = cluster->r5_cores[0];
> >> @@ -1255,6 +1246,32 @@ static int zynqmp_r5_core_init(struct
> >> zynqmp_r5_cluster *cluster,
> >>           ret = zynqmp_r5_get_sram_banks(r5_core);
> >>           if (ret)
> >>               return ret;
> >> +
> >> +        /*
> >> +         * It is possible that firmware is loaded into the memory, but
> >> +         * RPU (remote) is not running. In such case, RPU state will be
> >> +         * moved to RPROC_DETACHED wrongfully. To avoid it first make
> >> +         * sure RPU is power-on and out of reset before parsing for the
> >> +         * resource table.
> >> +         */
> >> +        ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> >> +                            &status, &req, &usage);
> >> +        if (ret) {
> >> +            dev_warn(r5_core->dev,
> >> +                 "failed to get rpu node status, err %d\n", ret);
> >> +            continue;
> >> +        }
> >> +
> >> +        /*
> >> +         * If RPU state is power on and out of reset i.e. running, then
> >> +         * assign RPROC_DETACHED state. If the RPU is not out of reset
> >> +         * then do not attempt to attach to the remote processor.
> >> +         */
> >> +        if (status == PM_NODE_RUNNING) {
> >> +            if (zynqmp_r5_get_rsc_table_va(r5_core))
> >> +                dev_dbg(r5_core->dev, "rsc tbl not found\n");
> > 
> > 
> > Do you still want to set state = RPROC_DETACHED if resource table is not
> > found in the
> > memory?
> > 
> 
> Yes. Not all the firmware that is running on remote core is expected to
> have the resource table. The firmware might not use RPMsg at all, and in
> that case resource table becomes irrelevant. However, we still need to
> make sure that running core is not reported as offline.

Please add the above explanation to the inlined comment.  Otherwise I'm good
with this patch but I'll need an RB from Michael before moving forward.  

Do you see this as a bug fix?  Is there a point adding this patch to the stable
kernels?

>
> Thanks.
> 
> > Thanks,
> > Beleswar
> > 
> >> +            r5_core->rproc->state = RPROC_DETACHED;
> >> +        }
> >>       }
> >>         return 0;
> >> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/
> >> firmware/xlnx-zynqmp.h
> >> index d70dcd462b44..7e27b0f7bf7e 100644
> >> --- a/include/linux/firmware/xlnx-zynqmp.h
> >> +++ b/include/linux/firmware/xlnx-zynqmp.h
> >> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
> >>       GEM_CONFIG_FIXED = 2,
> >>   };
> >>   +/**
> >> + * enum pm_node_status - Device node status provided by xilpm fw
> >> + * @PM_NODE_UNUSED: Device is not used
> >> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> >> + * @PM_NODE_HALT: Device is power-on but in the reset state
> >> + */
> >> +enum pm_node_status {
> >> +    PM_NODE_UNUSED = 0,
> >> +    PM_NODE_RUNNING = 1,
> >> +    PM_NODE_HALT = 12,
> >> +};
> >> +
> >>   /**
> >>    * struct zynqmp_pm_query_data - PM query data
> >>    * @qid:    query ID
> >> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum
> >> rpu_oper_mode rpu_mode);
> >>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
> >>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> >>                     u32 *const requirements, u32 *const usage);
> >> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> >> +                  u32 *const requirements, u32 *const usage);
> >>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config,
> >> u32 value);
> >>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
> >>                    u32 value);
> >> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const
> >> u32 node, u32 *const status,
> >>       return -ENODEV;
> >>   }
> >>   +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32
> >> *const status,
> >> +                        u32 *const requirements,
> >> +                        u32 *const usage)
> >> +{
> >> +    return -ENODEV;
> >> +}
> >> +
> >>   static inline int zynqmp_pm_set_sd_config(u32 node,
> >>                         enum pm_sd_config_type config,
> >>                         u32 value)
> >>
> >> base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2
> 
