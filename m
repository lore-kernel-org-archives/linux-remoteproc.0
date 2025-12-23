Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448CC303A30
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481262; cv=none; b=rXcWhqDHNgreMcK+Y3Ja2+Baso6uI2fDnh16Qiv3X/bhYCngqLm7b9rK0ueYNmd7PIOtLPgP8vNEqtmeB5HnmtTyOFetycfeerpa+1O4fP+hATf2HfZMwB+/cmZQtEqmEpooF6fKOgzqe9HIXt+QoGIWe5JZtyPgJ+zLN2GX9EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481262; c=relaxed/simple;
	bh=l0prRypGfOLngy3f8Ji1cHlq2eAPEXkQ+7O94syJxxQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HVdG5/Qk8IWPmPgENjVmXX1tCi+p9Vl8B6ibF5Nflm3Lywj9QSZJKCyGRzy03kSXcLhGGrtP2YwoJNMiU7AHx6SXEMm75obl997v8z7WwYNhMDyZuyMKQ9rxaFk+Q2Ccrlmr1sE2JxoiL0gdnXx3YqsctYDG04W9fK7kd/dwAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMiX9cOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr6tb58J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMiX9cOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr6tb58J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN72n0X2115503
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Ip1/prO6zRTqnoDW6JM8I
	QS6nA32OGWDdc4HypKQE8=; b=IMiX9cOAhr122E0ucUJCFyw/047LIGZHZFqHPq
	MJr4ccZ8RbLd0tPMrMl4/X4EYe+jS1chcyDho5hwbTbrYOKHDrgO5zMRvTwVAh0t
	+xQw/4qkfvL7spxlXbbw/+rpn4Y6bQzshnGcX7btL05yfTZ+L2O5Hloo+igxaoVN
	L8Ele2LFEsoV2yF023A7KoDs+T/mYEIn614x/9UR4rWb8kbJrmZF/dVzbCJryFSH
	R5+ECgyRAF42fduVQK70AkViLMslUdNJHqdOMd4RkNeDF04s9IUxfnW76DRtq6Ug
	ol039A/aLmCddD+xb807GKP9nlQk6YlREs8HBVMRfarw3tDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj283-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29efd658fadso143813535ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481259; x=1767086059; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ip1/prO6zRTqnoDW6JM8IQS6nA32OGWDdc4HypKQE8=;
        b=fr6tb58JIdMaFUx3jlQwcXRy+jalysHi4HHlBHHA/mMvpLyEseGqOOp5of3MHor8o3
         bs713PkX8NAD/B2xIpudf8XEEKxUloBWlR35QAkTEybeVei9QzQfrdrfMRXltVbaj4ie
         68DDAlmyAYIjf5mWPtneOpMpbN9TYVe/d/Bf3tRYS7/DWJJFrUG7MlO4HYFA9TjSF4kf
         TNTwyJ0fbhPBlQuZNteurXtpH4/BCHh9SqiLze4taEYlmwcE49qiSaPKqJSRRWs0vYzw
         9cG7JgWhMqv8SgDmiFlJuZcRJgEXPk1xUSUgmNG4yKxdX3n3tzA1DVDt1MVP1/55r1VP
         wcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481259; x=1767086059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ip1/prO6zRTqnoDW6JM8IQS6nA32OGWDdc4HypKQE8=;
        b=KqAAbg/cpYuIqDpLQEc5GpqlwZeVeh/fo7Y9KlQ96eb4P7A/ULIFuYIAE1bEmMJd0I
         wCq2AfDs+Tb4ACW6w4u9eu3jtDLaFe4I9guPzvT6x/Go9xdjNaiYH/7EoG/OUczaztQO
         rZINUBplu1tcM36LLRwsie2BWJDs85/LUBbEnwKFDDKyCdn9jNNXV+kwfEyNqydv/IAN
         S6Cd5vrmZAvEMFUuHndqENkraAvfZAYl9jXFi9Z4RAvxs6qH2Dssomq+lNH4dD8Ue3pQ
         2jw7FOa18uQSQHwXIlwgY2z8MEhNsZuOGKzii+9LGka3zWd4uYdtfi0WpMqUVZg/sAFG
         hqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqluE7/PHYtdCfQO97vsrfTPm9EPi7p9Obknacm91pZuX/9IMsrJUh2xUEcazvMsiQbD1ws5BJUksHoVbrg6AC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGakQQXjQVqgSMg/4NfDk0b0ydNtqMsz8V/KQwE9fJBALNqCx
	+wrzFeKtTqoxXWSzZdQnhwDACG2Dog5Zn4nGdJWABb7Bi66qp0BG0CZ0SNMlVHebEhnlsFORpVW
	C1yTHQKmk4AhYHK6USZ++IQD9C2KYBWbaD8bJGMGFAGtkhzK2y6pGhbG6zpG7Niz9bXuhoz4F
