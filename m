Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162A38A2B0
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296040; cv=none; b=A7LyMCjvr9TwZqwR4pagY9YJRT+fp+d/LH19zG+40icdLf7DOGnF8njV9zjpmwssloL+8yXekMTw1IMyG+w/H4GAginFPuBktxMPyPaVMGQ0/34740saNw306CxSApe6f0Wh8cFA+DRPxvlL/aF7oYWixsrR67FRFTSnOa4mMRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296040; c=relaxed/simple;
	bh=8S5pnDqi3z7NYVtTN/QgpOI6tLaNKLHkI2Sazqig2oA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LeZZyfxGiJ+oXFej9hRAAh+xBXlImLw3DAAa9e5dhCElbOMbSwRt93IP/PEbxZ5dPt6k0sDjv92PLWEp5as/BFntPtOGfeOEHx4CYGw0jsPRe677dfc9sY/TkM9X6828+3vl9zYD2MQaTuX9G/9SCLD/n+EaUv5QuG15fI16liI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBm1LB+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCRErruw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBm1LB+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCRErruw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7Dw2R1937911
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jgwGAj/f+zq4C4JuNQWrTXFjzyBuQEqP5rK
	j7r1xKn0=; b=nBm1LB+nEJHkefIiR4yVEwYf2WSlHYZBufQa0Pl5K9Jx0ZDZm0W
	9DZRw42grm9TCB7sg7RPRh6yz409WqgQKx/SEWCex5BSWAh/qI9mftkZ3zoJyd/J
	K83TuyY/qfdRXQI8fdA3of634I0wSwWSscv3TKQIOpgZ12QP70kuVNYFIIk1p9LF
	YB2YjMZnjkTRsBGaRDcg+7Rf/ohpgb8zOKpVadp44kdQ6IhB8PkRq8+Zkedrl0Ir
	EjJFfsYo8y4K459wa+MSAoS4v+8bN4QGj6RUrhnHb0rO/FhJp9pn4dIxHnOxBTCj
	nqbbY7kABAeSFYT3B9hGaKv6DwcUqLqJb5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnj9yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so192312185ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 01:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296028; x=1768900828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgwGAj/f+zq4C4JuNQWrTXFjzyBuQEqP5rKj7r1xKn0=;
        b=hCRErruwlvM9ZwmtCrtdVgW3TV4SoOWjTkH3K5NJkdFN0qswAwgSn3PfFCMpDDX4jb
         mLFqAjJWgERDrphanWgwNUjeYHaCuLcOJjNsZuuPVerUgbowxo4ng8fcfHEYu7LfyfXV
         r/EhvfyVBfqtZgoV/t0nnLNPKu240dJq8ibbRSVd+ps161yN0PD6/zQ3KZKzzliGUPLU
         w+De2fvtIYyj8DO1Qda5gb0zY1fpss6UiN1lp8vYcKVrhRGZfzYNq4G0fEKHa7VhCeR4
         7TnSidu0ICXwFg+PwvL+3426MbOabaKoCnbCsH4LBHA5sOLexHD5ie8kZWe2vGc7sVld
         YSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296028; x=1768900828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgwGAj/f+zq4C4JuNQWrTXFjzyBuQEqP5rKj7r1xKn0=;
        b=jIwyd1LTImWe7x4Dua5KNuDw6BjXpzGv2tCx5XpD1cZcCuCX9x6U5smux8z+ENDkKD
         Vwr2gRKvxhDfrHVfrXDhQ9woeagKTTl9V8B5Ghp5IfnDsqvwo96BGCz2f5mU7CB8hvC8
         SPNzJLv4eL5pPW/2PIxz1edp5jGTec19uP35I0zjdhPht9iDfG1CFKXvaZukTLRSaupR
         l3L+5D+jGBw2AXJ3yxGN5tO05AInMHLUYX3RlFJKdYVHJl+0aYceWocVb6X83Q86pHqT
         Pv3AmQrj5+VUIZlKSaIgzOT59Ji+qqhVNkAMZCshmD7NhW34AdDT8cEu7WhYu45RVePH
         TDLg==
