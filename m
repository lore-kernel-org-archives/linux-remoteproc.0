Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779C3043B5
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767695845; cv=none; b=BFTW3a1QqmiXNEacJfHsfXAPR02og94z6sjODhrYT14+W6AFPIsBxcunWNqa5r6yRFPCjkqbwY7Rz94+kdMzwYSpwRUJDM3hZ81G8ZhjPZfkO2KiWZVDJySKLldjdmJBJ1SrNdSOe+2nhS0S2GP4WSPPq5n75/CK/2c1xVw+LkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767695845; c=relaxed/simple;
	bh=SpPCEiRRsJyBsLER2/6TnZM/FuPOZvoSg7/Q8pTNWmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npWA0GT6iUkxEH4m9xSWyMzWWl883WaV8Q8rkRqS/Zfj9dPjdkeWa2J4sg45J8oZBpy1rS2qsgN9xjO3nQfSOTnNuM6aNDvZH3MGEaY3K4YEVu+sxMTGMS5Og79SUrmKcNudigq1mN2F6xkme7cHhh2nbR+PRsL7LsXSoNXVZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbprwQz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q155utPB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbprwQz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q155utPB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QQqI3214287
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Jan 2026 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qC7lJB8swoLFoinKTAlLV86Z
	KupdDLIULWKfAZx8TnY=; b=fbprwQz3oHTi5J6WLOsNCqfgdzXsyTruqoHUi+0N
	DXZpLIitr/g3WGjkbpWw3NedK/4Y3E48dOiN+ACWCJgDPprUgwj9o5rProcfzvjI
	GofF7RWqV70gOTbKq6tKrrmKKKkrNpMkXTihI256scWvoea9RGhvFhRxa0KhA8Ro
	sE1EZQJdyHZNFcWPg8uEaf97ZeH8/D4nk0NaCXblCkrqvFrbuv8lFO0agHM8JxU8
	jfsroc65nXnj2yf5tGsiZWvmcrPPyKNfXxmZarO7U/OGrBQ5UDZlkFQKcZTJhhUs
	v98GcaO6NbAGtIwjsrI0xeLicIQhBg5Vg+aZ7mpqlwfvlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9rap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 10:37:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so9893635ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 02:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767695841; x=1768300641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qC7lJB8swoLFoinKTAlLV86ZKupdDLIULWKfAZx8TnY=;
        b=Q155utPBc7weoIilfbhsCOsWjKj/1tZ88OUvCPsYWOrD86C3hrv5Xx5sP6pC90SGo6
         h0B9chcH7kDfZiysdfUjrYYgYh7R+wJo7c12z3ewD4gMNK4bNW0p7G5RcBOgyowJwU1a
         RVpx1S6lJiV/d+KrzZkpnJ+ya5Ut9i+9dtQgxgBbVsHEHlYb+r+Ry2d4N1A5A6nNUJHO
         QT2/pn5m74MVVZ6uO+4itgIkZXWgTXCKbqgI0dMHqf58kVcJy9dGEU3+zB5rs8aStM2g
         AQqBduYbz93qOBQ9YJ1oiCbq+xK6MQxi3VdnXhqyTSphcrU0AS6dI32Q1e4vg57PeYAr
         3cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695841; x=1768300641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qC7lJB8swoLFoinKTAlLV86ZKupdDLIULWKfAZx8TnY=;
        b=GW7q342ZCYH9iG6+Mb1oK2MCUny8OV1Y9Clb9Qzp2Hng32e6SUYyB+E7NjJ3qPDnh8
         WCiNh/wbMwUD95BdTw3lCZxdUnaiKIPzl9AT0wW48VRFwKwnXFALG7iE5mtioODhHECN
         f2XDui2C/7ykLHPkB9xf0zHI4EoOTdF236idzFYCQ+wioG+//KaiWZt3F4vycB69ROFN
         pGcqiY0EF33f/RGKW2XemYUwWc2hNJERkPDyujfqg0m4CPn/gQhwVEPws6kMANx/41Tx
         c+iHv+BK8lKiefRkkU/JBCA2DrTmr69NmBPsrPpZ8RU4WMzj9ELhg1GE6Hwu3lAoOgbT
         uloQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsoo0Hh08ZUdBJWPf+B2j2aemcEmax8CKp7cF7bYVNcQP7wrehoWbLre4vkxUc2XZInCmmkQw5ypda62l42LOQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr274+rHf5tPVSV1F33oIQXDCUUcULPNZ9rdUwbjSbh7v5eNDo
	JBvfPOgxSeLWfArTlwGHhOJruwC31xERuBJJSNGvrRyn2MiJmhtl/FxqXM2F/YOkHzSp88yapUZ
	WTajWn3qH8RDklA2RCwtkGFNSci1JCuYbF5pFGHFTzVcDuiF0ikj1Jy5s97hi9Sziq0npy0RU
