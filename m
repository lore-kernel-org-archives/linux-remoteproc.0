Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A0471271
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936104; cv=none; b=OpU2+OqOSEppejsHj/5hzfmpv4xlnRHoSMR64bim3ouPQ2rYp4g/eMO37JFLMUqVhMcZUmhaXeGRWthFX5j3JSBZRv2rmTXu5Rb/uU/mjWBeRLqLPO87pXUw8pu98XDWkeAIPY7b7lGXX0K7uzS9aFk6RuMNvjrHVxNRpu90Ww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936104; c=relaxed/simple;
	bh=Ii734INmYDucUqNJZet8EYTKxL9hlhTP9jhb3RVOPgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3u4W0EBlGwBrkHv70GCGEXxlbC1gneIbjVwsECFGsNKymOeSykZ5ahBXbmH+ww1XGEIQ16HbTn8MMtWJ2/Ks6Xkg5khS2dT0t6ZnjaOWv2i6Zh0TQA1gKrchJ8y4JJD1zshIWb0i0s7jwMXVtWcYxCaXyNAgX+0CxwIzYR3gAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD2REO7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfT4KDrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD2REO7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfT4KDrT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHHMe3313877
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3
	VUjw2OqU=; b=fD2REO7WYLvbsL4rlFcS/kDs/6Il1Dr2tlFCB1HK+gQU+STOG0z
	HyGh0qfQLURM94d15dTe4cHnlT7tf5vYdMmWWKMH1x4IFvWSXZeyj34lckT1Wddb
	lf058kPo89/p5JXhmagktqXMvvkM81o+CxhJeXwaaQAS0QAoj0D+lKOsmOsxNDCs
	TK+kDf+sZE/uk2DSY5ElxDGv0XH0Uh4iyLVp0oNlOT3/qGrFvCfo76CKWmPBvtFv
	Bf5C7m+c5CR99kF4rNVSEBD69gkiDhHKbiEpknZN4K7PeFwfusAShfmuFO0AAMjw
	BCTTtjdj4UKdf9bgFEmF/1qyfQUYzXYTCgQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r0jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 13:21:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451acf33124so458488fac.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936100; x=1786540900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3VUjw2OqU=;
        b=SfT4KDrT3bXHrTmYGKWKN3/b251qiYUMMCBTVyvIwOJRwWGnHgKnrJdnT4CauWOT0f
         Wg1JXOp43cnCjttbF2AxIv6A+jelv/h8iUsFAzilQdbsw6vcDyKlZJ2gQ2WPMV3JBQzr
         ioa3Z1dMJItfPmqNYvrvaBD3lgkQA3wtIW/76P3oDvwwzBSFCTS3HdPNqjNYiPifU3w8
         TURdNdtGubrFHfcztnqQZS1fTzTBdFZTGAH6cxp4fi/tezfRhklVB+ipJ5ybHLHha0hr
         3mhR7m/p9PSPC9BALugc8Q9/DhYj52AE73yqptLjxlsMOhkmnxuMprZChtjA0UKhlrAg
         ibVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936100; x=1786540900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3VUjw2OqU=;
        b=aF2nycAwZE2ThQlQyP4/9vIFOyB2opFtnb1PWsXaflVD3G7LiAPMgDqEKFijpZTYg/
         WjoQwDJ7/P4OgQ6HMbaT0H5WAchFZxWf+sbMgcCcs8iioW02UPgHQ1bi2mG7QZOsbnRX
         1vtffk3WoItg47HVxvPXFUuzmGeqLEf4fJrIhzrM1mG1SmXHeQ+Jdl1upvwZ4mQu20jU
         XR/htT6UZzNmFoQfFoPVJE9RKK0MTOGXP4r4+EdS8plHSIQ8Pm0ivHmbd1U1nDfQto7b
         N4OsSFwvtgfVaMi7WwEz2HE0v86WXSbNLNlF31bHOYqZuMy/UShAcbFU2jOwJ3ABX3BC
         M8vQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKDFwKhfKrZlW1W4/VZL1wqfvvnIDKjux15rq6mAfH+w+Zd5Ek4xT6Fyfrg8jC+ro3/QEeMoo/IxH4a2Ewhu9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lTCpFxOG934OeCrlL4+FOCK+qDwZh2DCq/PBmsiDTqCm2m4t
	Wq05u6l8nOn2S6A1TV6vCfCHCiBqcsT8wEKjEUZlRIIgT2uCFPVpXEcwWtcqfFgc1vphMTDbTmM
	w6OQqVVPRVZRbGRt8rV083ym+4rj6FngcWAN9MV+qj4vk6Yoq2eHeck0CHRziVQHwvLX/loKE
X-Gm-Gg: AR+sD13aVANeVEA+bxTDo3dzxDnHIrb4ZwwLXUox64OkAspGv0FU/kIZXmkMDxoNw0e
	/7N22ycL4HPS2/Uc0xmbZ0F9zKp6dun15BCCHTt8bSSd4MA6fAiFEcFMhZAWQpXn9dUFiQCJmzf
	XCw3VCFMmxajk7QqrFtkwcd+1jcTNqXTSw7cys4W28mouwcRqUu1VDEsNyCUPeSBz3BhCHuz/4f
	dED0oFhyHU7CU2BJ3bXoiqtjCMFIUByha5pqog1mKeEqurCgEdKXAbuju+fxe2/puuPQFV8FDhG
	QPxX0E7pR/Gx/G8fI0WK7vjUhtJqW5zPRi72y0n8HXbguJ4JRSQSNWOuQAdGXnnsVGY2XZRn07k
	bxnJXIV9KcQHA4mYqTwJFiP3GQP4=
