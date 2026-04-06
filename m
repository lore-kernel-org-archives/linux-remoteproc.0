Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E591E1C11;
	Mon,  6 Apr 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487575; cv=none; b=J/Pesy/DtOmOUwzDZTcni4bHk/11Az67jD6k/OCHp6KJf2GTJuBbjJG19d5wqVmmiZezUwyBAZGUCfNLyX/bL8In++lWVm6RnCy+82kdX8FO26fYGjuCCe0r9mr4xG9Qn2YLwzb6/ut0l7yachfneXjOI+ZkuTNzQaKffFN0POA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487575; c=relaxed/simple;
	bh=uEmBSd1tlnJ/ovVDlRDlYxhKYDiTSMla3a7v3NjwOQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA9u7Riu6j/aOywUlY4WPdNVX25YC4eealdtMX704U0ah94Y3yh5R0wFN4S0Sg666PoFyYPyplSWPatwcY1ISLT51clR9wX2XO+SVq4/6VsqqlJIJryH324cNlG57xmbGHjBRtitkg2iCNSx6YuPc/aZhggiwASYzP1lquY+DHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBaNRd4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBaNRd4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F163DC2BC9E;
	Mon,  6 Apr 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487575;
	bh=uEmBSd1tlnJ/ovVDlRDlYxhKYDiTSMla3a7v3NjwOQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBaNRd4cQE+r20OuEVVAnUyY2Xq/bI6xRq1P3xTx3Zwne9YWkmnGGtx9NY7oQKRiC
	 1T1Cb0MgripkrDcxQ6IlpR4KA5yEwpNkXSkkQrPapB+p4KvAyjHVU9P0i6G7EOieUl
	 6aBZ1ylaRo5D077RWrw35W6To4xAcenGJ+d8bqNUTG+4fOzfD2KdZ9FqqA48rd4sK0
	 vISGEzIpmEnIvc3/dM9RQVA4VTB5OyUk4F8KNJDQadRXhl9KsymtKSuxboXCq9bkHi
	 vrm7ePAX22/5E2rirr4BIGvTB4wZ3W/ABtDyrCTGlcQPUFCf1TK3H+9uPlnx5F08nR
	 Yhda8lPBxZnPQ==
Date: Mon, 6 Apr 2026 09:59:28 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <adPI2w5tVGCdo_x3@baldur>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 03:03:22AM -0700, Jingyi Wang wrote:
> From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready either at the first check or within a 5-second timeout
> and the ping is successful, it will be marked as "attached". The ready
> state could be set by either ready interrupt or handover interrupt.
> 

The whole use case of early booting SoCCP is to get the charger and USB
Type-C running early - so that charging and USB Type-C works in UEFI.

If SMP2P indicates that it was booted, but it's still not there...then
there's no reason to wait another 5 seconds - it's not there.

> If "early_boot" is set by kernel but "subsys_booted" is not completed
> within the timeout, It could be the early boot feature is not supported
> by other entities. In this case, the state will be marked as RPROC_OFFLINE
> so that the PAS driver can load the firmware and start the remoteproc. As
> the running state is set once attach function is called, the watchdog or
> fatal interrupt received can be handled correctly.
> 
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
[..]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
[..]
> +static int qcom_pas_attach(struct rproc *rproc)
[..]
> +	if (!ret)
> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	/*
> +	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,

This on the other hand, sounds like a bug in the smp2p driver. If we can
acquire the interrupt without getting EPROBE_DEFER, then we should not
get -ENODEV when reading the irq state.

> +	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
> +	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.

If this indeed is the problem you're working around with the 5 second
delay - then stop. Fix the issue instead!

Also, this comment conflicts with the reasoning for the ping and the 5
second thing in the commit message.

Regards,
Bjorn

> +	 */
> +	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
> +
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		if (!ret) {
> +			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
> +			pas->rproc->state = RPROC_OFFLINE;
> +			ret = -ETIMEDOUT;
> +			goto disable_running;
> +		}
> +
> +		/* Only ping the subsystem if ready_state is set */
> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +		if (ret)
> +			goto disable_running;
> +
> +		if (!ready_state) {
> +			ret = -EINVAL;
> +			goto disable_running;
> +		}
> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
> +
> +	if (ret) {
> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		goto disable_running;
> +	}
> +
> +	pas->q6v5.handover_issued = true;
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -518,6 +603,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -823,7 +909,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->proxy_pd_count = ret;
>  
>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_pas_handover);
> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> @@ -855,6 +941,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (pas->q6v5.early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index c27200159a88..859141589ed7 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.25.1
> 
