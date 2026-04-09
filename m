Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C404F377EAB
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724401; cv=none; b=f1KO1nLOHjd4pmIBiOl56sfqOq8uWDEcjkBdruSirmlNFVmX5xYoGDhtQd+sdJV4hK/C3H9YGo3jPAyGc3Jxd9Deq8O0FMZEJPo1ICckzTlltRo+Woy24b9q6h0NzfsBRL72dwiCuJOOgivCvxPN/cmGg/7a0YMSfwjkKrabaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724401; c=relaxed/simple;
	bh=L0ObvfduWGAGP21veczdi1azriQW28n0o9uJhPgYbBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjwPP1GosHakFzOOa41qQNocYB02TM2SvZwdTObCwnoaL1SY+skWVOG9pMjxuQGa/G+DDG/NFlbedL3habFyHyIF5VTMzC5A1RkId7V5yle0BG2AnMh56Hp0tsMAWBEb247UBWNAHzNMvOx2u8YM1SD8SZL+aMU8nU5n2uF1djQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQe54dZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjKnZYa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQe54dZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjKnZYa7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639789Xs2845008
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=; b=NQe54dZqD4tXrKWt
	IfH99gSgI1GYFG4OJXyu4tM9Y0D3CQ+hQYtzyk47L8lKJbdAldEFtme1p1/+gXuB
	2WOyN7wAOiTYe3mRuFochd6CfJ81tfCR/K4aWqT80nS1k0m16TWE79+zfjUhMfXD
	LB1tH9L7+2QmWawGqwtjh0feIe+DNd4C6a7eTFHnWiBBsalXbSlYye9Y0+VUsXVz
	Jg6r0ewcgVRDgYK9W0KAqugPa9HgDquxee4dE+AG8gAdUeSN0viTqOaOgCiC1FUK
	njCPnP7CaFkBuC92OV5IV05zhOuPXCnpagw9orse6BNYU6miplonpMRIxo+9P8Al
	j3zUPw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hk7kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:46:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12bf921cf49so8662792c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724398; x=1776329198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=;
        b=SjKnZYa7DXoib/ne2P0NLPNfolrQOLQDtZu7CI3t7c95m0ekprVt7G/2BBGCWajFwf
         resGsJo+iBJny4q/BaPMTxpx0kyYeW4f3keRrJ9uXB16wWV6VHyzGcL08STRW2AWXjDb
         HrI8ehEx87dcz9hu9V9S5O48QUqzngiMtvxnVvc+v+gVNaErtS1HYCm6JIdHibtD2cXP
         /Rv6dvkXenh5FaO2tZ/jlO1NR45nOHit7gYRaVjre7qWZ8SpOUPIF9qAt9y3O19TLzcX
         z5OpipsXgZTRKSxA9gdlOzqJoGx7jzSRgUMCTntI7N9CEbrKRxH69MR/yTfE1mPewSPM
         pJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724398; x=1776329198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=;
        b=YZcC5r/mRHwc7JipddWwBKNiq7rloxibU2RGCilABs6OZ2Hij5AvOlsphq4jfrb2SN
         cFCWOTcoKFelYlRqqb2rqXPz4Q/8Av43JaUjUSwYixVIoxiCmx/2OaPSiuEZyWxarrVF
         +4dTOvDJfdEyKpH/wH13S3vITsmHOd7Vmy5xABH4RFyeFa4wUBNh5obhKrqX+3QQh5Wh
         fptfJOq8tgsBKtHRwS505h/7XdQAzHIuelm09ZECxLv7XvA90BSUMK87oLVG7DpLSlAl
         B1NUE4h64BcyWRuw43LljBz/W2Rpaw9XlcFh7XoZ9B97veBGr7Jw0sxN2ajvjWM2SMd/
         DOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn9HVAsnFQuANPebACuZinl2ioqDF8w5hWcGBmMYV5tQOpsLNg8YM1LChHhaQHND5LMLM+HuttWZbqdxOknyPX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GnhBloqTYNExxs4Du8VDnGEn9PuvAOD5S6E9Rl1ncB8W/mJc
	gy1MByWpUvOMM/ka7EIlygyeC2VdFxDBQkiDETVUZEG/7Vacptm5hqlMkTaYIuyA9IKJkbnyDev
	g1Pc2WF75hen0M7pJcdcpvDgK/nJu3WZ1o99mYSVyLuG0ZyE841LijuBwxRcK9MvB5dYIVaFg
