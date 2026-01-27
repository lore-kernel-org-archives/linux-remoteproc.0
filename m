Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BE342524
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510355; cv=none; b=gKap4Q5IunJmbl4eElMDdpkRxonSNTc5mTMaxs/uFbTNlv6vPy51A/hpgHmMNN0UjnQNibpYim5Cd5KkXxJUHoSU631w614PrGhd65Y3Y141OgMAIxR7TORyQ3+c9WBB1mKIUWD7hU5rlpvPMT1sE/alFll4bURSgEujd6y5DoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510355; c=relaxed/simple;
	bh=Ze8qTVdrVn/GgssXDGcMZxw7mhSi+BcjLGzHI5OsYz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctUUjH06c9fFFW6pBqU5q0oKAQ15+d29Okzipv2p0PdnbCAa6ei6O7h4GTA9p2hEVWnEe66hpV/PFOWqLKdSZuaNP5UtaY7BaT4XPGKPxOLck0+ZqvwPOPU7iMSXVHJN7Zv1Xm/QjKs3Ywl4dCOtB0KCaXg1mL3p/OCoHwt1EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5MK7sbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlhOmLAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5MK7sbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlhOmLAe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9hPIX786325
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=; b=A5MK7sbE9LKtIGam
	ReJNwtdBg4MgiCEY1c7G5zXKJbD0mnlwt2wxj3zWhIA8JGLjwaz5J543+Iya/xgM
	oO37lcpoc1fdR5Zb39mj4F8jRkhC3Hw5voTcCInfG/foeA4xfnsL2rWsQtJ+AU2k
	DI85c2xHfxUP/n9L+5C+dOC/Ty/tETWRln0VnGlHCjShDOPED1KsM2x+SE1ypvd0
	3xPPExyXUM60sF7hQ+xLQR/epjZkn7pj3wZB0PO01E5gOF8i5CQLul8AdSa/HT8/
	lYxUjAlyWmGjHDJyDeXo+qII35c9MJG1NaHeDu15jkk3n7PIcu8nb/6pDaF3Eu6B
	jHIyDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93j8eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a863be8508so25433175ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 02:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510352; x=1770115152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=;
        b=RlhOmLAeczga2c89RWP2kjmv/oTqjnzjXTk3+h4TS5IRike4/TTtKNbfvPiChYQWb0
         Cskggr/GXwVKgxG6n3NvmSTD+6+MtndLqqlSYPtbE0isSWLjP4a66JXJiVd8ZlrBE/sR
         5oVe97IMRR4a8cSv+q679IJFh/ojxhUzvWIVdU4ywOKwYpqATXOpqfX8gWC2epvaj2JR
         y0WC0P/z+1MhhFAt5Zx6i1raAajLVD0VcYDMA9rGqVAsCL1jdIPzijAeC7ERikUQl9fR
         MomiMw96CMoTzBE9y1W2MPooPHjczZNP4bzWDWOPemmLS619063E/F7ySy8Rx7EXi+f3
         LtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510352; x=1770115152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=;
        b=A1cxNOSYmhH34Xdx+nNilCWD+M9rzly4+uxxILt4sf5TPQbkg2ZWDswJmS/pryyo+g
         hs+WmJvId9eSghOgRwc5G008fgKo3vhRsOp/zaRe/yn+JRtP67C9p7LX7Ib53ChylgCl
         8Wd86N9wXBdHoK9XRDdjRwTBPBJFOAXxSpQWuXxGZWIE7VWOuI7XTo/H1byIL0pYnOGd
         K0WEvCV9oyz1CMcE8kjOXdQmZnsOLUygLewxdtn/nL6N8+A9GYAVwJCtmKLqFG4hZy2J
         Ls4r1WTOezw9UQPULcOAPQ9CA9Yis+pDPp30zkonIaauN59KquomtceNQhJwbvnhuPMr
         dj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/qYzxJdWr5OIJ/4jV9ToiIjyY2MZl+YszoH4ETlL47zMYgdSka8UufT/0JvJn/1EpN7+owiekKVQ803L2xabq@vger.kernel.org
X-Gm-Message-State: AOJu0YyNi/OxY8kNnd5fu30LZcbRkISSzVj4Yk8XiH/2pPTF/WWOd/kf
	EhsHRlzOwyx5gxmVqfeltI3NIy2vlr2SJArMKE3NdMQz9gLVKpvlY1x9AOkt2/foAeC3BKveb61
	fHkYfeqdkyXvKp8Dn9ZKFvodEZsz8j4PXBGIVyJRpemi60gWZZ02jkY49dIK+rAuqqABFcJO6
