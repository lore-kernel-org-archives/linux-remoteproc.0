Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C133065C
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Jun 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935494; cv=none; b=Q864ngqRxX1qdhp//HBiAygLwVbRoi2n1c/HdNQSFLF+BcH2EUeaAnSZgfxZMC4evFW6o+Ffb/GG3jzBU/R7oJyhTU1RLdg0vVsWQHJwvjaLOuq4NWOyWhC3lfyPe6t9/Qlh/yRjdFCsZ8XmQ3d+F0AtHq9PdW69uxAtffbDcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935494; c=relaxed/simple;
	bh=eaFmuquwUqYMjCdmuCrnk+F6tGDSW0BaKZjT53vmxgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYWdhw1lB/pz8ObZ05LDnC4v/HFrowJkZXmBo3Fw498wlZ5cLNXTRxRKEfFidQyu5MalqeAqEH0PRlAeWdVI9wxgTG+GvQaKk6FqWMlHAsQK7cSvhSIvCtfu67LNj/Z3yvGB/K/OK6OJdmXOVtpsOW/+x4nigiLEIlqdmmI+yfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAexW0Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkc09QSK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAexW0Vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkc09QSK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFVhc3596230
	for <linux-remoteproc@vger.kernel.org>; Mon, 8 Jun 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZ/ECAxfrtXAV4RHwviGKJYx
	Yk5iU7sPT9ceJc7dl0M=; b=eAexW0Vl0caBPsd3273R0mW10On1sXUSv0djGg+h
	qATij60/yzOfkIHsNHO0gbk0sObowm/6+JwRFYVYMjMrPqEKLEK9a2qq28lRY7tm
	HxZdPmZrUEZD1dN9OLUWF+D6s2SBesxzqUauAMfTl2E0G7DBsNIsWwYWWg1NZKfR
	y52Vr3im3yTPo+zlKhwYxz4omDiXaocUC3li98YJNwp/6cpFHMQ4Z0k8rQ67h/v/
	ksvfGjhlvc70C/2ztFnV75x0ocVI8pkVnr4HmOIHXounuTdwtA5gevgn+q5XR00f
	ZKR9xp+E+yPMeij3o1CbQHJeXNi7ojw1qKkNnBaZuiIHrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9gq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2026 16:18:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so2250914a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935492; x=1781540292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ/ECAxfrtXAV4RHwviGKJYxYk5iU7sPT9ceJc7dl0M=;
        b=gkc09QSKO4Q8PT0j+b/7Y1cnHCYPlMNWxJAYr1ezWItbKdiJbiuNvUn3YV3hnloVfL
         2X5hq5ESBUsMKnELK9lk1a0Yk7lb2e/oEVq1nIPvUVcpgQP8yIAWazZHdScJaqaifKvt
         M4JRrOFDFVc9SUv+Qm2SPlnVId7eGN0Tn/3bEGrVzpQKLQSdQxkQViHvKVrvVqN8j+AD
         PwSi31VQyl7SZ2tlfAevpLscI/xxK7aYVRMEPlJ3sspjeXGuyYhZ9mchIVeYoboy2r0Z
         8uD7RpFy1IysY9HhzBiVw0GmkwFPnXutp11yykePnn0JGzJVU/NnGKYov0tAHDHRB9x8
         HybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935492; x=1781540292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZ/ECAxfrtXAV4RHwviGKJYxYk5iU7sPT9ceJc7dl0M=;
        b=eQbrAUruIVLCW/pjt0wWxwBU0IWtLKmgmdKKriGVYLdgVbCdJ+JAMzq0exwZ6eaA80
         9IP6IiLiieq/10CpUp3vfISHBp6KwactA1QH4m1fowU1CcJ91xuUHC19Sq8SF4U5UxPb
         +6/yJpnmanFa5rEv/HKiTsawBk1MX385B2TcHJgOm3ni6SmaCcqY6m1C2BIXaGJ8NYiD
         rEwKccVep8TUtXoF4+rW98sS4QrdXoqlr4gSU326IglF8+YgRfiIWoIFcBip89Ftc8ql
         ozAU/VQUrAkFh88CrqG5mPS6M/5TpBD8S4f6VK+uMtSiiGYgmFCgsBjAWyEEA4upsOw5
         MecQ==
X-Forwarded-Encrypted: i=1; AFNElJ9D4OzZSuNbokHO1Q96kv4IRK3SE/CR/oQ14Ss54fPmYTfK31qh7xntO4v+dJ4jEwFTiT3FgddZgvZMsSeo00Ys@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBopbIAA/bTbffQKVv66Vv8V8rSVMuzHp2UgBd0DPcczQVGoo
	k0kOi36rlP3W6uzRq/oAmxkzZBq3dTA6lsXQrSPQosEGO28V4zsVHkxFLHKxRnFUbUH6uMCHrKQ
	Z0kShIYrOKt/av493mU9dsGEocUAYZ9N+JEmi1Q5TphvHlpHIylHMnc/Eh0StnSOdfW46zp35
