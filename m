Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540D406822
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757431; cv=none; b=LVQgWO5E71sF7/kiTu47Ran2DpCCHHBsuSX34MUJ0kySnjkqzxxnu6NwSHq0Gw0TtffGcEGM91TxTvUwGhbJsMx23NeyluvDuLBj+2podkvbLq0Kud8DIsrVWO2JlzcndOhrdQ2lC/pnwhu8zcWy5UO0FaYLC7XBzKAPogqKzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757431; c=relaxed/simple;
	bh=JDBy8+3jBgK4vhVG7T4aeke2vKi1XDBfLfAM2GWRyGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t911T4NJrE4anicfzgJA7XlZkTKMrpjuaMAE5ECr41g8431LCnKuOwfT+OzxqKwVDj5+hJwnpD1RLAxy/5hwiL/KWXkdygiT24E68w+Lkmce1vkA1pC3itkupr+FEXH9dRigchJKZIzuTlzVbf37O6nU5zCnjoP1qRVk9xu6ims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbQFdRAT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ibu2DJnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbQFdRAT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ibu2DJnz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673B1Pbl3759015
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NriLbXA3yDf
	ODlpj1p7/a+1Q6QhXnZ6YMd/fRyFb37g=; b=PbQFdRATSJejuMiaewFX5v64fXr
	7j+BYy5qKGWowgikDL06iD7hnCA9lc+0PP0l+c0aa2qO6Rw8zVnzqDRR8uaYZNUY
	X7QDlGGpdfG20u+pgtiX5oLk9rRffk9yi1XCqz9I1nL/QNl4hEVxmcaEV3XO9hHI
	bB9H01gtA8JLlzehH8ykHpkW4XJC/Zz/ktnr2xfu8ALVAgvWu4o5lAABKxrUHNbW
	oUQHrZMaDlUwPwyiMtVBBpuKaf7S8IEs13loeNDd4sU3QFqbx7xsUDZnI3HCo0/c
	fAIPVboFs/1XGTE5pOw5Ls9/SUooambUT5nlwH1MT40MywbiWaz+pNpKsdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnsac4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so60078895ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757429; x=1786362229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NriLbXA3yDfODlpj1p7/a+1Q6QhXnZ6YMd/fRyFb37g=;
        b=Ibu2DJnznx8bjF85FIwwm0c3+vq/TKOuoLFjsLsf25GevHWO2MqZhuivSy6myLNiKZ
         ghVN3GE92hF5+TvlyBDkH3s2gG6TEgQhnYrHhoxqqduapgt9aqqEws63V30n6VsRraeP
         85E5lqw9F+Ur0dCzvHLr3g+3om1owSeP0cyyaDlw742X0htQC+2/t2A6ilngeBEqy46P
         CcEKytBxiWhoKUD5Jggis4oDV70FN09cKT2+VI4XyxcpiqlfYqDNR6KCb5q1aVuTVfpU
         R9WfxANOl0LBP60PlZ5Q1XpVoWK8ql8PwF5m+KH2OJqfEUZ8j0aXZEmdyEhG7l7S0Pu8
         HDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757429; x=1786362229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NriLbXA3yDfODlpj1p7/a+1Q6QhXnZ6YMd/fRyFb37g=;
        b=L6nApA0FN7z3h3nFq08Yrsy7RRrYXKve8nURS9ITH1TJy13gJOYRXoKLoZzPKObyB+
         NolOLStaPGAwb2IiyW74Ftr53G6xw499x4GNjOlyjy7Uq2y3c5eXmScKsGguysvaAbm5
         Yp6lkmUhH2P6M5LeJ4MtZIBFfTdXg8Si6TmV0SbP/aM/S7cfYTkmx6+WCqtqYfDfF8s1
         0CP1taqtO/whkgawobaLpqtgO6UFgf+ouHzxIEAzp0aSx7evpJe5cwpr2kAbqgrz7E0B
         ORrmpHiUjW7lacAX3V7omfxJ0CMPoj/lTxY9MH/CaGradChFHejeyNGSgHjHURBnixIQ
         ipew==
X-Forwarded-Encrypted: i=1; AHgh+RoKxQF9Ccxgt6qvUf2QNR4yuE8McfOUdpXu0/gYIBDuVmbWfUo8Do2yv2gujY1VaiUWwkgnPJk04C7NOnVRXR46@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDhm8OWXykZSuEj/r54LFZE1QFfOg8WwylCHTPIwZFjrW2z/E
	K+Ev86gcMTpNy3tUCOKMUiYNNVGBQj8L8lkruXJ2+CYFHDx3kF2tGtxvKLeD2N94Hy1zWvIM2Hp
	pR6jWixP4gykBsFr9hZS6/I4YaZ6JLw81P1wwWTgvQDBPg6SYIy/A1PO0IU6rTv/6gWsDOliEeH
	uxT6g9
