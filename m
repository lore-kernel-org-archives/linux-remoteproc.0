Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A631A810
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Nov 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183802; cv=none; b=SejHofoVHTPLPPl9jp4vPrxjfMGOB5uBnZ8yB5nJH1XpQAP9aEFf2A9kPLrcWEvBn/uPYsYcXNmqvRz6l+YRCxmY7tGzEYTUDyukJNloAixtjNsSV1EpJGCtvj2FDdv60D2eI5Z1TFb6XYlkVYL/+cagBKBV9+z/cmG8dsxi/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183802; c=relaxed/simple;
	bh=JdNpmgpvzDCtH5SZL/dNJAWTPkyCebG1SD4bGKhvhCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iqPfIiEF9tGMtioA/HLKu9NjHTC+qevX5/zbotvo3Nvg9TeITERVVjv/BexYzxjeJlwMot57MxUrb34Cg8KuigjQ7OmgfRZsHvGMOjKj0L4VpxHxZuts6iBHT2V6VYhpcCLavyvEXmbgnRK5Uh2RXd4Vs762ZZXi3qlB2ShAyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4p6p6ON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhoW+wTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4p6p6ON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhoW+wTC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3ELIfi3304014
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Nov 2025 15:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq0Jp95HnB8
	vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=; b=W4p6p6ON25RUmaYjgbID9g6Lutk
	fHInt32B9VwWiGxQ0u6kX1yQV+AkXz9viOj3GV0YJV6epGTpUAo/p8/gm0Hmc9OK
	TiD+3RCCWMVwMSA4q962WyONpNfA1DdSTA17z6Sf5f3XP8PbTVU+M7eKsRTPHtk+
	amDr/5ySzMREd7A7SYA8uww6qZLbOdzmMLEhBstKrcb656O88jqKuyKsHvncHlxM
	YSWEQXLWYbj7leiUiJvZYHn75niqZSS0cqfntlvuCUjNirEX/SYlq+uGnh6hdaLa
	0WKL7Y8RixKZLoHEyoBDJ8dKg8vXjbF6TvzYeC64/g0ylGWWDcT+cjtDLkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6x33r6gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 15:29:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295b713530cso13205725ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 07:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183798; x=1762788598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq0Jp95HnB8vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=;
        b=JhoW+wTC9JLODNdTXXGm2Q+SPIEV4to1t/1QXIL3jLWJmfKIcIKGc5yNzM0CEnSFho
         ofLrvwzeEy8iz8R+RGA7iaLUimPfFRwJyBpiZ+kdcP0Vt/NTdYYM0AWIwfjmh2ejIzjY
         GpF1BhNfRGRtt2fhcsa43D7Axp7enRUdrkTionZTkuJD4iUvh9neL7Xmv0GDFZK3biba
         JuLqhJAxZChU/5vE/3SS20irdNUHeXk1fcsMcMnO6wihsguqphYrQB0CFEGzHQKpiN4M
         BERBo49GCgTc1/bokuj5n17s2qSt77zjDtSuWoTKhutsyYQKsutrlFDsvqjNDZcYP1wX
         55iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183798; x=1762788598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq0Jp95HnB8vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=;
        b=aauNddE6dD8mzhid1Dopzg4lmDlJBkoFCEdszt311OV+Qe2gWdGWwz9uYAo31WXrF/
         YtYtNAHoLLMh+4SvObVWM5h8ZdnOK+cRpZsaeIACJ1+UKn9vIDQ+wRON5y81ULMUH535
         yVhVn0GQ2Kd+fwoWeatw34cD9a5V1C/f7qTamn7NTlI5e8xmgOIxm7h3Omr3R2pqPoyv
         bhXIj8fptKfVvv5j6+exQ3K8/olsgLQ60KKTKMhQBCNSEPsUTuBeOPXhKAEqB/V+ltoi
         +1+8gJ3hkXHmE7w4OSMLMOOAFX9Rn1HhXOPi0hYMb6PDWazwjgH+58WdAGAxdlP7pjhP
         6zKA==
X-Forwarded-Encrypted: i=1; AJvYcCXJJl6ylniV1hBlajE+gsxQdoipSpmO2TTvY7YCdYF7NycF5o/qPGb/019xFTXd6gXU0q3pYvwIUyGYdRz83Xwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Rc+u01n9VAYhYkwv8khKr/ixf/NtgRvYePpaINfk2D2PHs2m
	m4tt6voMQTDmYKuuXO7ahxrQZV0MTh9VqngBBrWS3sDzZMgPJQXTQmOhsdxgzwT6yfvYhAqelKM
	DBWU6mt2ZUQSqNOnW0drn3TUa1ncNWPhOq6Cn5e+htXqgZl2YKNfJ7s4kbKUQ6qIdHMj1B3hV
