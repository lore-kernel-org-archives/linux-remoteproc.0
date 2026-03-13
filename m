Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54734D3BF
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403722; cv=none; b=WRYugOZaXEJkvh9H5foHSGt7LrvdFlg9QXb0SQI4UJRbEdqML0PjOAD5dCLilArXSAsvfUvepw2Iee3qPdX+sszftmJ1syvRnUX2IzWGnxdYD87XH8eIem6IP39dnCq60LKEYiecJiN1lxBZLz3pcpw6h1rzINoPdxE5WLY66cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403722; c=relaxed/simple;
	bh=on41Xc/5ggRLAfRW+zrTkrut7mTjX4tmeojgEOjuzZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HQbkfQRdOA6e0vt+p7ficiHV/81CCMVcNIsfIk8cn1i4nFIyRa83J50THSsVheNITJegKnQjKKkSw1BA90HObKVgQKov2vTIMLkQK/ghiurL7Oe2ItV/GUaLTyrfETTWrMfKPYJfmXaeosqeTK1LEDCB2Sh2M5ymPMWWV1S8pAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcyPdW7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Il186JXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcyPdW7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il186JXx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oSQS793119
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfA
	EqWAQqBU=; b=XcyPdW7PwRzUxdImdzLrJpali8nZRk/vNxl+gBFJaylkCeLHmsn
	bkUOIs0IKBB16FkZp/bdsW/kIZXz59PFr6Hpjt/8CR50A6CbpSqOmN7dB662LDf/
	GDfhbw0m/mT3CJdNIbsG/fkmFy2PPwqrBlYa9zKK1OgvIcTQ+WIXJP89UIg2Ln4Y
	c9hbSFrFk7hik9eSmX9vPEsL2DyEgJt2lpH7CrDhc8dCNSbBDLgXYwyr1HxSQ7IB
	Z9PysOBXEWsBL3k/2l6vG+7U0+585Wilh6B4BRijl9MOMQAiWZG/Lj+UFVk0qgfG
	ETsWtZgbz+MjMbfkBc+To49om/c3torZjcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt12y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so9002434a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403720; x=1774008520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfAEqWAQqBU=;
        b=Il186JXxzNX1BGotXFOsv1mOKMW2BGr3JCvapAE0u9yuwKLu2tFTsWSWZi7kJp7kqa
         Ww7VI+/MIUv6d8sqkhAsoAXO0iH4vDB5faPWoqdQ0AfhbQMO6j6ZlSs0XATtS5lGSYJh
         oVKnl1QbUofhG1xefbhRYT1+FTVrKrHN6XumnupK0OcIXJwNrvDYXLiYCEEV6zb5hfXi
         S65fTm6wnDnUo8ihMyNJUVSGCp+GH4Yv9WE8xn3wdvXtA4vf8RJ9JW2y6UBJ8xTQqKvE
         9f/CURvvp5ZdJERW24GNtG2zzeNDjTSLg5LZPYrZSMXVC5YdDCy1l2rqBGXJYNoDjb1f
         0CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403720; x=1774008520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfAEqWAQqBU=;
        b=ccRkoaXIsYAqyyYUUYZM5g0DA9rhurBYkK3qf2O+iscjNCaC4bONsxcNI6MTQ0B0Zz
         495f43KUaGJQ41JQFbSuXn5OQtRsmMk8m3PIzypfCmgl8rJ2PwhV3085QdpbCGCsZYDM
         KeAlNwNGOyVBpAXvimgh9M3pVfc6/jk9WHn5H5g/QrxHaSf9lWGZp8wTYOVsdcUyIG0d
         lk2MHqjRF6wDHXwoVS6LzSeL2f3+I7t8dwgAVL6z6gS4bzhIlPpcBT/t9B2CGVKlBikG
         ZEGtyAElv0mMBn+coKopVo0+C+C86deQmtGTsYx+uuuXswNhOZktgxugTDvUWQ6Od8kd
         BjXA==