X-Gm-Gg: AY/fxX4hJsX0bow/bT6eDKw3R6g1DXRkYyajl0nxvaNqLKkK/zmSZYzgT/ptXQfvajn
	ysehNuRdKy2xWKZl6BY/bxm3hGO2bPY1cD+kR/V2p4yYybTCo2xDw9pFoPPGyygC1f23wTuRtOo
	k7Um48nRZI2HS+0N8PTeBcXIHcvb7vrRvffeaL+hbeaUPTgIg355QDtZ5DqJt8oyqqIbZnPg/MV
	bQ1us/x7HAllXzAhyVUlSROCKKp6ZgVtbQvBE6E7kaC1bXezuPKjwXuqW9sq0dWtJOjawZ3fDTD
	8txnMuWHCimOA/2VAu4rTPSR1TVku7P3UetfMZVvwFsSy+EHr3TyjSGfxEd4hjZ6gvnGPvBrrmS
	p4/e02W0whTQhISHLV0i1p89TQ+dj6qBQH5l2
X-Received: by 2002:a17:903:1450:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a3e398ea48mr22929155ad.1.1767695840874;
        Tue, 06 Jan 2026 02:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbotkesE4/jKSVGmk3rPRtGlNsdkZEnw83rD5hjDgYhln7tFXPdJxvpbGrFN6ZQZXVxJwxVw==
X-Received: by 2002:a17:903:1450:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a3e398ea48mr22928765ad.1.1767695840164;
        Tue, 06 Jan 2026 02:37:20 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bcdsm18570135ad.101.2026.01.06.02.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:37:19 -0800 (PST)
Date: Tue, 6 Jan 2026 16:07:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20260106103713.onhn2fpge5mwoy23@hu-mojha-hyd.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1REsG75uY2tH7YDQpx0r9_hqWYkIDHjy
X-Proofpoint-GUID: 1REsG75uY2tH7YDQpx0r9_hqWYkIDHjy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfXxXAS0zY2fpd0
 z336/weVyUgb1jswVxwW2BausLuKWuwUCTbqBmkbc0dsAapzSUwtBa92nRULYGDHeBoqKqzwp/1
 wNyTDLy/MEdW408tlJZ5ZGDu0Lg8JVhflvkirTeD1C0evxpxjgBYBEM0SHABCpsAsVHMuPsvGKn
 F3VHn3pSXtN0zlO8QVAYFK5QijfHhDQLedd7y6/UQ8a9mGfDu5QqYAynbHQiSsME/3LE3NL1IbA
 FknOk4y4K2jSU6XLBs64NcJlXEPN69HKb6ltWX+iHJP07rsS2JPaMPnAZwUuWT+cOWJIMT6XRTl
 ijP4vmerP4KshqqfvQuIHxOwRP6T3RRiFV3YRB+p+Zudt+jirxltw0R3xnuum9OuCdvPtnT5TTd
 dI0i8oUzTotaM5JO7iHux1iT/7WgdeaqWU45W5VNU5E9nhqqIPr8u15xwZlsiugpPOyJub3GWKV
 lzeWzpY3E8gg6xWX54A==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695ce5e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=fYSEttn6UoC9IXRoKOcA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091

On Mon, Jan 05, 2026 at 06:52:48PM +0530, Mukesh Ojha wrote:

[...]

Bjorn,

Would you be picking this for next merge window ?