X-Forwarded-Encrypted: i=1; AJvYcCXQD4HA5aBHbI4P9KpTGD2+PIEJROcE/FtYn5vS3S6cjy8p1umiOFVKdXSS/HkKgCIV52NK4sKCNurWrlybXh7c@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHvKHabEahDv64FzT0/9cYp0SOP495XbatWrx87PZeBPpa6a6
	LX+ZhQT0xqU0LAoa8e4fOQsmjLQp014q6pjoJeGEevNl2Hlc7xvWDsFyp2OgY6ft/nhY8TUdQjN
	XhOysyrFH9j114MecJ2VdjTWj5uFtH+322omFFycUFN22EqZfJ1QKApRishrYZEo2zw0vcI8w
X-Gm-Gg: AY/fxX6C9Mw2TTwmnsNy/FfRMh6IgErF1faH28wRCaD5QE+l+jQNVwJ/IPyDMbVXdJN
	sAtGRk1e29MkrzSy4SgdEX0yWygbzt8UfZ8v8hyjCpEbpi9hRbpJLfzSswPc4H7KYWUk+dxCvJz
	AiLp65ZxPkG1BseDopQuMq0JfkSkQfrIPUhWLvyVAN1UHK1k6m78KI+Hzj3S4YaC8aIBriVaLj8
	uP5gTxsntQQjUjUlBEo5SsXT5H4mpyGwdXDboIhxXlW6z+VqZgXbTU1TASLG0N0qh4cYFISuB4o
	P7u6sZevx3tfwh0G67lp5GwiDb4/qQ2L2/Qb5QmCTJ/5cKtXPoCcfvFA5OOd9aXuy9cYIDbtj9b
	GamXRfg10xaEGeoy7Pba2oy+NyhKAJ4RLoRb7HiPTTo+Jl369FZ9sO+O39X6Gt3Q6Kp9jJmNUPo
	WWjFI97ACq8eEXMIOqI4VGdhmtoBPwT7AJSQU4GcA=
X-Received: by 2002:a17:903:1b68:b0:2a3:e7fe:646e with SMTP id d9443c01a7336-2a3ee413991mr212377245ad.5.1768296028185;
        Tue, 13 Jan 2026 01:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnIo1+HYxjSK+lCXLl+aVEFawtHZg2S3zFQBZeJgbNllmR99q8enlfo3vCNX1DwcQihObuXg==
X-Received: by 2002:a17:903:1b68:b0:2a3:e7fe:646e with SMTP id d9443c01a7336-2a3ee413991mr212377005ad.5.1768296027682;
        Tue, 13 Jan 2026 01:20:27 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:27 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 0/6] Add new driver for WCSS secure PIL loading
Date: Tue, 13 Jan 2026 14:50:15 +0530
Message-Id: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oo1xMXKvF8wuSy8WTfuPcQ7NajLcYvot
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69660e5d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=RJCUFTRzgs7Fj7gX-CAA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: oo1xMXKvF8wuSy8WTfuPcQ7NajLcYvot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX+iI17cjnlTMi
 cU97e1N21gvvf6sHJuWaBSWws6nFPCU/bkL1ueC+ahGyV97Rh1GC8dgYoCI3dc3Gn/HPCpqpqe8
 Isnr7RZD5MR/7x9lE9UDCgrMT9oSJ8AHRR46Br+4qm3jlGIE4LIi5K8tpizch85i1Z2cQBM1dcZ
 ELV+8Nhwi8C/uHlNnT31US2dEoDc45LF3h9NEk3olN6Y54MjsMiLzidO234Urs4ayP4rhCksJ4x
 xlcESjNX95KG/awdrcfOFs6dqRb6uow1XgIrouzsOWLGOEeAIrx4yIOE9fY2MlA7eWenjdxJOh7
 Q+Du874oVUDgaojN4q5xYBHJwUFO+KWxyFNR6VFDWFYCwj8FCz89xV7KJnx15jZULdA99mmgdYl
 WihkaFq4DImq8dNF6e9z0Z5C3xQKb2gBOvE5K/W//k2DvFUMGxb9OVd1EV+jg6IDfNR7Rd92Fax
 UDnxCckNG3hDTg0vGJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130078

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
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

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
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
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
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
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 725 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
-- 
2.34.1