X-Gm-Gg: AeBDiesxTk1ESNVESGSp4oXJuTIbiHWLMcbP+gEK4W03pjRcoHUOA/8A04Bsz/pP2Ct
	fWtoJNZyW/Bf1a8kI7Axd/Ow2GMjI/DZxUyOIkvlfHLsOn5NQIy8F3DTanxfUEC1XyN2HjDJdat
	KamWlfEgK2Tp5plXvCOWbXDrzzDZoZrdHR3v5uEDXCLI19+4IlNT0YpTPHwQ76UN4vJg1mJTNKs
	MUGlnj8waCuMJtrbpc5bsaAnYUOxAdhV1v9JItYMO1RYGrsSGlSEIS5dgCoEsTWMp+/4nxXlrIu
	LI85SIubo/A+4ag61cdXSe93MqazcGXGd3394ILuX8a7OEjDMipvApTjZ4tMa/8b0Q+F9bFJ9mA
	BRfIzpwWGLf0twcAFidXrSPIycFPBYRDQKQU++/+ImXp7fAJi35KSLSHwKVUd+fyWL/kOJIHb
X-Received: by 2002:a05:7022:b9f:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12c28c0f6f3mr1406824c88.31.1775724397903;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
X-Received: by 2002:a05:7022:b9f:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12c28c0f6f3mr1406807c88.31.1775724397294;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:46:22 -0700
Subject: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
In-Reply-To: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=1712;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=L0ObvfduWGAGP21veczdi1azriQW28n0o9uJhPgYbBI=;
 b=xe0URL/XMhcfnx9ZDqY0llEzE2lxiq1Xz3M6I/6NxV/iPXd6RWjb0BmK1m1XL6V2FSQh1nZm6
 H0zrf3mmxCODjPvRtTgTbq5tDmx9MQ09y0Lkm7e7VtnHgb8tOlEpXea
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d7676e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Bsuwbdf3w_HfsqIaBggA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: g2HO9d-CH_MnxiN_f9s4seEEMhHcIyeN
X-Proofpoint-GUID: g2HO9d-CH_MnxiN_f9s4seEEMhHcIyeN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX9wIqBbjLQQea
 9CHtI5Uo71F9PbwLT0vpgUjytGEKaKbW5XetfMY7I7lyN5H/BPzVDckEei4OLaxvXMJCTHNSToD
 vuJx6nFPAa6mkO3sa5EIPEmX3mq8q4XLU0GrYZPN1FdpabxDCx1EZj6geX0RFCoS2YdTTWjxnBr
 0n6hnPFJbLXp9oFi4aoytMA7vSpY8tLHw0RK0p8t/i1qaIuKH0KpVqvrzdJ/mBUuK+Y+ZqdvU1g
 sTulb6L9m6uk6ARcQpgMns3c4MlGjY0VgXj9OpJC3I+MTM1VEYWib71wcWOv1EW2MX1o1OkajkO
 DR6gK5sC6nZggAGIO0Iox0g/HDsx4UnUdpFxHkH4NRv8UgWRcAWmVzLGGOSuWkVlzvn0lc/xhH0
 +4pYLADOlRz0AHvC8iY9c7qEW6x97S09KqQskoOJLC4I3HHKyqzkHfbdd3F9KdWhIoeBmgYojWc
 6232+ecwHY+t8yMMCnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090076

For rproc that doing attach, glink_subdev_start() is called only when
attach successfully. If rproc_report_crash() is called in the attach
function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
be called and cause NULL pointer dereference:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
 Mem abort info:
 ...
 pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
 lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
 ...
 Call trace:
  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
  glink_subdev_stop+0x1c/0x30 [qcom_common]
  rproc_stop+0x58/0x17c
  rproc_trigger_recovery+0xb0/0x150
  rproc_crash_handler_work+0xa4/0xc4
  process_scheduled_works+0x18c/0x2d8
  worker_thread+0x144/0x280
  kthread+0x124/0x138
  ret_from_fork+0x10/0x20
 Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
 ---[ end trace 0000000000000000 ]---

Add NULL pointer check in the glink_subdev_stop() to make sure
qcom_glink_smem_unregister() will not be called if glink_subdev_start()
is not called.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..79d9d45e0b81 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -220,6 +220,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
+	if (!glink->edge)
+		return;
+
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
 }

-- 
2.34.1