X-Gm-Gg: ASbGncudcvWSu+XxlingneZ3sq0IyIrZDk08EuEy0wcIXuXukFAygE1ru8sx+xY+Svi
	XIrhXkGXbXfjhEyVniMB5FYYC5Gw25NPiypcniT3T/dIdTT0ihFdz4KEAggz0jeeLenR4vlKacL
	1FYncyAnsvEc3pXdi0QHcWU6uSuysabZoJysSsQMxwKT39//SDpKGu2irbcGTE/RYvhl1RpXqdR
	E9+jGcLsKLjg3uwvq2xmM0U+UP0wHJI9CkEW9beP2OH5ZKuDSZvmo1YkAayq9Fe/IQ7zl0QUhb3
	94tQBQwTAKcnHD56GLcXkOME6FOVQ/dC3o0cWZLK97vAbGatxLrw4rWShDLyS223ZnzpSpLnd7F
	MxsHiDerqjuiDTfL+Vn35g11I5dhQ
X-Received: by 2002:a17:902:d501:b0:295:6d30:e268 with SMTP id d9443c01a7336-2956d30e6edmr106985125ad.59.1762183794885;
        Mon, 03 Nov 2025 07:29:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkDOLc8z/fx45Y/zAydvBiHcowZMRZLZACMJmr/cQIxvEunHau6mXtknVxHf/vU0taSS7eMw==
X-Received: by 2002:a17:902:d501:b0:295:6d30:e268 with SMTP id d9443c01a7336-2956d30e6edmr106984445ad.59.1762183794199;
        Mon, 03 Nov 2025 07:29:54 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:53 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 2/2] soc: qcom: smp2p: Add support for smp2p v2
Date: Mon,  3 Nov 2025 20:59:29 +0530
Message-Id: <20251103152929.2434911-3-deepak.singh@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: IV8rrE_wv-2GV5DBeR0C5ouM8E-VfH43
X-Authority-Analysis: v=2.4 cv=Z5Xh3XRA c=1 sm=1 tr=0 ts=6908ca76 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Xvny5BtixxlE2jsoVxoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: IV8rrE_wv-2GV5DBeR0C5ouM8E-VfH43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfXw7aYFJIeSpcm
 5MgDGMJpYyarUn5NqesDG6nPTa2KrOuP1jZAhTSXMFy/xvxtHF/pxc5/e/AXcnlcqdMDmBUJPNr
 mDFDfSS4r1BkUNNh46p88BzQDwxht4JeGk/ibCCFOrPZemfPZqijqvEEulg2lHTk3iLtxDRw4nw
 1CGvIE7rfght1s1oglr9vt/uZTV5Hbzzp4GiygewJL/O4EqyyHTIC5dyPtlyNwRYEkjH8fd4kRk
 IoBLq8S6LfPwvZLNI8x7zJDrFWmPmFsv4bpNxf3tKyO2p1Qk31mGKIiFs+iE7QubfaqL3U2BdKt
 yYcBHORb1uO9WcB2+nCh0PmsayozJHr6OqQhWY3twuaMzp8zVTMkBPFF8ATVdQ5zZgpTj1OYWDD
 qaY+AG4o5OLy4lC/kB3i9n7DuwiPyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030139

From: Chris Lew <chris.lew@oss.qualcomm.com>

Some remoteproc need smp2p v2 support, mirror the version written by the
remote if the remote supports v2. This is needed if the remote does not
have backwards compatibility with v1. And reset entry last value on SSR for
smp2p v2.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 41 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 39628df36745..c35ca7535c14 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -36,6 +36,10 @@
  * The driver uses the Linux GPIO and interrupt framework to expose a virtual
  * GPIO for each outbound entry and a virtual interrupt controller for each
  * inbound entry.
+ *
+ * Driver supports two versions:
+ * V1 - For processor that start after local host
+ * V2 - For processor that start in early boot sequence
  */
 
 #define SMP2P_MAX_ENTRY 16
@@ -50,11 +54,12 @@
 
 #define ONE 1
 #define TWO 2
+#define MAX_VERSION TWO
 
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
- * @version:		version - must be 1
+ * @version:		version
  * @features:		features flag - currently unused
  * @local_pid:		processor id of sending end
  * @remote_pid:		processor id of receiving end
@@ -183,14 +188,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in = smp2p->in;
+	struct smp2p_entry *entry;
 	bool restart;
 
 	if (!smp2p->ssr_ack_enabled)
 		return false;
 
 	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	restart = restart != smp2p->ssr_ack;
+	if (restart && in->version > ONE) {
+		list_for_each_entry(entry, &smp2p->inbound, node) {
+			if (!entry->value)
+				continue;
+			entry->last_value = 0;
+		}
+	}
 
-	return restart != smp2p->ssr_ack;
+	return restart;
 }
 
 static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
@@ -225,6 +239,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 	}
 }
 
+static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	struct smp2p_smem_item *in;
+	size_t size;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return 0;
+
+	return in->version;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -522,6 +550,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out;
 	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
 	unsigned pid = smp2p->remote_pid;
+	u8 in_version;
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
@@ -543,12 +572,18 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->valid_entries = 0;
 	out->features = SMP2P_ALL_FEATURES;
 
+	in_version = qcom_smp2p_in_version(smp2p);
+	if (in_version > MAX_VERSION) {
+		dev_err(smp2p->dev, "Unsupported smp2p version\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Make sure the rest of the header is written before we validate the
 	 * item by writing a valid version number.
 	 */
 	wmb();
-	out->version = 1;
+	out->version = (in_version) ? in_version : 1;
 
 	qcom_smp2p_kick(smp2p);
 
-- 
2.34.1

