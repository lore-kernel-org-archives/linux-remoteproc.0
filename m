Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4E4D9F7D
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008591; cv=none; b=WSiF+d35z80lbxhu3I7rVdDvr75VKPPa/UMNANA3TM93wz1bqIcr9CzZWVcoezI+soIXsaQlbAHY7/TuuSqtZursSA5zNMaIiHaKi3cCDH0NSpBxnXsIvGnW4rItZSK5j7puqWaIiyqtBUG9W5zjbz0HN8ymPLxcl1843k3+Z6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008591; c=relaxed/simple;
	bh=zBeiv+6ldU8tEIBG4gOqp6qaEf6kSQ+ahTuhxzZQT8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3pLkBAdMAW9XXmJBZqoLnx9E+lHC5zyiQ/JyHAyZ1k8NsLuGX3dr5n0ZmEnXSUB61JDVURrd/MlwxunXSi2zrYBkgUpR9swtl9F6WuM/VL+7ADp/o4qi2JnV96nndQ4T8i5GYiW6MyUzWVvYS5Hwbuw5ZMoIyi9rnjmuPOza+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Raqh58ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYmTZP3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Raqh58ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYmTZP3S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAFne1016706
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXqKJYwuvvUQOQiUdWGtmfsRGOkuLRvBLzIkGv53YFU=; b=Raqh58ibUQOhKh9w
	Znn9nwjxcTT3u273oYyv9Qa7XbkYkvp8ZDGGaPA4WWjdoHbERQpf1jwGB8tFPxIA
	qe9ztTqA/xlWAzw60VhVuKzKg6hrEHY15YZjeD/ZhzuFiOfgt3SvtU58omOJZEt0
	NKQr4+9mIPazfpYVdeTFzFoxp9bCpBE87YZqGHSvWHLG9Ve/YfOxkBJ7bH9r4iiU
	85cNlsu6mXq3OcrCY0IZABvhRl3Dt/bcF9u2WoTZ3ARakBtU34r9hopycKZK0DNb
	3I4I8bXDFhB4rlCX+6i/OXUxL8++b4ao48D4JGVZ9eaNxV7XbTnNdhAQHAguDx4W
	I21jDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxqaatt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so45229755ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008586; x=1790613386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXqKJYwuvvUQOQiUdWGtmfsRGOkuLRvBLzIkGv53YFU=;
        b=PYmTZP3SL2rl3X3NSy7uSKN4kOFYw4ini3J+l5566hVzJq5SWwHYCwYWbdPa4wGpij
         nQiFUnL39ljhosGifpHSoRIm404Knz3J4Nxjg0f+kdLVK7e4L+aQ1l6uI4DwuXtZ5fJ6
         ADIfk7qvenXrVVNaLtMHGzHaXFDX8lY3V92f4zBLuFJWoqasobqJBC/Et4SU7aHNzpDd
         bv/3iF7lB0ips0VVitic6P4TaWd+1bnghOdc5zFt1pgKp/dx4MqwwB6K2pAz+MWEybOG
         dYwBJnuYSWEe8XAvnCm8c+YbStBnLgsE/cJqGp+tWRmH6rshAOybAmIbN/HJzd8QNxO0
         CMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008586; x=1790613386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXqKJYwuvvUQOQiUdWGtmfsRGOkuLRvBLzIkGv53YFU=;
        b=grRntqsLplJcEJa2adxp58yMLkX0Fpa1HvDOsTenkCi7Y1v93OfThpLh6Wcxryk6bk
         MQ+Pvna1Ll72J0JwlZbDHxjSRnY2A5nSeHBQvJMEDgm2mhGxQvLxDyO+1J73rZaCrJan
         UGNTDQ5MPRpf+2RI6F9UEF2tfzF5IZW5LXtcqlVMHguF9YH5O20cbmHLBtBLvLUc5J52
         dg2aRlY1HzmuvxcXQ8QJ1/+w4MDYM2UHpKul4gV3i9LM+WFuDMm8WwaDOeybvPZ5zH4r
         9N+ZGbX7AArB5zFkwJU1yeIkj3JT1BNeAbIc6Y3sYlIo9D/rzbRmTz05RXp4CMFz68yT
         dQiA==
X-Forwarded-Encrypted: i=1; AKwUvBy440O6DoUMJSBBwcl+jFENjmSqQZ1k8Iu6Se9l70SEpIBRULoPzuqqXpNfGQ0qR9Jfws3zK5UYTyhDMNkuZJTz@vger.kernel.org
X-Gm-Message-State: AFuF++nsKFpxcw+CUn4lNxG++Q0augSdhooS9pYnexL/+/Cb3RBPdbaN
	PpYEzKSs74qd/HVNNrByB/d3B1FdZUCsgrwNFQMgz+wQ9Zni5zJXVlAGt+4w98klzoVnzzU/SO8
	4ZWCVJGDRqLXeCu6KSeBfCmPXe1rOztm77afvPLxiWK2jdL/Rvp5p+aEJ3UHSISPqdt7zEtiy
