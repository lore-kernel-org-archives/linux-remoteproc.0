Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A6451071
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137046; cv=none; b=MKoxwC9r3RGeSEAPdN/EqR2BMw/dvVzIl1+8iR941Go2oIewMXW6wUje4gQ6ONIDwGwCK68o72/qmDmIBOpJRjMNIuI95mpqBDr7Zg5IAsP9bo7dVc1dLZCICoH78yQG0xe95PWp//gDh5f54+YeUunlFQgSBkpFLoOBO9k0Joo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137046; c=relaxed/simple;
	bh=Qki3/gbxeC0wNNfIOLYG0fdPkgVBFql/haBzvhMzN6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfGNjSeI9dGtfToq8ry3KuCFv9onzQHrGC/j0KUHgZEKl/npRhJSsFqZZs5rK97liVjf/OwJahXRINelQoTPOXoJXT06ahXs7QEo0XdSptG2OcmmqLxJ3Ys6VQ04gPRQ6UnQQoiANbY8mCPYrcoNN7cHPUDtwowPYO4MMpHmvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDCCa37J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIGjqIl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDCCa37J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIGjqIl3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9JX7d2460646
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=; b=LDCCa37JkWb3Dbt7
	x5HVkDN5nIcF74bDfkrRqK+xVIQH/guhpkkHSU5OvzKNM8eRW+Ylploo906t4bur
	IU0ME8nY6mYD1DjDCpINisA/AJ/i9ms9AItIdmRcgqNO+oUjzgcc1tDxEcz25/e+
	r0QOGpcm/hmpFIpSjjjillcDE4SO5NKfzx1Rw4a85/9D1AhYukP5P/caRwuN7SrR
	4VlXI6ez1JVJOctepaMCrNAoxTHzpmEH1YpUYtOm3tEO26wARvIxeb+i5O7cEBGN
	lZPTcyhQ/cGzMzO88V9fJIcNX01SRbl61XmlT00MTyTUQYNKMHQ7KsvW/zpysaq4
	p/cdZA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1bpys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:04:02 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4be1dee67so129396415a34.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137042; x=1773741842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=;
        b=SIGjqIl3l6hJBE1oQrVHwnzoqPVdPwuMJACga+99lQBUU392cGbKylnGQU3ZPhsqYv
         iYeLxI8uNtx22id8NeOZ7GFMtCgKAK+n/zIny+TS5armua0T6rpeyUSnSquzAsdEMqj1
         AKxRws3hpoB7yqa2WgwYyHtgwvK55ZjO1gaPqZNXsAc7pRT3V2OkxZ98oMNkrFk7D7dw
         LnTvIPZo1KW00s0ttX+Fx3e81ovbCjxeKeutBHQcPL3H4IjNtyp2V+TqUsqGSL/kdJnN
         KxkgBEQBqbDS2MJheIr4Z2de9381Fhuqwk17G/21VSaa6eUwR775efKmHLwn5B4SpKgt
         xdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137042; x=1773741842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn8dFADlBLXUsARpMgo35Ilp2iUnE9H0E8H55YGOyzE=;
        b=Yurm7Ea4U34osk3cZUvmHsc3b1aCdZrBrBjcWYE0tf1EQ1d7jwaR+x9dtS6J85qIKY
         DSJOtKILK5qhpZudh4WUu9nEVHpnEd2Xo4bVQYBGiRbQdil8Fornr2/gdw1OgIYiwbMa
         0x1CiQBRVFZ50NAqRYt7in3iqIy5stGSvw3UbVrp9Fb96BitW23hdIDqIsPcfEfNUwDY
         5Je7D+HpvPpb1+XWuxy4SW5BZ9nY0tPutFV5J/3+McfBvXN1g0OVYsMADZdIgVjdb/6s
         kxcPzacuSdj3MglNIfJsIhif+DIhzFWUejnpwtDu3HAPDqdu8fgYKhWLqpS8AZ5SIB2I
         wyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9bGX8P02AdLJ73CRtqRjIhRzFI3hcfZTXqGTPumM76CmcwjY+90DZLS4eNXE3iELKS4NXZclplcTFP+C0Mj6@vger.kernel.org
