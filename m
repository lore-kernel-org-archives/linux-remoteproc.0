Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773E41A551
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951070; cv=none; b=MRct/3PCl0d/mpeKDOZvxleoPn70V85iW9RQn1K0Q2GEc4+ptg7dxwoymZ0ri4d1sDqz3S57WQXCRM1Wlbl7dffX9Sx4nIIJG4lF5lNxx/kTepRo0LH73XiLpdkbDSAFusWW5+/G1oLVq/whJB+KSv6SjpTDmSt+4R6cjD/QL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951070; c=relaxed/simple;
	bh=XyOIHtjc04/yJvJbnstL1jpJRMGbQhS1T68GYeytCf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rV1sF00/sfrrNiB0cmjTpC/yBf8y+MJek0pko1rcrR0WdbTlDr87JrbZ8IN+sdXhfawEsY0pKyymucPkwQfKgxDsbmCpt57GTQPnVWEN0ADc2dB2DMSc0Z1lgm1UKl1xXuu/sGgQTeGh8x64bNWi8D/uienukGYXphkNT6xadn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awNr8hQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbYFf7lr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awNr8hQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbYFf7lr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AScLR1048660
	for <linux-remoteproc@vger.kernel.org>; Wed, 9 Sep 2026 10:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6O
	G2JRWijo=; b=awNr8hQ1MfX+jPQNzUWaptaD25P9LAKMCOXStb+LQ9r15ij4ERN
	ErNFmZMP19ic/Pu6cWrQLGLVfrf1w2pbFwCoOniQj+u0xHoVr2q+m5admSmrXYk4
	sVsWK0APR2Vsh6YaKQs05G/2H1wJZSusl799s/NLGGF+jyV8nK+sbWagbbRFE3rA
	QNr8A94/3gkJMKsldwHPQrJwbbiYZmcTVFiMFSuEdDdZZyIfug2jdwG6CJolskri
	b1tN5FtV6hejKL3rHguBJPmjqOazpa9BwxYvG5MmjujM+vG6TF6ZXTlQ8hMKyn4Y
	fZYp8sj4edFq7DOSQ0yJpqY82QQZXhN6vNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559r7ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 10:51:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1286215a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951066; x=1789555866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6OG2JRWijo=;
        b=ZbYFf7lrMzFRyiCsx0UNwY9yujmEuU9bmIYtBILXJ09Hxv5SWR0VSUCrNUcq1Bl3I+
         7zdUtSvivh9WkLeSfNUKVpzdmmn97OjSKNsIqT2ablOR6K8lT1h/e7oMHdFn6zBVqOKf
         9Ow2Ref/eDf+teSigLF1KTcxfVL/OpRrStIqUQMBYzEhYWJMbf+wkBgBhM1aOuW1st92
         dudcv8vxqbfjXrliOp9QvKhyUMlcbHBJW821kab7fuOk8m5rnsz5P7Wiy2zGHCLRgdU4
         kczgv/dcTwLhdzxSsPh+KIgZkwK8R7SCrngPEBoONrX8jhpXpg6J1SLHYh6h7eFCW78v
         hDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951066; x=1789555866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KE2mNw13WoP9hs4aiWcB5lve3gwFX44yO6OG2JRWijo=;
        b=Z5kB5Pe9zusonCEF0wjpz2xtoiBsQOSB+KH2uabwiHXlCkijqf/xRvWUhx07JCXkTt
         RLytB7pKNhYXNRzC27gjcy6sJUxoE9uyq/2Z9E4p1+Kd3q0IeA5K6VPwuSwMh4PNX4Nv
         b7+Z+snui0SzEqqkibPuMlmgzfOQvde9JSpEa9XsjkwuT4U2trwgEOOjTzryI0/P/yvn
         cDR7Ca67YpQtF8ABDY6krPG7PMjTe8DmD3XpkND8l0LJLI9oALGJZQwmwPvV6Nak+k8S
         rQyFxAasR2Noz5gAq/ACuW3PpIaCJYZR7k0zcDkP1BGachLhj2Zka+oJ9QQru0Fx/daV
         DKUg==
X-Forwarded-Encrypted: i=1; AKwUvBxOqyYiRmJVCebblu/9mEreXFwS1vZ6xLZ22OxwIY4IoyA3otqg+eOvavRpO2z1kXCQprT2pPECWSDwfSWyJJmj@vger.kernel.org
X-Gm-Message-State: AFuF++mAdjBxdLtB2lFFhjyyKsuoIOpOqKtNBqml2WNs+qVCfbBISrqF
	+b+U7P3LctU9Rt7OArWp3VBqvF2nVkZsRhYwaHY1e26uDGZRsQ6tdGFUGa43RCroFDMTmMY80Gh
	ui+DEVhMJTFftHr29cDWBWaWTM2EwttMBze+ujpSq/dyCzAHjdgCtOJhFkqY0KpqjcNGhXgUo
