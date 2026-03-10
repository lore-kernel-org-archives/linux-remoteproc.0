Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA43AA1B1
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113794; cv=none; b=lpJ6oH+fOSVWiC3tmGq53q4oI3JSufjSsnVXuc/CWUJpneplTQWvsJO0b7NlGKgX9V9gyprVB7OfgPxIn3EqebXznmSoFsGJn1VXlhejx2atOe0oZ+54ax+3OaQV+89JH8ySwh+Ajrd0bgfwCHaIfdx1ERX5c6YbxrZoVanm6II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113794; c=relaxed/simple;
	bh=UZqsG1l1FYP/qw2Do3iyUOeOrDb1Y45bUAV0oMsrKOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rlI4rJqaIiiG+8Nib4ztI2ipIKlMlPlvPkUqJF1W/9HUe4vmsOsWPvwzjFz70SQyfnuelMjxvdDn8PN0xVO1IqVofPNZFtEspP9pBXqLvY87Nq5I9Wvv8/2/ZEtRPIYlox6m+cibo67a+/omPMoXv8Dr7J1x/gcbMFXmUhNstA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV4HOCde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c26nDL74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV4HOCde";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c26nDL74"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EDm83754541
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2f
	hcq+4PYU=; b=FV4HOCdeTAj8t4eA3hZ0uvgTfWnntoKaPDZ4yemnxLvhjkCdK9J
	O1IhT+Ip0X/4Zwean/1OHREXCucQ8czKDsgpVxTRzsSf2RKCreYu/T1H3U+pcfoe
	vijt5txtxDioasmjANw/3eB3eli6xbNixxBzJ+TelEWoAs2F939wTePstw7iOJ74
	uFh3qGV11FR7lPTGZai5WYLHHeO1m4lsh025qMvRwn57Y3fo3ovRuYNOJSpca+lm
	FXqVOweEEIXcsmxVuP0IStKqiCXsp91v4CE11TXS9/fKzkgRiG6eoLtkpKofjjVW
	tvVZwuaY2m0qXNcynprgnTIBJkB54DlMuaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477hadk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so11874577a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113791; x=1773718591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2fhcq+4PYU=;
        b=c26nDL74BXmNisCf2ViEaNAlkCGEjkNnEC+s1w6Zny5ATVjUous5iLZlZPqprennfm
         a5p3IdhePHatno94uGbXNLg9lWKCgzQ+EUzjDRsdXb4dSFzT/WNVahmuDGOgCTmGNQDi
         q+spXMSNfzH0GN18nZNh767icGLqOIJOQ5tC/+IycKoGiDdFRGeceu5E9D9/zK0kkInm
         NnsNTLg1aDjByB25Ku9SekmoUrt5HLRWRii8gLqNywVP4MFxm4lGvt/KbvHaXZdvWg5V
         uGy/qb9syAIG+0zh8Up6+Ye2B6lpeSNdf98mudP1J/juWYP2LPa77p3UnP2y3jDGXDdq
         uVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113791; x=1773718591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2fhcq+4PYU=;
        b=uCCHDZeZdqaxTGBTWK/CIbmDqHhT1YT6uTCRF6c0Fa4xHKOLj8pTOY/5GaqjCFa6z8
         7nacDyp1bpn0pSLsvY0LRS5O8VvKEk1PUGVr79brhc5yFTcXhBSIHjVzXEVzQVPJlu/9
         Rnl1XvavAUczkoXEbBE8nJYFPtBzsx9yvfcuwdMsgc5P8UbDKI87lm1wKb/3LxTAsPJd
         zOU3Ep06Q9YjXDpgrH9gZgCGJVLB0nmaT5eTqlLRpiWjiYkcWWCepc+qkiUXW2fwKWgu
         IuB8FJlzC8v+NKOiyqEr6zAQ036COQw8aFngKGo+C6H6Tr8Cecj52FR3YWUU4choMmW3
         68gA==
