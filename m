Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44C200110
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150389; cv=none; b=TV+ZUcpsDT4ZvGMTvhqvy9S3xZVt/v6+6qdFzpkUaybTygQRLSvosRr0ngc3pGNr0CZR4L4tRjehkA1sOHuHz8vIMl7OrQDM5CIhNMJMsS3M2uWAnf6aA1x139qiFyCvvWv9FBzGkMFoorCmS97GoAbcmu4Xl/Oe/dwWJQcaS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150389; c=relaxed/simple;
	bh=Q7nfiHO1vNXX/vdbDv/cBxZ6UHfeLk6BayBUSyoftqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h59LVxVOxJX5XSRl8gNp/eP0Aa6r3M/eLpNqJ3c9CYkDm1wEOX6Om28T1WoVivrwB1kCWzFoHcymvxH8AcfktPkiWfDWS8w2F/hcLo5gf51BGds+hx5C9WMOQa9UkJsszF2tx+7l/clejg1/nJjjTxBvs1XYElU8U4BjHIrWJCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LweZ+0J9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LweZ+0J9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88eb5e7713so1801317a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 10:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782150387; x=1782755187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVXqXLALkaEuqZj/gEMaREo8AsSoet4mhKT25GIVD3U=;
        b=LweZ+0J9vKxOXUa0VCqc2RjLtkIxdO0NqOUi5UOTwjuWN+/d3YsLpBfbsUn6JyWi+D
         AYt6YSoYRd1ZgkHDLQwzVOUkHI9EZ8b0ThUWYZJzWPfpO9ak70RNItkbW8NUVWUU3pQh
         9MLqrxCBV4uzacoigJ8H9V1zs8CHD3RLBMp3J7z4XS52ZAI449XWR4hNZFUF3E+gP0tz
         pLOM5ZJFx1qxainQRjWkyLG9fRTixCQMQaWLdJo4r3MpHoxocsr5kQn5+NXrUdAhOwc0
         mSCKVLGwVchIL75GQaxC/mY0iCKqD5/uTbDX73LXyg3U0o+pFnYOBtAIu0sbQg67o91i
         7PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150387; x=1782755187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVXqXLALkaEuqZj/gEMaREo8AsSoet4mhKT25GIVD3U=;
        b=VnYGzTl0xIS8ZeAjimHxnFAACn0vD0MB79X0Xg2pZ2jho1qcn/7/sL1JBUylZJDGN9
         OrSWLb6yLQxhhupBh/6UfSrP8uZRBJFIiTSdRV1YcaLOpe9fqWZ9hPYj8RKA7v+eZ5Nj
         aeVZ+ycJNNI75wiLfDM2ZWFALLuj1v7UksE1fDwSgV8FbNPe9KHt8+PBJLq6NoedH6T+
         J7h6kz6q2MF/3Fhh/fNteI1SyRgor8WX3W00y+Fv0gf6ZpZU2EN2dUMDaYU8uR3YSb+H
         v4WPHmlWXKhDwnwHDanWg2gcTvjCxydyxEV2EEF5qzS9xudPJNUggA0JQXo8AkklM8S5
         vBSw==
X-Forwarded-Encrypted: i=1; AFNElJ/+17g9znrcOa6bPwv124+H+t1rA8tt+Ye3FrUuo4eFQYRQfdsgYyJybXDCdfxfR1WY1N2BeGgCeviUks87E5hk@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbhTOcSfYE7Y+F/w/qxJf167+pSnSQIf0NTe8JGG+bmEkWevm
	9XL3i1wxKfxsbei7Eu6wrGTNIgh/cS4+jLnfptAwVvGfabFIPzGhTLDULlH8MwGI1nB9nmrCJg4
	8IVhhnww=
X-Gm-Gg: AfdE7clgzpAFVZJfnYkPbE52qSqxqsCsIe/+vrmydHs2AZAH+GuntBbSwJpNFZmLYVm
	rJEbpKanXl9M/jKCMP0Y9gOxkJve3/eevmbzZZEL1Qil3V2a+JDphQUx8oaIdvbzCbkklERSCQ+
	I2ZlNGdWRWOuJZJ0Gfp1yEkeGSt61YWqiaUBuHEvsKkbltv7KAzPdF9SQTICc/uF0tjYc8QqVH8
	db4gFPCueV0KO63Elk1ap9tjvsgIc94XI7pWiDckuQdsQSVovF48+OBF46tYshjXxRFqmqtOIpP
	3F3ydAUS3XCvvbeRLACQFumF5bHJf/+zyhRiUZeqfWz6N12A85koWYjxyHH5wOOX8dfHdy7gt9r
	00+aJPzm32O1Uo+PqP12xPcYvIPgoGMoqs0UKc+e72OXzN3KpnUM2B8vwFXdfdSUIJmMG23U55y
	xfAZC9i4n9ockL0gh6
