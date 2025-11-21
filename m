Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80C3451D1
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722888; cv=none; b=UqqqG7MQr0FNlDa7z8J1TQl8i1R2kWoguruz2mNJI6/Au+yQN26Qd6fPQwmLqESWuPDj2LMYPGqeVyR819VBqM3gG+naVdFLn9gRysDHgRgqcSY8qxyWsivi6hGqRQZQcByzoaB0PhH8iDwCj+3jYr4gk3acU7G1YyJWM97jN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722888; c=relaxed/simple;
	bh=0syRGPa2tBhcuS8yaBU/aDfg/wqrjnmb4AHTzhL5kAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uDFXyidFpYiUv9qLm642U8YuN0rnVE23M1K6YkdqufVnRHYvuEERJNKJggmUcrZgTjQzAci2eORcZaaN2ij2yJRzD6sT1eqlk4Vzla3LBlntjTdw+DCIb/q9U0fK/lOtPZTSm5Mg7yaLv8OE+Lp1amdMeaWDHABBzqdiwqKcPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4M/xzHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UARnQWud; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4M/xzHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UARnQWud"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SZfB3541532
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6/NtCfE4eOOvvl6/BrqIrA
	5GDBEKituqahdRPxRKqTg=; b=V4M/xzHN7LMYwrqx2sYjXRcYvDaAMttc4AiyYr
	HQ/ayfnliBUiHMZq/GaQYIDyCjRmc6VYlatzqGE9Ufgpsois1bZjYm8F1jyOfj4z
	hUCF9RQN/j0sKsmFNAg/ESiLOIvt8mryZUcjxEfYXI2Na6Hz6MEatiXIHUabbLs0
	+6mzxLMDzQ3miiSBpcCmCb2mwzuQXc4eCoLOkuAlxz8mQ+1ON0Zo+VhjjPEFM4CC
	Wp90Skm/XKX2VoDU65vgZJIauAkML0ub1LgL0YaZvRcAgBFM1BkDN8HGXHs9RVkG
	a/my0Pb+HXcVJhGv7kccJL74zIEf9bS8sCgQo+TwZ7qRtgaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng009jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343823be748so2097462a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722885; x=1764327685; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/NtCfE4eOOvvl6/BrqIrA5GDBEKituqahdRPxRKqTg=;
        b=UARnQWudTofBN6QG5QlMCYVlYZk0UMxnobXKmd5pJ1fJI6IYdO3Y7h/s2iI/lJOCrm
         RyQxXngs8UehrrvPUNqhaVp5laRudjR/IM+ip87NfkswBJitIWHJXqT8rGmOL5GcLbz4
         8Z+3nC9XKCzPvqCU1vyGNWJrX/C/iA4diWwflarJ3Bc3UBslDuXxDZn0TvwHRgNjlP3/
         geDqkzmq3GxY3251HjHRbfbpot2rkScl88Fx5+2tO++NtFI8gmgH1DAvS2uT/ScVLB/8
         9so2v8uRQlJs0gpP8OtLqwIBKKnXWXxb6Y4e/pDkZv8umKvIfDubaFpwkpo0PuHOaEB0
         ajTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722885; x=1764327685;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/NtCfE4eOOvvl6/BrqIrA5GDBEKituqahdRPxRKqTg=;
        b=dgdYGKw6lTymbAj3WR7dCAt46ZEZM9rytrp14UHNYl3KB/LPx+LAONpe3654DG84bT
         /2o69/IxnT7M0B96m1oibRFvz44xEFWPh5MfEo6YZGC978MSSSP76io6Mj02WmdbB4Gg
         RUlSeKVoHCUt5Nf5uoAjUfdnCjSY9f8+HbChpmi7XYKNipava/n7ufKNVPnIbONzYrfC
         z6Ao7NNISYroDLq/pfiaRWGgikmSQ8j/SDP/WWJ6qaDxS3JgxsCDn6miA+6Fc9evHllI
         9z/JQYQmzztmA5MvvEnSnytxF/3bvutHzJqoT3u9t+gILFAYSqS6QDAQBrPZvZElmG6m
         W82Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYi+7bPxvS93c0zWUK9vg0TA8J/AtkOOVPR15bugDOyqRn/bCZnE88OBAIgBompEPGWLMw6saytLpHZcvHgEwF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPAq7ItH9lAMGZxKmrSIzDPKRlDneM1/BbO+UGSBcZUMqkPrx
	WppnPfccE4OzYyzVBh78zTk6vsI6+3QsAfB5MV2A7a3PgoakdrvG4q/hD3n3vvv2mSN6O1z5Cxs
	1jxarbtxEWvZ82kN0aS+4kBuu8lUpbJnL+p5cOOruKPf1ewo+IPYy3fiBkVM4lDdUsa4wdfgE