X-Gm-Gg: AYBFou3wF6UKbV4cTpjjBJTIKw3iGlh0RKm45s6VRt8HCSHN5ghib6Ql6oUqrTFEwS9
	gFbWnId2BmvbkD0ZA2Bfc2htiUPl40pfI6jp/dnFmD5+4GMRvzUvE5Vt35zxmZkNlCAHWgrTBrb
	ueZ7kCgrmtXlRvCt+2d4/8YMumTYJ9y0N7QMWdAxY+vn4yQue5/Sw3iGV5qeoD+5o7nE9mAkTro
	5zLb388pcp559ebqPzSce02zsWdatdMHXxhGYxMU1bjTgLR9I4mNKM9WJyyaGfNVCKIqFwCeoko
	atu/kQZf52LK8q632vs0TxsiVm0Rao3hLvPl/ndCeBQweu9Xq/BuBS8Le05CShh84ctHwCmAzyT
	HVmEqlrWZc2u3KcILp+wbVQcI7CKz+W8KnSf1
X-Received: by 2002:a17:902:c950:b0:2df:3872:f289 with SMTP id d9443c01a7336-2df38730b2amr78666255ad.28.1790008585904;
        Mon, 21 Sep 2026 09:36:25 -0700 (PDT)
X-Received: by 2002:a17:902:c950:b0:2df:3872:f289 with SMTP id d9443c01a7336-2df38730b2amr78665935ad.28.1790008585401;
        Mon, 21 Sep 2026 09:36:25 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:25 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:06:18 +0530
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Fix 64-bit address
 truncation in dump and translation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=2381;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=zBeiv+6ldU8tEIBG4gOqp6qaEf6kSQ+ahTuhxzZQT8Q=;
 b=DCPhU3m6KQayd72qeXW8syPGvwM2X3h8ztAbaXoGd6O4Ynnjk6xUyqh0KNdCl5iIkstJVpSEJ
 mOUaHy2ZXLBA40cXeHDz2ow/kvs7izwwTjNPHnvx506G3gwZcpwCt4M
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-GUID: 3N-KdiXqaYE-tZMvjpzlRYBcFzA9OvDV
X-Proofpoint-ORIG-GUID: 3N-KdiXqaYE-tZMvjpzlRYBcFzA9OvDV
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab15d0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RlcIIcj9roE0ZJis6KoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfXxni8YwX9S2bd
 ww2MgZ/PVXmMjxy8WU7eonDnTMCaSBYCsEfIp83VtAK8DB+//hofz2FwwruUbTZj+LYKFumE7J+
 DPSspDTMClquzTjpGjaLa+I9J6DaApNGh/aaFKfkOL5KMk7D5QeolZ/yCMjLuDeLCm+gvX3chCQ
 Wr6jnBl8acmWFLjOd1FjTaTrhOHBO1djXKjtaqLzuCZGSxqjUW7MBzWwSXMZTfndruVKL/bKGkI
 njRMc6uykmL7fgJALboL4D2+Wz8fUmaWpJDt5xapt75n3jBbt0Rt4MGzc1MUvCwF00Y2z9NNBj0
 mTOkUkE13/Or8twgC+95VofZdqwnS8oKiE0ofxbrFbQnD0S+dEhOWFjMPoPT7UpiOn2+14GkGo0
 IsQaX350YKUZ+WJQ2fbPFs5QgPGXkVz8FgkP3/UnNAxbPjPLSzgUI2AaNF1i9UvKPSZK+njgzsT
 qagHvMITvl426Banupg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX5dLM+9xi1RSu
 XczoCgt7bCdFQJjtyM6SWuKUtQH/VJ/Jggp3XQ03n7l6Et9M3/lVTenlbUnIXQguZjnZCsM661g
 gLXwpKI2Y7BnHfecqsPl/uv8JWo3jAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210242

In qcom_pas_segment_dump() and qcom_pas_da_to_va(), the offset
calculation results are stored in signed 32-bit integers (total_offset
and offset). On 64-bit architectures, this can truncate the 64-bit
address arithmetic result if the subtraction or addition exceeds 2GB,
causing erroneous bounds check failures or invalid pointer translations.

Fix this by using unsigned size_t offsets and explicit comparison-based
bounds checking. Check that the address is above the base before
subtracting, and use the form (len > mem_size - offset) instead of
(offset + len > mem_size) to avoid unsigned overflow.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..c95a030949d7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -130,10 +130,19 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 				  void *dest, size_t offset, size_t size)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int total_offset;
+	u64 addr = segment->da + segment->offset + offset;
+	size_t total_offset;
 
-	total_offset = segment->da + segment->offset + offset - pas->mem_phys;
-	if (total_offset < 0 || total_offset + size > pas->mem_size) {
+	if (addr < pas->mem_phys) {
+		dev_err(pas->dev,
+			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
+			&segment->da, offset, size);
+		memset(dest, 0xff, size);
+		return;
+	}
+
+	total_offset = addr - pas->mem_phys;
+	if (total_offset > pas->mem_size || size > pas->mem_size - total_offset) {
 		dev_err(pas->dev,
 			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
 			&segment->da, offset, size);
@@ -445,10 +454,13 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	size_t offset;
+
+	if (da < pas->mem_reloc)
+		return NULL;
 
 	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (offset > pas->mem_size || len > pas->mem_size - offset)
 		return NULL;
 
 	if (is_iomem)

-- 
2.43.0

