Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEF44CAE4
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917778; cv=none; b=OMOwen48x7DRJowELS9ED5meBcU7Y9KSCQbaYq9SORGJFrZHrvzR3AkiU6cFhG7iUwW9rYZt+4Izc5Pjl/Bm9v6QFcCHbiutwl6XuygWdqazJ3uzPYG53r2QYw5jR50A7swXiCbSsQEqnC21HIe3P9YZQyg264FWHXBR9tY0CvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917778; c=relaxed/simple;
	bh=GkHfHDQxq6kcXRftPPAVs8KKYHLSKlMYMaUrhFTu88g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuSMr4tYPNk5N2tbOsCkkl0GdBmpBvPRIfufxR2m9TcjyZegZLhyQk57p2nsVng8mdwSTbkLDRcykwMUZJzTlEN+llT+M8/iGIGHNm1H7nUgaHLmsRGIEHDkcae9bIovkDWlsxodvgzpZjKsDhgybTMtdqnCHknaI73BTJkMNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiG+F52h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVcG+fM8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiG+F52h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVcG+fM8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqcpj3537469
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFaAYGbV+xSMPR84AyNeauaa+2DTFZJgYrd5KO4zgn8=; b=PiG+F52hk+NVIPPl
	1vlXjFxesj5mQgq0z1X0A/p/Mgi8E3d+vuwRN9kWT4ozhfvCy4mjQCVz1sirXRgj
	gm0BVwpVZeHtSDGOxoSK7T2xYPtZdL/ZradLs0surDzeOfttmEfVN4AfXG7d+nvJ
	8HdzWmNqtTn/aQZcgOGMsJx/YaaHP3u3Xt/jzbXYxkFtFs4WYSWbsuRJvWuM/gF6
	jPDDA/60dFSioLk+tUdefQ/fztwxgQX/MaFvB7nA4YoPOdJjCZWLDteny6ZzxfHP
	4EO+kLnh0SUvp2s4uumZj82ekQoFObZZA/KehabLNgGfJBNBModJe/TQmFKuk8gW
	vxijvQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh7fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so834788a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917773; x=1785522573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFaAYGbV+xSMPR84AyNeauaa+2DTFZJgYrd5KO4zgn8=;
        b=PVcG+fM8/NunPIpfi7NPNEgDB450ippw1vFWwNNWxj+p1k1dzXQmVbDZ8W/X56kYJW
         Meyy2XiPTfUTT71IzLc5iEtkn7CAWttdRcygJ7ymGLU5PbGANthYDi3VDv+rElYv/6lS
         Mmd/9JeiiabrqNBt4Pg+MmPC29Zs27v+JEuV5su8vn02ysmgKtZJvhhINynRucDILvnX
         gxwfSd9p2xz6iUsTWcGN/6u2mcIQhu2tQqZEDNIIzQ2Xyk5iW4K2s+meBj0kT+wvpuew
         cKj/Z3DfVbBR4gtNx6Sh5nXdrTsISWn8Jgz2EqAA85aeUFFu7BYSkEC4cKKOYR/HsyYK
         wQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917773; x=1785522573;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFaAYGbV+xSMPR84AyNeauaa+2DTFZJgYrd5KO4zgn8=;
        b=lHMWmrIHHZvVBmOryD/bULR94/lnpO0GCC+whAUL9hZYGW75+TNfm40SmMe+FLOhVB
         fX1sRLHiTF/WVzMFNv70CYu8xMDIb6xDtjYQk8Qgbsc1/9Rvi5P0fZOGS4r7eClBPmB8
         Pj0Ytw5UT+rX1CYAJ5nYMObzQQTZA5Izqp19yvDPGRqK1C6K7Li7Fa1IQ25DHGV7RJu9
         zTEBX7xSk9G7wMZ4tQN7pfUQ0Bb1iiu6TpqjlTm7E4m8kjvt/RAJZ3Iv99n4rZG2P25r
         bkiZeFdASUWNaGgxFMG0F8OcADWJ1Gr+y7sUpnJsIiw+bGEoF/BcqPsHFEFux0xInZ7b
         7MnA==
X-Forwarded-Encrypted: i=1; AHgh+RpaIVJwODm/MwngTBRUuD9M1Q3n+7+1teTt0+gG+b+gbgMVGAThYJwt6DK2q0cKtIu5Aj9SR4dhTGwcM8JqTGMp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Tz/2qKLnWvaXW1aDbY4fPpZycVnLwyO67r7KabQuCgpVd5cZ
	tkZLfQkL0wJ7wUzzMrKqHPh+Y2+RiSXbcKdUeHsrr39Uy9O4Q7mHMsH+AiimIf/j1Qz8S4ws3zG
	BMZ80cVMrAfp/Fexle0myfP75jdepcHZvA82A7XWxCxF0JnqdEJUDH/ebac4qAq/uuesVZp0g
