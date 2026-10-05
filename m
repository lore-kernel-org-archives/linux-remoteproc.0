Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161E47FAE1
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204858; cv=none; b=mE3wx8eaH8MxZpDr1r/BJwoUIpL3v2r2+h+rGygjHQSfkiG5VcRnIMCqAH2zPqWdOFzsYYlGP//m5Pv5xMxVajUs/tari8KvwuOzpOSMzS7O+0wH+Hn5wSobku2i/Lvu3KxzX9qY9XL5xzZ3onsDhZLnwCiAb8obVXcn0AkBIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204858; c=relaxed/simple;
	bh=ggi3edH2klsPzsxW2XWRtaHeVgrW9jclFLxw4x7UpQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVtXtLtZ8ysUkp9D4c1HxE7D0Gai7xFHjlwdnDxB1axcKxOSxtgejSnVrZEZaq2Uc9EgY1q3uDYM8KEPVBmPo8Nr63MQNXEXEQFywmGvDx7c3ZQks0i2eMoHVkicXLvk7UbpG4z7DnS5pffLwwrrejMjRMWxoRwemy+Oqcg9PWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhkYmXq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4y/MPxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhkYmXq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4y/MPxj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFPuv1726775
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 12:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgX
	pzhVzQV8=; b=DhkYmXq41i5fLaBJS/tNsSBH39EZTaHw1TK4m1wNF0SONUsIqPL
	F0+aZoOfVooxfz7mj8DNwu7Lv3VAaHcOg4A4Ne0+7O4F4W34F6QZ+/Ddkw5uZvmo
	ypwwpIvmbxAyrtVhUeaQWSZ11neqmsJexhxVLJdmdl6BgjOIF7ks5Z65RPFzHdze
	SLvPuZylWB66cjv4XvcvtEseqJTH2mDBCduVPlsyaX44OFMQy6a2+I5EbnL/XFe7
	idVlrTEC7ikqsnLumLbYqWqzVAJyAuPJB8ixJBgjU8aut66H6eSkyvgNdClpONnc
	IOXPQ2ye2lKCy1qLiA6jOZYkYyOIgdHc3tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs239t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 12:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso454326085a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791204856; x=1791809656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=U4y/MPxjYdP7d51DW3QfMLNiy5jdwbhXnj2YIEqRt7PkbkvVRzT155vSUxpeKz8Pi4
         qmbqKawbQjpKx/OWEXYgZaFzKTfTGGbL79g8D7dj1AyxObaWMy5/SyPdfhamhIthpHQh
         vX3+bPo7Gtf/tjLDlH85r5OhF+Dt5hLVANj01SDKSa/Rjl1tGRsHT+caK/KKPPYfBN+b
         O47HB0cqdqFmtIY1muTX58U8uwyeZagy5TNAJi58gWUM09w89sS/TSxtm3iy72AtZPUh
         5voXG3yA1FnPCpThji3a6Nq3TZYVKr5/4lRVPCmHp3SbxkPC6aOsMnOJEWDN7M07NddW
         ZjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791204856; x=1791809656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=fGm2tVzzJfn4c++VXhexQap9OGd/grxbaII4kzzQDUVeY4Qoyy1VvPxQ7Uysy0iS9e
         htTjnca32J+i3lLz1mCCcWYdPH75k+gELoUzwXGHy2OAzE19D6vdsmAtHxcelADoJBXT
         U7SPI1w91xNdhJXzUD2W783/S8hqeeG+0WhdCB8zs9PmoKfABc3oH1mMzWv8XaOFyIs3
         VPaJ2Y+X4e6qhcxGD0jr5yB+LACmheQ7AalgcF7wUu7XLyNbRolGs4p8jrZydZmghGoz
         u6BxdYLTzU1dxEbz9BD5U8UpmkPy8GoqFGDzjkqHFthyFDd+AtJvq6q0PCK2Q80wrpG/
         noTA==
X-Forwarded-Encrypted: i=1; AKwUvBz+gqv4/QkHA0VavHNTeWjCyxKhmjjVuw7FYJ4YwLTjT3SMzg6V9oyIz6ZU/ioq/OkRlbWkizXSt96QqWcg29Z4@vger.kernel.org
X-Gm-Message-State: AFuF++mB34n323A4K8jNJ5yqyM/0CKA02BhZm0GO8qPvUwEdc2/vvOW5
	bO6hoZgukR0K19zAi68459tnkRf6Vc+W4x0ZdXB5CwllBs0VJ9/sz+/WL0pdORBXraX2X8IxCpu
	SGovmyZBG/vyO4iQ+Kwh49Uh0WiUSfUgQRHckQQagnJn7fPJwKkHf+in3J3psB0/OPOrwZW+Q
