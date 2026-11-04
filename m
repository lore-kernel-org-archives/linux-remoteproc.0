Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801026;
	b=rIRXqUD3eNncdq2D9vf5/p09WXlZvEj3Pmu6GDUvIIqzh+IyCWD7TctRApsU8z0VGZi3
	 wBw2EUPz2zHb4gO0doBrMoyrTjOL7fDfVyDW6VfV5KfeO5BMSRwiRTvP0h1fqGpq0n/ly
	 GK6IrJ2zG8brHzlo3ws7o/da2XPmcdDl4+nSsX2ZHtZJibqlJVyIaDjjBE3PFeEvmYzah
	 ppahTlMcdyMZFDLK2SY49UP0RxcnzypKaq589z4sWqkg2PCtGs3V+pajYmQ+0guT+Zt5N
	 BAucVvYjf9PWYpsiuJyEC42A9Jv5QWANYt9IiXRFjEq2AHEfvYCy3x/kl4SUhsMqJfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
	b=1tGXenDnH4K1HyJMKT3uGbS2l96utZz3RQVdAbcoalQI+8REL9uarYrqug2/DV0V4AT5
	 JBJXYx629hvjFD2MC3kM1YFqOhfC34uwvSf/Zvi/KPktGWLA3HrA10Ny/2NDWOWrvc8p5
	 Bs1tV/4umZ/GIVInmxU7+9HoNI7w2ObviOt4rR8Wz9iD7bFFF0TMy2mmxTs9HvliDYyCM
	 b1W1p2G1+GxpEIIjq+OEh0ijxKAAbD4tiBy8nPA1MmlcuNVSVovTeyDZEzl8DxXOa1239
	 G5Vu0P09/I1/f1YViUhGb6+oyJ0vGDHKtj4fv+F3hbX57vGJLcvcilpAmTQYeoVk+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jR/uLvhZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5NN8Ql0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A5606A335
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 14:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9A5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR/uLvhZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5NN8Ql0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxOh608499
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 14:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zjTT2oSPpv6GIMn50uchi/
	8d3fk9ClR81FB3L7DPO8M=; b=jR/uLvhZcgZvaBLAQXAqTXCiQddR6Vd6uoVkAG
	xoSsqexEFOFeREnbJMPfMz+Xc1NFaMTVZg407tTXyp59EsDMRR15JQIYE+y0cIqj
	6HYckZuXrYnsfxtQnjZghlnt5qjD1RKmbSU2eEKSlC9OhlFG1ztgeaP17ikaUOKl
	li7TBHm9GFtTrfR4zI6wIavwVYrHp4Nch3qX8mEvJ2xgeqrsI3SS2jRHavCfXvr+
	k+daqgBmjfW6EwZhZwEoE58ewrDT1xPtFrqITVKCNwM0UG37lYG8T1qvbCClMJ+T
	X1iH6QQmroyhq6hSdWZgrFJj1HySzHDxzmGstY5eWXUJwUvA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80kqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 14:03:44 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso1079865c88.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801024; x=1794405824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=F5NN8Ql0eCNYmahd3vOjNLuAsjr8otSO6hTkgYM8+TyHHrTGHuLGrMeqBydNB5mo74
         CWRXVL0HMlXR+/v8WjDCW+EXE6HxBE755eyiEpIVQ8cdfqYXJgpHh+jqfr5z0bE/6oTV
         g7AqGd52sBR/303wxZhAH20H9ehdERV4WZDyCOpTJXjQ9YYJY0dIsnN9IWVaeXB/VeWq
         KGwb9Rz8kt9ybuxHowAQ0ovM4Aa4IiNEsHGtMT6yh8Uq4zsiET306goNue0Z3J77ivgG
         MHt1UyHWQSi9ZgTQpUN3ZDz9/+Qn7HPLTeEyQ9QCA6gtiL6yjrdlp4ZQCJaH6pGS98Ww
         uiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801024; x=1794405824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=ybVzLjCse7Rzc+0/N1u+PB7Ez3eGLLKyfRvnDY/s0xqO8pxj220X8odOH1ohpliF3Y
         mmVCRGCwR7n97z8dIa0PnFJCoBWMIQ16to96QjKitgPpChDGqHMyHuMbwXmyej8Qx51W
         ObPz1VoMZVzkcm3aUcZ/sph0M/6FvPFGUemvJemQ6hzBqfeZ5OytOhW0FkRKSTIkDHDM
         pu93XkV7sHVHNKHtwl05wpIrP0/rCiS2UYx57pBnwIhD/cUMrzYw+owk/qxFb5SEojVZ
         iZEBSZDa+WGeXDKfLcTCUZbVQCv0pfD+tMhKdAF3J2LBBUZxWz9UC6baPaG7Hkp4PfSe
         Df3Q==
