Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1125B099
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768957; cv=none; b=qW7nr2uljLTjRqHLI5aM/ZnrwsYpKVBNPlqY1W8CMLY4bUs7uXNH4GjQuS//kIyIabHa7vYGPhsOzaX1oOGtMXbLwXyBsBW7wNgE/fBjdspiLeKNGwyIiCUB8YwvTd0TIKyNHqUQpNWkR59LiatOcE98qbE8BXI4DIGMMrs2dtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768957; c=relaxed/simple;
	bh=6Hf8A/ibvYwSw2K6acFMvDfVvlwnZ2P8a7yJ3TSb5dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OJMSJE3B3qKSRrvsqAOtKgmxfisd6RcVje+cpvf0eexB6k3sB+Mq54zy4oY+36ftjplsIzDz2WI/Wyj2T+wpvzBtjKVIEvqFjUxFklaK+bthkci4V+lHgusdnf0c3WpxWZkvZpOEX1OKF5z4sgARjFDsRBl2v8DRtsqf9lNyjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhDUGPbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CH3DLrPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhDUGPbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CH3DLrPp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8JXx2898174
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Zu+NIHhBBeQIzNpCB+KAo
	MZrGj5Ijoy9JyI8PUji8o=; b=DhDUGPboDAaFomNYC3akX7UGb0BaIytWe21LXC
	HlDrCmBBIW+/Awz+dkbho7xmHAoJve8F9fiG/T5UiwsIF3mgYUvC9Jj19iWUh09g
	2Gr3Qm5yKqnlNRLWqAHTrZEWhjp6p8rsAFSg8NylQX53xu+PkAf+Z/zI9Tv5uq0f
	Y9+f1H6gs/w3uwm2nsEpc3nnFFzzvWa/b1/O6XJ8rwgm35eUQoYioF2VH0jExtaf
	+jLSiJ5i9uyOsmjZD6VZw1vEkRuU/jW/AuEg7qb51eOODpsRclQVWkhXVWkNL0QM
	7oKYmKx//FZHWstiJeMJpQ17n2bDOHtqYDDpgQBqi9RMT3eg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn20vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so6270290a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768955; x=1791373755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Zu+NIHhBBeQIzNpCB+KAoMZrGj5Ijoy9JyI8PUji8o=;
        b=CH3DLrPpz2J3NevAuXV0AmOh/8xxe+ZB8G27jU1Kn09MPOQm7MUGj89FOL/vjNc/ku
         loRtuoH9Tyw2oPPqNOM6spVB1DbxHWI4tiT0/uFC1f+aI+UG+hhAju59pXnxqRFZi1qf
         AWuQJKqm2gaW2SQvVDKGzoGfAMuoRwbsU9k2zKzv4p8aM7UGTDzSm1199LIPHDRvQW6X
         bmt3Xl523aaRTp6Bi3kuMReHmM5vC2rNyiUjnSkyYWRmhTf3IHSHYSCnAGCxexyKd4IH
         BP4ZOTc9rEilJMCp6ebfaN+9e4KxPDy2i2HS6twDnbs1sqNJhkkVnmA3P1Wn3Yl1zP4H
         d6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768955; x=1791373755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Zu+NIHhBBeQIzNpCB+KAoMZrGj5Ijoy9JyI8PUji8o=;
        b=ve5w8mhSZhRa96A8FjZhqbXAG6jExhjVvN8HluHYZL52RFCSO2cgeXvOTu4uCRPvpT
         uby1t4FTJPUWBE9W5wEY9uhblHvt5YYJJG/ZtMUePys24H+jrGOoc+3WPDQoQKM2OBDF
         ljs6vEnoze0XMX1dDQkPXaFmPgKr0Gq893b+B6G54YC10/xB9e0SrqLS6ejdrGqHAcd/
         kwtfG9Fl/FzjjWJq1Gq6y7kCjWAtimPXBjGU4AjQl+gQQuxvpVrCniBiagbjOa23k+8d
         w4oyY5skgnKt73U+sZXXagZkjt4NIx8SFwekBJ+vJlh601pvyCZAUyL+xE43FP1sitEl
         8TJg==
X-Forwarded-Encrypted: i=1; AKwUvBz8ZzuYs5cd50v5UPMWCoRbHk40o0do9u2cHvs2rLwswzMYDaAwsw2MZa8cZRESDZxiF98Fdf50J7gd24CM/aoC@vger.kernel.org
X-Gm-Message-State: AFuF++kkz2vaoNJbDaLdb30yEfXeBQw9g2uRJQQGvrEqiwgLyMRljtUV
	U5q63DfgelrN/JzK3iwN4MmWye7YDyhnW5e+xQzcolLEHj5biOnbkkH83rYjZQpJ61SEJyaXrBz
	rZ1nRHZmUm31R+UdZHYN0tbw0ViNeBsvnenZEBXZ5axbeeDMkCz2lp2kXT4Yxtnb0bRaexsEe