X-Gm-Message-State: AOJu0YwpaQcGXQbPdv/IUNn5cahFKOinPtX7LfC+oNAbmwvr9+Pm4OLQ
	TPREo6+sVRbeX65q7FuaGcegQEymxzZZPhmatLxT/w5UuPQF1Gz+NninYfV2unvT4bjsbsRrmr9
	T2U7MTF3HO8BKpE64Vyft2goxCn7bzy58Tr3bcZv2P0jSEXpxNqL72zh0IvH2LiB8Iu8bX6Ji
X-Gm-Gg: ATEYQzwrXk217aQqcj6l4z8g5U/sOmaSM45hjAU1aicnhokrWqgHQquX+8ObLHJpk/8
	MoM3r54irQtboLp9frNvOjDk481VbKOLiLBZSB3aZl1vZbxo0uekBu113MolEdmHI0+3UxiD5r3
	MVtEzZLz49TrkyJMRPeFXEwdH/cpUzd70mPXdiWxxYFOeKxpO+9PGOMZNyxvSmTkbsbbU3OFgvz
	GrhSYQVFX6sSncrGew2WZphOLs8rT+sXgoxLj93Oti36cBddEteS8DWxVV22ToZb9mYUsl6G7M1
	NTIaszTrp3eRRRHkJMnNsYxbnuOPaeNbPTV2UL/efZxx60E5D6hQLlMcEeUCVM9ZSIoInE0fwHq
	UHWT1NCbiMUoiWXwsyvxyA70gQkG9ukXnLFPiZYJqvKfhs/rdwO5ljVtwLEMFZNnzHhmbwoou
X-Received: by 2002:a05:6830:2e05:b0:7d7:4666:69be with SMTP id 46e09a7af769-7d746666b8amr6009170a34.18.1773137042182;
        Tue, 10 Mar 2026 03:04:02 -0700 (PDT)
X-Received: by 2002:a05:6830:2e05:b0:7d7:4666:69be with SMTP id 46e09a7af769-7d746666b8amr6009157a34.18.1773137041827;
        Tue, 10 Mar 2026 03:04:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:04:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:23 -0700
Subject: [PATCH v4 7/7] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-7-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=1647;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Qki3/gbxeC0wNNfIOLYG0fdPkgVBFql/haBzvhMzN6g=;
 b=63NZCz2HoyrpbgRCj7V1hnJNLOPV/aGp+Si/dIpCx9VFfD7tUReoPdHhbSHPgzO49FC93n0+E
 FifcvhdAN/5DmXlfeJSx/Whi6votTKz7x3NvddTOypIgi55iYyqZxQa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: iycUk0u26Z9A5urJH5Sr9qfYz3WXFx3M
X-Proofpoint-ORIG-GUID: iycUk0u26Z9A5urJH5Sr9qfYz3WXFx3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX2u4my2JKgXlj
 mBm3BkOmQNYNeMUTGJ62+kXhJFJLv02ybKEFSW2FpjEV1QwItxAtqRnIk2RO256izGNp2OrCrCv
 dyY0l96oBDhu9Q3o2uPx87ZOV/0BpxOMrBK1/HqHCGLcICymlGWNx3BEYbte2UoWf6mtwWWg10N
 jTOnpzx/EqKFp+qN89PRmr+yWcrbsLU+YRZFVP6ve5fI8Ovep4TWV2UzWE7H4WlD8HEEPcAKWAn
 RnswssydPjT0mfsZrGc/1TakxpdoAwQVVOspCzvfRZ6BJkpSz36G9MiQ4Xx3DyuryH0wjFRfWUM
 FLo2fVQGXq3kqwaxgdoKlppyrLAWneEml7dkbDN1q7QOQ6VWT326edR3qNFWU1syC5JrdbjMprq
 BqPmZZljziIDAUYy2tMSVXEf725PFZYZauTZRfFJn8qGCjmhrUGyl4xDZdwvgRfOzbGV+W5LSps
 t6CkYSlgD5s7vXpJI/g==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afec92 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4700d111e058..a5219dffcc7c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1625,7 +1625,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.25.1

