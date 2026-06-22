Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5B3B9D98
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138926; cv=pass; b=OuLZB5PzNkvYq1ryEzpTloqX7e+nsfZf91S8G/0dlfAqZWJ/nfR0Kx9BrNWoWskdnIpFtpDu7oubUdug1s/Ku9mQqEaO2Qn5cKfiyWPV0pRszGmi+tku/Jl1wjQcRNMltzYPEoqdrfO03JkfgdQ4cGqQIiR632swKlWb+8X+pwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138926; c=relaxed/simple;
	bh=ikHoNKliLry32LoDV0kQcgRAP5K54uiDSjkfPFbX4Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OecN86JjrQ4GGvcZYNHHKch7UWsk2ufJ5ASww5NZHy4BVvmYTjXIsQJjjpi7s/r57pL15T/DpiNAczYbLPpUAbDMnV9pOm5NAJSNd+0dM4pZQ3l5ahKBIwTPuwKe+yh0R2TNaUeyFJxV5xs8zaDO1wHrLw5P+PV8IvIpSVjvwfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULT2qNR0; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULT2qNR0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bed19623d6eso645273466b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 07:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782138923; cv=none;
        d=google.com; s=arc-20240605;
        b=lTgokvMX8i2gfTIvlWEtMrpTF+PeBSV6lSTUz6lCu2cOBpLVKHQ2LxvzN2yBYR5tph
         WppUXOn+4347EKwl0TcJinvyaZGuB+rRzS3o9oq3liK/sl4xxlhyvQ5AVPt/QS8GtBPq
         Zl5tNoW3GVyvhXF2hYsoYGqVaR5PPnKepOGH5xwxAqPaN75JtjdA2s6RG1pltUScJ0T6
         9wfwfiRdsS7NI34k4tYbg74osK8JWkv6Xi3Ms71Fa7iTw5EK6lvnaNW3RsePNrpWuqDm
         Pmy4FCzghgYRnruEybLM4LgCFKslS8f3yDHKbfR1wPctTW6MUZmSOz9W3UDTfD1qSfpe
         PIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cc6r7Lp9vGxajVjEiP+2jWn7h6KCdfXLIQ302v2pvac=;
        fh=CJ7dDDKFqZW91EDkd/gMpMm7SGXCjmSZJHKTF3bfgSA=;
        b=UhMtFgcAkr/UQoaX0Dlx7xvqx1Kf62aGEMzJKtTau0ArsbFuklrIlznjHOU1ygH9lA
         G5wRwZkMxtUdKLcWd9h4WP/iiyS2KaGiM2OL5M4vwlqv2LgJYojEAtENUyG3nUjcWLFn
         IbdyWoCtk3tlNBLIWtHcsgsOYas0zxNzUg+0UzxFXLmfC3jZviS2RECjdWifYYBEhuS+
         NOy8Lfh0mPpEe7mRMwOuTe+nZOV/2CE+Q3jt3Q0fw40MinQAfouwWAdlneV8E+9YyLIg
         C4m0A+A2gVSQln7qwcG1HOhTi8vzB8K136eyNC30FAOKP1oU9cTNPMvqo+HSgMEqmFC2
         zp+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782138923; x=1782743723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc6r7Lp9vGxajVjEiP+2jWn7h6KCdfXLIQ302v2pvac=;
        b=ULT2qNR0NkdNp168RtmNVySM+lMEQeW0vjfvgUUgzg6PJ0eyjo/cLNwppR4bucPEBZ
         AN56tUbwHDtrmqMmoEVNzEmtWveF4BZHkNJ+YRMmtxGbbPUjbG9SpYSp9jB7tTjx7rVv
         EvbSJhQC144EyLHYjG5UwNcuGA6HZ3VDmd0d3rCli9xuerziNA0+bgKUEvD2sjX9re+3
         7fFdi6AmUAwgZm3mPlXoyYRnSqEVPx6LeEpp0r+zB9SAI0D2CGYzE+RjIBIcM088dc3T
         CwU92xjWSAb55Tspj3fcZe6FIpGJ6TbIclhB6uAW3VeqXLJmm8xr6L8uaYybv4hC21dY
         OMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138923; x=1782743723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc6r7Lp9vGxajVjEiP+2jWn7h6KCdfXLIQ302v2pvac=;
        b=UUv8H1CBzGXOZokW+iFqbQ3nDH5atyjYtp9aLmErUFHvCLimWHBGIONBCmhcTnECFV
         +THtTdTb3q/Y20y1ORO4iqhkTp8zzuIeaRzj8Sn0XU1eJ/gZ/eYFwEdbBH9NzaJRkxTD
         kuREl6ta92Bz3tcUcGj7BTTy6A8pX3ggMlqxJVFB4bO4y54f0V2mhESaY8i0VPfuiV3B
         FC6qwaYMM/uZtOzwDf/X3smxSolx5Y4A/7qZChaQlQllLAup07RX5NOqHGhgvLd9V/hb
         Pt6UtqYl956Ghgzx51luyZxaj+voI3/AHrPXG/+t3no7cwSfkzX1QDAS/y2V8Uuj9pMh
         WAjQ==
