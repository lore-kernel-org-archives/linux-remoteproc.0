Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7233396F1
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619398; cv=none; b=kDcvnstGVuawPDGKC2IgkBKWtSFU2FZhuGkiDvIHYWTginX5gHd0r8fnKMzD5oitFCVVAv8mGRQ6goIeLygVYG8SyH3zPt5p8yV91JnlHX3Vikmr1lMajWUsDAoHtaKdCELuyfZZx8qtvzj7kukrOIC4Q5NztiO8ovVDETSU61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619398; c=relaxed/simple;
	bh=XO9dtpMgjTtcaHVeFmCrBasnyEBHShq9gYcex+Vkow0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hPhD2N5zXZP4GQeUYsC35aOF70Q3WPLCINX3n+8yi8o/jVGnjGQ1nDWa8gR7w0qthBSPYewHoj+/WF/i7jgF48xOTXXtybeZXIAuE66atO5+ITAtqlHej0O0crCUhuKQ+4PpuHI+h4ZDIlwBWrmEYNaxTXb3LEY3bz/Ht7YsSgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ih/9nW6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USiuV5ww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ih/9nW6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USiuV5ww"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058bSGE1216101
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P81WC7ZNtAwMJfbRlEu9DA
	+EvPb0KUzaALFdaIGqG9M=; b=Ih/9nW6z1xPBnDizYld+FFEUtqiRQu2SHGx7U0
	o9dSdDzRONh6XE1367O9s4oMb29DfPYIx995BC+O8mdpADiSkOFsVqQZejDrJ5Yf
	hmwdk7GbnMoXEDiIZDlFUOOQ1EiQUAKwwZB4mODXxLeGKlqk0qMLh2JyI/nyqmya
	eZhoiGlYVj5tgPY/mbTL+oOEopA4GRX6g27vYA5W2h+ixQWYL70QVWxAsH58Q17l
	sg01+o7zQ5pDumvtLkW47BWVQXmeL9fIcFiHtLpVoOpiTenghwlnG4mobO4LQDAj
	rT2I/3gKflyUbm0RT5uBfIIDM5heHnvDk1IIVwG7CbbY1Euw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hch6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:23:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so15119134b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619396; x=1768224196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P81WC7ZNtAwMJfbRlEu9DA+EvPb0KUzaALFdaIGqG9M=;
        b=USiuV5wwUUf+h6YXGpR9oEIGwoD89zoH11CJGfndgm3a2c46rPt/sMfnurD26fOHtZ
         RJKh/nyahy3CWzngKqK+oBG+eBr5URqpY5Sp7L1TT1hT14hKvR4yAzxrM/hqExQT+X/K
         iifqyN3DUVVhVALJgHFSvxqQX4Bj/54cX7pYOdiQeYkHCWLrnIHrX3AmaljVzxsNwcg1
         zYd2pl6w+IlateyiLcM4MM99kf50OCecLm1GcKmcMoIw8aZEIlPiH0hygvCsAJ4DhmNc
         VMGbeVKlwL8fFBse22hXPri7RvCTdVqSoc8LOuKIu20yL0fKx8ZahN9QH8BX7NIDTCn4
         6n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619396; x=1768224196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P81WC7ZNtAwMJfbRlEu9DA+EvPb0KUzaALFdaIGqG9M=;
        b=ZI3NJX1Zn30NvoNZhS4MKr7A5X8JpnUaac4Mc9TX27UKNutU5M/mCTK8iJwTvCGaRs
         oe7SiF5Tb/tSNhD2yqA6kYrscZx6kehLLV7IA5GjjVbeupdbV3PhViV4G35hFt3Je9nT
         XOijjwp4Fla30ef9nbttnGreLjLkatgtsoqdAbQJ4v1aQnHaBPgoZiaosdZ7EuF9+JMj
         bddFRzpkdIJ3BDR6/ohbcSiXcfAkq0gyAlILAc19BsbtZ/EwypCHhi8D06BYiNSTQWXW
         a1OgyrKrNYT7vfEDkfEotGXoK90Ir7HxTKqQnXc84NNgMGQyleHIjAXPL1sV2RLUYtgv
         JKkA==
X-Forwarded-Encrypted: i=1; AJvYcCVW50hjSai19lSfEp72b/PJr9blj7qEOliZtt2nuQRZOei6kxzyBoGTAUzUgDfg4vF2ZPX8z7lv8HVGPW75P1uq@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBe6UOaW46sSTr3EmONsNyOSOgo+YTaNLdF/rVyfXitvJUsKP
	za7WJx01O9d5IOPtlS1wEsZkOu1n3rjA75Z2hUtesADHv0qWNE+KGUUgiAyZk53/H96A/F7e7kj
	xsAav7r01p3z8R8jE5J5mx25aXj4WLgnFM2bNBSDKNmuzYsrGymOGZry/Zz9ASEpsEtp1Rt3I