X-Gm-Gg: AR+sD11um8ugMUmRISJ7NuPo8Z9JGa0WNIR2oL2MI+0fLoMRIxrnbxfJ1sVZZAecpcP
	TZWc8EHAMhDHSRKqevaC1v7wOeKK31kCnhKNUXOFGDSIY36LSJlRD18XTbDcAJq1wl5U37kFCdc
	YqKJN+iBxERIcbDqvkOPtDDSxp6fwPwtnvFBlfizICLoNYXuJJvaLhOBBO5kDs8skKIyvkCUIsf
	h9vDKaVlUPGRC0FiXh0eVmIs1RDHVrUBNwBQidBEfq11E20lJgXmvcPkNHmIP4iaRbxExnYT+1V
	assRlBZf13JZf5UaIjnlHjNzRN6y5J9haI6v2QsVTxPnxsAfYsJOlD8lrs+eudkMpAP7JjvzVGY
	L1JaW7IMCQijgx45bGVlQI1S3KEw=
X-Received: by 2002:a17:902:f70c:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d052462f7fmr94206955ad.33.1785757429040;
        Mon, 03 Aug 2026 04:43:49 -0700 (PDT)
X-Received: by 2002:a17:902:f70c:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d052462f7fmr94206705ad.33.1785757428558;
        Mon, 03 Aug 2026 04:43:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 5/5] remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
Date: Mon,  3 Aug 2026 17:13:31 +0530
Message-ID: <20260803114331.3277263-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX1iPV0nVY8R/Q
 Rzo66ZnDBDIGfArQlI1rgwbzS7hBVgBp3ek26KHqqLpKMoPg6PdrJu0Tn3vhM1Zp7uPIJ6vYceS
 hYiFm+SRFDyzhKUX40Le8vRJkpEoioo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX/j+YkJNMo6yM
 gO+Ml6BhosJ0P4SuNmJMpfA6tXoZ4Y2nI0pN90K7enIcWtT+dcHTnMi6Kz3iw9rvWFwTP85HH3m
 N7tEb3i9dqeRSRrtfcPbwq4S86oOQZ3lpHOB+rNFHDraANshjtRqNKWkI8gMW3FqFwr6MgYpyN9
 LBhWDv9er18pg8h3Ne4fJHBN7/Pq2fIrBxFQb3YCRPtFuX9Ll+sRPumTmXbnxR2TZBYyKT6yFYL
 AfDtS+oTBvTNxKWKLXAsdBNqB0OLRz93oLvd+o9jkoe0DumMGnw0IH0ZTTL607smNQP03/rDVoE
 cjwuSI4BHZKJCAP28b5CNL1X6WQGxrxAfyWVkcsNlDyVRJR2zJHkG9zq0uBiBjeTqim9SbgYJdJ
 JBW94sZuU2VGiUJeBsaMTRZnpXgRpTwoUW9YXoUNK2gIC6DeiIg+DdyxgzsVUqncG5W7JDRHO/b
 /0qedkPOXfT1dh1ufiA==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a707ef5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_5PO8_XNLmbmSLjM89cA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LwsXpZwWBIw3LCdAqM4bxJsGM_RBaVuy
X-Proofpoint-ORIG-GUID: LwsXpZwWBIw3LCdAqM4bxJsGM_RBaVuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030105

table->offset[i] is a u32 from firmware, but was stored into a signed
int.  A crafted offset like 0xFFFFFFF0 becomes -16, placing hdr 16 bytes
before the table buffer.  The subsequent avail check was bypassed
because the negative int was promoted to a large size_t in the
expression "table_sz - offset - sizeof(*hdr)", yielding a large positive
avail and letting the out-of-bounds hdr->type read proceed undetected.

Store the offset as u32 and validate it with unsigned comparisons before
any pointer arithmetic.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/rsc_table.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index 0ad9122c22af..71b60125310e 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -310,17 +310,22 @@ static inline int rsc_table_for_each_entry(struct resource_table *table,
 	int i, ret;
 
 	for (i = 0; i < table->num; i++) {
-		int offset = table->offset[i];
-		struct fw_rsc_hdr *hdr = (void *)table + offset;
-		int avail = table_sz - offset - sizeof(*hdr);
-		int rsc_offset = offset + sizeof(*hdr);
-		void *rsc = (void *)hdr + sizeof(*hdr);
+		u32 offset = table->offset[i];
+		struct fw_rsc_hdr *hdr;
+		int avail, rsc_offset;
+		void *rsc;
 
-		if (avail < 0) {
+		if (offset < sizeof(*table) || offset >= table_sz ||
+		    table_sz - offset < sizeof(*hdr)) {
 			dev_err(dev, "rsc table is truncated\n");
 			return -EINVAL;
 		}
 
+		hdr = (void *)table + offset;
+		avail = table_sz - offset - sizeof(*hdr);
+		rsc_offset = offset + sizeof(*hdr);
+		rsc = (void *)hdr + sizeof(*hdr);
+
 		ret = cb(hdr->type, rsc, rsc_offset, avail, data);
 		if (ret)
 			return ret;
-- 
2.53.0

