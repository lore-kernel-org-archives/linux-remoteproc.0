Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053D425867
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554142; cv=none; b=naqxP5+Hkd6uhkZa4LwEvOa4Vc6aLixvmJURSb+3176++CQkkwkkQfg8GxMQcapywYn41KglJW+ZBwmhXsB0ASTajie2EW00aT3iUH5oHk98YaqekQ+ACSZYqSpTzxM4taRxXNwyltg0hMN1bL0XhUp1Lh7LqgYCT5zmQ5c3bLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554142; c=relaxed/simple;
	bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3Q97N8DF0GAmMP+gqo1DbXnmscqehO6TLOmlsJwSUoF+f8coVfWKpxC/vjEKb4eeE6F0RZvGmuCr9FDD/QSTJXo8hiTW2nYZjau76x/hRfKKjcaxza74u6OeaCHuJvy8y+DKzu/EKMI8cY+KzZ7qUp+BzyeoRSMx6q7aP/4GLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcyvTcbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAJy8Jzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcyvTcbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAJy8Jzh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvakc2430721
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=; b=TcyvTcbGIiHHk7LQ
	E513ElA69Gqw8Cki99oVnEPtOkU00UJ2kS0wh+fiH22yc0tFha9yu2pKybTdRTm5
	XAcwpKCerWnmW9OoS20qqfxC4y4Z8fEcCAjxNHR9VpD84IDeua7+sDUL+J6YrK7b
	xHAHo8h1k1Yv4WLnG44nsf1GAM4OZG8T0WiSloW/ZuchfyJVrBEI1i1DV1no5wEO
	h1hvgv5Wnd4IRYeoEQnDBWpHIcWyk350Eym8quo9vv5SoAbr5v8JOVXE+TxTyUg+
	gAKPEMywwdRwKgpP5DQ4GHNAJJ0nqs5LTo1gh48c+7YCneo8x5xcaSfr1legxaYU
	kCOTUg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyru3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:28:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so10744665b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784554139; x=1785158939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=UAJy8Jzh6DsLwzewxYQLSKZl/oT2vMCjOoVhn9VB4ExRCrHX4WusRIOUKTGa1U0N5b
         WCwjIflbYcQRaIBMn9wVfbdlIQWRyPUWUpBaAr1w6rgmLf+4I78BMY2lTqR6r7VpxUEM
         y9szBlhonlccOYwTnL06dJY+ScTu3Y+9++lsjz9spitG/2oXOhvNC0cL01ybBKB6dXPv
         feTkBaBFzuoAYOIKac00CcqIlFdy6bysM6Mn/+rtsMPS+AqRWCKj/l2sabuoEpV7iQGy
         pvPX4JQKve0YGuL+hlYNyeqYshUPy4G7fLQ0Wd+eBdoLIETH+uUdoFigXmNJTEFOCafM
         AWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554139; x=1785158939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=XS6fch35I2WlixFZOz7jn/W85fgtSyYLshks74QUv/CnlskbpxdC+Q/VmSNl2egAE+
         G1oID18chlEIOynKsUkQQTYLBlhkJcrV2gmvHtpIhNh7woSaSJuet7MlN25m5LbZEu4v
         3LzHOI4ACZFiegTMro/bsSsyK8a911sKAiVM88KdIRAOn8wbXiCh5u20VGeuHKaZlcwp
         ebAH2R72qOtZOBhB5DuFXE3WcGvdroMWXGA8gAJUzsVoaC4bTqrHuzArqyqM+3fiJhSQ
         gsfQwBE8XORpNd5PO37y1QwKzx+IyMpN/RWDynnJue8eujsvlcc2f1Ns/RzsIXwYES9j
         n+4w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9GJMZPwKsySNeKBhbQ2pSG0yGgExKaRY+Etk0HCpTUiwXS//tl7SjY42s/Nwi+fo3gsSvvVvFVKcsk3/rJDh5@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlqLNACMoYTFB1pP3kKarufJdYEdbvvEEytCqNk/Tw0/KK7AH
	q3cNLUkz2I9ppVtnrD6yJNvdsgdBBzyuR5yMVuyBBI7tGLGivkeZXU/xq+8FnL/fe9flXh8wjKa
	kjX0nxGpnPteTfrrWQWF47LJkj35BuAL9rtSdaoqFa30CUezWy2Wf/Uy8/3CZY/x84+dNzI9C
