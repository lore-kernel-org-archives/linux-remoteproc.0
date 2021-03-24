Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C21C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Mar 2021 16:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6FF561A14
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Mar 2021 16:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbhCXQrE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Mar 2021 12:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237143AbhCXQqU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Mar 2021 12:46:20 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757C8C0617AA
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Mar 2021 09:46:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v10so797713pgs.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Mar 2021 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SNuu8ZzGzMF7xtrSNxC7YMAORADCFBN/fBfCqCTiBqM=;
        b=zpv+dNB2O+cONDLjCXuVooRA+NyBJx3kH7UwFIL/qT6pI0dZhVN2xNIh5l8LSntj10
         Jw0exnpo/0fkVG2m6ZbMoXZZZMi8/Oq7/6/0rMhNugPqze9/rLyxTEA6fkMOrCeVNzL8
         UFHjkW1R9kgIiFvgZk/XYcSBF7IMF1g03ROJoGSYM4+RjU0R54ESQTCI4lEGs/S4EbLz
         WATDkIKgmR2uMrNk2L+7Y1z+blMEXGvHgzOlGDsK/UI4R6PnFp3BSCHGoWVgMXyemrft
         4lLBWFhTdFBJ6RdD0lntxFXc60BcQuScxsF1vwxz4mnApuqThD4nIV97Ae5AqIF6Y9ns
         GxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SNuu8ZzGzMF7xtrSNxC7YMAORADCFBN/fBfCqCTiBqM=;
        b=IhkTFxkJB7TzhRqnFVtnEOgKi2q9dfPU/AZ5bedGo0+fXNHbGwfl8llJNRb3GO4PDE
         7yG3r3WA713Dl5Y7lePGw0NkCocHV+8rmv6CDj6EGAjmppLAmLyNvYcyUbEjlvtBy2jt
         fCfu14E2SA2lHuNSP3GTK56SO2+cNqKhtBpNKXJfVYXMzKw1cVRRI0ywzLASOG12somi
         c2/7zE6clvM9nAhGv6CCfyWAQhAYvalkhRqMRbOyQHa14kPkgCquWuuGX8RTABlaebXd
         MNVE3BbwS0wGpzmoupCwPdTXfsYB8HA5wzUW49UXj6uUSU8Y5M9bPCrLD3GrYAYtyG3/
         Fmgg==
X-Gm-Message-State: AOAM530AoZNKE17cs7ExC9IgiZNGDr2gXZrfko/HozBmGbcLHlYeS0pv
        48IEd1IPUfN/eNxq8/i9h/YIzA==
X-Google-Smtp-Source: ABdhPJwc19AEHcSKOMWNfda/yZeJ3Rnx8L44uiUVka78fHS1PNm46RwljYR7pdup5Vh/yJSVchgGeg==
X-Received: by 2002:a63:3e06:: with SMTP id l6mr3746572pga.140.1616604375663;
        Wed, 24 Mar 2021 09:46:15 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u2sm2962698pfn.79.2021.03.24.09.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:46:14 -0700 (PDT)
Date:   Wed, 24 Mar 2021 10:46:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: k3-r5: Extend support to R5F clusters on
 AM64x SoCs
Message-ID: <20210324164612.GA1806983@xps15>
References: <20210318215842.8196-1-s-anna@ti.com>
 <20210318215842.8196-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318215842.8196-3-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Suman,

