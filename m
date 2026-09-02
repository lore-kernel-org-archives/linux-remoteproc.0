Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5924AC145
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381833; cv=none; b=B8ZGNmOtFaDvNg6qX3rtjuJXCD3W6HrUIVJGOKL+c3sVEereeXFgIII35uYgwNHJE42fFbCGWgcb+CfLrKDwA944tFJXCGEkquI9DrxLBl1kYxdYic2pWlEeimU6vN7AyVtRmTq+aXBLXWho6L9lr+0N0VBop+gGRXWvBjWkZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381833; c=relaxed/simple;
	bh=f6q8FoltjlovTDu1+uHniIV9mJzmkVGNfZOq0t3Zo08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/uPTPpPie29ZLsTB8TjYN1CVDXRUDDnx1QD1LuHR2dEEFOXbOvdtcbKk9Qn0j7MLsNgl6GLVabfC6+8+orCCiRYNgVHJUqUJqPR3TAHkZxO4/jCSs8LH8uQCAnQPFA+GVJp6NLFecyYWKEfVJ8epmPPMrCFQmaw2s1H0M8A9Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et5DBHyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUcQmWh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et5DBHyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUcQmWh6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH8is2417708
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 20:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BwimQj+9cTD
	SXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=; b=Et5DBHyRvF/r8A40pKXkCpcvi7n
	pc+ccSgQslut7Y7/Z9dBtUxnzI7V+eraO6a/SrKznn6+5Gr7J8IxWoL+1hIbiSBS
	w+PAStqgrsc28jy0CWzwcqgvVmzfDDA59z4FnHCUBeurhHu/53Ns1JDNj4QTqM8d
	W7K7PRxdbGbdd12/CKoYw2UDxmRwi2/eE6AX90Ttb5YLKudEbuh48xFgOd7e6RuT
	LU/ue2gJBVAvyzp52enSIIwDSFnra3E5x3IeIYcg8cMVP2KKPuwu2o/EqVKQRAxD
	PWCOoxMIB4X+ufB5wmwktevgN8xGjYAeu9Tnd2FD2oiD5/mYNWZFmyh79HA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdshfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 20:43:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6c166bafcso23754465ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381827; x=1788986627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=IUcQmWh6PkZ1fU2o8LiWY7O+8WlNmG2q6NUFEGZjVQwun04eC+hYzOGIWIuGqkwt8q
         4OWOQN/MmO1fsnP7LDKRLrXO0tm4CmYwftCezANz3TwXRgqUPjzc25+1EjUhQHZI+5/P
         406zHDFy5EP65np1wupuHYjX8kZTn9K7Vz5K3V1+L2YWgQ5wYOQFLcor1eAwp5P6Up0B
         urPfYpBNnHPmToSVssMRU6pO7eY2FrfBzFAYwgS0f8Evgf3sCjUzMuc8KftKnum+Wx/m
         yMXwswn/qX6QZMZAH5wWq4HwrMliyp84Wf/HFoQjrYfaxe53yjKO84sjpRyyy+oZj3iY
         uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381827; x=1788986627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=aWrDOMO+5f77kcimussBoNJCbulkBQZwzV2ivFl5yE6rmh1k5c7ahMYXKzBPjmqtMJ
         hw/28Lt4Fu/wNmz4AN/Ioh7teEKbJt6ty+S2f6gNrcILWXsyxjwuEzjUPNbhInnxffFw
         B3gBpCQJuRVdkqro+KiuIWPNFXpJauOZtUJlKzGdZENHxqBsPArIADT675IZF/5AqhJC
         PsCGI/brqxmF3WfUSM/Vh+LMbi8Lri+wdGGHG0eHL90aNxWwTjKia+n+OVjELqanknmw
         1WuPBkgaSlUns106BfusQ0QyLzZ6hnxgoppYeHuZQxQ/o9NWZMRAGxEbrCy4U/0pcxyC
         +FAg==