X-Received: by 2002:a05:6870:84c6:b0:456:bebb:a894 with SMTP id 586e51a60fabf-4599ecdf934mr3339908fac.8.1785936100208;
        Wed, 05 Aug 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6870:84c6:b0:456:bebb:a894 with SMTP id 586e51a60fabf-4599ecdf934mr3339882fac.8.1785936099574;
        Wed, 05 Aug 2026 06:21:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings/dts: qcom: Consolidate SDX75/Hawi/Maili MPSS onto SM8650 fallback
Date: Wed,  5 Aug 2026 18:51:26 +0530
Message-ID: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a7338e5 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VrFMkTrUw34MRuZEs2sA:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: fOoG0HUZJGhmz710I2dbT2hsnp4Vwjhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX6cYjw+2v2ftI
 2VdiUmW9rTLSFr7o5rOOxRblNRQ3E0DvQuH8Wkb3v4J8wqemyUGEWPqon5FID1aqAFsGPsHSiWj
 IQX01ARG/3Z6vSVimtSlfJl9C9VNp/aX6a1bl1+uoDAfxXGeb9W2Pvfm68aaTaNWw6n+IxmjZEF
 6m+Z5a1AForL4XXyR5ET2HNTiLKE9ZkVqDcZnj48XWFgaZ0yhJB32u+5v6sE3OYZqCsG+Ra7VgB
 2oPiRodSTkLe66bRQtTDN4IyM32FtH+XUNjgR16X+GngWpzUCoNIrCsZmHMt/IEhxGivJ9JQq38
 FcZHxqYCL1m8YqPgGnYA/NS2osc0sMSygYOAk3931sFODkN7a230zDEHp4kMp/DijY4fwZLIHmf
 UnXUM3K1rbsXDjWf17TWvqSulU6ot87ImcZ5N98ocJ1oVY0drmX7yL1g/Io0NXIzSSfQRhavzWb
 Vs4u8R2vm+cebvDHe8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfXw+aBxpeeAwCP
 sLOnpHC1k/MgBokIOQK2Tq1xYZvupEBBUGhHCwfLf2ZdSAfkiKMA8NT24jXvk29FhN4Tg29YYsJ
 wdSV1UH5bzu5YbvJ1ZzABIW1QkaRLjk=
X-Proofpoint-ORIG-GUID: fOoG0HUZJGhmz710I2dbT2hsnp4Vwjhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The MPSS remoteproc block on the SDX75, Hawi, and Maili SoCs is compatible
with the SM8650 MPSS - identical interrupts, memory-region layout, and
power-domain topology. Today SDX75 and SM8650 MPSS each carry their own
standalone compatible and are repeated in every "mpss" allOf conditional.
The duplication hides the hardware relationship and grows every time a new
SoC reuses the block.

Move the three SM8650-compatible MPSS variants into a fallback items
block and drop them from the mpss memory-region and power-domain enums,
letting 'contains:' on the fallback compatible qcom,sm8650-mpss-pas
keep the constraints firing for the array form. The binding change is
split into two patches so the SoCs with no in-tree DTS yet (Hawi,
Maili) can be introduced independently of the SDX75 move, and a third
patch switches the in-tree sdx75.dtsi to the fallback array form to
match the tightened binding.

Bisect note - patches 2 and 3 are intentionally split
======================================================

Patch 2 removes qcom,sdx75-mpss-pas from the standalone MPSS enum, and
patch 3 updates sdx75.dtsi to use the fallback array form. The tree
state after patch 2 alone therefore fails dtbs_check on sdx75-idp.dtb:

  sdx75-idp.dtb: remoteproc@4080000 (qcom,sdx75-mpss-pas):
    compatible: 'oneOf' conditional failed [...]
      ['qcom,sdx75-mpss-pas'] is too short

The split is deliberate so the dt-bindings change and the arm64/dts
change can flow through their respective maintainer trees without
cross-tree dependencies. Patch 2's commit log documents the temporary
breakage in-line, and patch 3 resolves it.

The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry so
already-deployed DTBs continue to probe. The binding is intentionally
stricter than the driver; pruning the driver match is a separate
cleanup once the DTB rollout is complete.

Changes in v2:
  - Intergrated two series as one
    [1] https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
    [2] https://lore.kernel.org/lkml/20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com/

   - [1] was incorrect and should be fixed with this version with
     fallback.
   - Converted into 3 patches.

Link to v1: 
    [1] https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
    [2] https://lore.kernel.org/lkml/20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com/

---

Mukesh Ojha (3):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as
    SM8650 fallback
  dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to
    SM8650
  arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 +++++++++++--------
 arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 ++-
 2 files changed, 16 insertions(+), 10 deletions(-)


base-commit: b3c71fad96372775fa36507a4dc0ed5fcb6e92fc
-- 
2.53.0