X-Gm-Gg: ASbGncuHQkDeXYfGnZERSpXEideHD4bXtpX6U5VvFJDIbNyeCx7UeASPzDjd/M7WFdy
	r1yaThgMTUy1zQlWjeGPr61SMD57rBwNYfBUSAxiOO8rt1H4XoCuLKDGxIR1poabnPstbuIwlLG
	dqLnlHGqqHnDocrN8Xcw/4DHbetLa2SOzkbf8wJVUKGmmiQeSmBUwKWbr5JGiqrVDGKLCoJKAsW
	BKUCrds3dYyUEtHrcp43fuDjDqJy0NyINwD7rQ4SRFhPtCvCBV7lh5An9ayiQ9tdBIbiBixCNpB
	nNKj0ywlPyeCMnTe8Bmx2u3Hn96Q/xpFY65HPahFsdgK6l3YHml/pijju7aZ5gAEpeGtMOJOSCb
	vHvx8K7JpmhI34vW0wKpvvabsKs7YuIi3OCze
X-Received: by 2002:a17:90b:3d92:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34733e5d7c0mr2347742a91.16.1763722884150;
        Fri, 21 Nov 2025 03:01:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4EKY7MSLgTkKfk25ptNCqYPzEjYm4XjjCzOGQMz/G9K8eq3yeBgARKx61LheDDQVki2IjnA==
X-Received: by 2002:a17:90b:3d92:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34733e5d7c0mr2347641a91.16.1763722883371;
        Fri, 21 Nov 2025 03:01:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Fri, 21 Nov 2025 16:31:02 +0530
Message-Id: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG9GIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3eyy3PiigqL85PgyC11TM0MLAwMDYyPDtCQloJaCotS0zAqwcdG
 xtbUA1ZI0kV4AAAA=
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=8178;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=0syRGPa2tBhcuS8yaBU/aDfg/wqrjnmb4AHTzhL5kAE=;
 b=13xomvLMM8Px5pPBQJF63HgN2TCM+0VNqn+YENmhtiSnnH1NXyS8tgC61kaN6e/UDH+OXVbg2
 5fdTFsCgBvvC0SIWDFLKMD0Lmy1fE3Uv95T9TGgnDlM5Jh5qw67ZnxE
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: -KhWSnm6UWKBI8hw3m1joqNT9Y6LuY9c
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=69204685 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=xSRJaIKPBtGH_lneNy8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -KhWSnm6UWKBI8hw3m1joqNT9Y6LuY9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX6vP2YUqLwxes
 fy1uhJC/IAad5tS6/uF4go4SdcDA68V9f7nl3KeVMh/Ah13zTCYiqQkIKMvy587oQkhOp2Q1wtj
 6KHX/voKVWRX/abvDwr25tK66rFu8hyL8IaDHJw2WkDPVKIj88PO8vNtzYxSabpNCIj5ahOK8s7
 sM/sxmKA5EuzHBOSh7YeGmz5LkfkjyGr/HGl3tRFEIS7LG+Z+LszULugYaGfxJU/p8m7scSOCKo
 PW9W81FvsltNWZ+enZqEI4daDnRmytvf9bt9UZEJqHPVG7LU1MsjxKzYRqFx9S+Gkb77cWdbLB9
 OSMb5/8JIJQZuG3NXzh4srqKEM22zjCSIBYToGnl+xliE61JEOVvEgH71/fpVxgl3hNJpkEvBT5
 xuiH0Di+fv15nEnhFZ/4iE9ysNxMyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

In May 2025, we discussed the challenges at Linaro Connect 2025 [1] 
related to Secure PAS remoteproc enablement when Linux is running at EL2
for Qualcomm SoCs.