X-Forwarded-Encrypted: i=1; AKwUvBwzXzm41wsESiu5dA/YqWNL9r+orlqpYKe/yu2B8HziTlOPxVdwI3REeECtuaXK41UDZfP6+mrctueg3m+JcFOp@vger.kernel.org
X-Gm-Message-State: AFuF++mgMaixnq+EAL+hD+YrTPfemYUCgNyyy/9Xj3WSgaCJJoDLOqxX
	D7XXvS5ezp1rMxqfmd0WR1//Kw88v8GeotnHlOaD8B51EEIDqsECnF4ZAonvOawG/tbIOTyYvNr
	mw8JgCvl0dqSbh1Dhvf5Qa3JFugZXpSXH9nBQ8i/5xBm8vimERyaTn3E62r/snIGnTjhlvgzqNM
	ddJ4Cg
X-Gm-Gg: AYBFou1jZihRkoXHzwvlelOBAnyp6v7I+ivRoy7ETFBT0EzciaD3iemkdfZ2pL4RSkM
	Omq/hGx6gRN1fbng1ZY4tW8Tz/1ivl8ZYUeuVkiavNgvPul8sJrckooDe1INQhDlRVjYSeJL9ln
	svvIzkVF/hlZSK+tpH8apZR7geZLyg2Ug1vhvHmtcfjnaE8Y2TsB52REFAojAbSP0sbWn0h2F60
	wXuUgtE90i5FUgk83LpksECeqnH3i2sgV9yeemaOxKt80RjgRlbw40peQAeBpAf3fwLNFK5xbBZ
	UVkFAE4pOex77LmLVbT+YyBYRWM6eF91nMgnePwICQLbwSIGJabKMG3u8J73YcXLxmrG5z882pW
	HK990TwqfXmcsWK7zSaDQNGBF+a0=
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347425ad.11.1788381827392;
        Wed, 02 Sep 2026 13:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347075ad.11.1788381826893;
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Thu,  3 Sep 2026 02:13:32 +0530
Message-ID: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988a84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 92Byjho123RLxRwplpwJMjZ8o6q-GdtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX8qRx6W/KUVs+
 734HdgKvX8CKZ9e/RqqYKRsiJ2R6d8yfAja4GsquM1i0Guci42fXSYTsUI2JhSJzsb0iiPGOQIn
 qQUJsR0RBJliRX5aLWMG/wONc3Qf93trXMB5T7y9Y7i6eJ9xDEcnWnQ5wvRYA1fiPlVeMlRsYci
 fLFdQWXysOhYxfxzOgoMRegSG/SEOuEVgAHesPXP6AXVaCWGbnKLEKuc/KFtLIPTnGJQdS//3QN
 hi+mdftVfg4abL1VyRjBmLh2BSnv6irZyHPeQ8yttIEadw09TRkDcyKH/MHjLduO0KhnG12qS7l
 ImMyV2k+jUYOG6JS7zMYcFTA9q9Nk8PTBlsyfpUgdFVEPu9KEAgpfFK1NhX+rfgVhd5G6hkOIaB
 iHLtoY8NNAWECsGOdufUHnddGSVsQG+6wNf87REi3OnUmZxbicqKDnnJSq9jkDarjGLXv6yiYhE
 dbyb+mME7AW54A+MovQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX8kZ0olmS5kcZ
 Cc9yuxXuKIobVzvmufrt1ygmvMDFJYPor0aOrVxNn2KOo+ASUCvrWMDw9oNm+jv1164PAxwt7WS
 kDrkxgpXjlxYFG5wLTjv0K4k5bOIWaQ=
X-Proofpoint-ORIG-GUID: 92Byjho123RLxRwplpwJMjZ8o6q-GdtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and emit a warning on failure. Firmware
load continues regardless a performance state failure is non-fatal
but the warning provides a visible signal for debugging.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..01dc0194e130 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret)
+			dev_warn(pas->dev,
+				 "failed to set proxy PD %d state %u: %d\n",
+				 i, INT_MAX, ret);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