X-Forwarded-Encrypted: i=1; AFNElJ96VHxgWro393mh/TP8EskyOebvrvOjgk0qfnWgvnookh8zQgUXJmDrekR36f1eTKJtFSsgS5yN5glJekk7dVro@vger.kernel.org
X-Gm-Message-State: AOJu0YwpHMFK0O65t4va0ElCSu3f7ZljdFJDzlTj6W11ZXx2yMhWwJ+4
	yYGwBIsZdrJQa8uPISenFH7lM2mILrcPaRhCbL9RET5CxxmIrBM9p+MPrfSdGqcNJjEQU+4gfgO
	0hpJZnj2m7Xyq+yM5NfnAYb1ZIXNufEBceblUc/vpBw==
X-Gm-Gg: AfdE7ck7wwk2kRWYWjcm5LA0gDeOUUOf/g33H5OpDCzPx0w+1L3x1LBV2Wi5vie3Cre
	0Wa9nHjXP7lKmt58T0x3HWLZ0+2Ozb2/l/Bwz5M+LjRIUD0d1LEQ5cirslZBOLPpToUVZ9EYtGR
	XslMHgFqMb9PEY0GLqt07tQDXKp8PY7HgHWdSrbBcCwV/aPP2ynJTfFFCV1sa90ooKLJQEJb+3D
	vAYiFcJsM+NNLu8SKabwapAza7cvHrBis8cRMRZiXd5ci6e10SHMmAhh3NLKVY0nEg41Xt8sa2G
	u3mw5sAvf9Ny6L64KA9xfGVb7q9ZGi0=
X-Received: by 2002:a17:907:1c11:b0:c07:ef7f:61a4 with SMTP id
 a640c23a62f3a-c0b6273ff9amr705791366b.39.1782138921273; Mon, 22 Jun 2026
 07:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610182711.1758544-1-tanmay.shah@amd.com> <20260610182711.1758544-3-tanmay.shah@amd.com>
 <ajFzbDgrCbWL8-ds@p14s> <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com>
