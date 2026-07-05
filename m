Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E73A6B6C
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280482; cv=none; b=t15wbfSGRSuWHjQc57FCSKN/1J+m9ypAMpZOM8jV0LTb6mdsrRwQgFE/R7r+a4nWkKbt72RPHRGvu9Sky8LfszPDdwgp0CLu23XfRM08MGCTZXdNWCvF809mhoyBTQPDHSxgwzGHlkV8H8ZJS2TJu3hnxFn30bs8nYmLHWZO2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280482; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3LZ0bX5bYAHo3NyGnGFamRQ3hP2Iay8wi5wwvGjfsDUrZdfiYgG90H5vb7PmhktbYlespb+LwOZLT752JitA/loMkJuIjE8SiavsSU9bRuBR64nVr2BaDz7F02dZBq+w9yYr6h+9hOgXfNN3k7pz8cirYZgqANlbtmz21kaKro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jJCCQ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVhvB4ar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+jJCCQ4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhhpK2131068
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc77a6943eso38160285ad.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=X+jJCCQ4rZNaH2QZPG0tZitzpUKqRrCOmuWF8J6cmnJ3Nezh1CbmYLLK3XFP/GW9Z1
         NZDdKt/HmKptEKSYSuSDjjeeCqArYdiH9LH5ds5rIZGHZqQcIDd7ilrT2+NMj0H2pQNc
         YXGiMP11RX308CqgyQ9qahuXGTw35xLR9bY8jQ6vV3UPasFMOeEz4Bn6i8n3vv8oXC+v
         8/q9SY35tZd5ymgEIzC38hWwU7FPnfggW/aRH/c+Nk0ZD/ocJvFlWX1+Gqcv8vZkZav1
         l+1xsS9fA6P9cv6WvY+n+8ZjiCX7ulw0dGUd152yINSkzYgwat5NwxLIITzc5E3CrlEk
         kUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=oFNglxdIu0Akwpe+ftDtjJ/R+RSxyDc7qJLKXMMsKsJNKnavHOordS+iyTiNcgVfop
         TokmAq7EmrLxTspv3OnbmxRRCQEUENg9LxhlplOoJfRDVUiIYN1YJ5En9r9OZUhu6nII
         W06I6pauDXXLiAXC/ivsl08qTZyX6xNhQVERX6QCzZeilWJcm/h9GernTGt6z2rmH6Un
         qwqXYYA6mV2YZYnQLfeXUi48QtpetQ44rWo6DEBaIiSOjccBJ/MxcvINxJiCTna2sdyW
         Lykfa7Vw6AmhZuuxNJ03OXucDN0KXkk/xmk/FiuVkwAQl5Usa3Gfq+XhtbPqdz+Q6ElU
         Ce0Q==
X-Forwarded-Encrypted: i=1; AHgh+RobG/MvZvwCb7D1yTRjZgp647QvGwxGt2gA4aiqOGa2iTyCbFB2SCNuJFYxZ5V8HBSRzlriDpzI4Oq2cutx3FNj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuW8llCT2KjuSbCuJlIxNKjTtteVDN1xj40DGHcuTq4+XxvrnR
	4fAnbgKAPJ3d1KzGVuo1OGzEurdpD0FljbkIv2UZXa61dzDQjjfBm1fKooa/POgrtywbMp6xEiB
	lDsV2H+OUomRMNqmxU4v0VWfUJfl7l6fWzZpNexNNTu8N/Q+zU/GvNoP+1GZjSRrSTVxMFCWj
X-Gm-Gg: AfdE7ckhoKf85Gj/O1+VGcVc/zdZ1aF8wXeGm1/d5E2PInEwg0rygk4zTJBR4HIALOh
	CZaCQWlR5prjhOasigmuf9BRJjqil3TYOOMN7ZWI77bS2jeZ+Pq3oHSO66SWFtWfSnbUScbwBGT
	q43fcpxS3qnLNSz1VkBlUpGsOigpuIAkptavMLFTKXGsCNhgaCDwkhSnKI9IE31yjrsJiWyGx8n
	e/JsOeG+dyeyXi8OgTQq5MoIK0DFj1llTficPOIYJjMmeWnKPkbktRbjXw3kW0ZO3PPmbeNSx7T
	67ezKfdIFkDPBH/iFonfpKc+rFp228b7mTNtaNO5jeX9svceKjLSqX7SWH0aN8NpBPMQM6BScce
	FN+0RnJKpuN5LNTs8dT76tBhaun3olwXdVQ6gGw==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826115ad.34.1783280478037;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+7w3FCWSbL2q
 WKqSwSN454if+/bOr0J9OyEEKaMi+aN5WIIJT9Ha66Ka6W0qjd4pOXqwDj+8BG+/Llw6d2nUIL7
 3r8rdXthQp0VSWzcdJ5pUxxRa05yRDQ=
X-Proofpoint-ORIG-GUID: o-wMuY5JhrsvGN-MgycJvxbRKzAY4-NG
X-Proofpoint-GUID: o-wMuY5JhrsvGN-MgycJvxbRKzAY4-NG
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/f1bAWJb8oJX
 hiWjRDrfX6IQ0pNvOUPpUoi4/eIk7Qkj48fwK86q/jBpC53G6vmEwNvpG7hRibzlpu/hHsJfz1u
 G1wJksCdj1lpgntCHtLrTu/2FXvP1/HwjdupANAFYhA8t73Zt6jSsPAqWBXwbvu/xAJ4Gl0NU4a
 l5BMMol5AZ3Yy0BNsjKq4MvC+JrQjhQrNRrWS3dUpPAYr2+LZ70QwkVBxzA4myrAOsWYagwFdk7
 0uhOttg5hlZY5H5F+hzFOzmc5TqlKpUs1rNvw47K4czlkZbhutoxsfpsmfJy0piagVdaq5qRdDa
 I39LFGW6lxTTkb5fdeZ6Iv+C34kFRD4nGvrExcglnxxi/pkhD+Qhn+CRStjZQMnIYD/e+6uiiRN
 O0/ZLTiAUK4BEId5HwKrs66A54vbrOCRVEWwrw2F2QvjuwnyYIU+2yU7EQUDMh53T8kpRcGl8ig
 WCfF4hamy1IJlnFbTDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

