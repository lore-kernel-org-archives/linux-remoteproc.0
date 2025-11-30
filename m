Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C22727E6
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506181; cv=none; b=UbN9Fhm+ie5BLJJJr2hw6fFcfOmVCNz0s+HR1sGhZbs8pxkHgON5RVh2+4pWZ9ieD6KYauzs3FsWM2xv3qbjN2SNpX4gp/ysdXR0XYZei/42c45yGRTqZwV/IzfecBUJ3bmYa0RHURwiCr/M24G3FhGdv7qj6h3ue4aaAljUwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506181; c=relaxed/simple;
	bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YX/pxQfQBUEmD/J9mh0/JN3tqy87bG6hpgXqqL7Qx9fAor3wSqGQ36camvPKdBqzKNhTyhZ5H7BDZ/b5LiDBMO5CKBp4oqI2CvsLjvcI8x4QYHsMvHA3c5GJXYyA9Se17XNGfYFNt/ecXioYYqV4f+ZZrUcDshYCLwHM6/xhKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpxT7ZCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtCbQ7Uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TpxT7ZCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtCbQ7Uq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU9ZLiX626434
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=TpxT7ZCnor5T2yg3
	AKgmBbRB5Pt+U1lPauoLJS0xDRXqqO93uwhjmP1g6U+ru+mDj19cHM5kXCpC8xkb
	/DN69xmHIx9y04/TtZbcu1pxjRkSuucpZ9iiwmkGW1hHgIi0UInB/FM5GCtajS8l
	TanJTGLjX57AHO7tDv6nG7LBnQEh+QEQbTR1m39m8bY3G9NaHZFEgiuBVZQrnhTO
	XwmXHfV8aZ6TyHXrKZxwkYVQb/aXqogQMz1Jv/TEApwBm3Ix/XcKOAc5eSMNmOI3
	leAWHVHZ1o6DZK8hoTcfOOKkZqFLsquuCNVbm1E3hTiPQ0e+MFomBCu2X+R4SAbh
	/NR0sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt46a2ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso627117585a.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506178; x=1765110978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=LtCbQ7Uq/BzPpb4T1xFw1AQDVEJc7u9pgsBxbmaY8bb+CgM5HTw5Y6yA/K0cvMdEj7
         ZyEaHWTE9YOcsOzHp0W9bDZAVqciKvbfTtZvUqtu96up2t4r1zUszAbHIVpySEUj92W5
         Lhwz353U41YMQVr5QwdlvZQa6xaA4HYwqifijKMAoN8g8zBxuNCkTvCu5nDl46jpotBr
         5Rc6MYt/E5jmBSWYsq9rVmbIBrMa6rBH726AzciZnvuwmm3jQteBWPcI+o6iI/90fxOr
         3By7AWrG7g/ftBrV0db1TK/STgxCGtcd1lnvoSzxi/dQ0bPefpfin/nNlnhnnzf9T8+S
         p+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506178; x=1765110978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=C2WYm8LaNTPCoD5FIMy4taMsydMV/WA8ABd6l0mIkaMEXizENuzND9Kclg3k65ZN5e
         cterG/RTYwCX5p+lw8bNGBZHXO/BA0fo0QoRwLyDeQkOMIHNBoI1Sn5qZJMKxCT4EZ57
         bT66kMSLPJV1lF5+NfytjeIaRiwI9UP1jxkL5irBVxJZ2I4GL2he5BLZJwBohy/vzd3g
         GFkeVdlG7240yA+BkdgD5KgpCGdz+CX7dv7RmS4uX5xpoEAlMceZHLM8w2+YWd6W+PYK
         AVu/ecpVpwKE63JlQlvbVXSaFINaeai9OJOgMWmBQt/k86Nb9yT2a1veDuH+qztxtqBO
         NudA==
X-Gm-Message-State: AOJu0Ywd/3wH9z+2z1ncbp67mAcRQ9icPuA9Q0gmSgN8Tu01mKYsQgCU
	uvWGA1GwGkDhElYx238m03p5dCNu4QCvjfeIYffxmu/rFqmo/NB5La55liU58gzQbogh+FzzuIp
	2MjX1mqQ5cn6ZCfmVxhUkyMAzMJpGERVINrdQXvDFp7rUHOJq3GV9vERBVVCEbfa7tiApt6ko
