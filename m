Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A96391E44
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288527; cv=none; b=oJ8jXvg1xq0VQ323yeWpVcEGJyAdu1SM4MImk7fqbcT4aPcxSbWbtsH9YhoVCpqonpbgFd76lDkFGZnpFIIIkWrV+e5Smq1hXbXDGyXligbsmoiDgR49LMmAnf4V9BC9dL2ilj3RQlloo4C0PLIQiAyp6WHMDuoJIxxWsotrb6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288527; c=relaxed/simple;
	bh=PCatXMQ7Ma4Yl5HqX2Rm6nOrvsBITeVXW7flqfjEArg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVE9jYIC557B3SsJEsKUwFvAJTkInZgcvgxeL1UNT92wqK1whrEDhclnn7QDFmsdq2VjCaswaTXELUsFSo+wZXrD4urpjwKe1c3Hx/rYWPqMlXyQSPkWeORvrdHwXR2gl7mV5gLdQNMS2zOn7cw3ShAhvfXSLWXec//fXoZR9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO6CVxOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klYpxv2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iO6CVxOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klYpxv2K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u8qT2555582
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 08:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJbzjN1RbygmG8cpQBxIz+wj
	rg/x7EicOMtlyIXDJvg=; b=iO6CVxOXgszHJNmGfHo9P/bONKEZ9MGqPSiYCFuX
	avzKMEcRUIRb4PFeKsCgp74mmvc5e+AT2KzbLN5fykGb/r6jSEMNwRNx3g+WghAe
	dCbUFPsVL4xgmp/H7ACa0eoDx561DHgbh92IW208bdE0fU1LocMSDK6eW4/owyRX
	b7HoZOcCMvIakS/M1t4a/lMv0u7U0GDUt7grrjSbEeHtHUFmWR7MD34SKtWftNgO
	/TvIcPEwiEFw0s3yk8No+2SLWrcph5VDmR+xBiutH2t6AYtVsatrFPkK/6f/Rgwo
	HsBySyQ7bbSwhBH1LlZJHvkb0l64mo+NWPf6yYQqUgbUcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996ggvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 08:08:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b9d265308so627048a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782288524; x=1782893324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJbzjN1RbygmG8cpQBxIz+wjrg/x7EicOMtlyIXDJvg=;
        b=klYpxv2KaxXY9ECS4Oo32aNKJHfvtT7haHtCP1foYv0XpUoTB3nxtDpHEJwmCEDIJr
         45+JAUkgFcmwD5kN7VA+WuoSHgwAQKjbrXLMbd8SYoW9RJk92wtmW0eS2YIp2CT5hRY7
         YQ5nRKAMrkBKhODxx487X/+k4z5jn6tpnBJ+K+rNXL9SWXjEG9+e05iTN369+R8j8tB7
         F/GfiaoY17ULDFBOTxzXuTPS3qK1IzkQLmtekaBFNcZco7ZcSlUHQfHc5m0vwQpBq+4J
         xSqEE07f9f+WM3YWtoCQQxdNHoNe/Sv0Lekd65usYSQfQ2e3TZbxO271l+ZZmE2teLfB
         Y9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288524; x=1782893324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJbzjN1RbygmG8cpQBxIz+wjrg/x7EicOMtlyIXDJvg=;
        b=ZdIjtXGTiDfYiFTtlQ6bSk42ail0Y5SAjh0KOZHnaI3SS3WdaS9TK6+r5HQXIqXKPH
         WmwvTKSvnbwgsFiOHJvfWPd1Iv89ZQsQX/2AgRaMAdjEjNMypsLWan9wWtEVDucR8qbz
         RoosBmpEUp26Jju6my1iPzh+uXnHiCmn/Oo2fxKGj45V5oOYvtyTNAhG7Ygb4VHqK6RY
         yMhrSobNPZlTUBzjMic7yjfxawM3wt8C06K6xou/1v7+kIFj2/Olr2ljbLa4W/XP/zrP
         cPyd6ewGMErzH3AYjAMcHFtk8zCrvwSURmhgUrilIaLJs6kcRN/oJYZDMm+KSfBrBRiN
         UKrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOp8iu555pACCO9cqgaIfocuvAFS2/uWf3qeTejPlz5rTnAIOuZ9h9PfdMJSxpsUr7DnO10snTVU2fy6NW4Vow@vger.kernel.org
X-Gm-Message-State: AOJu0YwAvJFzs8/6o73AfzS67fx0ozM2EjcI+fzbKA1YZau7f9/pmUGi
	GRIxPZZsMIK3ciyyt3cQl0fmMKR9u00V7+lVomhBY1u1veGGJ241Yw6lU9f/fds2Uk8pQ6ECxRN
	gOxN2nFQKTnvnRO8Vu+VmvnAsy06UGjIl2vqbaszyppGAu43nH5zA8cOWEvOEI6T8TIa8vC+y
