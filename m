Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A1221F1C
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764687925; cv=none; b=Q/MiWz4ay7au/+9vjuXayA27XRAuYDOEpYthUDb9rDHZM4kiRzak4tWegXt7YHF7omFWV7CGcfpdcLHHhRr5x/yw2TVWGbqrguK++leKGrFcD5MWMgR/udgkvX/FMdF+oYqYd9XrsgEykI268OzmIG87+lF+f04ZJ9mEzLef6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764687925; c=relaxed/simple;
	bh=bApbVboGM0KE91bn3kKbMfTs/BklRV5/BsnBzJMWsHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ike8q2j7IS12YCW6Te7oVKgdkXfBzRn7B7rrkZFcq9z14EaqSByVrbMAvI0zlKTqTJopPYZMVeiHyzTqJVyAft/NNWVbcoEuIZ0aklfwKVS1VUIafNs5+JH80JxDUZST9I4Iqrz66PTiLU4+4S36lfp1IkDo0N5/iq1VGTodi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRhR0GvE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRhR0GvE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so9166340a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764687921; x=1765292721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLofy9NjfVWvvYwD5IZ9P0Rgay+Ak8ZGY6jWoIwWek4=;
        b=yRhR0GvEXODgrGY+zMIPW0+ipFr4MkAsbaCZi7XvP8tea6WcZpZ5QAcWCbc7jjDpnC
         4aWx/dnBRCm5jhsGCpSmGg5b8JoiyvUaKMoK13S5qSPwepQp8szoUgytopLgQFVylA7P
         rl53MwoWiJE9jRfGm5WW57GoSVDztZ2sKfVs0efmhF/NkX4HXG9jYnJAbtKH3Yi3CWuu
         c9wQ3OpiG8LFarMGbmkN2Ru+1LhMsSrqQ0t3Dc5IP9SsjTw2g4Rlve6598nHe2mtQyP1
         lyj93X3p+fKiGXqqFGT62gJkZftvIz7oZN+Hesh0lkNaAEGu6oShhrY4ik4+ALHyHzbR
         lKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764687921; x=1765292721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLofy9NjfVWvvYwD5IZ9P0Rgay+Ak8ZGY6jWoIwWek4=;
        b=SDiuH/ev+eI7AFwCJztiCmBqT2GAld+cAUrZu79LyzFM9rm2yAeJsyVdpgFNjG9WxF
         GmEyENAGFBs7LFAzqYTM9wFlkJF+nJPOABGcqPvrFlxRH3WO+6ydSRygVQ0g/w5+qa4K
         TTi9sZMgVfjZVL8s7X0OFjDdm0aUaO+6Ep1OcLQd0X/sJmyLxzPdiyT6mjR+2+csUnT+
         XTUp79cJu3xbQeVHKIsPq5Qh3HEUFbwHkt5WCYmQxm5eWgDLpjT3QoiyvdBoM5+Ax6qG
         jT6SoKwTkyOEdE2Y02/pArw2mQK3rLt0/PiGqhCuiASoVuE0jBUTFiA8mLBLOaM0M4Xh
         CVOw==
X-Forwarded-Encrypted: i=1; AJvYcCUDawZpSQPP3AEMT5/SPws7CYvQNJm0VxaxFZ1cegtgTQy+gUZhNs2BQmm/ZCQ9+iRXGBMskhgkki4TTtllwBYx@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGTT7ToVSnqVOQFS2VardAK6CDyczRcwAVvNAyg5zkjnbAW5l
	kjL6+IdKGbwZzttRXP9QlBDcVPKGII14Asl0Jv4IzdvrfJRes6CnilQR33VqMZDBvsWati+Zo83
	fHTfwHIphZv0bCvStINHPaIcieZnY5stWM95XkCxh4Q==
X-Gm-Gg: ASbGncvSys/sqK+HaTeR3h/F9muQRVFNoYg2S8+UFefg9MabU2uYoUJO2tHUa8s6DET
	Xmg8nMWYDV4zetw9smPGYixL2O2L8PNoQzLCiuDASoLChcATCsxXodWOLN4GotRQnNMAYAkSXfe
	PSjgpM82ruzrdcn3ZWU3ywYV7GB/lJm3R6RbfRq2Nr4SqoFvtk2SDtZKmHahU8vO6xi8UnGWJa8
	Ni0VRZX/zJUA1BMsMQ7ooE/55tnqKUSifEdCuvph3PkJeMPC4sJHSsRMp4xuJpI6IgqR5rPAF4P
	bgqVMU7dRGXVmsP1FTI6R0ipDQ2p