X-Gm-Gg: ASbGncuyLScCHKNSumD4WyQjX/GgQ4ZRT4umapMgqlkUUj6TIJWdql2kneC1keOSi7T
	0psgQQBX5cUKWnAwkNXQ2w9pjhYFKQKhjEZUQ+skrn6JDOap/jJRweoOefd6qWX5JDX0GWycZSY
	xchu5ca3GAPG+fyuz4Yc8dfyEWu+Lb0T/XyEv/NhjxNl/uscd5mfClsBLIGOYEmqkPAoLEfgnYO
	oS+lD9uAsHePo9QjALm6Xxkgex1eTT7ciaTO+hi6oABtZUmezbt+Tr3KS0J0zjFQzCZDGdQIeTl
	aSew8tTX5L6NEXVpULpZFy0MmPtQ9nJdswQKsjiVOfYGSq4eyAlcpj0thdnkZ5FPRxmPjcBoywr
	A0vy973Dj1Zck53iuB61kryhdfvv6NIpNDw==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721866885a.49.1764506178431;
        Sun, 30 Nov 2025 04:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd83+g8q92x1y4CWxFdCnR6Wp/D+6ypCjsLsXp/d0HHxg4TfXOyYZHiS3ejZPS6LsXDPMgw==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721863385a.49.1764506177949;
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:08 +0100
Subject: [PATCH 1/4] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-1-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo77EwKqXOJTM+99Uw/WZdDbkh4LZ6TE7MGd
 58HKTs3HPSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 19GjD/4yqvoVdSiFtXLgPtSNjWBghlWA484iGQ/nvK11zYtmLSt73fjHu+ppUkACDE3Gzj+MQW3
 GDtp6bRzB1dZ3QT8+hLu/z1ccX0SfUdcsfvl8p/37dFdHApMe6rolFyGrlIn2G8TYijT3nYGyB0
 izR8XwMJza/i4Fmr7yUyAAbVxOeHbHI3TF5CozIZns+a8GS7giqH2FmroISq6Lq16y0TDHRwJqU
 A7ZLWYFUb2KyJTNwdjFO0sfjVkjqx8e/PKvM6Bzs8E3btdilFt/KcUIM6FXwFsUSUDpuuiRQPqt
 Qj5mdGUxGAffYx5dow27iCxx6uemvTGdgakcUyiQCaQuCytEbDlh8Ocm9SRF8XuTaldc8Wtagkh
 qNyDq8rMPwMzoHaW/BS0a54JrP8GZfP+40GvH+Z58mM7JNH6UoevmOFeyzT/u6PQ4QAA/4sskOK
 gapow81/rauguxhutkRhwgqWvj3E7v9wSscxUC06Tk4DILYqPcd4gzxySFbYZrqEgx7xXie2fDj
 r9mOc69XtfZRc9kYxDe15n5d6KEqv/5+uAg4SOlFfKoJjPjNu3LRCs1QldniZqnGgp33WEh3kbU
 gRIEMvf47RDpaZ/ky3EnM/viU+sU8FftAtiEPtskYBtbQqyRQD3BLdg0yLoExpWQ4Qro+t2IVvW
 Ps0SCz8LoJid2Gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXz/t2k5H+SNI1
 VB3gkHAT4nXzThLowbLKwZbXb8Gg3Xq0BLJNdlSjMF2O+3Ls6Mm3lWZZm+yDKyEHepWbMkL/qlC
 oNSH0kaCPgehuYUtXZM2eleYMmMyhFCVd0eZnAq32ncwepfQ28Yvgbeo/Vv8E20ixeBNA0259ce
 Aj0ifB8tb7PUYy/QYQLOz+NjAqf5b1D2FTJTNR7QxRTx2f66sRhcvCOc0bpHW4z/2SrmroQibRw
 cH+qYnD/vAhKXGgux671vX9AI4N7+K+5oFT0jyH3+tFaRvyWoJNRCg4RUrXTSqgeDMrA8cavDBA
 3RFXnZirZeaLb8ExZriBq/4o6d6ekwqgPyQA9h1nIJoxuYtkH2ukUkxR8KspI+PCUiSnIi8Wnhm
 63L0XD0MIoetpirCtBwNTBAZ4SovjA==
X-Proofpoint-ORIG-GUID: vHNYzQcFRAhuOgxjyr2Z2EsS8G9eBj_X
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692c3a43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vHNYzQcFRAhuOgxjyr2Z2EsS8G9eBj_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..bc1ee82cff36 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.48.1

