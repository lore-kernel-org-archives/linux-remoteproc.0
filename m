Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AA319845
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Nov 2025 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183796; cv=none; b=u9bbuZw1zFWuRmWMUUaHkeHkFlVjiV2EuT4py3u5+/+WfBcml4z0serMcO6pSrVVFWixrCVes9fXGpZ+StSz2O+VrRpUhTCsOvSb7zmzhicMGBTSXqySBZfgr/zGJa4yvd1jeDwK+71HACSE0nqBYF5KYIgjWeUK4GNLZg8vNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183796; c=relaxed/simple;
	bh=dBArJw8BtQbb+GbIeTd+sj4QHw9R7vxcd2HVbGXyZ8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=so0GbzRSWaZGHSemfQ3BzH5aLE8+2g8l/J75koZC89KVHHszy+cgWqW0oOV1336VJNoK1HjNfVuKHFQjNbqzSaF61Ssu0/pFG2FGe1xFacLx+Hs9plvMwENVpTQMEBdc3+8g1o+bv14OnRAKeyF6IVCn8VMb5BbuqZw/xQ+F0gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm7iVkNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDiZ+t/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm7iVkNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDiZ+t/d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B5r1C2906327
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Nov 2025 15:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5RoU67xWc+
	/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=; b=hm7iVkNlXLmuTNV25NbfYm+bPFZ
	Pp+4Hdg4U6Ejt303H1ZP3RtEljLlZcF2a2sSHgyXYIKEY0piA2Rvx6H5aGifeyUc
	2/6G9ga3b3rr6ELRXFPaBD1GYmZsm4+SZtv1+xEagy0p6nd2otjKMHABvw/biuer
	jtkp5u9JuxmT2wT3YiQqR2siZPXFPLXmhggPsBYI533oCFwJvCHBygZVUmC2K+7f
	P+0Cu29rVLlBRhL8Tji4tWzwiBibQ8LzciYTKAOp88tCzUkWl/uVLL4/flHoNSsa
	DZNhAGIzEyRon2s95OMJgUNEdEAMp9EVj3iwj7AMBexqah7h/QzYhFxvSzw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u7krnu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 15:29:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956a694b47so20223335ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183792; x=1762788592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5RoU67xWc+/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=;
        b=TDiZ+t/d58R09rgflDHlUPVh9y+tWDbvKnLaXyx+BRDuLSGc96/emOdY5jPexKFIUg
         BdhcrMbSYsCrjsrcWYVFlG5dljzs0cbPXuHdBfg/NvCAKr1HjeqIwU6LYGFYVz71TDUN
         KOljy6w5Ia1pz6l4f6tro1npdgVi6Ljz4UhfRE0VZYZsbBCYHgBEx3haIHBxHO2w2SIE
         GIZYKYPedWEQ23qwQMVOqF4I0dTyMbmIZCySNXTnMiJ4MpZhX4dN57u9gk2umULB0+Li
         mfo9UBBdaABHfvBPyyi5GQAv0iTveSj6WWg1U8WEjQ9HI4QUl8hwCEyIjoatr4/VvpmG
         8JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183792; x=1762788592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5RoU67xWc+/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=;
        b=UrOdbJYxx69JvnQIvMVwkduezwYvzGLWMODbCtuaZF9KPUx8J8XrmEWLFFGV/wzwxc
         XNFERwiy/YRWwStwkGC4AUQB8rvSLKByz3VVFwKM4Qzv7Cmhvs1MNk6cxceRNSIosXwi
         RzwbFssGE9fOH9YlOIVu7VmhVKvjuyZVOyYsaV9Hntg8jDh4v9YP5zOLVIfK9pFJyblx
         c9mff1toF0EvkDAqXQZPrvd6pdywU7BFyhL1tL2zXjiZbEW17iyoNevGwBqVfoD+ueIc
         BRC3P84eJXNcvGsbrzhB3xdg0oVC6zPWnt84SYI7uGWlP1DGnZb2SSQ/0AlB1eoC66BJ
         fVJw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6pAEhS+ZuSFa5g4JHHDwYz31HCr4+a2S0NKZpBPP26uDfJciGPPGdGVCyLCFuYVzzzmY87xrCuVP68DK8nnh@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBP8QqifZ/cpM9tC3wckcau3Kb6IgZbAlj8YRT0+N/P1lsel4
	kEVKLRJT/3IVLSrlQVk7waPRUeWYw4CLstOfGf6lBmiLsEDMnvsBBtOeTsoO5mOsPTIVWqr6zcd
	ikmPukqrSWcUHrRyzbEi3qBLOAAdDYLeUIB1twKiFfoXQ09QJoaR1SPzOQ4uCEdVtVMyY2Cgh
X-Gm-Gg: ASbGncsA+QC9xOKpFuw2GI1uZF2JzgnPJnN9HWJCAaWtvIiR0iJanKJflxMkK5KBVmc
	ctnshOKrosc7SKe2WZH90Oe6Cjij9S7DDcYyIeLQpBteVBCK4jMxhnkeT6x59Tr/c4k3qc+oItm
	0CcZIGi5BftdInmniTOUzL1Ro/kLCa+ruX77ZOEJ1Zx3GAk3hqKB2tLZjzEun7bGs/acnmp7JKG
	zWKkQf5q6d+Fy4+kn05OOyTKCgoVOIWQ33sOksgze2TnrY+34Q5kvG21qjw1/tQRfmf3xV41lsv
	VPYBTrIalyKava7mpnZGf4pfZOpGkdtBqrx/gPrMGi3x/RLAw43iM/85Em/jaKcgHBZsYDA5FTx
	8jq16HxYSj8kgMzN1p2xnB4iPrARp