X-Gm-Gg: AfdE7ckKiqOKRXot0CcEsoqSMmosgVlMNAVh8A0NsVkdDE6sKoGZpy1tqmoYV4KybV1
	UIPQgy5nHWw2CTO8aPSPI4BsG7YDnB7ukFZ6dVnsrIXuIAwJBa0c7t8ESF+pGwF6Ibjq/34ixLT
	rMMLrz8aw/Z9yAhh39sjKqA9r9pWQqo8+sqSGUCbN/sBxHGBwhctFDQFbqHQdS39OM+Gg6nJLzX
	0Ue9Zr7lllqQaZWoqkUqMAbBTOzjPFiFh1AIVcFwC7PowVCVB21zsnzrilTfdfJdt47WQfrllpX
	kyqbIraPJOnWGYwZfY58PP4mJExOfefdEp7M2swl6TESjcliFbBs2VmGJrfavmmdxutGWBctpPP
	u88+/NWkmrlyUF32jLF7Gi2L9U8mubilA6UbBC+Zh+sg9fpU2UpatiNS9T25MWJ2COWHtnC8=
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr13692018b3a.36.1784554138605;
        Mon, 20 Jul 2026 06:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr13691982b3a.36.1784554138122;
        Mon, 20 Jul 2026 06:28:58 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm5628822b3a.43.2026.07.20.06.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:28:57 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:25:52 +0800
Subject: [PATCH v3 1/2] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784554132; l=1360;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
 b=okIJZHRXPSjsp1sepbCVpZhksl4sbPqjPOxDXlDMhA1LOAVVf6pLAA0NFtNbxiGlBx/oVJ84o
 wRzFaUBrCrEDQqZImu0A64fgupq2EerEi4Wj3iTuvq4RMAXT8KLtlOs
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX/yH2k5JrMDCT
 lDx64w9pJUhMdNCeuG3fe5BlyySLS6N6QaKMqvShL4ebn7i22xtthgIc8zdvkObNqlu/vMQTNx3
 3yDPBDIxUnuudlqu2AcwdbsmTkcUdM8=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e229b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: nyJyDZRL4ApJnbV_lAbtHDginoyWPS5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX4wUT5T7iK2av
 2sYOkJ/l15Ubguc4L4aVm0+WsqKcWhVb1c6Crj7pVgcWYjUcPSYazVrXO9sGoY0RGCkRaqGWeDx
 xqr8v3KdNCPNA1WFtdTNEL1Pp+5vvmiu/g7gpW+bQKU44D+GUGI6WX0QkTWGzov5SEJ6EDmPY3p
 aPD3nPP4M91DkixGHPV3JOsXLQH0FaedB8zvfv3pjf9THMzpDrS0kEmDdUzqiSHpokm102oXlD1
 cOXUzcxJFR1K8ZfHTQFaapcsj8MAUjJyRXFdC+P+sgqkXGd77GI+qvEfAi7jYYvUyTBzPXWzOR+
 vArhf09SQc+7r3SA8gii+kobHMy5ofePrLJtmZp2JEtII9C38iSCzc5H0aILUXLZeqVdYaSxDW9
 a0WTijqQ4zL4tivE/elWylTD8fvU/B5CTe39vqHpkZRYAyjXdp0ITSI2/xDCG9PWGgJ7tLPGzX/
 DCZpHsa1yZiNK22/6HA==
X-Proofpoint-GUID: nyJyDZRL4ApJnbV_lAbtHDginoyWPS5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200150

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1