X-Received: by 2002:a05:6a20:6a21:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3bb6c4644e7mr15489071637.38.1782150387218;
        Mon, 22 Jun 2026 10:46:27 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b36f:3823:3d45:dff4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c6e1sm7587091a12.15.2026.06.22.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:46:26 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:46:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
Message-ID: <ajl08A4WkzGaaCCs@p14s>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
 <20260610182711.1758544-3-tanmay.shah@amd.com>
 <ajFzbDgrCbWL8-ds@p14s>
 <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com>

On Tue, Jun 16, 2026 at 02:52:50PM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Please find my comments below:
> 
> On 6/16/2026 11:01 AM, Mathieu Poirier wrote:
> > On Wed, Jun 10, 2026 at 11:27:11AM -0700, Tanmay Shah wrote:
> >> Remote processor will report the crash reason via the resource table
> >> and notify the host via mailbox notification. The host checks this
> >> crash reason on every mailbox notification from the remote and report
> >> to the rproc core framework. Then the rproc core framework will start
> >> the recovery process.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> changes in v5
> >>   - use local variable to access crash report pointer
> >>   - End crash report string with '\0' without relying on fw
> >>
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
> >>  1 file changed, 72 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 3349d1877751..86afff9f3b40 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -112,6 +112,10 @@ struct rsc_tbl_data {
> >>  	const uintptr_t rsc_tbl;
> >>  } __packed;
> >>  
> >> +enum xlnx_rproc_fw_rsc {
> >> +	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
> > 
> > I would call this XLNX_RPROC_FW_CRASH_REPORT
> > 
> 
> Ack.
> 
> >> +};
> >> +
> >>  /*
> >>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
> >>   * compatibility with device-tree that does not have TCM information.
> >> @@ -131,9 +135,27 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> >>  };
> >>  
> >> +#define CRASH_REASON_STR_LEN 16
> >> +
> >> +/**
> >> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> >> + *
> >> + * @version: version of this resource
> >> + * @crash_state: if true, the rproc is notifying crash, time to recover
> >> + * @crash_reason: number to describe reason of crash
> >> + * @crash_reason_str: short string description of crash reason
> >> + */
> >> +struct xlnx_rproc_crash_report {
> >> +	u8 version;
> >> +	u8 crash_state;
> >> +	u8 crash_reason;
> > 
> > Do you need 2 variables?  Would it be possible for @crash_reason != 0 to
> > indicate a crash, making @cash_state irrelevant?
> > 
> 
> Actually initially I had defined crash_reason only, but when I looked at
> how crash reason/type is defined in the kernel, I got idea to keep
> crash_state separate than crash_reason:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/include/linux/remoteproc.h?h=for-next#n183
> 
> enum rproc_crash_type {
> 	RPROC_MMUFAULT,
> 	RPROC_WATCHDOG,
> 	RPROC_FATAL_ERROR,
> };
> 
> So, if crash_reason is defined like above, then it's easy to make
> mistake and not define no_crash = 0. Different firmware projects can
> treat crash_reason differently. I would like to keep crash_state and
> crash_reason separate and not impose policy on firmware projects on how
> to define crash_reason.
>

I agree with your assessment.  Please move "crash_state" to "crashed".
 
> >> +	char crash_reason_str[CRASH_REASON_STR_LEN];
> >> +} __packed;
> >> +
> >>  /**
> >>   * struct zynqmp_r5_core - remoteproc core's internal data
> >>   *
> >> + * @crash_report: rproc crash state and reason
> >>   * @rsc_tbl_va: resource table virtual address
> >>   * @sram: Array of sram memories assigned to this core
> >>   * @num_sram: number of sram for this core
> >> @@ -147,6 +169,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>   * @ipi: pointer to mailbox information
> >>   */
> >>  struct zynqmp_r5_core {
> >> +	struct xlnx_rproc_crash_report *crash_report;
> >>  	void __iomem *rsc_tbl_va;
> >>  	struct zynqmp_sram_bank *sram;
> >>  	int num_sram;
> >> @@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
> >>   */
> >>  static void handle_event_notified(struct work_struct *work)
> >>  {
> >> +	struct xlnx_rproc_crash_report *report;
> >> +	struct zynqmp_r5_core *r5_core;
> >>  	struct mbox_info *ipi;
> >>  	struct rproc *rproc;
> >>  
> >>  	ipi = container_of(work, struct mbox_info, mbox_work);
> >>  	rproc = ipi->r5_core->rproc;
> >> +	r5_core = ipi->r5_core;
> >> +	report = r5_core->crash_report;
> >> +
> >> +	/* report crash only if expected */
> >> +	if (report && report->crash_state) {
> >> +		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> >> +			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
> >> +			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
> >> +				 report->crash_reason, report->crash_reason_str);
> >> +			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> >> +			report->crash_state = false;
> >> +			return;
> >> +		}
> >> +	}
> >>  
> >>  	/*
> >>  	 * We only use IPI for interrupt. The RPU firmware side may or may
> >> @@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>  	if (ret)
> >>  		dev_err(r5_core->dev, "core force power down failed\n");
> >>  
> >> +	/*
> >> +	 * Clear attach on recovery flag during stop operation. The next state
> >> +	 * of the remote processor is expected to be "Running" state. In this
> >> +	 * state boot recovery method must take place over attach on recovery.
> >> +	 */
> >> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> > 
> > Why is there a need to play set/clear the RPROC_FEAT_ATTACH_ON_RECOVERY flag
> > here and in zynqmp_r5_attach() and zynqmp_r5_detach()?  I think we talked about
> > that before but can't remember the outcome of that conversation.
> > 
> 
> The remote processor can go through following life cycle:
> 
> attach() -> stop() -> start(). When this happens, ATTACH_ON_RECOVERY is
> not valid anymore. At this point, it should be BOOT_RECOVERY which is
> indicated by clearing ATTACH_RECOVERY flag. That is why it is important
> to clear this bit on stop().