X-Received: by 2002:a17:902:e5cd:b0:295:59ef:df96 with SMTP id d9443c01a7336-29559efe23amr109155605ad.13.1762183791804;
        Mon, 03 Nov 2025 07:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHTGFTcSyqO40WoFf96Tzk+1rxW6bfMikFwy8bey6bnkI+yt5C/QmsCzPuTxQ6g51HNPuH7w==
X-Received: by 2002:a17:902:e5cd:b0:295:59ef:df96 with SMTP id d9443c01a7336-29559efe23amr109155245ad.13.1762183791133;
        Mon, 03 Nov 2025 07:29:51 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:50 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 1/2] soc: qcom: smp2p: Add irqchip state support
Date: Mon,  3 Nov 2025 20:59:28 +0530
Message-Id: <20251103152929.2434911-2-deepak.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfX02C73bY4rv5k
 172YfTHY2CXPmTvfvRuOpLAPPQhez+B8oAB/EShNd9/c0ZOGkghf7umiOG+QVXZ11zQ+lOXVuzr
 ZZ1V7sd4fh4ZHw0jb/1YvNcE8LWI7ZIrR0S+kLyef3zLqtyjpv8+I818jZ3+L19NsX5Y/XluYyB
 RaZMpmOiRzw4uJeXYhfbnRCu+4vB6nTteiyGLpTVaAnxSflGEnnTmRodhv7oaWHkPoT0y3MAg/P
 zY+VK5PZaxA935LBzA8tBYdlmmocC+X+Iuy3dSQpPiBPb7nS5HmkYuDVO7yxqffw5LFtfSUkEGA
 ViIdTFNDQh7wEpRWjTQXLOZQJ+aFJm/buc/HvWJHGwDowkGOlBWElS6MzyEmC73jw1mkko8Dla+
 NbPtTAzD1h/zX1AMGusDrdkIQOINqg==
X-Proofpoint-ORIG-GUID: gqSDUk8rSzeEVBczNT0kEpo2GnHem4Iw
X-Proofpoint-GUID: gqSDUk8rSzeEVBczNT0kEpo2GnHem4Iw
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=6908ca70 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ht6YvOiLTg5Y4LB-hcAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139

From: Chris Lew <chris.lew@oss.qualcomm.com>

A remoteproc booted during earlier boot stages such as UEFI or the
bootloader, may need to be attached to without restarting the remoteproc
hardware. To do this the remoteproc will need to check the ready and
handover states in smp2p without an interrupt notification.

Add support for the .irq_get_irqchip_state callback so remoteproc can
read the current state of the fatal, ready and handover bits.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..39628df36745 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -48,6 +48,9 @@
 #define SMP2P_MAGIC 0x504d5324
 #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
 
+#define ONE 1
+#define TWO 2
+
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
@@ -222,6 +225,42 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 	}
 }
 
+static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	char buf[SMP2P_MAX_ENTRY_NAME];
+	struct smp2p_smem_item *in;
+	struct smp2p_entry *entry;
+	size_t size;
+	int i;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return;
+
+	smp2p->in = in;
+
+	/* Check if version is initialized and set to v2.
+	 * Early enumeration of inbound entries is required only
+	 * for early boot processors which have smp2p version 2.
+	 */
+	if (in->version != TWO)
+		return;
+
+	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+		list_for_each_entry(entry, &smp2p->inbound, node) {
+			memcpy(buf, in->entries[i].name, sizeof(buf));
+			if (!strcmp(buf, entry->name)) {
+				entry->value = &in->entries[i].value;
+				entry->last_value = readl(entry->value);
+				break;
+			}
+		}
+	}
+	smp2p->valid_entries = i;
+}
+
 static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in;
@@ -368,12 +407,31 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
+static int smp2p_irq_get_irqchip_state(struct irq_data *irqd, enum irqchip_irq_state which,
+				       bool *state)
+{
+	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
+	u32 val;
+
+	if (which != IRQCHIP_STATE_LINE_LEVEL)
+		return -EINVAL;
+
+	if (!entry->value)
+		return -ENODEV;
+
+	val = readl(entry->value);
+	*state = !!(val & BIT(irqd_to_hwirq(irqd)));
+
+	return 0;
+}
+
 static struct irq_chip smp2p_irq_chip = {
 	.name           = "smp2p",
 	.irq_mask       = smp2p_mask_irq,
 	.irq_unmask     = smp2p_unmask_irq,
 	.irq_set_type	= smp2p_set_irq_type,
 	.irq_print_chip = smp2p_irq_print_chip,
+	.irq_get_irqchip_state = smp2p_irq_get_irqchip_state,
 };
 
 static int smp2p_irq_map(struct irq_domain *d,
@@ -618,6 +676,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Check inbound entries in the case of early boot processor */
+	qcom_smp2p_start_in(smp2p);
+
 	/* Kick the outgoing edge after allocating entries */
 	qcom_smp2p_kick(smp2p);
 
-- 
2.34.1