On Thu, Mar 18, 2021 at 04:58:42PM -0500, Suman Anna wrote:
> The K3 AM64x SoC family has a revised R5F sub-system and contains a
> subset of the R5F clusters present on J721E SoCs. The K3 AM64x SoCs
> only have two dual-core Arm R5F clusters/subsystems with 2 R5F cores
> each present within the MAIN voltage domain (MAIN_R5FSS0 & MAIN_R5FSS1).
> 
> The revised IP has the following distinct features:
>  1. The R5FSS IP supports a new "Single-CPU" mode instead of the LockStep
>     mode on existing SoCs (AM65x, J721E or J7200). This mode is similar
>     to LockStep-mode on J7200 SoCs in terms of TCM usage without the
>     fault-tolerant safety feature provided by the LockStep mode.
> 
>     The Core1 TCMs are combined with the Core0 TCMs effectively doubling
>     the amount of TCMs available in Single-CPU mode. The LockStep-mode
>     on previous AM65x and J721E SoCs could only use the Core0 TCMs. These
>     combined TCMs appear contiguous at the respective Core0 TCM addresses.
>     The code though is executed only on a single CPU (on Core0), and as
>     such, requires the halt signal to be programmed only for Core0, while
>     the resets need to be managed for both the cores.
> 
>  2. TCMs are auto-initialized during module power-up, and the behavior
>     is programmable through a MMR bit. This feature is the same as on
>     the recent J7200 SoCs.
> 
> Extend the support to these clusters in the K3 R5F remoteproc driver
> using AM64x specific compatibles. New TI-SCI flags and a unique cluster
> mode are also needed for the cluster mode detection on these SoCs. The
> reset assert and deassert sequence of both the cores in Single-CPU mode
> is agnostic of the order, so the same LockStep reset and release sequences
> are re-used.
> 
> The integration of these clusters is very much similar to existing SoCs
> otherwise.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 155 ++++++++++++++++++-----
>  1 file changed, 126 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 5cf8d030a1f0..497f0d05b887 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -40,6 +40,8 @@
>  #define PROC_BOOT_CFG_FLAG_R5_ATCM_EN			0x00002000
>  /* Available from J7200 SoCs onwards */
>  #define PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS		0x00004000
> +/* Applicable to only AM64x SoCs */
> +#define PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE		0x00008000
>  
>  /* R5 TI-SCI Processor Control Flags */
>  #define PROC_BOOT_CTRL_FLAG_R5_CORE_HALT		0x00000001
> @@ -49,6 +51,8 @@
>  #define PROC_BOOT_STATUS_FLAG_R5_WFI			0x00000002
>  #define PROC_BOOT_STATUS_FLAG_R5_CLK_GATED		0x00000004
>  #define PROC_BOOT_STATUS_FLAG_R5_LOCKSTEP_PERMITTED	0x00000100
> +/* Applicable to only AM64x SoCs */
> +#define PROC_BOOT_STATUS_FLAG_R5_SINGLECORE_ONLY	0x00000200
>  
>  /**
>   * struct k3_r5_mem - internal memory structure
> @@ -64,19 +68,29 @@ struct k3_r5_mem {
>  	size_t size;
>  };
>  
> +/*
> + * All cluster mode values are not applicable on all SoCs. The following
> + * are the modes supported on various SoCs:
> + *   Split mode      : AM65x, J721E, J7200 and AM64x SoCs
> + *   LockStep mode   : AM65x, J721E and J7200 SoCs
> + *   Single-CPU mode : AM64x SoCs only
> + */
>  enum cluster_mode {
>  	CLUSTER_MODE_SPLIT = 0,
>  	CLUSTER_MODE_LOCKSTEP,
> +	CLUSTER_MODE_SINGLECPU,
>  };
>  
>  /**
>   * struct k3_r5_soc_data - match data to handle SoC variations
>   * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
>   * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
> + * @single_cpu_mode: flag to denote if SoC/IP supports Single-CPU mode
>   */
>  struct k3_r5_soc_data {
>  	bool tcm_is_double;
>  	bool tcm_ecc_autoinit;
> +	bool single_cpu_mode;
>  };
>  
>  /**
> @@ -369,6 +383,13 @@ static inline int k3_r5_core_run(struct k3_r5_core *core)
>   * applicable cores to allow loading into the TCMs. The .prepare() ops is
>   * invoked by remoteproc core before any firmware loading, and is followed
>   * by the .start() ops after loading to actually let the R5 cores run.
> + *
> + * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to
> + * execute code, but combines the TCMs from both cores. The resets for both
> + * cores need to be released to make this possible, as the TCMs are in general
> + * private to each core. Only Core0 needs to be unhalted for running the
> + * cluster in this mode. The function uses the same reset logic as LockStep
> + * mode for this (though the behavior is agnostic of the reset release order).
>   */
>  static int k3_r5_rproc_prepare(struct rproc *rproc)
>  {
> @@ -386,7 +407,9 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>  		return ret;
>  	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
>  
> -	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ?
> +	/* Re-use LockStep-mode reset logic for Single-CPU mode */
> +	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
>  		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
>  	if (ret) {
>  		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
> @@ -427,6 +450,12 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   * cores. The cores themselves are only halted in the .stop() ops, and the
>   * .unprepare() ops is invoked by the remoteproc core after the remoteproc is
>   * stopped.
> + *
> + * The Single-CPU mode on applicable SoCs (eg: AM64x) combines the TCMs from
> + * both cores. The access is made possible only with releasing the resets for
> + * both cores, but with only Core0 unhalted. This function re-uses the same
> + * reset assert logic as LockStep mode for this mode (though the behavior is
> + * agnostic of the reset assert order).
>   */
>  static int k3_r5_rproc_unprepare(struct rproc *rproc)
>  {
> @@ -436,7 +465,9 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>  	struct device *dev = kproc->dev;
>  	int ret;
>  
> -	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ?
> +	/* Re-use LockStep-mode reset logic for Single-CPU mode */
> +	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
>  		k3_r5_lockstep_reset(cluster) : k3_r5_split_reset(core);
>  	if (ret)
>  		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
> @@ -455,6 +486,10 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   * first followed by Core0. The Split-mode requires that Core0 to be maintained
>   * always in a higher power state that Core1 (implying Core1 needs to be started
>   * always only after Core0 is started).
> + *
> + * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to execute
> + * code, so only Core0 needs to be unhalted. The function uses the same logic
> + * flow as Split-mode for this.
>   */
>  static int k3_r5_rproc_start(struct rproc *rproc)
>  {
> @@ -539,6 +574,10 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   * Core0 to be maintained always in a higher power state that Core1 (implying
>   * Core1 needs to be stopped first before Core0).
>   *
> + * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to execute
> + * code, so only Core0 needs to be halted. The function uses the same logic
> + * flow as Split-mode for this.
> + *
>   * Note that the R5F halt operation in general is not effective when the R5F
>   * core is running, but is needed to make sure the core won't run after
>   * deasserting the reset the subsequent time. The asserting of reset can
> @@ -665,7 +704,9 @@ static const struct rproc_ops k3_r5_rproc_ops = {
>   *
>   * Each R5FSS has a cluster-level setting for configuring the processor
>   * subsystem either in a safety/fault-tolerant LockStep mode or a performance
> - * oriented Split mode. Each R5F core has a number of settings to either
> + * oriented Split mode on most SoCs. A fewer SoCs support a non-safety mode
> + * as an alternate for LockStep mode that exercises only a single R5F core
> + * called Single-CPU mode. Each R5F core has a number of settings to either
>   * enable/disable each of the TCMs, control which TCM appears at the R5F core's
>   * address 0x0. These settings need to be configured before the resets for the
>   * corresponding core are released. These settings are all protected and managed
> @@ -677,11 +718,13 @@ static const struct rproc_ops k3_r5_rproc_ops = {
>   * the cores are halted before the .prepare() step.
>   *
>   * The function is called from k3_r5_cluster_rproc_init() and is invoked either
> - * once (in LockStep mode) or twice (in Split mode). Support for LockStep-mode
> - * is dictated by an eFUSE register bit, and the config settings retrieved from
> - * DT are adjusted accordingly as per the permitted cluster mode. All cluster
> - * level settings like Cluster mode and TEINIT (exception handling state
> - * dictating ARM or Thumb mode) can only be set and retrieved using Core0.
> + * once (in LockStep mode or Single-CPU modes) or twice (in Split mode). Support
> + * for LockStep-mode is dictated by an eFUSE register bit, and the config
> + * settings retrieved from DT are adjusted accordingly as per the permitted
> + * cluster mode. Another eFUSE register bit dictates if the R5F cluster only
> + * supports a Single-CPU mode. All cluster level settings like Cluster mode and
> + * TEINIT (exception handling state dictating ARM or Thumb mode) can only be set
> + * and retrieved using Core0.
>   *
>   * The function behavior is different based on the cluster mode. The R5F cores
>   * are configured independently as per their individual settings in Split mode.
> @@ -700,10 +743,16 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
>  	u32 set_cfg = 0, clr_cfg = 0;
>  	u64 boot_vec = 0;
>  	bool lockstep_en;
> +	bool single_cpu;
>  	int ret;
>  
>  	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
> -	core = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ? core0 : kproc->core;
> +	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +	    cluster->mode == CLUSTER_MODE_SINGLECPU) {
> +		core = core0;
> +	} else {
> +		core = kproc->core;
> +	}
>  
>  	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
>  				     &stat);
> @@ -713,23 +762,48 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
>  	dev_dbg(dev, "boot_vector = 0x%llx, cfg = 0x%x ctrl = 0x%x stat = 0x%x\n",
>  		boot_vec, cfg, ctrl, stat);
>  
> +	/* check if only Single-CPU mode is supported on applicable SoCs */
> +	if (cluster->soc_data->single_cpu_mode) {
> +		single_cpu =
> +			!!(stat & PROC_BOOT_STATUS_FLAG_R5_SINGLECORE_ONLY);
> +		if (single_cpu && cluster->mode == CLUSTER_MODE_SPLIT) {
> +			dev_err(cluster->dev, "split-mode not permitted, force configuring for single-cpu mode\n");
> +			cluster->mode = CLUSTER_MODE_SINGLECPU;
> +		}
> +		goto config;
> +	}
> +
> +	/* check conventional LockStep vs Split mode configuration */
>  	lockstep_en = !!(stat & PROC_BOOT_STATUS_FLAG_R5_LOCKSTEP_PERMITTED);
>  	if (!lockstep_en && cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>  		dev_err(cluster->dev, "lockstep mode not permitted, force configuring for split-mode\n");
>  		cluster->mode = CLUSTER_MODE_SPLIT;
>  	}
>  
> +config:
>  	/* always enable ARM mode and set boot vector to 0 */
>  	boot_vec = 0x0;
>  	if (core == core0) {
>  		clr_cfg = PROC_BOOT_CFG_FLAG_R5_TEINIT;
> -		/*
> -		 * LockStep configuration bit is Read-only on Split-mode _only_
> -		 * devices and system firmware will NACK any requests with the
> -		 * bit configured, so program it only on permitted devices
> -		 */
> -		if (lockstep_en)
> -			clr_cfg |= PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
> +		if (cluster->soc_data->single_cpu_mode) {
> +			/*
> +			 * Single-CPU configuration bit can only be configured
> +			 * on Core0 and system firmware will NACK any requests
> +			 * with the bit configured, so program it only on
> +			 * permitted cores
> +			 */
> +			if (cluster->mode == CLUSTER_MODE_SINGLECPU)
> +				set_cfg = PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE;
> +		} else {
> +			/*
> +			 * LockStep configuration bit is Read-only on Split-mode
> +			 * _only_ devices and system firmware will NACK any
> +			 * requests with the bit configured, so program it only
> +			 * on permitted devices
> +			 */
> +			if (lockstep_en)
> +				clr_cfg |= PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
> +		}
>  	}
>  
>  	if (core->atcm_enable)
> @@ -894,12 +968,12 @@ static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
>   * cores are usable in Split-mode, but only the Core0 TCMs can be used in
>   * LockStep-mode. The newer revisions of the R5FSS IP maximizes these TCMs by
>   * leveraging the Core1 TCMs as well in certain modes where they would have
> - * otherwise been unusable (Eg: LockStep-mode on J7200 SoCs). This is done by
> - * making a Core1 TCM visible immediately after the corresponding Core0 TCM.
> - * The SoC memory map uses the larger 64 KB sizes for the Core0 TCMs, and the
> - * dts representation reflects this increased size on supported SoCs. The Core0
> - * TCM sizes therefore have to be adjusted to only half the original size in
> - * Split mode.
> + * otherwise been unusable (Eg: LockStep-mode on J7200 SoCs, Single-CPU mode on
> + * AM64x SoCs). This is done by making a Core1 TCM visible immediately after the
> + * corresponding Core0 TCM. The SoC memory map uses the larger 64 KB sizes for
> + * the Core0 TCMs, and the dts representation reflects this increased size on
> + * supported SoCs. The Core0 TCM sizes therefore have to be adjusted to only
> + * half the original size in Split mode.
>   */
>  static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
>  {
> @@ -909,6 +983,7 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
>  	struct k3_r5_core *core0;
>  
>  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +	    cluster->mode == CLUSTER_MODE_SINGLECPU ||
>  	    !cluster->soc_data->tcm_is_double)
>  		return;
>  
> @@ -987,8 +1062,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  			goto err_add;
>  		}
>  
> -		/* create only one rproc in lockstep mode */
> -		if (cluster->mode == CLUSTER_MODE_LOCKSTEP)
> +		/* create only one rproc in lockstep mode or single-cpu mode */
> +		if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +		    cluster->mode == CLUSTER_MODE_SINGLECPU)
>  			break;
>  	}
>  
> @@ -1020,11 +1096,12 @@ static void k3_r5_cluster_rproc_exit(void *data)
>  	struct rproc *rproc;
>  
>  	/*
> -	 * lockstep mode has only one rproc associated with first core, whereas
> -	 * split-mode has two rprocs associated with each core, and requires
> -	 * that core1 be powered down first
> +	 * lockstep mode and single-cpu modes have only one rproc associated
> +	 * with first core, whereas split-mode has two rprocs associated with
> +	 * each core, and requires that core1 be powered down first
>  	 */
> -	core = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ?
> +	core = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
> +		cluster->mode == CLUSTER_MODE_SINGLECPU) ?
>  		list_first_entry(&cluster->cores, struct k3_r5_core, elem) :
>  		list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>  
> @@ -1396,7 +1473,12 @@ static int k3_r5_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	cluster->dev = dev;
> -	cluster->mode = CLUSTER_MODE_LOCKSTEP;
> +	/*
> +	 * default to most common efuse configurations - Split-mode on AM64x
> +	 * and LockStep-mode on all others
> +	 */
> +	cluster->mode = data->single_cpu_mode ?
> +				CLUSTER_MODE_SPLIT : CLUSTER_MODE_LOCKSTEP;
>  	cluster->soc_data = data;
>  	INIT_LIST_HEAD(&cluster->cores);
>  
> @@ -1406,6 +1488,12 @@ static int k3_r5_probe(struct platform_device *pdev)
>  			ret);
>  		return ret;
>  	}
> +	/*
> +	 * Translate SoC-specific dts value of 1 or 2 into appropriate
> +	 * driver-specific mode. Valid values are dictated by YAML binding
> +	 */
> +	if (cluster->mode && data->single_cpu_mode)
> +		cluster->mode = CLUSTER_MODE_SINGLECPU;

