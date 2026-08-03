Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A080403AF7
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757425; cv=none; b=iLTT+TJbVcG/TL3pefr90UlIL+rJgmj1FAkzdfTzBoglgjrxWMjou2Hp2iL12MvlXR/hnLYhRyBJ87ozCTI2i363wAPKIZnUOLyxaOJeWVe1xTYeAK6KjQyN12SScVNAkSuQ+lxUCrbrNW9taDv1F/nFVGedoxZ1cPBKpZHJgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757425; c=relaxed/simple;
	bh=lHZscjtvzZCsfdf5GgOgS/+EUWdCPyEeqt7aj7+aBCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KajHPjEfpPw5WMUtK0kw6FGnVQ630D0Z+b4lPfbWAFRb5keBkMvYl9jFvuT6iQcI4M24/0JtiOWu98z2JqmK5EKGRhLNVRWjzw6mjPwtzOzFwKS59pgf46k1PXuS6hM3oodTaAzvBm4JNPP2ugwGnbuwSoDE4bKSWAUoRb9a8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzlwlOBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9kHkezb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzlwlOBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9kHkezb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AfW0O051570
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5CTAr045jKy
	zaBrP/rYtUtr0ILnc5SpLs/Qa80fjum4=; b=HzlwlOBlOd52N7k7XYEXlYZ+7+7
	/klaQ9LiMetfL0xu33pyysjTL5PT4BoX6nmKxNGFVI8KM3jp7JWlNAQDJF4YkIjz
	daDVQYpObe5yUxsP1BSa58QzUCszYDGR7c6+nHj4EiCq065BWjZXW4P5SMYNqTt6
	kQF/vu9G6Gl4S2dowYHqL1HG2VXXp1z9Jl+bRi30oZC5s9tsUHHWzF+hraTqSPsj
	KBC7GgJuz6/i7ePbNwOHgUPkf61L0d29ZctfF2SKMP237g7pdmaUafebTbgwtzQe
	ckHLVv3Oj2fWXVDmvViXeVvVzsxeTfJ3QcwWSocFqwY8i730RwG3QISYCMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9auj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so58920835ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757422; x=1786362222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CTAr045jKyzaBrP/rYtUtr0ILnc5SpLs/Qa80fjum4=;
        b=b9kHkezb2Mzmbju+5lODPvEtlgjsG4PoXkrRy+cV6550150/6P8vmmutf8ZGxaIYab
         aEAylNMF5k21GGjIBileiaKvnJeT9tPCR6GqIw2jkFQlTIUFBSOA2WBBSWx1UFilf2iH
         sGqZZoi5r+6D7t5sQW7v1MOEuLpk1wvT0DrvyrUVjhxiarYeITtai7JCKIZDNwJ3k6e6
         /WNEg5aQkknGeB8fVLz/1tXUu3t8wMFD3mtGbV8Yv22lOsyyBmsB6HFe1uZw5uk48Pv/
         JPVpXt2A+WDsf41KxSzPyz/hB8iM1FnWhvXl3JWeuaHFHHsjpMNzej1Dn0BjV0Opzf1E
         2gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757422; x=1786362222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CTAr045jKyzaBrP/rYtUtr0ILnc5SpLs/Qa80fjum4=;
        b=PiDRxg4IdYwCd73I9ZNWrePKyxizTx9SgPwl9gq0sns+ZMbff80ViZ+KdQqUjFJS1h
         XWGX9eG+iuOCzH+MoQlnufX541bcL+lPBL+oGBP5EzNc3ft3lTlaKop1Il0vcDG20Vgt
         4fMI7fpx1ops1M1sYYBwu3C9lSVBowUHzO34tD0tvRmZb75E559TQ7fm0k5NkijtnCbx
         Au7ZJv1PDL29uyU1aeNMhHnpT1qu4eNdD9QZ1e1VDujOclpXGRJ28RIBiP5IkW17Yvio
         hfpn4OHOBL0iin811l3HblvadIBI6jaRbb5E7MwGHSkkqwJOT1cVDN9s563EUC9Jv9Iz
         8Bzw==
X-Forwarded-Encrypted: i=1; AHgh+RqxIHPuFjAQ+ffvq1mj2tkFM+FBNH1G7b1eHSIZeV7dslaiAyUHx3VqdreX7LtPKW/6iwSwhuEbRwkkzZvMBtd8@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeOi+4GagcGk/cqNvBx4+c8tnEneiZlguCfcOyIrEd9JiC4NL
	QiME8HD4hf5lvDSaBAY0dFhWsxNV74e8FUsSRYIMEE3AAKsickPPRQ//O7ymJJ6+5iE01HhH9jt
	4evPzDbDwCVbTAsdziyOdPvwRpLGS0fbRNzp+/gqvTqi1+nJj1B2vWDXay3vrxtDfGUj/Iis4mV
	k/FC1R