X-Gm-Gg: AR+sD12pzCm/NJUSDf+1rKtVXzAEPQIJmp9m461h4kFFVRyGazHlBax3fW6VWRl8Uwx
	M5ZbgWbjQ+AR7P2G6eLJtf0Egqd/1C1jDqKcUTzJYu6qbI3HDZ+9MNRt0KSBbfgzx8s1v5aAXAx
	ku5uy5qryJYTj/cXslUC0y+Zdzba0hS7LLQTkpjPYtHRRKxicONuSk+GjOdBgG7tfHSp3bpPSBS
	lxe/cxYkCF3NYpxqvbLDSidlUGYq2XF96cVHubAU/1k9zlOq2hEZr6TYY0dgSK+8I12x0+kYNlx
	JmPQoGIYYl0/bAg2Z2mT0GzhxFvGuVeyIuwq1KuXaZa0oYl/+Ao3vYnjjOtlC5XEY0z6uwsDDV+
	YXPuKHgm6KjqcJI3qWSbOBMNK/QY=
X-Received: by 2002:a05:6a20:a11b:b0:3bc:5284:4859 with SMTP id adf61e73a8af0-3c44afb4d8amr9788759637.13.1784917773181;
        Fri, 24 Jul 2026 11:29:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11b:b0:3bc:5284:4859 with SMTP id adf61e73a8af0-3c44afb4d8amr9788723637.13.1784917772646;
        Fri, 24 Jul 2026 11:29:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Fri, 24 Jul 2026 23:58:58 +0530
Message-ID: <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX5ogKlXvgBzEC
 A7hwZkBJV2lYAKcqDAVBGBqGmeVZT95JYX05uu3PRw49EMX+SxC7EVSiruXOYyOyaRsEFY68w4Y
 z+UICzJGfquBkr7bSZ3sx3j0SJ5e81UMmQpqVd3/+As/uuqshHpdUJTwXYNSgiEvbd1tnlcBiDN
 wnFBWnOAQOvCMM7oy9pZcTHQoi3NgVU46rHSlQF2ygUc9PZBxKG8aumQoHb9QI63MjC8Qs54+Cj
 E4SKjVaMwMtNXvDSyu19AO19pXBj/kkmVD/O+QYVvPivFGHoqFrwaG69h3YHjqkqFcX6L1/CvsR
 vpkSXT5vfvfNz/dogiBK0zCOwtMyTHix2M5CqpwfgZWZBt1IRTVHmaiK09j3GR2PstZQbvLbzF2
 GVlPohVF3Fv77OwPnF4AWk8HIb0+EkquCzc79K5DPQdNIkPXBdsu+nqZxLM7ZGEFlzUDySjrC40
 dH9w7Gk6X6qJZfHQDcA==
X-Proofpoint-GUID: XvrJOvYxiVc-5arkaaGFdjWdB6RJRozN
X-Proofpoint-ORIG-GUID: XvrJOvYxiVc-5arkaaGFdjWdB6RJRozN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX+54JTlAWO2LG
 6fuHkxUAplve+//8vWZE8S1oRWBypDgpaps3Nmu2iZ/bDl+fyCbS4SygRywbXIEyx9OkzpuI+nz
 xOWkzByBFwtbiv6AG7Xjtten96bNPts=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a63af0d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

The PAS image initialization path always retains the metadata buffer
when a valid qcom_scm_pas_context is provided, even if the caller does
not require it. This implicit behavior leads to unclear buffer ownership
and forces new users of qcom_mdt_pas_load() to manually release
metadata, which is error‑ prone and incorrect.

Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
retention explicit.  Metadata buffers are now freed by default and are
only preserved when this flag is set. qcom_q6v5_pas enables this during
probe for contexts that require retained metadata for subsequent PAS
operations, while existing callers continue to work unchanged.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 18 +++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 16ae42e6c434..54ffec97cc26 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -664,9 +664,21 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	memcpy(mdata_buf, metadata, size);
 
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
-	if (ret < 0 || !ctx) {
+
+	/*
+	 * Some clients still pass the PAS context as NULL. Until all clients
+	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
+	 * for NULL before dereferencing it.
+	 *
+	 * When a valid context is provided, keep_mdt_buf controls whether the
+	 * metadata buffer is retained after PAS_INIT. PAS remoteproc subsystems
+	 * set this flag so metadata persists until auth_and_reset() completes,
+	 * as TrustZone keeps the buffers locked until then. Other callers leave
+	 * it unset and metadata is freed immediately after the PAS_INIT call.
+	 */
+	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0391e30f42ba..38e6f6019825 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -722,6 +722,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -740,6 +741,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
+
 	return 0;
 }
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..1d132e89536e 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -22,6 +22,7 @@ struct qcom_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
-- 
2.53.0