X-Gm-Gg: AYBFou0eINPPgQoabCYG4uYQJ1ZbIxCh7TkylFWrCz/ojF/D/BJrkkC1bTJhpiHNITR
	u0dX/lcTMMrBLLIk9WVN47kFfcJn3jjHnhY+Kbol+ghCSBaJ/M5rBAmNF8dgLpUXy8dGVo6sOkV
	3XhbgAeYtA7S3VNswF5YtWRWYYGQzd5vCrXBPNOG8bX8foO12+NkvSXKSyK6D9tqfiTRgQhF8W9
	xB0FNBTp/OAO7KJa/iUmI0dMwUb4rNNdWGs63PW4v/bR0l1JMKLBCuIqgOsxJgqglihyexH3xu5
	PpBccQGVdUD7FES3Jv7TviZEFoKZ38pfUsI4AoZSSans0hpiSzq26nGy9aEH8r8HmLdsfybjFRz
	IbyL6hs0kfFIt8jb+m63hRzYrVnHhhg/+lzeDE0kiv1GT
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259558685a.39.1791204855523;
        Mon, 05 Oct 2026 05:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259552885a.39.1791204854938;
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270728sm3508733f8f.12.2026.10.05.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pas: pass no resource table when the firmware has none
Date: Mon,  5 Oct 2026 14:54:00 +0200
Message-ID: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rs9I0EPmHMRwPzVzpUe4HWI4tsIxrUNJ
X-Proofpoint-GUID: rs9I0EPmHMRwPzVzpUe4HWI4tsIxrUNJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfXwST0R62QGOuA
 VGpq8Ev1e1gEna+VFEwERXysXeUfOMeMXghxdpa1w8+KuhXqgmbYbW98Uf9lzewAvsItdRTP1X5
 hSc0AukLuSlgU4ZH2hODfOPFCEMrUAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX2JuYRXhIH9og
 7NEetHyyjJVSnzBElRV9HrkegT2nDonAR0zkQ71yI8czjyo06B+N1BUe5ZIOUbSDJxyZ3xLFBsy
 deAcUW+ivQ7Pxje2bvUWMtmE8ZKmwXHj4C6h6kjcxuf0Z/f2kf9gNrDC1rtCb3wZeNZzuEblkIW
 ohTE3IqEoCvKSReOJwe+6CJc5zr9M6DboRozpFH5d/wBGbI50SzE0c7mliaXxEwIMnVmfjLxZXG
 4Xy1p3oHFdmniqOt+HE0ZRXe5Srlq9qkxfUkUujYRxi7PpUGoupAbgF0ly29SSwSF/nR1Q0JbIJ
 LEsccUvsRHJjXFWe7DSR4vVvrrBJuAjolJZdTny5v5ZEiybzAjWCptZKbnFK6LxuDVqawUOqjwv
 jCS5MVvPBJkIkAWurjU1smHNw6wHSHjtyMCP/B9oRUGt2bPN/vJzu4u/zLy3l7ZZGR9k0gD+77N
 JjcxiFos2Sr2wMdSimQ==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac39df8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GaOYwgbrjy_8eysdYG4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050

The firmware resource table is passed to the PAS backend even when the
firmware carries none. This only works on the first boot, while the
cached pointer and its size are both zero.

Stopping the remote processor, or failing to start it, frees the cached
table and clears the pointer but leaves the size set. The next start
then pairs a NULL table with a non-zero size.

The SCM backend substitutes an empty table and hides the problem. The
TEE backend copies from the NULL pointer:

  remoteproc remoteproc2: powering up cdsp
  pc : __pi_memcpy_generic+0x110/0x22c
  lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
  Call trace:
   __pi_memcpy_generic+0x110/0x22c (P)
   qcom_pas_get_rsc_table+0x38/0x60
   qcom_pas_parse_firmware+0xa0/0x100
   rproc_boot+0x2d4/0x380
   state_store+0x40/0x100

Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..e871e03ba794 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	struct resource_table *table = NULL;
 	size_t output_rt_size;
 	void *output_rt;
-	size_t table_sz;
+	size_t table_sz = 0;
 	int ret;
 
 	ret = qcom_register_dump_segments(rproc, fw);
@@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 		return 0;
 
 	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
+	if (ret) {
 		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
-
-	table = rproc->table_ptr;
-	table_sz = rproc->table_sz;
+	} else {
+		table = rproc->table_ptr;
+		table_sz = rproc->table_sz;
+	}
 
 	/*
 	 * The resources consumed by Qualcomm remote processors fall into two categories:
-- 
2.54.0