X-Forwarded-Encrypted: i=1; AJvYcCVx07NZhnX2+Hpd5onw7g/N2aYxQ4BNaPDfWw1lq05J47A68D2FhuRwMWv2ks5ypfO+70u4Ni1zhAz3Vh77MCD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgyOGZjtdMbSdzdX3ext3bDiR2fBeC1IUul45MPvn1WWO8mW6
	1+jlevt4UE8H2kbmSbABmuvNTUjPXKyVzoAONDWWERhEWc/pPZqvTLejgN4KANOca7gWxoIT1ja
	GBYge4bwhJfSLIBApYmDz9D3x8LuCP2Z8hhqnaHRfDONrNF0IhbnEQK7w56r1hKV3HTF23PmE
X-Gm-Gg: ATEYQzy5bY3zvAkOWHt9e28HVQ+XcGywNH786QRDNCWsMeTFg98PMdL+XeSItBM+p4y
	tSprXAaSUSKufwbeRaQAlz6TtJyxunFTneBT8YTcGE7p8kf6DlcnOrSxS0+ojJ0nNK/RNm4JMcO
	5d67SKmfXpXr3uYTn/IRT40zc5WPiKWzskm8f6MQVWdk+SBwJoj2gC105/ZU2/Ga1U0kEEXEt2q
	bhrHblH7UPnuBSrhLhygb9YrAQeccgKe071HnzQIsk9JvGnDiDuvQ7jqe8Eml2YsYyDy6ovgnlc
	Nwm9/Bx7B6c29u4yF8maLJ90JRdQ6aoEFMIXE4fRkK1Dp4oYAwenxlB1ZOtJgpg0pDYEmP7U9SW
	ThpEVfsyhY0bPU8O0aq9STVQgNn7IDn3pNZTBf01Y8t5GJqaWe/0kEA/OuMiqu+Dx4kc9gaKOZz
	KU5EJW+W8oW1n7EG1RMk7yvLVF21ntMTuXg7Vo
X-Received: by 2002:a05:6a21:71ca:b0:398:6e6b:da1e with SMTP id adf61e73a8af0-3986e6bde4fmr8743082637.28.1773113791060;
        Mon, 09 Mar 2026 20:36:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:71ca:b0:398:6e6b:da1e with SMTP id adf61e73a8af0-3986e6bde4fmr8743036637.28.1773113790591;
        Mon, 09 Mar 2026 20:36:30 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:30 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Tue, 10 Mar 2026 09:06:12 +0530
Message-Id: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX15IjTND1lkni
 7HieGoNSJ+nYndZeel3cKWLrNeSopniyIfZpTWvwdvvEeXEJDB8a75tiaVOB2uQvp16pBm11FFq
 auMj9IhvNDRn4YiLa/g4Ls4YxlYKW82b9rQc9nYEQo6eLs95tKfp4VBdG3ThBxgMc5M73MBmpNi
 4X9HsaA18BRhEMlbJwi7p+Z+n82E2g3kWjBOqZeLc1UYABvNEEqOCPNv21uAH933WxUg8Ptb4fD
 1e8tL3imWu+OPv2K1MHbXaTWuv47DCeUO+/ur+w1+5SKFvuNbQNukpvP2x+GumBz8HY9HhmW0R9
 zqUIIu9mB165JN/AnvGQllAtqM8gUNiWSjznQn/K+z7qjMek2jgElSALiZ/jOxt0JJtJtACytqB
 RAETY91pCqPw10PkYtZJttYMaN+MpfZCKD0jQ9z6dVYT00/AOiBCGw2jAqCebohwsVvrc3BjjwD
 a/2QR1pkCgaZwwvtI2Q==
X-Proofpoint-GUID: CF4L4wxhDDoTrvs0TKUossskmColbWBW
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af91c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s31CYYquAgwWBkh-MLYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: CF4L4wxhDDoTrvs0TKUossskmColbWBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
-Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |   4 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  14 +
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 286 ++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1