[1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa

Below, is the summary of the discussion.

Qualcomm is working to enable remote processors on the SA8775p SoC with
a Linux host running at EL2. In doing so, it has encountered several
challenges related to how the remoteproc framework is handled when Linux
runs at EL1.

One of the main challenges arises from differences in how IOMMU
translation is currently managed on SoCs running the Qualcomm EL2
hypervisor (QHEE), where IOMMU translation for any device is entirely
owned by the hypervisor. Additionally, the firmware for remote
processors does not contain a resource table, which would typically
include the necessary IOMMU configuration settings.

Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
Authentication Service (PAS) from TrustZone (TZ) firmware to securely
authenticate and reset remote processors via a single SMC call,
_auth_and_reset_. This call is first trapped by QHEE, which then invokes
TZ for authentication. Once authentication is complete, the call returns
to QHEE, which sets up the IOMMU translation scheme for the remote
processors and subsequently brings them out of reset. The design of the
Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
is not permitted to configure IOMMU translation for remote processors,
and only a single-stage translation is configured.

To make the remote processor bring-up (PAS) sequence
hypervisor-independent, the auth_and_reset SMC call is now handled
entirely by TZ. However, the issue of IOMMU configuration remains
unresolved, for example a scenario, when KVM host at EL2 has no
knowledge of the remote processors’ IOMMU settings.  This is being
addressed by overlaying the IOMMU properties when the SoC runs a Linux
host at EL2. SMC call is being provided from the TrustZone firmware to
retrieve the resource table for a given subsystem.

There are also remote processors such as those for video, camera, and
graphics that do not use the remoteproc framework to manage their
lifecycle. Instead, they rely on the Qualcomm PAS service to
authenticate their firmware. These processors also need to be brought
out of reset when Linux is running at EL2. The client drivers for these
processors use the MDT loader function to load and authenticate
firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
to retrieve the resource table, create a shared memory bridge
(shmbridge), and map the resources before bringing the processors out of
reset.

It is based on next-20251120 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
 - Addressed suggestion from Stephen which was regarding commit message(9/14),
   debug log(12/14) suggestion, and return type change(4/14).
 - Added R-b tag on 10/14 .

Changes in v7: https://lore.kernel.org/lkml/20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com/
 - Addressed Bryan suggestion to modify commit message on 2/14 .
 - Repharsed commit message based on Krzysztof comment made on 1/14.
 - Addressed Konrad suggestion 
	o To remove pas metadata data structure.
	o Added his suggestion on adding retry in rsc_table SCM call.
	o Added his rephrased version of comment made in 12/14 

Changes in v6: https://lore.kernel.org/lkml/20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com/
 - Added comments made by Bryan to save some cycles and added in 2/14
   which could change patch order.
 - Renamed qcom_scm_pas_context_init to devm_qcom_scm_pas_context_init()
 - Replaced devm_kzalloc with kzalloc for output_rt in scm function as
   remoteproc framework does not usage devm_ api for resource table
   pointer which is cause mem-abort issue start/stop test.
 - Removed union usage and redundant code from qcom_scm_pas_prep_and_init_image().
   
Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
 - Replaced minitems with maxitems.
 - Addressed comments made by Bryan, Mani and Konrad.
 - Fixed some of highlighted issues in v4.
 - Added a new patch which removes qcom_mdt_pas_init() from exported
   symbol list.
 - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
   directly while it should use in the commit where it gets introduced.
   Hence, reordered the patches a bit like v4 5/12 comes early before
   4/12.

Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
 - Fixed kernel robot warning/errors.
 - Reworded some of the commit log, code comment as per suggestion from Bryan.
 - Added support of gpdsp0 and gpdsp1 and disabled iris node.
 - Add R-b tag to some of the reviewed patches.
 - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.

Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
 - Dropped video subsystem enablement for now, could add it in future
   or on a separate series.
 - Addressed most of the suggestion from Stephen and Bryan like some
   remoteproc code checking resource table presence or right error
   code propagation above the layer.
 - Added leman-el2 overlay file.
 - Added missed iommus binding which was missed last series.
 - Separated qcom_mdt_pas_load() patch and its usage.
 - Patch numbering got changed compared to last version

Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
 - A lot has changed from the V1 and a fresh look would be preferred.
 - Removed approach where device tree contain devmem resources in
   remoteproc node.
 - SHMbridge need to created for both carveout and metadata memory
   shared to TZ in a new way.
 - Now, resource table would be given by SMC call which need to mapped
   along with carveout before triggering _auth_and_reset_.
 - IOMMU properties need to be added to firmware devices tree node when Linux
   control IOMMU.

---
Mukesh Ojha (14):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context initialization helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |  10 +
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
 drivers/firmware/qcom/qcom_scm.c                   | 368 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 166 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      |  42 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 577 insertions(+), 106 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-kvm_rproc_v8-5618000321fb

Best regards,
-- 
-Mukesh Ojha

