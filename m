Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D5D3815DE;
	Wed, 25 Feb 2026 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062205; cv=none; b=P4GuaB28L4w/Y39C2pO97zU1nC9ZPI8gan445VLBcAN5cUjVLDkb15SWwTc00tQ0HuWeonnyT6InPHBxBXPETxWhsLtXxmGi3deO2r64bb8LIY+lsDfPdfoev0zYvR1KkotAxkkcpCkKNEtibKM1QthKfypM2hXVOtCA0KratD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062205; c=relaxed/simple;
	bh=feTl4z7EoM084DOAu81qIzjnsc8/OWyi59XCj/KrDp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwYBqFb9RN9pKTAKn1SQYgOTxNeUJ2PttvaX1yX5X2HA/OHgOSkTeQWAXEDz0mX17mvB7tPa3RBmTfJW3tOpuHQFN/ckI+vZdJsOS3g/Qx//ylhVXfB/cHDraMRZsYBHcLG2I94MFN2H6LMW5fDNZwo2A/ZwX1VWcoiWPKVepM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOkrKoJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOkrKoJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF09C116D0;
	Wed, 25 Feb 2026 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772062205;
	bh=feTl4z7EoM084DOAu81qIzjnsc8/OWyi59XCj/KrDp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOkrKoJHewwaQUZDenps8+xsqMixIdL/OnjYBUfHcveOdihWq3GE+cAyhOnxt3Ora
	 e/7GHtth6nVcimC/TX1sEU1Amz+2NYMqFzUY5wTN7bngvcOKuUetfMy4aiIFd36kUL
	 UkgNW1Hk1rmgQbzJAjCiSAVo2h4l9XjnkrIrNeoRPXHhTmqcEDcer2wZxaIAooyDNC
	 ZLxsf/rDQMAt2SYvwJVUwwaJyxsahQyDiGvm33SOsuQ1zSsQ06wGB5fQoLJHVdUh7H
	 oJehgAr5LjMqkTTKRHdQiRZeuxQxK0oqBGoeovQzQ42VHI1VMwz07qIyapXPO/Dgyz
	 T8QnjzqML3zGQ==
Date: Wed, 25 Feb 2026 17:30:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: tanmay.shah@amd.com
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
Message-ID: <invfmjqikuyzpkfv7sw5lccj4kudoktzhk37t3rjfvuizpashl@ssjowsnczygz>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-3-tanmay.shah@amd.com>
 <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
 <3175bac0-1def-4f3c-bebb-31459855b1a9@amd.com>
 <f480e21a-6075-40c0-b420-56171f7d4e60@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f480e21a-6075-40c0-b420-56171f7d4e60@amd.com>