X-Gm-Gg: AYBFou0DziRiNiIfki1OL/9oPBjtIP1mjCZ6m7UQwhiB+quuCAZoXoF4QKMbp/zUgAc
	29nW1daACIBa9Mv4daGMfmHnHmYSuYzU19hqA5N4RBnSRS42w4lS9U3X0Q/XCE00B4kka1+SgGt
	qrzhLIA4qxyF6KieRH7WWz2JF4Kc713be0NyDZavtBthdqVIrDQVRitRcPwUbD5pZ+rmOugFH8E
	8DRfXEivqedN+l1cN1xjOXWNwlaYQUgNO+Lgtl5oHMflVXKxYUJVz61PiXl9K6rnkc8kqZP/xkF
	jIVmB05dpuL/i01Mz7rbpmGJI2zq8aFVbyDA26Hd77UfnvY4yCsYf7509OKuLB29ty/OfUZ/lzD
	RICa1a3arRsYjQF7WkoiSmugPUcs=
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr35821a91.15.1788951066118;
        Wed, 09 Sep 2026 03:51:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr35739a91.15.1788951065449;
        Wed, 09 Sep 2026 03:51:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/3] remoteproc: Hawi CDSP support with per-PD
Date: Wed,  9 Sep 2026 16:20:46 +0530
Message-ID: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa13a1b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5g8txmhWQN_fPa49kPgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nOf2GsDGnjzMRfp9nF1b7e9-NBS95EBB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX9jTUxUSMlyeK
 P+66S3wyfIbhVO6nBpfj5e7M5Y/wh7EDEn9acPiEHydsdGhimI2I20YBW/iGwuYsjVnvPyMtadM
 asdaX23tNWqcb6ubQQajEqKdmHWOp4A=
X-Proofpoint-GUID: nOf2GsDGnjzMRfp9nF1b7e9-NBS95EBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX1p8aDlFn7yMv
 w+zxd0N644KCCdeF5xP4g3opD1f1/dHk1yqSdaABsMjcZgYJlwqSAd/vGJa5nLBUqJw8o3w6OjD
 Obvumfx5BD8rCPvx8mSUHlkdpMwyUjUwt1ro8uZbSKSSbDBOYTYxsUerfxDZlgcCTOy3euoXIBc
 aD1uDAAv+B016v/izL2WzFnTLhu5+KEX7ws2N8ssDnUW/3VKl6gteMxszCNPhHzelYZqOVJV6J4
 o8xvCSF/4EMKKcTS5GsBRUNdwKw3F3yvSWQpz+ljefO2FZmLHxCN0kl7+ED8/tyNvjpI9LOoZ33
 zq3MyV0YRsKaBi3WWx5+N1iJE+mY05zVN/5SssYvdXW0Fu/82BkQe2u47gGf7+hPCn6gEvVSHHb
 oJ9BCa42EEO/aDMDxIj82UGpK498XrcBBywC/u42e3nyP581OnicALnayCaVWO5//oMu94X9hRS
 0ROtaANnz8OXOJ9GH8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the hardware-level compatibility.  Bringup revealed
that the NSP proxy power domain on Hawi requires a specific RPMH
performance level below what sm8550 already supports, breaking the
compatibility contract the fallback string implies. Remove
qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block, add it to
the standalone compatible enum, and extend the existing cx/mxc/nsp
power-domain constraint to cover it explicitly.

The fix is two-part: first, propagate the dev_pm_genpd_set_performance_state()
return value so the failure becomes visible instead of silently proceeding
with firmware load. Second, introduce a per-PD performance state table in
qcom_pas_data so platforms can declare explicit RPMH levels for each proxy
domain. Platforms that omit the table retain the existing INT_MAX behaviour.
Hawi CDSP declares CX/MXC at TURBO and NSP at NOM, matching the hardware
requirement.

The binding and DTS are updated in tandem: qcom,hawi-cdsp-pas is made a
standalone compatible (dropped from the sm8550-cdsp-pas fallback group)
because the proxy PD behaviour diverges from sm8550, breaking the
compatibility contract the fallback string implies.

---
Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/


Mukesh Ojha (3):
  remoteproc: qcom_q6v5_pas: propagate
    dev_pm_genpd_set_performance_state() errors
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 54 ++++++++++++++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)

-- 
2.55.0