X-Gm-Gg: AY/fxX6yHcVn5boZg4GxhxfRpkILTNLgjJKOYgvQKYUHzI9/9YywsyDwq3lcQY1WiGv
	280QjXhFlWihU+oaQU6yhDTMgdztRsu9nVkURNSrP0XPOLH0Y1IOQsfCjIVr1hX+Ja3GM4gA9g4
	3yBnJ+BiVyn/MDkUyXnbt7bMc1Mkd6aXF99A+TrMaJQPm19LCRbYci0XIZsaaYZdeRmGXahT/AZ
	Ib9b72nXc9aQnnq9vr7IbGSvCNqp0kVTHuwzCdRf4Npe1ykONQMkUmu4D3TpgqPZOqRcq67BJfL
	GAzUT+SznwHB1LzPcsMcKLEe6jgNyQJ3GF4hD7z3HsbGqD5vVKlZ7p15KA+4+5+ZgYXL0Bux2Z8
	jEspe3AyNc1OU2J3k6zsJb9BecAw1O2aIz5d0
X-Received: by 2002:a05:6a00:4392:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-7ff67258ed1mr41188351b3a.57.1767619395386;
        Mon, 05 Jan 2026 05:23:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIsqavD088i1Iim0E+NPtzZWQumAqOixg/YwN0ICWmB+gGHvb3VRkxmzvQXEE0y6hr/ZQ8vA==
X-Received: by 2002:a05:6a00:4392:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-7ff67258ed1mr41188313b3a.57.1767619394675;
        Mon, 05 Jan 2026 05:23:14 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:14 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v10 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Date: Mon, 05 Jan 2026 18:52:48 +0530
Message-Id: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACm7W2kC/x2MQQqAIBAAvyJ7TliNOvSV6CC51hJprCCB+Pek4
 wzMVMgkTBkWVUGocOYUOxgcFOyniwdp9l2ARTujwUlf5ZZH0l4Mak/OujEgWoPQi0co8Pvv1q2
 1D8usHMZeAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=8761;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=XO9dtpMgjTtcaHVeFmCrBasnyEBHShq9gYcex+Vkow0=;
 b=por/lF5PCCaUNhGHE1PTRGmPObMkOV32eumstzRoFMfxPpBpp3nyT667g6BpNW8pTT09qnJJe
 CpgIU8nlvk9ACpL6Jw1WlWCTf7/Fmoy5vWpWxARfeG5kb1rr625+aOR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX2Act0xskESao
 SmigHYRtMcpFGG7KL9HgSfQuJ10aA0O+bFNnRE6tQJYX132OieDilvWXq8MCg/w68njMymaLnnr
 kSC9yQ+tZZR9dqxsQSpuGVQpT5gc3V2aloA7BhnXESSYPxgi/r4rtZAeOYId8YnXKhTnjqzXJjS
 xzx7t6xhAozTyUtJvzxRK6oUceqtneGhzy8KU8Cn6s5zJVS9k4IgOPV/Pp+QMmBjObol8DDe7cH
 +X2WGgHzFewK8DqYNap/RmrSZxom/XQpAPXeDFEOyCEBVN54U5Ofq6cbo3g3Cw68KIJraKUpvBF
 k0nyGFLipeg7KnZsVEX/Yr1IBn1kgKKOwOoi+QindmRNgmlev2S05rhqTWBKl5QLlQ3dInqBPmh
 BZeCvX5QjepPvZhajOa/SKD/xykWOxSgTe4MqozsH1rM/L61B38PRkh3DeKO95OjppNVDP/fvN6
 D1UWIUgUPFfpqiwBKdA==
X-Proofpoint-GUID: Oo-HpPRcCsF5itqXJD-iZGR2ROSXWOA4
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bbb44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=xSRJaIKPBtGH_lneNy8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Oo-HpPRcCsF5itqXJD-iZGR2ROSXWOA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

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

It is based on next-20260105 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

Changes in v10: https://lore.kernel.org/lkml/20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com/
 - Addressed change suggested by Konrad on removing while loop in resource table SCM call.
 - Addressed Bjorn review comments from v8.
 - Address kernel test robot warning on doc.

Changes in v9: https://lore.kernel.org/lkml/20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com/
 - Addressed comment from Bjorn and Konrad on resource table SMC call
   logic.
 - Removed comment from overlay file.
 - Changed flag has_iommu to use_tzmem.
 - Added R-b tag on some patches.

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
      firmware: qcom_scm: Introduce PAS context allocator helper function
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
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  35 ++
 drivers/firmware/qcom/qcom_scm.c                   | 380 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
 drivers/soc/qcom/mdt_loader.c                      |  51 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 581 insertions(+), 116 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-kvmrprocv10-dea2a3f00210

Best regards,
-- 
-Mukesh Ojha