On Wed, Feb 25, 2026 at 11:22:05AM -0600, Shah, Tanmay wrote:
> 
> 
> On 2/23/2026 4:40 PM, Shah, Tanmay wrote:
> > 
> > 
> > On 2/23/2026 1:55 PM, Bjorn Andersson wrote:
> >> On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
> >>> Remote processor will report the crash reason via the resource table
> >>> and notify the host via mailbox notification. The host checks this
> >>> crash reason on every mailbox notification from the remote and report
> >>> to the rproc core framework. Then the rproc core framework will start
> >>> the recovery process.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>
> >>> Changes in v3:
> >>>   - %s/kick/mailbox notification/
> >>>   - %s/core framework/rproc core framework/
> >>>   - fold simple function within zynqmp_r5_handle_rsc().
> >>>   - remove spurious change
> >>>   - reset crash state after reporting the crash
> >>>   - document set and reset of ATTACH_ON_RECOVERY flag
> >>>   - set recovery_disabled flag to false
> >>>   - check condition rproc->crash_reason != NULL
> >>>
> >>> Changes in v2:
> >>>   - clear attach recovery boot flag during detach and stop ops
> >>>
> >>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
> >>>  1 file changed, 59 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> index bd619a6c42aa..0d831330ea90 100644
> >>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
> >>>  	const uintptr_t rsc_tbl;
> >>>  } __packed;
> >>>  
> >>> +enum fw_vendor_rsc {
> >>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
> >>
> >> Given that this is a vendor-specific resource, wouldn't it be nice to
> >> find e.g. XLNX somewhere in the name? Same thing with the enum itself.
> >>
> > 
> > Ack. I will change name for enum and resource both.
> > 
> >>> +};
> >>> +
> >>>  /*
> >>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
> >>>   * compatibility with device-tree that does not have TCM information.
> >>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> >>>  };
> >>>  
> >>> +/**
> >>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> >>> + *
> >>> + * @crash_state: if true, the rproc is notifying crash, time to recover
> >>> + * @crash_reason: reason of crash
> >>> + */
> >>> +struct xlnx_rproc_crash_report {
> >>> +	u32 crash_state;
> >>> +	u32 crash_reason;
> >>> +} __packed;
> >>> +
> >>>  /**
> >>>   * struct zynqmp_r5_core - remoteproc core's internal data
> >>>   *
> >>> + * @crash_report: rproc crash state and reason
> >>>   * @rsc_tbl_va: resource table virtual address
> >>>   * @sram: Array of sram memories assigned to this core
> >>>   * @num_sram: number of sram for this core
> >>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>>   * @ipi: pointer to mailbox information
> >>>   */
> >>>  struct zynqmp_r5_core {
> >>> +	struct xlnx_rproc_crash_report *crash_report;
> >>>  	void __iomem *rsc_tbl_va;
> >>>  	struct zynqmp_sram_bank *sram;
> >>>  	int num_sram;
> >>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
> >>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>>  {
> >>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> >>> +	struct zynqmp_r5_core *r5_core;
> >>> +	struct rproc *rproc;
> >>>  	struct mbox_info *ipi;
> >>>  	size_t len;
> >>>  
> >>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
> >>> +	r5_core = ipi->r5_core;
> >>> +	rproc = r5_core->rproc;
> >>>  
> >>>  	/* copy data from ipi buffer to r5_core */
> >>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
> >>> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>>  	buf_msg->len = len;
> >>>  	memcpy(buf_msg->data, ipi_msg->data, len);
> >>>  
> >>> +	/* Check for crash only if rproc crash is expected */
> >>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> >>> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
> >>
> >> Nit. I'd prefer the order of these to be swapped...
> >>
> >> Compare:
> >>
> >> "Check if we have crashed, and if so check that we're in a state where
> >> that makes sense."
> >>
> >> vs the way you're ordering this:
> >>
> >> "Check if we're in a state, and if in that state we have crashed"
> >>
> >>
> >> The "have we crashed" question is the most-significant-bit of this
> >> chunk, making that the outermost conditional makes it faster for the
> >> next reader to orient themselves in the code.
> > 
> > Ack, that makes sense.
> > 
> >>
> >>> +			rproc_report_crash(rproc,
> >>> +					   r5_core->crash_report->crash_reason);
> >>
> >> Are these two value spaces synchronized? crash_reason seems to be a
> >> generic 32-bit number without particular definition, and you pass it
> >> into a enum rproc_crash_type.
> >>
> > 
> > Yes, crash_reason is supposed to be enum rproc_crash_type.
> > 
> >> I presume the outcome is that you get the string
> >> "crash detected in <name>: type: unknown" in your log for most cases?
> >>
> > 
> > So far, we have only "WATCHDOG" and "FATAL ERROR" cases. I guess any
> > more reasons would have to go in the "unknown" case.
> > 
> >>
> >> In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
> >> For the watchdog bite there isn't much information, but for the fatal
> >> error we have a error string which we print, then we call
> >> rproc_report_crash(FATAL) which results in another "useless" print.
> >>
> >> Perhaps we could expand rproc_report_crash() to allow drivers to provide
> >> some information about the crash beyond the enum.
> >>
> >> Something like:
> >> 	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);
> >>
> >> Would that be useful to you? Would it be valuable to turn your
> >> "crash_reason" into a human readable string?
> >>
> > 
> > Yes, it is valuable to turn "crash_reason" to human readable string.
> > Should we leave that part to each driver and not have it in the common
> > framework?
> > 
> > If we are to refactor rproc_report_crash, then I think following is more
> > flexible:
> > 
> > rproc_report_crash(rproc, const char *crash_reason_str);
> > 
> > Then each platform driver can print crash reason however they see fit.
> > We can also avoid printing crash reason two times this way.
> > 
> 
> Hi Bjorn,
> 
> I take this back. I think crash_reason can be defined differently for
> each firmware project. I would like to provide that flexibility to the
> firmware developer. Hence, I prefer not to convert crash_reason integer
> to human readable string, as can be different for different fw projects.
> 

Then we certainly shouldn't pass it as the second argument of
rproc_report_crash().

> Instead, the xlnx platform driver will simply print the crash_reason
> integer as given by the firmware, and notify the crash to the core
> framework as following:
> 
> rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> This way, we don't have to modify the rproc_report_crash() API.
> I hope this makes sense.
> 

Yes, that makes sense.

I think I'd like to make the proposed modification regardless, but that
is then a completely separate change.

> I will wait for your response before sending the new version. Rest of
> the comments I will address as asked.
> 

Is your struct xlnx_rproc_crash_report already defined and in use by the
firmware? If not, I'd recommend that you spend a little bit extra time
thinking about the content of it. E.g. the human readable char [] found
in Qualcomm's crash reports is quite useful...

Regards,
Bjorn

> Thanks,
> Tanmay
> 
> > If we do this, then crash_reason can be defined for each driver
> > individually. That's more appropriate as each vendor can have different
> > enum for crash.
> > 
> > Let me know your thoughts.
> > 
> >>> +			r5_core->crash_report->crash_state = 0;
> >>> +			r5_core->crash_report->crash_reason = 0;
> >>> +		}
> >>> +	}
> >>> +
> >>>  	/* received and processed interrupt ack */
> >>>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
> >>>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
> >>> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>>  	if (ret)
> >>>  		dev_err(r5_core->dev, "core force power down failed\n");
> >>>  
> >>> +	/*
> >>> +	 * Clear attach on recovery flag during stop operation. The next state
> >>> +	 * of the remote processor is expected to be "Running" state. In this
> >>> +	 * state boot recovery method must take place over attach on recovery.
> >>> +	 */
> >>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >>> +
> >>>  	return ret;
> >>>  }
> >>>  
> >>> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>>  
> >>>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>>  {
> >>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
> >>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> >>> +
> >>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>>  
> >>>  	return 0;
> >>> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
> >>>  	 */
> >>>  	zynqmp_r5_rproc_kick(rproc, 0);
> >>>  
> >>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >>> +
> >>>  	return 0;
> >>>  }
> >>>  
> >>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> >>> +				int offset, int avail)
> >>> +{
> >>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> >>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> >>> +
> >>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
> >>> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
> >>
> >> I don't think you need the cast.
> >>
> >> Regards,
> >> Bjorn
> >>
> >>> +	else
> >>> +		return RSC_IGNORED;
> >>> +
> >>> +	return RSC_HANDLED;
> >>> +}
> >>> +
> >>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>>  	.prepare	= zynqmp_r5_rproc_prepare,
> >>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> >>> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> >>>  	.attach		= zynqmp_r5_attach,
> >>>  	.detach		= zynqmp_r5_detach,
> >>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
> >>>  };
> >>>  
> >>>  /**
> >>> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>  
> >>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> >>>  
> >>> -	r5_rproc->recovery_disabled = true;
> >>> +	r5_rproc->recovery_disabled = false;
> >>>  	r5_rproc->has_iommu = false;
> >>>  	r5_rproc->auto_boot = false;
> >>>  	r5_core = r5_rproc->priv;
> >>> -- 
> >>> 2.34.1
> >>>
> > 
> 
