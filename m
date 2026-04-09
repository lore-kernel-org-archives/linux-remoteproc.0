Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3D37FF4B
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724756; cv=none; b=KAv39nLQvZbY4TsfVC+zieQn7OpjIL4hLnQcv3c1X9Riq66V/ZfsoyLVX+wH7gDJ02739uDFHReDhSG9W7gF5SRIMbco1WRJO+o8jw74LzG4htroAOkpr2jxUQhv24X9RspSoYPWs/PhMmBmBVF5ffPWjvUBCV6LVlqdra12nTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724756; c=relaxed/simple;
	bh=VGZ2qnkepn3pJoBbvctXkK35dvCZbzYbNWt8Mi+WCTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tsoy1t5AyViHoyfSyEZ9IAqLNKC/LeGkg+h+hFiFontBnHDDDXwfmbHr8lF0zOAfd870bhCt2vmE3grDBXX6qIywgh2hB3OmYa9AWt4drns3J4eM6O2kK1TTBBdB1TGE+1im5eGCxxbAX4muNCl4BI9mop3J8+l2+M6PpkhjNfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLlnH28r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j27B/pKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLlnH28r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j27B/pKA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397A7Ds3049754
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8GXIGieiM1aeC0n8AxMHjt
	30GkwFEMXzDfbscEYLVdI=; b=mLlnH28rXpqXi7LfQNvCKJsFg56ZD68iy019Vg
	oaJKnMCZ6KBqnLyAzQZ3iHRduSG3NfJFR1RtLPYyhCHrYUXV/Za10LsM91zkpfgK
	3lRWjhMSip7B+1pGzYrPFvXMVV937QzNtCmlBcy5H/AhQL4u8W1mDMkt+OOnQ3aE
	VTnGSSP65T5Z5F3aNhs2Q7SJQU8lrtSsmKg6bCLNC8c3B/jgw4W3W+jvsgBlbeWl
	ttsW/Cq7JQDGYgis1cllC2auiAk+BuKYt9/+Rq6cdEyJy3rs8yoBXFmHV+GEyyUJ
	L+b0NGbanfgdm+2B90LexOqW8QtONiNr0sapHF7iNuy8dOnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b652-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:52:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so723384eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724753; x=1776329553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GXIGieiM1aeC0n8AxMHjt30GkwFEMXzDfbscEYLVdI=;
        b=j27B/pKA2rtnKFd5oDhnW6Aj9OCo4FtoEDz2rqDaXw+sqb3h2zGeNNKJzb73TBeCzM
         VeFqzfoZjyMI+eMQEMBrmv8BI8fQnfdP8/L0Gm/6518FhAH5PZ/ImhkYXPAuuAD+SrBr
         RLmmEyMEXQO0wM7ypRasasNk+TPPKtGOrqwIcVDQvjfmGynDe5etqMUazG9DUNZAKCn8
         I6dDP6WdTXM5hd/OJgbuiOhccTKnA5kZ32Acu99X67EHCm+LBEC6MuOCOE23kceibFFw
         vFtY/E5XEBLkjPcZ6QvYP5OZkMN4ItIpbpxZkzBFuabSJpqhKmeOeIm3lZxr05BKil0K
         j0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724753; x=1776329553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GXIGieiM1aeC0n8AxMHjt30GkwFEMXzDfbscEYLVdI=;
        b=e/68a3k88PsvSjscVw7iNzy8+yROK0uvAccNU+58dKJ4L5xag4VVFfbb+J0NnjAW1W
         L5JsRfrKAhkDifEOreT1pcNQNBWEkfHplF/EaH25E9jLAnVx5aU7rdhXgqROl4JgiQmq
         m+hGgalOk0auzIw23IZKmmZVmRXCCnZkDgZZnn7YSBQKavTyu7kC2FIT6Etaugbpfcba
         DomvDud2+gp/RBwWKk5GTIBb7rhC3gkRdrORWxBh9Z2nbQDhqOjVsDrsIn2fRP3fo8kG
         xdtulX0PyXx3XY/FVjkBHIrGBt/KAPUPQWnXM+epzaBaVFzcAcyQcEjqTHRaJdlalKpO
         mv1w==
X-Forwarded-Encrypted: i=1; AJvYcCWlKCEiPYCQReVCzIvlwTJb3itzKcrVDz1Jnu6mxeUjz7sBwcCTECq08f1gHnv/NEutKn82NzErvwev09sNG/1I@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyDHIoUOf3Vr8aRoggZLUqeXdwk/dLrlU0MG4pE0za5w1NDqF
	MVllmQucTzEfypA0HQ0BNDgnngegT/Z5MKMnjrAyUAU0+5RVlMEEEwepm/9EpMLF3PAc5MDlVIu
	Nzl6aAX480wYZ4mx/PrPqDQ43SnX8SE+Zf8F+CvFtli0TpcoaaOmu07gM0A9DAd0HUrX8jwNh