X-Gm-Gg: AYBFou17wICoN2yTtGxGUWYsVYYu2gQVxvTDtFefjyQGn+1oTQpUU+6xOoIo9BGgCGc
	ThBRLEafvJmX85mcr2zFHc3C/+xYHRNyGl04ZcRLPKWqGgZ/v//ip4T8TK96XjKzC4Iywf7Ym5H
	Bjhj7ZAKqh4bDr6Q2Q1c9aSJeOHFmFVPQN/F2Bu0+lcang7AQ2cakPExtF6YScgtod4KzkVIBcN
	CFNb751X52m3ZMap5thYQvmMjpUGTbroAZNjA4cOHkPDKNBC7Gwhm/NCaw6kVAv6phwVQRC0upq
	dHrG9r4gUE917VR6NjuzmGqgLgyVLgTlT0TcmTxNFLrgmfSKVxem/nGOBXmdr+Kzw84beyc1Ahp
	aOxF5Wskf6nPaOA==
X-Received: by 2002:a05:6a20:9c86:b0:3de:137c:2bdb with SMTP id adf61e73a8af0-3de9ebc5c44mr1058461637.69.1790768955127;
        Wed, 30 Sep 2026 04:49:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c86:b0:3de:137c:2bdb with SMTP id adf61e73a8af0-3de9ebc5c44mr1058443637.69.1790768954685;
        Wed, 30 Sep 2026 04:49:14 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:14 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Wed, 30 Sep 2026 17:19:02 +0530
Message-Id: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC73vGoC/22Myw6CMBBFf4XM2iF9RB6u/A/Doq2jTASqHSUaw
 r9bWbu5ybnJOQsIJSaBQ7FAopmF45TB7AoIvZuuhHzODEaZSrW6Qen5lhzSYJBc01atbfbBBsj
 CPdGF31vs1GXuWZ4xfbb2rH/v38ysUaOqvVe18c5ZfYwi5ePlhhDHscwD3bquX+XN6airAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=1846;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6Hf8A/ibvYwSw2K6acFMvDfVvlwnZ2P8a7yJ3TSb5dg=;
 b=8ey/RxiPhjOBes5cw13ricIfGhRA1qGBjR8Udpb5S5Z9myULY6o+RZ25Hfjk1uakhanS/vaHk
 LnEim1kM+NQCtTA2toGL+2M4i0lyi4QEFEnhHqRs1QzYm2h2tCQqfJK
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcf73b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_5sKuGRrJ7O-zHbQ9ngA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 33FydR3CkRZunkERttzyKdFZ38Q8c2LK
X-Proofpoint-GUID: 33FydR3CkRZunkERttzyKdFZ38Q8c2LK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX9nhMDNNZOrPk
 nukdZV5NsFCLbmJrzkWebmecKevXCXOhFg3gyyzm02lnouLPbjkAj3djEKXe0GnJ4uJ3EKx6aX1
 WfWTXHWZzsoW9wU1S/UO6aihKbmhDsc11E/+ztSuqLMTBBZe+9R19TxA7MUg8sNOk/+V8vz1886
 vsG5ZegrH4zFCvXpPKSB8l1x97Vxiz0UeY3ch+ei5+YnaqnHbPxpRTs5n2JdvW0cxJyVVD+GcCM
 zeKunqgcKpOTIyIbHYcHcX0PgDM9WpCY46MkVntj1PFEWTJyF8+d6o874/YQv1bkRUgEyfQok5f
 1uJeS/kyPczQ60sW++z+C4z1q7GcGTtguVGQTYor2OIORtvfBh6wtTZA1A+dWiZN1X/XqgVEeAI
 yu1vxxY9mm3hRgZnPFmgyMN0ZNqAwxcu6EhQ5JY2dd0Gca+R4uuFod74bPRd1GNexVBnsIXVCD7
 a2SyUIBbB+42znbjzcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXwv6oa1DHKVEO
 +f+WkNepaFMmv8uE3Pf4AkoX2Bcfs9IdreHjhYoTI3yM0Y3eHNQ0pQ1qbGYtlTdWIl4a6fDH8Zb
 JCUzJEZfaNV1JozG5GIPRGxhbz6G6v4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

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
  dt-bindings: remoteproc: qcom: Relax PAS iommus item limit
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: remoteproc: qcom: Relax PAS iommus item limit
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

