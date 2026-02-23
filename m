Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B8376465;
	Mon, 23 Feb 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876542; cv=none; b=ZnAgvVnVNNlBkqViQLe+6ukJv9nHm59CbSVeNx6XjEKoBJkovm2LTSitGGozj2AVtgTdZwbpoSxlGNteMMVQBEIfkXIZIre+RkU35N67vn7IJE6gNdS52b+HjodUxng9R1tkIOJMhRrE4Uzqkrf3h2snh+WE+FU13zctRlfX5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876542; c=relaxed/simple;
	bh=wELJ74cc6pt67tZm2J57ELEeuITvToCKXCacQ/3Bhkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ/DO0me6a05nNHhDfJTWp+ZL9UIUVNx3eRdJuCuIxigT3INjRrm2/pC+Zwi0omLNMrvBD3SthmXUq2e4AgoH7U5USOKJmf1tY5CIprNd1FwXLtdyESSSY6we1YrEG3vlJEziHbdKSYKDcMWJJW/ERQ76+qqQrRtJ0xbmFYrWuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVAEx8KT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVAEx8KT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C52C116C6;
	Mon, 23 Feb 2026 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876542;
	bh=wELJ74cc6pt67tZm2J57ELEeuITvToCKXCacQ/3Bhkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVAEx8KTVA5NL3SlpXyfk3ZW49kbb1Om0nbeYDuDmu0mXpq+/pgYaRR4luYzwnNqq
	 G39RdhGOw5o6+WJXiJLlYRE23Lo9HSLUhBXwvRyuau00yqDFEX9FDddjGwS6cYM3xs
	 JI9nn9Iux9Qdcx2R0hFOK426pNOGS5jG/zGpbxs9mmRuhUS57ZYH6Hpiy6z3UzT4Gw
	 2ToClUud8m4XWKGF3IQ//l5DFtDoWZ/rTvJgdM9lgP1bEbjYz0CCgiaSSWjFTrUJON
	 ajK+vj3FhgHH9EZ1hiIawMGz8q2X0cHG+AZPjrNjLT7jXFgSSsbkzmEG8UhcMn263o
	 jfVDm4u5PxX+A==
Date: Mon, 23 Feb 2026 13:55:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
Message-ID: <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223185006.1278518-3-tanmay.shah@amd.com>

On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
> Remote processor will report the crash reason via the resource table
> and notify the host via mailbox notification. The host checks this
> crash reason on every mailbox notification from the remote and report
> to the rproc core framework. Then the rproc core framework will start
> the recovery process.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>   - %s/kick/mailbox notification/
>   - %s/core framework/rproc core framework/
>   - fold simple function within zynqmp_r5_handle_rsc().
>   - remove spurious change
>   - reset crash state after reporting the crash
>   - document set and reset of ATTACH_ON_RECOVERY flag
>   - set recovery_disabled flag to false
>   - check condition rproc->crash_reason != NULL
> 
> Changes in v2:
>   - clear attach recovery boot flag during detach and stop ops
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index bd619a6c42aa..0d831330ea90 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>  	const uintptr_t rsc_tbl;
>  } __packed;
>  
> +enum fw_vendor_rsc {
> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,

Given that this is a vendor-specific resource, wouldn't it be nice to
find e.g. XLNX somewhere in the name? Same thing with the enum itself.

> +};
> +
>  /*
>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>   * compatibility with device-tree that does not have TCM information.
> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>  };
>  
> +/**
> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> + *
> + * @crash_state: if true, the rproc is notifying crash, time to recover
> + * @crash_reason: reason of crash
> + */
> +struct xlnx_rproc_crash_report {
> +	u32 crash_state;
> +	u32 crash_reason;
> +} __packed;
> +
>  /**
>   * struct zynqmp_r5_core - remoteproc core's internal data
>   *
> + * @crash_report: rproc crash state and reason
>   * @rsc_tbl_va: resource table virtual address
>   * @sram: Array of sram memories assigned to this core
>   * @num_sram: number of sram for this core
> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * @ipi: pointer to mailbox information
>   */
>  struct zynqmp_r5_core {
> +	struct xlnx_rproc_crash_report *crash_report;
>  	void __iomem *rsc_tbl_va;
>  	struct zynqmp_sram_bank *sram;
>  	int num_sram;
> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  {
>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +	struct zynqmp_r5_core *r5_core;
> +	struct rproc *rproc;
>  	struct mbox_info *ipi;
>  	size_t len;
>  
>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	r5_core = ipi->r5_core;
> +	rproc = r5_core->rproc;
>  
>  	/* copy data from ipi buffer to r5_core */
>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  	buf_msg->len = len;
>  	memcpy(buf_msg->data, ipi_msg->data, len);
>  
> +	/* Check for crash only if rproc crash is expected */
> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {

Nit. I'd prefer the order of these to be swapped...

Compare:

"Check if we have crashed, and if so check that we're in a state where
that makes sense."

vs the way you're ordering this:

"Check if we're in a state, and if in that state we have crashed"


The "have we crashed" question is the most-significant-bit of this
chunk, making that the outermost conditional makes it faster for the
next reader to orient themselves in the code.

> +			rproc_report_crash(rproc,
> +					   r5_core->crash_report->crash_reason);

Are these two value spaces synchronized? crash_reason seems to be a
generic 32-bit number without particular definition, and you pass it
into a enum rproc_crash_type.

I presume the outcome is that you get the string
"crash detected in <name>: type: unknown" in your log for most cases?


In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
For the watchdog bite there isn't much information, but for the fatal
error we have a error string which we print, then we call
rproc_report_crash(FATAL) which results in another "useless" print.

Perhaps we could expand rproc_report_crash() to allow drivers to provide
some information about the crash beyond the enum.

Something like:
	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);

Would that be useful to you? Would it be valuable to turn your
"crash_reason" into a human readable string?

> +			r5_core->crash_report->crash_state = 0;
> +			r5_core->crash_report->crash_reason = 0;
> +		}
> +	}
> +
>  	/* received and processed interrupt ack */
>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	if (ret)
>  		dev_err(r5_core->dev, "core force power down failed\n");
>  
> +	/*
> +	 * Clear attach on recovery flag during stop operation. The next state
> +	 * of the remote processor is expected to be "Running" state. In this
> +	 * state boot recovery method must take place over attach on recovery.
> +	 */
> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> +
>  	return ret;
>  }
>  
> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  
>  static int zynqmp_r5_attach(struct rproc *rproc)
>  {
> +	/* Enable attach on recovery method. Clear it during rproc stop. */
> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> +
>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>  
>  	return 0;
> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	 */
>  	zynqmp_r5_rproc_kick(rproc, 0);
>  
> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> +
>  	return 0;
>  }
>  
> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> +				int offset, int avail)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> +
> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);

I don't think you need the cast.

Regards,
Bjorn

> +	else
> +		return RSC_IGNORED;
> +
> +	return RSC_HANDLED;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>  	.attach		= zynqmp_r5_attach,
>  	.detach		= zynqmp_r5_detach,
> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>  };
>  
>  /**
> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  
>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>  
> -	r5_rproc->recovery_disabled = true;
> +	r5_rproc->recovery_disabled = false;
>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
>  	r5_core = r5_rproc->priv;
> -- 
> 2.34.1
> 