-Mukesh
> 
> Changes in v9: https://lore.kernel.org/lkml/20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com/
>  - Addressed comment from Bjorn and Konrad on resource table SMC call
>    logic.
>  - Removed comment from overlay file.
>  - Changed flag has_iommu to use_tzmem.
>  - Added R-b tag on some patches.
> 
> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
>  - Addressed suggestion from Stephen which was regarding commit message(9/14),
>    debug log(12/14) suggestion, and return type change(4/14).
>  - Added R-b tag on 10/14 .
> 
> Changes in v7: https://lore.kernel.org/lkml/20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com/
>  - Addressed Bryan suggestion to modify commit message on 2/14 .
>  - Repharsed commit message based on Krzysztof comment made on 1/14.
>  - Addressed Konrad suggestion 
> 	o To remove pas metadata data structure.
> 	o Added his suggestion on adding retry in rsc_table SCM call.
> 	o Added his rephrased version of comment made in 12/14 
> 
> Changes in v6: https://lore.kernel.org/lkml/20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com/
>  - Added comments made by Bryan to save some cycles and added in 2/14
>    which could change patch order.
>  - Renamed qcom_scm_pas_context_init to devm_qcom_scm_pas_context_init()
>  - Replaced devm_kzalloc with kzalloc for output_rt in scm function as
>    remoteproc framework does not usage devm_ api for resource table
>    pointer which is cause mem-abort issue start/stop test.
>  - Removed union usage and redundant code from qcom_scm_pas_prep_and_init_image().
>    
> Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
>  - Replaced minitems with maxitems.
>  - Addressed comments made by Bryan, Mani and Konrad.
>  - Fixed some of highlighted issues in v4.
>  - Added a new patch which removes qcom_mdt_pas_init() from exported
>    symbol list.
>  - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
>    directly while it should use in the commit where it gets introduced.
>    Hence, reordered the patches a bit like v4 5/12 comes early before
>    4/12.
> 
> Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
>  - Fixed kernel robot warning/errors.
>  - Reworded some of the commit log, code comment as per suggestion from Bryan.
>  - Added support of gpdsp0 and gpdsp1 and disabled iris node.
>  - Add R-b tag to some of the reviewed patches.
>  - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.
> 
> Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
>  - Dropped video subsystem enablement for now, could add it in future
>    or on a separate series.
>  - Addressed most of the suggestion from Stephen and Bryan like some
>    remoteproc code checking resource table presence or right error
>    code propagation above the layer.
>  - Added leman-el2 overlay file.
>  - Added missed iommus binding which was missed last series.
>  - Separated qcom_mdt_pas_load() patch and its usage.
>  - Patch numbering got changed compared to last version
> 
> Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
>  - A lot has changed from the V1 and a fresh look would be preferred.
>  - Removed approach where device tree contain devmem resources in
>    remoteproc node.
>  - SHMbridge need to created for both carveout and metadata memory
>    shared to TZ in a new way.
>  - Now, resource table would be given by SMC call which need to mapped
>    along with carveout before triggering _auth_and_reset_.
>  - IOMMU properties need to be added to firmware devices tree node when Linux
>    control IOMMU.
> 
> ---
> Mukesh Ojha (14):
>       dt-bindings: remoteproc: qcom,pas: Add iommus property
>       firmware: qcom_scm: Remove redundant piece of code
>       firmware: qcom_scm: Rename peripheral as pas_id
>       firmware: qcom_scm: Introduce PAS context allocator helper function
>       remoteproc: pas: Replace metadata context with PAS context structure
>       soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
>       soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
>       firmware: qcom_scm: Add a prep version of auth_and_reset function
>       firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
>       firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
>       firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
>       remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
>       remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
>       arm64: dts: qcom: Add EL2 overlay for Lemans
> 
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
>  arch/arm64/boot/dts/qcom/Makefile                  |  10 +
>  arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  35 ++
>  drivers/firmware/qcom/qcom_scm.c                   | 380 ++++++++++++++++++---
>  drivers/firmware/qcom/qcom_scm.h                   |   1 +
>  drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
>  drivers/soc/qcom/mdt_loader.c                      |  51 ++-
>  include/linux/firmware/qcom/qcom_scm.h             |  30 +-
>  include/linux/soc/qcom/mdt_loader.h                |  22 +-
>  9 files changed, 581 insertions(+), 116 deletions(-)
> ---
> base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
> change-id: 20260105-kvmrprocv10-dea2a3f00210
> 
> Best regards,
> -- 
> -Mukesh Ojha
> 

-- 
-Mukesh Ojha
