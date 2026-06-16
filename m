Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264104279F5
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625714; cv=none; b=Hi5LxFOid7GCywm9/HvHh6uA35YLnbstYr/1czgV1afvuaSJy5H2vYYl+k8VbFDeA52h1QIOJnQlU72FeJPoT4I01gKXILm1Vwml3k89XcwTkvfrYbP9QXb0SuniJPHloXtYqPwZzmRItkaAsY2A4ga0TXrLwCixKISFtmhf4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625714; c=relaxed/simple;
	bh=D6mF2gf3MFY+EEgg7nRCQY+BAM5iUxMeCwlSzpPLF+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esZNdFIXmJOPL/IMHGab+bZF/IFRDUrxFDTmJeNjOBh4WkDTvbnkXAJNYBk4SryGZ7ZPWNve8br4eJVByaUmBxfmmPn6FAmcR/SdW5jFtIxkkbvBtxCigEo3VQ5/ebtD2SSoMOpRIXX9AhGaAua1K7hxgUCZhyVX7rspsoAXG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVemAAhu; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVemAAhu"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso1711153a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781625712; x=1782230512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh2j3xTRSk/IZ8X6UrWu31VvbtcmIiBqYoXb0F2c9dQ=;
        b=vVemAAhuvqpVRyzDRdkfaZMdMPl4mz7jg13Ohnvk3uIH3HNicnoKSnn19LV1kNDlVW
         kxbHnksNQ7VPE+xxHFJyB1GeO0DgN+SIp4Wij/pnuMZU5NtGZmM5hfycM2eH12eYY5QZ
         aInJlVDyqlyDSbkDHUqjDLVjY3qo3C3k8vWGD6Fc7TMS8y7NwKgqYoGZoT5oEG0z4sRK
         wfZ2EV5r/V1ykvrPQRy24ryGCcpQSYpOTpkyo7xv9HLJIn9r+vX3HblKK67z+MvZREK3
         BNCpGZ0UYUgs5F1sxQH6OP+s9akElCH18dWibrTsEubhe+YcD0dh+kK0mJmXwRO3YJpZ
         f1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625712; x=1782230512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh2j3xTRSk/IZ8X6UrWu31VvbtcmIiBqYoXb0F2c9dQ=;
        b=AUVKiaY+PuJ+LxvI1HgTo1Su8Q752QjhAHXu56+g+4qXTuFag6SKYOMZdazHVSXcu2
         2jNWYnhoMeFwUfSMslgLkluKs/mc0rIYFTCcXOS88vvdKdFURL6Z0oRyR6nq8SDihLJn
         Hcy1Gd50ijP5ajVvOPWKQtXb5k7Omnn/N3AQckAA8KwDPBXUpRfYN5cyZenWUYe46Fpw
         uFLhVUDNwILTpebAuX/sG7PrfxzMDpHEEPGQJeGIdqXyLL5gYjb53Zd4NFs+B9ZGOzg9
         dk6b1rZxrfuMsqigHn7UonxDSo8iX2CSCaf4om5PDWNqLKD5lp1FrxU0wUHsuf2eIJks
         RN9A==
X-Forwarded-Encrypted: i=1; AFNElJ9ybCIr3OAGnUcBz5RWbNm2wjuPt17cd5IrjHW31BsqO8WR7owPmdXGDzqVSv/Rsdn07r/R99lFqUi09p0Ow4yd@vger.kernel.org
X-Gm-Message-State: AOJu0Yypfqg/3qcA6NdfYaa5Enutp5XNbuwQKf08Ha5+SGbbfzf/4/at
	MqjzlpI0eDmVavfDao617j7eZlS7fdTO+scTLH6Dl+gO5j0Vahq6Izu0fP2W7aUVZmI=
X-Gm-Gg: Acq92OHX/xgXfAl3GbUd8cXGzycGEHwgV7klNgbFVuXMCN0IQ5ZIWcdpMPwkRs/ESs4
	CZ0/Tgwaj7VeRCgMBbIVRIh6YJUdhPKqjHTCfsmLhdtXBgHJG4PsL3wdIyGGFfazzVZHndT14eb
	lpxjgHHtbv+DDHnxgx+/T84S+ZkDiuCTgkUjcSxfjaXW5qQaM/ocFFR3Bel5ny/6QGtVKnVkeC/
	Y4238+ovEQpVw8E0BuziVvk6aERxcU16T6l576zOiwPa43Znfkb87Zj5JiuG2vXtqvYV2A8sibA
	Pzl0kpZgztaTUutdL85M3zSjAadpXLhS5hOPmyYjRkTJyUIGhhGCyi8Y7KbB58a2lHs4qOIb7S+
	YluTdzz7HgSfP9lOvGvCpGtS8gV0d4PNH4YHHfsf0tZm3+JCN2M4DnBCROcUSvFoW5HEqecuX6k
	v7Lw+M/nsFXgvvfYwN+FnuTWXDcO0=