Despite its small size this patch was hard to review, mostly because there is
two flags to keep track of the single cpu mode, that is k3_r5_cluster::mode and
k3_r5_soc_data::single_cpu_mode.

From what I understand it would be possible to get rid of the latter by using
of_device_is_compatible() in k3_r5_probe() to setup the default cluster mode.

Thanks,
Mathieu

>  
>  	num_cores = of_get_available_child_count(np);
>  	if (num_cores != 2) {
> @@ -1450,17 +1538,26 @@ static int k3_r5_probe(struct platform_device *pdev)
>  static const struct k3_r5_soc_data am65_j721e_soc_data = {
>  	.tcm_is_double = false,
>  	.tcm_ecc_autoinit = false,
> +	.single_cpu_mode = false,
>  };
>  
>  static const struct k3_r5_soc_data j7200_soc_data = {
>  	.tcm_is_double = true,
>  	.tcm_ecc_autoinit = true,
> +	.single_cpu_mode = false,
> +};
> +
> +static const struct k3_r5_soc_data am64_soc_data = {
> +	.tcm_is_double = true,
> +	.tcm_ecc_autoinit = true,
> +	.single_cpu_mode = true,
>  };
>  
>  static const struct of_device_id k3_r5_of_match[] = {
>  	{ .compatible = "ti,am654-r5fss", .data = &am65_j721e_soc_data, },
>  	{ .compatible = "ti,j721e-r5fss", .data = &am65_j721e_soc_data, },
>  	{ .compatible = "ti,j7200-r5fss", .data = &j7200_soc_data, },
> +	{ .compatible = "ti,am64-r5fss",  .data = &am64_soc_data, },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, k3_r5_of_match);
> -- 
> 2.30.1
> 