X-Gm-Gg: AfdE7clTF/jrkjwOKqA8Ds1YB4mO9KNfsmdcMwa0il9NvniKsb9WcM1KZ+ZbAc4NWta
	yFu2c9ljpewmwjQpXNi/Z9FqyMY+kk37AhohxgzB2KeW4jZfZSdgVs/B4IDUWMN8+mUjMXHnOWA
	klCZQK1hsQIUzRakgvA/3gKq6/ZXx+LxT8t4PPWB8AdYr6OteSj1TkM1/HnqR/K+4NjmzroDppU
	n0aZV3sLFRjtibLd52PUsCKsI7mFOukErqIUS9vho7nJtyWYJnsuFGK61xeK2030tCdjRYDva0e
	4tGmN53JFSwEB9tTRNPsyEZ6ClPgxEqRH/rNQBaktrTz8X/0pwTif1h1CG382vTddgn6O4FTTmH
	QjVkmYaSP8r1FxPTzW1PpNTUM776F5HHFPDqGtQ==
X-Received: by 2002:a17:90b:314e:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-37de41c0522mr2784071a91.8.1782288523606;
        Wed, 24 Jun 2026 01:08:43 -0700 (PDT)
X-Received: by 2002:a17:90b:314e:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-37de41c0522mr2784029a91.8.1782288522926;
        Wed, 24 Jun 2026 01:08:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ce544dsm1877831a91.9.2026.06.24.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:08:42 -0700 (PDT)
Date: Wed, 24 Jun 2026 13:38:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
X-Proofpoint-GUID: d_gnhbjGCE1jDYNlFsNHVw_FPZio6NUt
X-Proofpoint-ORIG-GUID: d_gnhbjGCE1jDYNlFsNHVw_FPZio6NUt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfXzYS4GuVQfrXt
 jTNjtiurZcbKc19YDYv4yEno7ILnhajYZc2NRGAQFk3eAnpnrsOeRLXblvDZTXZzws/Mas9RRB9
 8kRbfYQoHXvuWJQCAzzkGHI+NN78UqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX0s6IzrJPZSXQ
 WYtkWoEIxRzQhDZZGVbyY9wdvGrCnBMaKPCUGt8u0bGMVmC2X0b7gZin5PY4ar20nZn9jU6+rtT
 /ExEM7oMKPsb0/XexT3YpZFDZ4QcyZZNs+GovzoGvUkUOUBsnFijN/1+yznMtB8Posatj4sc2Gs
 XuT7QsLhR5Oz2O+r8ynosxNpb5vwsy+GoO3QuCTE1lPkOoRSa5t4hPRpsp1M2IhGVgJYFo7XzU3
 7ZykZ83EBmnR9G4w5dNSrXFdVtdqR9PxVHEVvqXVLARDu4AnZBflpXKQo1FPFtMJoPbv6+y38Bh
 I+plDvlr2s2NT/yFngP28r8wt5JmomfG5FwBrj+Y1S9Tn1N1+z7Ghm81TuxkKAKtUn/tDIx+Bu8
 CV59sK4epjXrEFO5w29kuiYzflsY/Zfbw5qq3AkEk5w+UW33XB4N78JezZZAwZOUfMd2EX6ToKT
 HN6E20yNhlyFbPUMmtg==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3b908c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xccAi-TjZwAcfVKLSogA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240066

On Tue, Jun 23, 2026 at 03:05:21AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if crash state is detected
> for the subsystem, rproc_report_crash() is called. If the ready state is
> detected meanwhile stop state is not detected, it will be marked as
> "attached", otherwise it could be the early boot feature is not supported
> by other entities or it has already been stopped. In above cases, the
> state will be marked as RPROC_OFFLINE so that the PAS driver can load the
> firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_common.h   |  6 ++++
>  drivers/remoteproc/qcom_q6v5.c     |  3 +-
>  drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
>  4 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index b07fbaa091a0..b0e7e336d363 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  					   int ssctl_instance);
>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
>  bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
>  #else
>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  							 const char *name,
> @@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>  {
>  	return false;
>  }
> +
> +static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
> +{
> +	return false;
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..a11d8ace554b 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>  	q6v5->running = false;
>  
>  	/* Don't perform SMP2P dance if remote isn't running */
> -	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
> +	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
> +	    qcom_sysmon_shutdown_acked(sysmon))
>  		return 0;
>  
>  	qcom_smem_state_update_bits(q6v5->state,
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 808e9609988d..8a0bb4b2e71c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +	bool stop_state;
> +	int ret;
> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> +		goto unroll_attach;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		goto unroll_attach;
> +	}
> +
> +	return 0;
> +
> +unroll_attach:
> +	pas->rproc->state = RPROC_OFFLINE;
> +	ret = -EINVAL;
> +disable_running:
> +	disable_irq(pas->q6v5.handover_irq);
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static int qcom_pas_init_clock(struct qcom_pas *pas)
> @@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot)
> +		pas->rproc->state = RPROC_DETACHED;
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 913e3b750a86..a0830a48b1f4 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>  }
>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
>  
> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
> +{
> +	bool shutdown_state;
> +	int ret;
> +
> +	if (!sysmon)
> +		return false;
> +
> +	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
> +	if (ret) {
> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
> +		return false;
> +	}
> +
> +	return shutdown_state;
> +}
> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
> +
>  /**
>   * sysmon_probe() - probe sys_mon channel
>   * @rpdev:	rpmsg device handle
> 
> -- 
> 2.34.1
>

I tested the series on Hawi., it works but unsure about newly introduced
stop and shutdown status checking why is it required ? I think, you are
checking this for sanity if it is left some random state by the boot
loader..

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