In-Reply-To: <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 22 Jun 2026 08:35:09 -0600
X-Gm-Features: AVVi8Cf052iLuY_mu1T_KasoU1qHYjMFWlaR5kaDnpVyfQvi4lxBS0uVaKtT8rY
Message-ID: <CANLsYkxXvsFsVw-8u83rqSRePqx6nWmKyKyPh+RvxYV3e=t9eA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 13:52, Shah, Tanmay <tanmays@amd.com> wrote:
>
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
> >>      const uintptr_t rsc_tbl;
> >>  } __packed;
> >>
> >> +enum xlnx_rproc_fw_rsc {
> >> +    XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
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
> >>      {0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
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
> >> +    u8 version;
> >> +    u8 crash_state;
> >> +    u8 crash_reason;
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
>         RPROC_MMUFAULT,
>         RPROC_WATCHDOG,
>         RPROC_FATAL_ERROR,
> };
>
> So, if crash_reason is defined like above, then it's easy to make
> mistake and not define no_crash = 0. Different firmware projects can
> treat crash_reason differently. I would like to keep crash_state and
> crash_reason separate and not impose policy on firmware projects on how
> to define crash_reason.
>

Thanks for the explanation.  I'll think about that a little longer.

> >> +    char crash_reason_str[CRASH_REASON_STR_LEN];
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
> >> +    struct xlnx_rproc_crash_report *crash_report;
> >>      void __iomem *rsc_tbl_va;
> >>      struct zynqmp_sram_bank *sram;
> >>      int num_sram;
> >> @@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
> >>   */
> >>  static void handle_event_notified(struct work_struct *work)
> >>  {
> >> +    struct xlnx_rproc_crash_report *report;
> >> +    struct zynqmp_r5_core *r5_core;
> >>      struct mbox_info *ipi;
> >>      struct rproc *rproc;
> >>
> >>      ipi = container_of(work, struct mbox_info, mbox_work);
> >>      rproc = ipi->r5_core->rproc;
> >> +    r5_core = ipi->r5_core;
> >> +    report = r5_core->crash_report;
> >> +
> >> +    /* report crash only if expected */
> >> +    if (report && report->crash_state) {
> >> +            if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> >> +                    report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
> >> +                    dev_warn(&rproc->dev, "crash reason id: %d %s\n",
> >> +                             report->crash_reason, report->crash_reason_str);
> >> +                    rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> >> +                    report->crash_state = false;
> >> +                    return;
> >> +            }
> >> +    }
> >>
> >>      /*
> >>       * We only use IPI for interrupt. The RPU firmware side may or may
> >> @@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>      if (ret)
> >>              dev_err(r5_core->dev, "core force power down failed\n");
> >>
> >> +    /*
> >> +     * Clear attach on recovery flag during stop operation. The next state
> >> +     * of the remote processor is expected to be "Running" state. In this
> >> +     * state boot recovery method must take place over attach on recovery.
> >> +     */
> >> +    test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
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
>

Here too I'd like to review the current state machine.  I'll get back
to you shortly.

> Now in detach() it is not needed. I am just clearing the flag as part of
> a cleanup sequence.
>
>  >> +
> >>      return ret;
> >>  }
> >>
> >> @@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>
> >>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>  {
> >> +    /* Enable attach on recovery method. Clear it during rproc stop. */
> >> +    rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> >> +
> >>      dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>
> >>      return 0;
> >> @@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
> >>       */
> >>      zynqmp_r5_rproc_kick(rproc, 0);
> >>
> >> +    clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >> +
> >>      return 0;
> >>  }
> >>
> >> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> >> +                            int offset, int avail)
> >> +{
> >> +    struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +    void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> >> +
> >
> >         if (rsc_type != XLNX_RPROC_FW_CRASH_REASON)
> >                 return RSC_IGNORED;
> >
>
> Ack.
>
> >> +    if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
> >> +            r5_core->crash_report = rsc_offset;
> >> +            /* reset all values */
> >> +            r5_core->crash_report->crash_state = false;
> >> +            r5_core->crash_report->crash_reason = 0;
> >> +            r5_core->crash_report->crash_reason_str[0] = '\0';
> >> +    } else {
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    return RSC_HANDLED;
> >> +}
> >> +
> >>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>      .prepare        = zynqmp_r5_rproc_prepare,
> >>      .unprepare      = zynqmp_r5_rproc_unprepare,
> >> @@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>      .get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> >>      .attach         = zynqmp_r5_attach,
> >>      .detach         = zynqmp_r5_detach,
> >> +    .handle_rsc     = zynqmp_r5_handle_rsc,
> >>  };
> >>
> >>  /**
> >> @@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>
> >>      rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> >>
> >> -    r5_rproc->recovery_disabled = true;
> >> +    r5_rproc->recovery_disabled = false;
> >
> > I'm good with the overall architecture of this set.
> >
>
> Okay. If above comments looks good, I will send v6 soon.
>
> > Regards,
> > Mathieu
> >
> >>      r5_rproc->has_iommu = false;
> >>      r5_rproc->auto_boot = false;
> >>
> >> --
> >> 2.34.1
> >>
>