X-Forwarded-Encrypted: i=1; AJvYcCWnKi0h2oOdyWw9Me15zGuxV1CmAnTLM3JASeK0wA+fGgTHk8hBksg/uWATfn61E3BzGvHM6LJCvOCdNXyUeUHX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aZuO8/I4pB5I0SFEpp+ylhWnGlRLH3Ecc7WD8CVk77sZ+mRT
	K4qp4Hil/ma22zBaL5Sg85DjDGayFH/Hj1YIM6Gam5ay8UQHeR6gih4+qBR7vQVKKwniBI9oMMx
	LOE0wfPuEtUumeqbYPmAQacvDi7R0z7RtrvXEEjqs6ZtKftWKH6uEr+KM4xM6m8VNV2MQLMQQ2c
	kisZJL
X-Gm-Gg: ATEYQzyRxf3ZC9gz6ma2pAZjND1XhzZ2Ib8FMnZ3hTqB9t6a+ohyyvWT/yN1Oha1Zlz
	rKwMtBOc63F073bNnhy4a5sWUfANkb/1WnV6Q4zot7g+BfP8PTx/fq2SxtnKqwkhtj72dM5X7ge
	0CWw8eszLyugdguJYhCbJEVNfq132jaKAQWjup1T8sIPWfxC68dKQZZjxBjdSXVkgLH2GDC+rIq
	stXpmoC5UuVeT5eQT0yR75h4FqySaFF0UNb6SnZK3QbkKJxhQXyZNkHTwKFUDXH08pMO1cF7nNn
	cItbap/PJ3wAB67HTqYhoMXXPFloFIX7lWS9hiSaIMQ+YAu1OZ5DOQFLwmmXqc7sGtjKioLN3tE
	+QhFpigJukGTZtw7d1g6xC/Y/PgxBZ4ClYVDc7sunWM7N33cI8Jh7CN4ybetKJLaNEof6UXPJtZ
	j26r74ue9zzXqksjrKnTMDbvZfVVQyXJdneRHH
X-Received: by 2002:a17:90b:1c08:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-35a22004c98mr2877053a91.19.1773403720353;
        Fri, 13 Mar 2026 05:08:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-35a22004c98mr2877014a91.19.1773403719854;
        Fri, 13 Mar 2026 05:08:39 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Fri, 13 Mar 2026 17:38:09 +0530
Message-Id: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3fe49 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dCknIGr3ai1sMFi_97wCod9h2SQ22jQ0
X-Proofpoint-ORIG-GUID: dCknIGr3ai1sMFi_97wCod9h2SQ22jQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX8pQedvImqZoY
 +clRev6O8DYv+j3p2II/xNIQXWsWMJjRKQ6TtJzR0qUDcTPsJ/OuG4iJG6xVKAyX3zuiTP0Kz4j
 EIGlz2XaNaMnnkpfz+TP8XjFKDE/HuUzuIv9de7OibiCwpsVdjNhlFevGIioWly2SOu8rj/9mbo
 A7x80mb1WdHVK5ax4kv3jEyMneuY0kkWuypPV69WWO8v42vRmUZuuEQsAa1o/RFxVICzaQlNVeh
 gXeCZAnjngP1Ht6V1AKLstaSbAup5MS7786o+qPwk3Q11d57aCTU/MNgGmaebqZzk4DTYuG9adB
 FDqBbTX+WP6wfKZWNK5ZIefEA1ZskM/jfSMsx8ywJj/gI+0Uz0tjvsUY/e9+snIuZl9Op2MpXPf
 UjrZRvjoLwSicIOLOtTA9+g/VXGTqBF+b5d7wzs385H9MaqpOePcPr8mT4b60i2iuQU2yKntdim
 4HLs4fq46wNwP/81tHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

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


base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
-- 
2.34.1