X-Google-Smtp-Source: AGHT+IGFY7tMRQfA84XDau7dZuU1g2UEmEbx6B2Ld/COfA63c6u9p6S/xnNQgqnrvT2IwX0spZ+GivkpBDRS5zvBtXs=
X-Received: by 2002:a05:6402:358b:b0:643:ab7:2e7b with SMTP id
 4fb4d7f45d1cf-645559f9dd0mr39444751a12.0.1764687920888; Tue, 02 Dec 2025
 07:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113154403.2454319-1-tanmay.shah@amd.com> <20251113154403.2454319-4-tanmay.shah@amd.com>
 <aSCHJvtEwYWb6Ie0@p14s> <a4c586e5-f89c-4a92-b74e-d358e7cf7a2d@amd.com>
In-Reply-To: <a4c586e5-f89c-4a92-b74e-d358e7cf7a2d@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 2 Dec 2025 08:05:09 -0700
X-Gm-Features: AWmQ_bkXdBewu_96e140LxEduFRXhoSIDpYqBOv-WWxiVHZ1lYSTHb2qa4E_JRw
Message-ID: <CANLsYkxuwpiy+nSedxpRM43J0jMsYY0w5DVw_3NFCqmgGnro1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: xlnx: add crash detection mechanism
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 22:04, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
>
> On 11/21/25 9:37 AM, Mathieu Poirier wrote:
> > On Thu, Nov 13, 2025 at 07:44:04AM -0800, Tanmay Shah wrote:
> >> Remote processor will report the crash reason via the resource table
> >> and notify the host via kick. The host checks this crash reason on
> >> every kick notification from the remote and report to the core
> >> framework. Then the rproc core framework will start the recovery
> >> process.
> >
> > Please substitute the word "kick" for "mailbox notification".  I also have to
> > assume "core framework" and "rproc core framework" are the same.  Pick one and
> > stick with it.
> >
>
> Ack.
>
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> Changes in v2:
> >>    - clear attach recovery boot flag during detach and stop ops
> >>
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c | 56 +++++++++++++++++++++++++
> >>   1 file changed, 56 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 8677b732ad14..5d04e8c0dc52 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
> >>      const uintptr_t rsc_tbl;
> >>   } __packed;
> >>
> >> +enum fw_vendor_rsc {
> >> +    FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
> >> +};
> >> +
> >>   /*
> >>    * Hardcoded TCM bank values. This will stay in driver to maintain backward
> >>    * compatibility with device-tree that does not have TCM information.
> >> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>      {0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> >>   };
> >>
> >> +/**
> >> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> >> + *
> >> + * @crash_state: if true, the rproc is notifying crash, time to recover
> >> + * @crash_reason: reason of crash
> >> + */
> >> +struct xlnx_rproc_crash_report {
> >> +    u32 crash_state;
> >> +    u32 crash_reason;
> >> +} __packed;
> >> +
> >>   /**
> >>    * struct zynqmp_r5_core - remoteproc core's internal data
> >>    *
> >> + * @crash_report: rproc crash state and reason
> >>    * @rsc_tbl_va: resource table virtual address
> >>    * @sram: Array of sram memories assigned to this core
> >>    * @num_sram: number of sram for this core
> >> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>    * @ipi: pointer to mailbox information
> >>    */
> >>   struct zynqmp_r5_core {
> >> +    struct xlnx_rproc_crash_report *crash_report;
> >>      void __iomem *rsc_tbl_va;
> >>      struct zynqmp_sram_bank *sram;
> >>      int num_sram;
> >> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
> >>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>   {
> >>      struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> >> +    struct zynqmp_r5_core *r5_core;
> >> +    struct rproc *rproc;
> >>      struct mbox_info *ipi;
> >>      size_t len;
> >>
> >>      ipi = container_of(cl, struct mbox_info, mbox_cl);
> >> +    r5_core = ipi->r5_core;
> >> +    rproc = r5_core->rproc;
> >>
> >>      /* copy data from ipi buffer to r5_core */
> >>      ipi_msg = (struct zynqmp_ipi_message *)msg;
> >> @@ -244,6 +265,13 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>      buf_msg->len = len;
> >>      memcpy(buf_msg->data, ipi_msg->data, len);
> >>
> >> +    /* Check for crash only if rproc crash is expected */
> >> +    if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> >> +            if (r5_core->crash_report->crash_state)
> >> +                    rproc_report_crash(rproc,
> >> +                                       r5_core->crash_report->crash_reason);
> >
> > At this stage ->crash_state indicates that a crash occured, but how is it reset
> > once the crash has been handle?  How do we make sure the next mailbox
> > notification won't trigger another crash report?
> >
>
> I was counting on the remote firmware to reset the crash_state once it
> reboots before sending the next mailbox notification.
>
> If it's not the best idea, I can reset the crash_state field in start()
> callback or attach() callback at the end. That will indicate that remote
> firmware has started successfully.

I think this is a better solution.  That way we don't rely on
something that may or may not happen.

>
> >> +    }
> >> +
> >>      /* received and processed interrupt ack */
> >>      if (mbox_send_message(ipi->rx_chan, NULL) < 0)
> >>              dev_err(cl->dev, "ack failed to mbox rx_chan\n");
> >> @@ -397,6 +425,7 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
> >>      if (ret)
> >>              dev_err(r5_core->dev,
> >>                      "failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
> >> +
> >
> > Spurious change
> >
>
> Ack will remove it.
>
> >>      return ret;
> >>   }
> >>
> >> @@ -438,6 +467,8 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>      if (ret)
> >>              dev_err(r5_core->dev, "core force power down failed\n");
> >>
> >> +    test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >> +
> >>      return ret;
> >>   }
> >>
> >> @@ -874,6 +905,8 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>
> >>   static int zynqmp_r5_attach(struct rproc *rproc)
> >>   {
> >> +    rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> >> +
> >
> > Why can't this be set in probe() and left alone from thereon?
> >
>
> Right now no specific reason. But I wanted to enable recovery only if
> attach() callback is successful. If execution fails anytime before that,
> then no point in enabling it.
>
> >>      dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>
> >>      return 0;
> >> @@ -888,6 +921,8 @@ static int zynqmp_r5_detach(struct rproc *rproc)
> >>       */
> >>      zynqmp_r5_rproc_kick(rproc, 0);
> >>
> >> +    clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> >> +
> >
> > I'm not sure why this needs to be done, same comment for zynqmp_r5_rproc_stop().
> >
>
> I think for detach() may be it's not needed. I added it as a cleanup
> sequence i.e. reverse of what's done in the attach() callback.
>
> For stop it is needed in the following case:
>
> attach() -> stop () -> load fw () -> start ().
>
> In this sequence we need to make sure that if recovery is requested
> after start(), then we execute "boot recovery" and not "attach recovery".
>

I think this is a valid reason, just make sure it is documented in the
code here and for _attach() above.

>
> Thanks,
> Tanmay
>
>
>
> >>      return 0;
> >>   }
> >>
> >> @@ -896,6 +931,26 @@ static void zynqmp_r5_coredump(struct rproc *rproc)
> >>      (void)rproc;
> >>   }
> >>
> >> +static int zynqmp_r5_handle_crash_rsc(struct rproc *rproc, void *rsc,
> >> +                                  int offset, int avail)
> >> +{
> >> +    struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +
> >> +    r5_core->crash_report =
> >> +            (struct xlnx_rproc_crash_report *)(r5_core->rsc_tbl_va + offset);
> >> +
> >
> > This function is so simple that I would fold it in zynqmp_r5_handle_rsc() below.
> >
>
> Ack.
>
> > Thanks,
> > Mathieu
> >
> >> +    return RSC_HANDLED;
> >> +}
> >> +
> >> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> >> +                            int offset, int avail)
> >> +{
> >> +    if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
> >> +            return zynqmp_r5_handle_crash_rsc(rproc, rsc, offset, avail);
> >> +
> >> +    return RSC_IGNORED;
> >> +}
> >> +
> >>   static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>      .prepare        = zynqmp_r5_rproc_prepare,
> >>      .unprepare      = zynqmp_r5_rproc_unprepare,
> >> @@ -911,6 +966,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>      .attach         = zynqmp_r5_attach,
> >>      .detach         = zynqmp_r5_detach,
> >>      .coredump       = zynqmp_r5_coredump,
> >> +    .handle_rsc     = zynqmp_r5_handle_rsc,
> >>   };
> >>
> >>   /**
> >> --
> >> 2.34.1
> >>
>