X-Received: by 2002:a05:6a20:d528:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3b7e49418d6mr5598209637.23.1781625711641;
        Tue, 16 Jun 2026 09:01:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1850:280c:40de:53f0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665187371sm10791982a12.18.2026.06.16.09.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:01:50 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:01:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
Message-ID: <ajFzbDgrCbWL8-ds@p14s>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
 <20260610182711.1758544-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182711.1758544-3-tanmay.shah@amd.com>

On Wed, Jun 10, 2026 at 11:27:11AM -0700, Tanmay Shah wrote:
> Remote processor will report the crash reason via the resource table
> and notify the host via mailbox notification. The host checks this
> crash reason on every mailbox notification from the remote and report
> to the rproc core framework. Then the rproc core framework will start
> the recovery process.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> changes in v5
>   - use local variable to access crash report pointer
>   - End crash report string with '\0' without relying on fw
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 3349d1877751..86afff9f3b40 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -112,6 +112,10 @@ struct rsc_tbl_data {
>  	const uintptr_t rsc_tbl;
>  } __packed;
>  
> +enum xlnx_rproc_fw_rsc {
> +	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,

I would call this XLNX_RPROC_FW_CRASH_REPORT

> +};
> +
>  /*
>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>   * compatibility with device-tree that does not have TCM information.
> @@ -131,9 +135,27 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>  };
>  
> +#define CRASH_REASON_STR_LEN 16
> +
> +/**
> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> + *
> + * @version: version of this resource
> + * @crash_state: if true, the rproc is notifying crash, time to recover
> + * @crash_reason: number to describe reason of crash
> + * @crash_reason_str: short string description of crash reason
> + */
> +struct xlnx_rproc_crash_report {
> +	u8 version;
> +	u8 crash_state;
> +	u8 crash_reason;

Do you need 2 variables?  Would it be possible for @crash_reason != 0 to
indicate a crash, making @cash_state irrelevant?

> +	char crash_reason_str[CRASH_REASON_STR_LEN];
> +} __packed;
> +
>  /**
>   * struct zynqmp_r5_core - remoteproc core's internal data
>   *
> + * @crash_report: rproc crash state and reason
>   * @rsc_tbl_va: resource table virtual address
>   * @sram: Array of sram memories assigned to this core
>   * @num_sram: number of sram for this core
> @@ -147,6 +169,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * @ipi: pointer to mailbox information
>   */
>  struct zynqmp_r5_core {
> +	struct xlnx_rproc_crash_report *crash_report;
>  	void __iomem *rsc_tbl_va;
>  	struct zynqmp_sram_bank *sram;
>  	int num_sram;
> @@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
>   */
>  static void handle_event_notified(struct work_struct *work)
>  {
> +	struct xlnx_rproc_crash_report *report;
> +	struct zynqmp_r5_core *r5_core;
>  	struct mbox_info *ipi;
>  	struct rproc *rproc;
>  
>  	ipi = container_of(work, struct mbox_info, mbox_work);
>  	rproc = ipi->r5_core->rproc;
> +	r5_core = ipi->r5_core;
> +	report = r5_core->crash_report;
> +
> +	/* report crash only if expected */
> +	if (report && report->crash_state) {
> +		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> +			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
> +			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
> +				 report->crash_reason, report->crash_reason_str);
> +			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +			report->crash_state = false;
> +			return;
> +		}
> +	}
>  
>  	/*
>  	 * We only use IPI for interrupt. The RPU firmware side may or may
> @@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	if (ret)
>  		dev_err(r5_core->dev, "core force power down failed\n");
>  
> +	/*
> +	 * Clear attach on recovery flag during stop operation. The next state
> +	 * of the remote processor is expected to be "Running" state. In this
> +	 * state boot recovery method must take place over attach on recovery.
> +	 */
> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);

Why is there a need to play set/clear the RPROC_FEAT_ATTACH_ON_RECOVERY flag
here and in zynqmp_r5_attach() and zynqmp_r5_detach()?  I think we talked about
that before but can't remember the outcome of that conversation.

> +
>  	return ret;
>  }
>  
> @@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  
>  static int zynqmp_r5_attach(struct rproc *rproc)
>  {
> +	/* Enable attach on recovery method. Clear it during rproc stop. */
> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> +
>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>  
>  	return 0;
> @@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
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

        if (rsc_type != XLNX_RPROC_FW_CRASH_REASON)
                return RSC_IGNORED;

> +	if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
> +		r5_core->crash_report = rsc_offset;
> +		/* reset all values */
> +		r5_core->crash_report->crash_state = false;
> +		r5_core->crash_report->crash_reason = 0;
> +		r5_core->crash_report->crash_reason_str[0] = '\0';
> +	} else {
> +		return RSC_IGNORED;
> +	}
> +
> +	return RSC_HANDLED;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>  	.attach		= zynqmp_r5_attach,
>  	.detach		= zynqmp_r5_detach,
> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>  };
>  
>  /**
> @@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>  
>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>  
> -	r5_rproc->recovery_disabled = true;
> +	r5_rproc->recovery_disabled = false;

I'm good with the overall architecture of this set.

Regards,
Mathieu

>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
>  
> -- 
> 2.34.1
> 
