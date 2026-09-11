Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679553101B2;
	Fri, 11 Sep 2026 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103002; cv=none; b=gIfUquVbEU+A2H+dRNM5tYgtT5JaxB20tucnEmn2xsluPSG6ELaalG6BYKNjGObgsoRHnWpxlxLa4Xl3nX0BF7Cwrh7b1LDbY0ftU2GSty1E0jxcJw0kninphNzi9exdP9Id/V51tgwSLhP4dhqmr6R6S+TM01PgeI8ytrWRVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103002; c=relaxed/simple;
	bh=e2a00vm5VUvTR4xdHavrdDK4GrNGmiJAv2YXJRSZA9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3WW0IQeubjMwPx92hLYBDV0D2TxOxK/RNTjUF8GqC3nDjtqNqyAWZCm19Z8UGaLb740ZvIdMux417i37Lyti9aK/0EW5l+u1JPxbn63lao4M3hsyJAxPdFff0K1Ys7LrRiTk6jTNRaKWlnXlFjqbGlk/EoQixZ9QSykFmNnOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2l0DQXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2l0DQXE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vPwq3464043;
	Fri, 11 Sep 2026 05:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nk3cYb/Eg9qRp9GzenOQ0T
	klQAPGiZWpGBazwoWYmJU=; b=E2l0DQXEpq7mMduFcxjdm7x+IyjFwwb1qzo0RB
	HqSYjHm8Z1M2hVRf3EBSYWaHbEPqwXFDec1vWnnumVcczyLlCjw2j81kB3Ca5baR
	ry+kjSP/n/chPZForx0sMKYfwZlXlsj/7tY1yTf1omvJxJ2B+rdzsYaG71l6mHSj
	HpKoNGK1ENKPls5UB+7KraBLLI+X274wq1k3zvZvBZjV/Lr19G4HYPQE5G7J4Jnm
	/Pa0Ix8bKa/LsJufn4Ycwc1TOGGu6k/WP8CYFLYMlwHy0fzqr8NHBy1px54cPXLw
	eUh37fkAFxoIz4mXVdY5ZZIbvYsA2w2htrZuKSJaoSUY1DHA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q414be-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:17 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B53FGw2535841;
	Fri, 11 Sep 2026 05:03:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B53EHl2535807
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:14 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id B7C4A671;
	Fri, 11 Sep 2026 10:33:13 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Subject: [PATCH 0/2] Add QMI TMD based cooling support for the Shikra CDSP
 and Modem
Date: Fri, 11 Sep 2026 10:33:02 +0530
Message-Id: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaLo2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3eKMzOyixPjC3Mz4ktwU3SRDYyOL5CQLk9TERCWgpoKi1LTMCrC
 B0bG1tQCYXBiuYAAAAA==
X-Change-ID: 20260908-shikra_qmi_tmd-b1328cb84eaa
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789102993; l=891;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=e2a00vm5VUvTR4xdHavrdDK4GrNGmiJAv2YXJRSZA9E=;
 b=FfBemhsx9fQK6SiyHLaOhPrhwbTOOePlY58s2rMtAN4DVdLa02iVzCUNluZBhecRV1bX8DrKo
 TPD3959LlwyCkPjiyPODN4izcv01d2zGpFJpz/oteXhhdkofn0XAWPn
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Q5Omv7Fob-5lxbFaD5oiWHsHRgbITmUg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfX9Mu/a6zioyZt
 kxZO9Wc/HnpfYJKoNnZd/mW+KpV7bvBGb/I4DabyUzQjE/wChBJQwPpz7tkv/xfeLdcWIVzVC6W
 hs5ohENldLTeDmjBf1EhW1DSOK6XqCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfX95ikJUVEfygJ
 OKMJu4u1b+orKhjj3iODgcD+RzMOhk1SLEOqKyKNbUizvTyOGwpb0RrTNQY76Htq7zRmKYqbNRJ
 7SeCrpJrUvXqMS5ldxxrRrWIAOovwp65E6fqpnjj5z1oOGrDEHWKc0p5UxqqYmBp0cUHicva6WL
 lEMRNu2Ze1GIb2v1PQEPl/WcEtucRHMeS9hUiH+h1K3mYFh8sFQ3rRcDcGr0ZTJSNQ9NoK0CK8u
 aYErc7Cabf3gBM3Altu77F8NbYjhshWWc8ZAEeANzArpktDbxTjbb1/GTR6NAjefxCpyqfxd42V
 6pE6UAM48mF5IJ7sAspUKIDCWKLHhUdJz46tZ/pwLlcDnMZQNLhUAJ8wCOdJkux65xx6l3HaOBH
 dvDDu7OwqqM4fmhI7PaRbCsny5Zq0PO79Ls/QsvjDZzzh79AfNa7d0i36JX3XEUB2SQqXQAAQnE
 KNjp1mbqRe9nwGwX6Qw==
X-Proofpoint-ORIG-GUID: Q5Omv7Fob-5lxbFaD5oiWHsHRgbITmUg
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa38b95 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Nr8_R9MzsSvTTqNlHi8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110067

This series introduces Qualcomm Messaging Interface based Thermal
Mitigation Device (QMI TMD) support to control thermal mitigation
on remote subsystems such as the Modem and CDSP for Shikra.

Depends-on: https://lore.kernel.org/all/20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com/

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
Dipa Ramesh Mantre (2):
      remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra
      arm64: dts: qcom: shikra: Enable CDSP & Modem cooling

 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c   |  6 +++
 2 files changed, 74 insertions(+), 3 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-shikra_qmi_tmd-b1328cb84eaa

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

