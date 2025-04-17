Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1D1EFFA8
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870375; cv=none; b=kMrsuyl8jX+wsYGWtfT9lN3uAqczrLitsFCmymdnpecLnF4daBtOi2yhPkZWqRqI2a1M/ilt9+1eIqPXyreqPgybboNGyshUdyDZA1BGsf6SdQIrafGIifkdPeatGNVHseAAy9YMJlF94AGh/SU+Uhh7/VyXetjm8OUtZiH7cmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870375; c=relaxed/simple;
	bh=cgtO14Bpvt6Wb55LWPr7WF1fABYqx6pYYyQ6s4+ktgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nVZYqXQhZ5hybT8gCbJDJyz/dUwjpmnzwDYa15vICG2G2MKW2liYWOlIxPVss5Now4FI8eG8cUpL8DmAWa8/+k6LxmuGWECcMgTEpOKvuhw3LJBWWO/roVL569qd03H8TtOviBAJNcxZr68p7d3qu0XFntdFLuQYhfLeu72fzZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLUoC/Zc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLUoC/Zc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lPpN022641
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qmgG5UzNxXN5PBPdTRUaB2bKva2zzhOulRy
	r2SSIuUM=; b=XLUoC/ZcbgRR9TVEuzdrK5YdoC3rXF/UZ2HWVyXAr6K+K1Zs8Tj
	UmQ2ZAIKbHGjM090gVErYXfJHEmjUqdvyHE4KAQNME23vZLcdjrvgj2ZTBQlz3G4
	eCso8W4FpqnVvmra3oVYIqrw+r/bK0WYGhR25dGcl/+KLui88kXg3RximTh6uDxn
	zqLvRveF5krBcgaIeqgN2rhSVsYvDMLsZGRpkGO9D83Dl+LSpZOCZL5/Xp5EnC6w
	VtCrLfbmbka9yBbNQ5YqEguSuNSMBOf/giGGQoTz1jciCSY2dr0Dz6VWl/u89/xG
	iHa3OWD8AIKmzJ6zdCU+MW9WfoicLBI+PBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwnbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so442939a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Apr 2025 23:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870371; x=1745475171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmgG5UzNxXN5PBPdTRUaB2bKva2zzhOulRyr2SSIuUM=;
        b=H8l4Fx/CN/5fuQ/tul7Oy61+y5EKarymHkGvmulIOKM7ZNrVHcQPrQzk9ucJagKETY
         M8guLu0b2pZXKoM6YDpnUci6CnT/eQXfKWIDG7ggV7G7uAsKmkLMiPJMS9lbrFDMe76W
         U9YljVFXY/CR6xWXo5x1g85q15RrnSnBtW6FTnAZ9vbVMGtaUcM5zKUC0NLiIlqzPEEP
         p177t6t1rv4JyJ58jkRJa3f5sFU9yjM4yPj2j/fmZSZICMG3y7lMsEfAv3pOWzVPfZAs
         MY7puRksUlSKk438aoreHE3rgp2mHrOq0hzyvGbsfAmJ2+samFxam8A3hWrK18wTnJh6
         yPxA==
X-Forwarded-Encrypted: i=1; AJvYcCUgzdH8EQejSS1ID8HbNaoOzB3UEXMHryvK+uQ/YUAu4quHOlzQ/leQTCHkjh9+bmUuYNDk5DLpYHw4Nh+0eo4M@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTmrrIU4zoATLYfzd6mwJ7KUjg5PJsoJBiLgGkhMO6y5jrgDk
	s/JOBo4EqKmRcq3DQcm63B/vPuU2/YfinctRThimFokHQBVFrtr2slaps/xL9uTHVCrne+BSb2h
	HHteF6HWILWjnMbXseLmruyzAMCnD7VvceyEUiHNOqhL+alAvdKUBRSnQxHuA5PuRb0K/
X-Gm-Gg: ASbGncvwYzIczjBvN95/pMfjx55/Wqrnc3tAGv/+hySpXLkYe0EpezrGF1vZo8ITAug
	jYDmmsGbO7I8sxNSdx9u6RyDeeyNa1XnyU+0h1n1VPU5V7bU1oObshXbC8uNHePbmtFt6tuGfys
	2WKPjPo0kOpKwc/TddBM/GlVKQqE6L7CYQnv+WOrR9BnKpwZOYu6w2ypB03+aeGlAn9azd5vucE
	2r69ZE9DlXuzozxm2reIwopxpiBgOy62vI45nQWTDcNHgAV/5c9biidir7Pevqx7KCExj8bEvjb
	EV417p9F9fYG5lPXziDEcWmnkuDuyhW4ykd6xOy80i4fguOv8zo2AOyPbwg8MQMcNJdgH8dQyvD
	+/JnG0ORd+vV10Rh/1aZ5ig2YmWr/Ol38tS4=
X-Received: by 2002:a17:902:e542:b0:224:249f:9734 with SMTP id d9443c01a7336-22c358c5261mr71251125ad.4.1744870370912;
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCQAlvcNuZzfshnIDcwN9Wn+dmeRTS2l91t+hdzoOVBIq0mrD0PPxzu2ly2DtwXNhUB0CVBQ==
X-Received: by 2002:a17:902:e542:b0:224:249f:9734 with SMTP id d9443c01a7336-22c358c5261mr71250745ad.4.1744870370439;
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 0/6] Add new driver for WCSS secure PIL loading
Date: Thu, 17 Apr 2025 11:42:39 +0530
Message-Id: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2jH9q2999leHj3Q41XZTNFPgOeKXHv8-
X-Proofpoint-GUID: 2jH9q2999leHj3Q41XZTNFPgOeKXHv8-
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68009be3 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=iXkry-JSjlV61FjWxUcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].

- Secure PIL is signed, split firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check

changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts 

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.

changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof

Gokul Sriram Palanisamy (1):
  arm64: dts: qcom: ipq5424: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 ++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  82 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 ++-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 399 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 769 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1