X-Gm-Gg: Acq92OGVvBuB9KGoAIrnjoErvFr8YGfmcdnGmXO2fGAX9QV6XEMpwKg2H2AkVi0E3mr
	yUMyJO77bQmBRfRbUSpZAOoqiOy//z3QEumGUUkshvP1OqU20KikLh8381VT8AnH9XkCkrmF/LB
	/IL1Khd6RWlD4HPEWc+wm7b68r6lL1sBolFpYCcqyPUpRxEG0SfF2mGUlQwezZv8uAalSv1YtLx
	I9KbLkknKS/2VEXEjugaA7QIVZhx5CsiLJd0tTS+IptIf5KcYqe45ukzzeOz7i/QuUwX2rG4n2D
	6DRXUj9an0yK++S4atRTVpMaQYiGTZ0RcXj6yWOFzN5Y/tx6ydRHd0LZiR9lL5MRu0UoZtEkgcx
	kWep8mhjWlnXtM0W2kljBUkMOXGdf3bkJCe1dBeCeXfor1gkrvSE1QqQ0TxI=
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-842b0e2f70emr15840057b3a.4.1780935492012;
        Mon, 08 Jun 2026 09:18:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-842b0e2f70emr15840014b3a.4.1780935491338;
        Mon, 08 Jun 2026 09:18:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17499311b3a.7.2026.06.08.09.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:18:10 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:48:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 0/6] remoteproc: qcom: pas: Misc fixes
Message-ID: <20260608161805.46kf7ktlpibvvxxh@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: HxnkjFaw9OV79N15TyHDc-mUrqujfOzM
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26eb44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ugYh0M8TO3JB3k0A73AA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HxnkjFaw9OV79N15TyHDc-mUrqujfOzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX49lXDbHU5OY3
 2SoFHsGX2KluLBn9OQXBu8CLEWwiYexDL867Hl/Ycr51yN+1RT11pV07h9C8oPdKzL68FbuzVMZ
 B3eKYlEwM96lYFIhgXSeAq89WFIoxv/kNosVRsbBRZkE1MObF1nM+3kyCg2Jz2+BwONKQlpJq79
 h4FXyP2FghaL3enqMNVquuRnvMcWlORDSmkrgGcpUq1/jlpNZeH/4dxGxkqSxz2iI6Og9WvQSc2
 VczRS5Y1fdwLalTottNY/MHO82oDGuuTOixhIEUFBEldMhzuVf2c6iQQcfqey2KuH7qShS6g9Sa
 wLrXna35aONZ1GpgDlOpJj5qv6ZfXOPTGhmKRRJTl74PmvAAKUcr9ONd9jEUg2F3EzDgS5lujHK
 LtBAtCUW6gwyMCA0ZMaRHNO2lB9PBrIezx40Mq59LNKvUveMPZkhEIrH9FFoY5AmiE2tR6YMwti
 nP52KiEBwcetfqULRYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155

On Fri, May 01, 2026 at 12:42:47AM +0530, Mukesh Ojha wrote:
> This series is a collection of misc fixes for the Qualcomm PAS remoteproc
> driver and its supporting SCM/MDT loader infrastructure.
> 
> - Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
>   annotating mem_region fields with __iomem and using __force at call sites.
> - Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
>   consistent with all other release sites in the driver.
> - Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
>   so the DTB context is only created for subsystems that actually use it.
> - Map/unmap the subsystem memory region on demand around firmware load and
>   coredump, avoiding potential XPU violations on EL2 platforms where the
>   region may be handed off to the remote side.
> - Drop the now-unused dtb_mem_region field from struct qcom_pas.
> - Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
>   buffer retention explicit rather than implicit.

Reminder for review and if they look fine, can this be picked up?

> 
> Changes in v4:
>  https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
>  https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/
> 
>  - Last series mistakenly divided two series cause laptop shutdown.
>  - Some minor refactor common code rest is same a rebased on latest
>    kernel.
>  - Added new 6/6 to the series.
> 
> Mukesh Ojha (6):
>   remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
>   remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
>     check
>   remoteproc: qcom: pas: Fix the PAS context creation placement
>   remoteproc: qcom: pas: Map/unmap subsystem region before
>     auth_and_reset
>   remoteproc: qcom: pas: Drop unused dtb_mem_region field
>   firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
> 
>  drivers/firmware/qcom/qcom_scm.c       | 21 +++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
>  drivers/remoteproc/qcom_q6v5_pas.c     | 99 +++++++++++++++-----------
>  drivers/remoteproc/qcom_wcnss.c        |  6 +-
>  drivers/soc/qcom/mdt_loader.c          | 18 +++--
>  include/linux/firmware/qcom/qcom_scm.h |  1 +
>  include/linux/soc/qcom/mdt_loader.h    |  4 +-
>  7 files changed, 99 insertions(+), 56 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