X-Forwarded-Encrypted: i=1; AKwUvByLSf7ACt3G/EQrNK7a90HGTiqI9mFpft/Bqvq7FdV1h14MSVPiKnh6LYyxpsQe4U2F681fDp5K6Ov/GCC0bAnl@vger.kernel.org
X-Gm-Message-State: APuU4Z+4ORuEUxMFF255cPb3ZnvDtyjn72q/Hsy/TNBdVptFHkLLpXVi
	P2X55Fh2kG+joQP/vyilAAs6cUQNSRG0Yk8ygJOJkb2xccqZZEV0YQnTllwEj1iIOH3ciX2BSFU
	MtTVJAF6E3AwkuqEG7E0yLKu16vx+6y3k4s17Sbn1/Ie9M69jywNExFkeEyg2Kbqm3XwupVXe
X-Gm-Gg: AYBFou0599BNuPv5p5m77RMwSvisugqEyp6FCrVIxrFmJs7rPeg09BFpAbKuUgSzrIH
	0drlqOYAiOG7iTShlJ2syCCqmtDyQb1zkyRXP/XgXEgWYAF5H3WpD5pNC8EIrsVgYYMFbSqqoL2
	qa2RVYmCpK5/JD5M9aj2RevGxXM2nY0ksxSEmyBmfi3U1pbuCw/8IVasq0XxHlMoTgwpw8fm6D8
	mefe61WsbH36OY99VH2/UxTnS5+UR/IQmilIYTDTG0XCBHhDkGWnKlAwo1p82mQ4D1neE9A1oLq
	+XwNa1YMkUvWNBNrIjLyXK1WeEEh4Cz4/TWXThc+9c6dh/131KpgF6FMs25IDuBbk/SpmbCJ53J
	xCk3+F3RLadUK610FMWxk02duFvIsztNfypNCwoYNUUiUqMN0jQ==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39770048c88.29.1793801023155;
        Wed, 04 Nov 2026 06:03:43 -0800 (PST)
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39769937c88.29.1793801022222;
        Wed, 04 Nov 2026 06:03:42 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:41 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Wed, 04 Nov 2026 19:33:29 +0530
Message-Id: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADE762oC/3XMTQ6CMBCG4auQri2ZtrQUV97DuCh1kEZ+tFWiI
 dzdwsJIgptJ3km+ZyQBvcNA9slIPA4uuL6Lke0SYmvTXZC6c2zCgSsomKahdldvKDacotGFKoS
 WVlgSBzePlXst2PEUu3bh0fv3Yg9s/m4yA6OMQl6WkPPSGMEOfQjp/Wka27dtGg+ZtYH/CAJWA
 qdAK9CclyiNQfwjiK/AAORKEFFQTFe5yIQqpN0Qpmn6AJeBlGcvAQAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=2786;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=L882II8VBUM+EAwyKEsaOTPVGKLyZlUm17EREpF3Wxs=;
 b=Ua1vv2E0eJ2mz52U/dBlpPOF70UDWuhhQ2vbVLFm/WTlaKZSuJYv4hSRnpB2pEreSNBGnUnqo
 Bwln8nBZ7FSCoZRXZVcOCqkoIwFEUmXXSsckICMuAZRhPe/3pNcZEG9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: aTTipjhVGvjduUrLjPqLrRY8V4zyN-5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX9JdFuvi38oJf
 mEL5E+RjwH6D6PbuKosy2SFc+gIKqmkP9ODZ++ZvGKgD+uFT2MT4wPl7B+j79oaN+b/4P9Hj7TX
 G8G2+q4QqTjfNfoavDIpB5+769Bqaavzb+6Jymx9uuVwHrLv3mfGyl6AHBM/v/2o0qlBJ4zaKJq
 u3UN0N5JirCSaPLwGVXhXhcBax3TXfCe7zwnwt+BJWb3IV8TZvwLQ+n1Oy0aKwz5MrTpdZpbHBy
 dcAusHM+kuQP2KCGhyknCQ+hbDmiXMJ37tUAbNYaUowE6XjrQRPWvHrytPneCu7gJrU7n/VXXFy
 Q3bj9igT9FZmBpv/3C1NLUU0JBClZEzxFc+8wEb24PoNWZOlGNGgCwRptPRfyO0wd5dl15o3NFc
 ObkbbLmQnn2oMOus6GzJAO/1y7ypkaUV9KVo3LPbG9LFi6kvRGuRhRVAVS6BnVSjWepdaEwvZNM
 7EXgUJo7ZqopfUo68hQ==
X-Proofpoint-GUID: aTTipjhVGvjduUrLjPqLrRY8V4zyN-5P
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb3b40 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c34ISMXoqBeJqo_8tdQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX3q47I5V4j2Kq
 W4bDzynv7/akyGorzqgrnqdHye9qCplFtM6EPzVpIqUS2m+v/CBACwpWRtIwFkX9CHzW1yYzk45
 N1ayruBjzrOFZfFlG4H/IwQH51+oNW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 7 files changed, 75 insertions(+), 3 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