X-Gm-Gg: AZuq6aKTyZp4kV5PlXI7KtdQi0/0bhlPox7qWp5Rs50K6dOLf9V9NeRH6wS92bUQLev
	ByeCBKHq+Wlp/VW/VllR1GhJVvcUU5levpDHRdoAaJZ02czwd1jXq1e0y9QHddM97RjhuUN3PQY
	htqhwLKuqrpyVCwl/jWyvh1Xn40iAjK4lU5UwtgBRok4SQ6tTTs5A8VDCRb84G4CRpJbpMb+QJ2
	zziKcHiyByDonFj7JZfj013evjnlrCJUi9KWTFX/7qam7BnXQaqwSN9dJMS+784wnSmI2YWdjuL
	FybB6QJXL6Ok3P+vsXivJoFe/FdR6OYxmscc12WDr3WzxhyqgVuWHnQt6vFdW9JMspm/N+TDE4M
	XFiPRiLkMr9LSuv049DhfQis8HALon11jq50PTfQ=
X-Received: by 2002:a17:902:ccd2:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a870e7206bmr15258255ad.45.1769510351936;
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
X-Received: by 2002:a17:902:ccd2:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a870e7206bmr15257885ad.45.1769510351376;
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa782sm113957055ad.5.2026.01.27.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:08:45 +0530
Subject: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
In-Reply-To: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769510346; l=3224;
 i=deepak.singh@oss.qualcomm.com; s=20260127; h=from:subject:message-id;
 bh=13RQvVdEs1aG2xZBqFThtiXdBL8dTgVO/i1E/yHiDQw=;
 b=V+UbhjiveXmbsLN5jTG77Ybp/dhsM/WRiOqGV97dPznomIp9JiI787EsyQ//g6VUFv4a75ATH
 au/CO93TTFYAcnsvwt966djJuXyKCnSojgkeXSb4JOfGweTmY0SUzbn
X-Developer-Key: i=deepak.singh@oss.qualcomm.com; a=ed25519;
 pk=fVTLtknRa0voM2B2QT8dD1HmvNdAnw5PY0XmwOE0ldU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NyBTYWx0ZWRfX8mOWV55ghgej
 BlOVuTrenK80ZyCigFXiva/olZu5WomkQBdQ5vFNW1niMYS8EYNtU4WEa2EJ8M0FNjfi3FcJ7r+
 pVPwZHC69TwX4+l4loQ5c3SX/DrzCbfpQcd2IKXuZ5qV6Tm5gbAEfWRjbVS5UP1QhMhyR4CHppv
 iU1AZmWLpx5luajn9HaMmlsHDnjnSrt319+HfSAJUe8lCHApqh6imR/QMwgnA0QaYHiae6OE6u5
 JdZam0zDjF+1qIcXRwX8VqQpWBsVaTz/qUBo4VGMY1DE5OgEnMzi7WWFVw8Fs2UgrDgUjFJ8mTs
 a220syxAGfVrOhZt3mt1udGKz7Tu1bD6kMZiJGYwEOj0U4P3hB+gFZ4KZGWrTHcWlEyOP+5wfgC
 uMcEXq+2ubkilPUad7p8S1VNLm62IGBMTwZZc4t2gLOI3Wxp4i/SWzdVD2OLXWyYsYpVypXp/nU
 LEBBjsKltexjJ7k8hxA==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=697895d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00Z1fs_rM0_F7AXzQWUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4jD6bQoiNof726YpK1c1d4Ge1ES6OOhK
X-Proofpoint-GUID: 4jD6bQoiNof726YpK1c1d4Ge1ES6OOhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270087

From: Chris Lew <chris.lew@oss.qualcomm.com>

A remoteproc booted during earlier boot stages such as UEFI or the
bootloader, may need to be attached to without restarting the remoteproc
hardware. To do this the remoteproc will need to check the ready and
handover states in smp2p without an interrupt notification. Create
qcom_smp2p_start_in() to initialize the shadow state without notifying
clients because these early events happened in the past.

Add support for the .irq_get_irqchip_state callback so remoteproc can
read the current state of the fatal, ready and handover bits.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..c27ffb44b825 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
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
+	/* Check if version is initialized by the remote. */
+	if (in->version == 0)
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
@@ -368,12 +401,31 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
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
@@ -618,6 +670,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Check inbound entries in the case of early boot processor */
+	qcom_smp2p_start_in(smp2p);
+
 	/* Kick the outgoing edge after allocating entries */
 	qcom_smp2p_kick(smp2p);
 

-- 
2.34.1