X-Gm-Gg: AR+sD10CtjD8fiYjTxjcGOuJKzKPmBZoOkLyaaWjKelTjDjyIe4lBgTiJnB8lwbW1i2
	HFQSt2KDScD/rA0EXneHEBtgtinDanOiuF8nB1HzbMmoQ8PTRSQG8MwmADyahiz66S1yYkBimjH
	mDzt9c8roNs7Ms8lQ+go18DNUeKc0RFtq28zWJdTnfUpL1UMZQCnZjrymAbgv/7d/yZkzRZsf0Z
	U0lftEqG0aY3rWa86BwTxX3+bZMtN4ATr6AbsV9PKckwPuyyJs+0YMuylvtlub6mffyKakmUxR7
	SpsPt8EK++5kBS1+cKE+jGiLtWB/EAMYAcr1oS4L63zyWMVAxLk+Y8N/GH+fJJ0E+RmHDnBHbrv
	/BW3soRt2UAeAXKJEJnI00+/d0VU=
X-Received: by 2002:a17:902:f78e:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2d052413674mr91661605ad.45.1785757421842;
        Mon, 03 Aug 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a17:902:f78e:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2d052413674mr91661345ad.45.1785757421391;
        Mon, 03 Aug 2026 04:43:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 2/5] remoteproc: fix coding style issues in remoteproc.h
Date: Mon,  3 Aug 2026 17:13:28 +0530
Message-ID: <20260803114331.3277263-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfXxpgh61S5WbWI
 IC/E5lt2aJcSf+yg1KfvidaBIXg3yVRkSL2mwcegSVhSZMy9VVQ9LxrEURpoInQCYHhlMlq5eSA
 sh0tqCdbj6NZ0fyzN9sklKTOIqIyw5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX16SrXBCg+yOk
 WS8scgUCPJl3zJLbZgolEX7aiG682Nhrv4y+TRd7eGLlSK3Ghrp0v3vpCq0LRWkgugCHBVhkbyt
 Ig5hCIA2yx425v1fmdYodfzdX0eU4sCHY8Fqk+WSqc9qWM3/FTYQeNd0IcbG4eDhkWj1OI4sx25
 nTQhRbCNsqskIGGpK81WHq4oCU+c1/o+biNBYpVTWzWN4WYI15sMzYLfDBPebyUJTPL6TLesjj6
 8Xln/guw3q3iZXwxL2nlxoZoHEFJ03nTtCfvh2jNKRM3hLf+2SzgztgGY34G6h8jaDKtmZRqCt9
 sAYbuLEJM3oOHYvZsakCQ52rLMKfBhGwbH11xFGXwefnFD0ECtbGI5WnQR7ePD+NxmQUwbJNl6r
 uDItQgs18Gcn6dtP1StTRzlDcbWjR9CWHtvPak7Jhlc4bx9f/W2DUWKySElhA2GPSLmtkmYrNzO
 9JmJZ0yJuGtJVHCJqng==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a707eee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PIGfwsdRRb5bziVgSkMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pvv3IfDBmZK1668l1Q3Uo9UtXZ-xPaUx
X-Proofpoint-ORIG-GUID: pvv3IfDBmZK1668l1Q3Uo9UtXZ-xPaUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030105

The function pointer declarations for find_loaded_rsc_table() and
get_loaded_rsc_table() had their opening parenthesis at the end of
the line. Move the first argument onto the same line as the opening
parenthesis to fix the checkpatch warning.

Also remove a spurious blank line after the opening brace in
struct rproc_vdev.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ef711a5b1a7f..fe77436677f9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -128,10 +128,10 @@ struct rproc_ops {
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-	struct resource_table *(*find_loaded_rsc_table)(
-				struct rproc *rproc, const struct firmware *fw);
-	struct resource_table *(*get_loaded_rsc_table)(
-				struct rproc *rproc, size_t *size);
+	struct resource_table *(*find_loaded_rsc_table)(struct rproc *rproc,
+							const struct firmware *fw);
+	struct resource_table *(*get_loaded_rsc_table)(struct rproc *rproc,
+						       size_t *size);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
@@ -382,7 +382,6 @@ struct rproc_vring {
  * @index: vdev position versus other vdev declared in resource table
  */
 struct rproc_vdev {
-
 	struct rproc_subdev subdev;
 	struct platform_device *pdev;
 
-- 
2.53.0