X-Gm-Gg: AY/fxX6+rwcGAksEfHPOyq1bgpju2zdjN0Lgdf670Z/8WQrD96NbBCDPgpo3eBzubpA
	wzWlDWWRjWrUHhdCtkEUvaThNo7rvvBsJ8MqzVMQ6xjcxBZ970ReAm7jk7YlgR8JSPY3sW1XHBp
	iHGc/lNu75WEgvS2WiOequxdWI18vodmVII/O6Sb0w9bfH+lMTYl3uK5YxByE7ZA+LxD/LCCaI9
	ZTKbuWy0UvyGGbHHt5w5MoVqx+JFXjO6RWH0zmMmcNGGsdh4Ot8GyqR68U02GXlMlBlBsOxvdwd
	IzohJX9A0oxJtEZm2SciEAwgjfIeYn98+w3jV0ml/SakAwKzIlj4OfXFwXjan89Tie/eKzesq9Q
	VA1wLAKa/qELU/pNuDDhPd1f3TM75SO8GZOlQFzsugi/PBY+aNA4u8gz6sF+P
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121722c2521mr11800925c88.19.1766481258761;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOCB2lEpxvhz6bp/aNU/0EztiBxpdm053ysqbPX/iDe0GvH0kLl2VsvFu2b2ki3dZkYKrggA==
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121722c2521mr11800893c88.19.1766481258160;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:17 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add initial remoteproc support for Kaanapali SoC
Date: Tue, 23 Dec 2025 01:13:46 -0800
Message-Id: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpdSmkC/12NQQ6CMBREr0K6tqT9DcS68h6GxW/5SKO00CLRE
 O5uwZ2bSV4yM29liaKjxC7FyiItLrngM6hTwWyP/k7ctZkZCKgkgOIPP/JIQ5hpjMHyrjaohEE
 UdcvyaIzUufdxeGsyG0zETURv+/1GgtR7rXdpDvFzaBe5l38GAfrfsAAXvLZnqbUyFRBeQ0rl9
 MKnDcNQ5mDNtm1fQHif+MoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=2915;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=l0prRypGfOLngy3f8Ji1cHlq2eAPEXkQ+7O94syJxxQ=;
 b=njAdJt3QUyPKJoKTJ+acPVyO/W2ze2TT47VrZDwqxNgrt/WEfa9YKXzgU3raGckHJ0FDJEdx0
 S+IYKUJYp5LD+Dun4PhJUWfzODq9KA+71pZzPKjvV/P6+++c7aTYtn0
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a5d6b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jlxKODRQ_LuX4D-yXW4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: FfFdvzFAnCXdkEQ0ndGmMp9HG99SBP59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX5G4m3QQZh11y
 fA85vMbrr/NZuFDRMspLYwcsle7Endbr+pqQmFmdenYaWeurFS+IbC2BAGbRd94hH2a4OoBZwWn
 zs5HAEZlcoD+zzB0XNBYZyRs2L1DNwqUYFq1wW9a0cBNUaTZ6T+rojJEQc89bliyUqlwtWTbm/V
 jvsE/FIJedkP4DHy/Gd+Wgssl28z3bdKV6OdCfRXd+C5yjmfyN6QpFlJjpXWlCE/RfkUYIxign8
 SKUkdDkbkFoqfNfS8FJVyOVq3MJnC0/6v64alAJ4PfvkslCfrBT37HPy0siHmMjRIyCXYwi6GLL
 PWUxIUMCF+Q4YkAUr8l79J1MiLRRlqS4WqTLdywo7pSs/i0oz0raO/jozoJ4b4tru5ozkjRbNYH
 YJfDcoK83avrYCEfz4Ve7nDID8nuyEgWYXPqzPrpFYIL/O/IjnU3x6ffcIvjN/L6F1ZWal/L+Te
 rnHHPj/KnIYMYJfkY4w==
X-Proofpoint-ORIG-GUID: FfFdvzFAnCXdkEQ0ndGmMp9HG99SBP59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Add initial support for remoteprocs including ADSP and CDSP on Qualcomm
Kaanapali platform which are compatible with ealier Platforms with minor
difference. And add initial support for SoC Control Processor (SoCCP)
which is loaded by bootloader. PAS loader will check the state of the
subsystem, and set the status "attached" if ping the subsystem
successfully.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

---
Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v1: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Gokul krishna Krishnakumar (1):
      remoteproc: qcom: pas: Add late attach support for subsystems

Jingyi Wang (4):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP
      dt-bindings: remoteproc: qcom,pas: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 +++--
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  10 +-
 drivers/remoteproc/qcom_q6v5.c                     |  87 ++++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |  11 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 115 +++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c                |   2 +-
 9 files changed, 377 insertions(+), 14 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251223-knp-remoteproc-f6ba30baa06d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