X-Gm-Gg: AeBDieu3gzCyM6YPE/49NeAMxp2wMPesAKIqThrNN+ORFDQo4R9N10gM7WYgWGJHdMd
	fw+jq4Ml2xU2/SIr+38YGPPdREw0m1NXii1o0tiFRjwufOOoTLxQh6eojqS0t4PEuyaJ3sIee4N
	1vSM+fBw3rpEHb3iL+PGnXrx1u3USLhMC6VK7vNR63h3LqEeaJSoEJ4epHRwXRdCQyJUd70yxeq
	p3zrF9iqajODzbYiXwMqfLH/m01pI+vazw81fdBfw98abPrBdzp+7a0dj6XUrvvshihMcLKO1aa
	hEvTD9/g1dbj7VB+0NiyYAckflx0j4yXphC3VtzbfgUMCx3jA2FFRLamrIAo2Z2CHvi1Ug7Nqm3
	PzWiz5hLCsCuQWSqHaQzYPQ51ilfX+rzWRpF5YKJb/LGdITf2vhpIhN1dhafAmVeruB/+zQex
X-Received: by 2002:a05:693c:2b0f:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-2cf3de7472amr7987116eec.27.1775724752531;
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2b0f:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-2cf3de7472amr7987091eec.27.1775724751942;
        Thu, 09 Apr 2026 01:52:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add binding and driver for Kaanapali SoCCP
Date: Thu, 09 Apr 2026 01:52:23 -0700
Message-Id: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdo12kC/02NQQ6CMBBFr0K6dsgUKVBX3sOwKHWURmmxo0RDu
 LsFN24mecn7b2bBFB2xOGSziDQ5dsEnULtM2N74K4E7JxYFFhWWqOHmR+Bg7QhFQ7rRCqtaS5H
 8MdLFvbfWqU3cGSboovG2Xwtp3axa7/gZ4mf7OMlV/sX3Ev/iUwkIaLRUtSKkmo6BOX+8zN2GY
 cjTEe2yLF+H79yuwAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=4806;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VGZ2qnkepn3pJoBbvctXkK35dvCZbzYbNWt8Mi+WCTA=;
 b=+BpHeCwt0hbXQGc5q+U6AFNxJ3nxZmOapQuyD4yC6yeNLcQyllhQZG7MMzVrgp+rpZ+zm0Z2G
 y0SHA0ZZ/N2D5pC5P5D85DlLvooaj+Vl09VnKRNF7umxryziDIg8mn8
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d768d1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwbTwWG3q5equovErDoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: D67txaB-OifNC32Li2O14VfNtzBr0tXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX35+P4i87wA6x
 Fp7EHbpUY84BpeYfRbU3BzDdxKSc67zIO0xIhliM9C0d+6hy424BH1rh1sQlb4ILjcktJIcZmTf
 /OGrOOriE/PqDiU41TkVXMohnfMFvx1Bq8r1MHNmcMXc1KXUPa0ETF51RoEMvOM6SHVSNOhLt+i
 XwcP5lXBEtpLs1Kvtzx4G/DZKGaPdv8kiXj3ZvLwACaD1yr/Hgm6n29PMQyquKSlRiZ7sFCjNe8
 eftMUOhbMYmHcOoBtuKdR4OEzeMeB1reiQkM5d3ph9McHElJo5uk+vMLQ3fVIxb5CYbTefGCXB/
 9InnsIKIxuA5iTtKVDCw7EIWlKhsiyiuG/BktDYOgnymYEUwvThkOROVBlLBxO6584nbLVh7wDO
 2R6dpYoBvQa41ydjfOsPReVpCvguh0Sf03kSUd5tEZCElgk3kIqM+is/LXTnza20PX4F91/8Rh2
 G2OW9+F4ujZ1HLrGRuw==
X-Proofpoint-GUID: D67txaB-OifNC32Li2O14VfNtzBr0tXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090076

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached" if ping
the subsystem successfully. As the interrupts are redefined differently
for Kaanapali SoCCP, list for the interrupt properties are moved out of
pas-common.

When we return fail in the rproc attach op, current remoteproc core cannot
handle it correctly for further recovery/firmware loading, which should be
generic problem shared across all remoteproc drivers that do attach and
not mandatory for normal bring up, a separate series is used for resolving
this:
https://lore.kernel.org/all/20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v5:
- squash "qcom,smem-states" patch with the change changing pas-common
- drop the patch that set recovery_disabled
- remove the 5 seconds timeout in qcom_pas_attach and related logic
- patch rebase and add reviewed-by tag
- Link to v4: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/

Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

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
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

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
Jingyi Wang (5):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  22 +--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_q6v5.c                     |  69 +++++++++
 drivers/remoteproc/qcom_q6v5.h                     |   6 +
 drivers/remoteproc/qcom_q6v5_pas.c                 |  98 ++++++++++++-
 18 files changed, 671 insertions(+), 78 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-knp-soccp-28e989506791

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