I'm good with that part...

> 
> Now in detach() it is not needed. I am just clearing the flag as part of
> a cleanup sequence.
> 
>  >> +
> >>  	return ret;
> >>  }
> >>  
> >> @@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>  
> >>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>  {
> >> +	/* Enable attach on recovery method. Clear it during rproc stop. */
> >> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> >> +
> >>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>  
> >>  	return 0;
> >> @@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
> >>  	 */
> >>  	zynqmp_r5_rproc_kick(rproc, 0);
> >>  
> >> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >> +

... but why is this needed?  Why can't it just be set once in
zynqmp_r5_add_rproc_core() ?  The only time the bit should be cleared is in
zynqmp_r5_rproc_stop().


> >>  	return 0;
> >>  }
> >>  
> >> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> >> +				int offset, int avail)
> >> +{
> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> >> +
> > 
> >         if (rsc_type != XLNX_RPROC_FW_CRASH_REASON)
> >                 return RSC_IGNORED;
> > 
> 
> Ack.
> 
> >> +	if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
> >> +		r5_core->crash_report = rsc_offset;
> >> +		/* reset all values */
> >> +		r5_core->crash_report->crash_state = false;
> >> +		r5_core->crash_report->crash_reason = 0;
> >> +		r5_core->crash_report->crash_reason_str[0] = '\0';
> >> +	} else {
> >> +		return RSC_IGNORED;
> >> +	}
> >> +
> >> +	return RSC_HANDLED;
> >> +}
> >> +
> >>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  	.prepare	= zynqmp_r5_rproc_prepare,
> >>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> >> @@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> >>  	.attach		= zynqmp_r5_attach,
> >>  	.detach		= zynqmp_r5_detach,
> >> +	.handle_rsc	= zynqmp_r5_handle_rsc,
> >>  };
> >>  
> >>  /**
> >> @@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>  
> >>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> >>  
> >> -	r5_rproc->recovery_disabled = true;
> >> +	r5_rproc->recovery_disabled = false;
> > 
> > I'm good with the overall architecture of this set.
> > 
> 
> Okay. If above comments looks good, I will send v6 soon.
> 
> > Regards,
> > Mathieu
> > 
> >>  	r5_rproc->has_iommu = false;
> >>  	r5_rproc->auto_boot = false;
> >>  
> >> -- 
> >> 2.34.1
> >>
> 
