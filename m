Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9480423EAE
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889574; cv=none; b=LNXNTdQHEYgBl6xnyzAhVsItP97rIzXqBy43ur2yI4/I0mzP9ooV2BdBWuc5/6eUer1NzxJBwknWo2nsQjxau7zdr/6VXmzfQOK9ujioySH/gj93hOsrAga+JoxnIeb7GFkYQTSrHolvPBXydg/DyIcE8YouHdsV67eZTOCE9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889574; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6rUs63m1rzZmMF0BaKZftcI5RsFw9QzIe+53YvT7LxyUACx6QOdpIIwV6BRiLsmSRK6qzUCCxUjS7EPt1w6Wr096gYVqLxjQXE1kbrkuRC1Vc35C1dnWRSY+ZcqCa3kSiXh4EpS+7dILr9Dae050hzIucRIajQtXXB0nr9Xhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGCzD5Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH2S4nCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGCzD5Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH2S4nCC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADwCD2916991
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=JGCzD5Br+5X+EDBTTTZM2xfo7lX
	Qa07ac9cxKNKVRAraRsAz7b+Zvd7MKOSObOVwnRrXY6TgeymZKHcv2x70b2d9wjI
	WoU0frIJbbTh5q0oMWF5/gpAl/NyNQ4b6FimwUPSk81gwsEY21kp6WZ14Ipf6IH4
	TSZHoS9VNBU2vyVnYYA26FcVKpMcMw8lRHypc8hyfCTII/gjgWCzjnR0H/nfvlro
	x9A3LpaL5oLMmKFi5LiCjMG54HrI16/EYkGt+FC0iVeE/M8BsSWxbXQaNxN/v9qQ
	5bYoFdPgYPADa/QgO/oaygR2y6q/ZNaLPwY27HDs+rjYPp85Rc/3YBpss3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vksdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso445040a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889568; x=1785494368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=dH2S4nCCXumeT8Xx3CTxtV5uh29BFHD+B5vsc+rV9MPrk8bFh9JjaJxunBwXXgPKkC
         mYuNyP3ElNsKu9/P/KNLQyEzNXRrHuHNuAzXmuQIN7jLNfuHIMI6G14fQgX3OAmCnTxe
         cPEvdOY1QS6poHLVqfxIOm4T3RSRyPibBS/ebD9zmzdzIfu77I2bjTGaUCV+TCbgIhIE
         kN73um/8PIWGyQae4N/kPAOna4ve0sI77k6Om6v2Vf06h6yqK9Abltptk/Hh7vWvIURY
         HSp1x9WMxcXVHduakdnZsRH4F8oGNisaPvGOtVTaDGDOac/WZXqhgOo+Lpyn3gefD5cy
         b+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889568; x=1785494368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=nn+eAVzAQlMqiv9/mfkvaYZlX0Q7cxcBO3E8zjMpcYtxpfd1HMS39nqV3bDth0j8Ul
         JjmwGArAfU4CoITHpJHdVUI+H/jezvTja0AH2OXmsLMmdrDSqEnm4/mw0xu7jofWbPFd
         MlLRfqwEBujgcH7FRk6xi/xxuNr46h3Ur2Z7jMXijqSAIp4ARSB3JFgwhQ84BDJGOPVA
         uVn8DyOWPertM1l+B6v+1sbG6GWn1KS3EDVUILVJOYYC1ijLCBOkQ+sov8FmirFYjdNa
         Wj0P3QbaML6sxPyl9WaU+kL1ya8Mf+SokDfqRFRsGD8kDV65F6XtkfxpvDnmWRusd+za
         13BA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+8Ya5MQ855JqdNdGweHH+LgKsH8JvdOf8H8FS7lawSKQC+/Jk2OJ5MB6mpJDm0rP5S7pLR3usBY8NRNITEVbO@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiAHcvsV70jgtTXZSJ7Li8IkbY+O9H1NO5P1g7EUkUlQYD/ru
	NOGGEzLEb+DeNUg8ZrBG5qVvzrnUwF4fmjB4clWrDlwoVAq4E6LxrL09+RRLxLYd9+1FfOmWB9O
	iMo2UKHgIEyD0njfblXdo2BabgtkXUilNzsY4YSN5zk0OF43vVKZQ/wa7N/p1msz7VHaUI3iK
X-Gm-Gg: AR+sD11wrxlHgWdmgy88xtvYtQGRS2Zn9qjzLfzVFdee9pcHW9G/TWfzyNAguzfY49G
	jpFYKPgXlFuPS0FfvLChHMlTZNE7mkdLjSAcqET0ktHy6c4F6zrfcCt3P4PQSUmzAIy7qRhAPTI
	gjvR/J9CHH/eZ9ZRIyfsv5xtnMkQCiIAWPR6vwmjful+CyFDsXvb0+WW6RaqZgVWE6UTf+Dzyjd
	8gEhEap4BQ5b4fZ5WLqFL5lgXEVp1ZX/60eRT9LiZzoymxo+Wet1K8E7qaSoId1gq6UDw6rPCI5
	4MhFevq48vcJJbsxF02QEh7F6DhMoEOFSkmxtHgYnNAO8l5WNmtBIdp4kF9cP9MZr7A9OCjx5ub
	aglHoHzGp7GqxlnXLQcWn6PkoIbOT93Rl2Hs/ZV2LLY4fBsI237SAEEr1xoPs
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905253637.44.1784889567673;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905219637.44.1784889567200;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Fri, 24 Jul 2026 18:38:46 +0800
Message-ID: <20260724103848.233804-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX8qGpZDQYrfS9
 ki0Ydxham9rp8C/GPM7R6yXaM2lw/jZjpYLPCwU09titq4Vuur5SfQSTs0d2j07x3mtQKKM8BFF
 yYpGF9H6IqwQL+NIIDiNnC04m5STJh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX02xloeq4nirn
 R9xa2xkgBULnXF8YhugDKeVFgPnvefgrDJPyboH+f7kbS8IuhV7h6TcFQwp9A13OwNkQbGQ/VDR
 5VEQugPB2juSOIMRRMZkIeq3pjtEbBFek2e+FPYxFliJclB3RmoMZJx0Bu8kvZv0OeEmg7G70oP
 SvDrl4dMgSKhXKTlwTjtM3+lZDOFYg7N+NhlXE7YrYGuSAQSM6owMeMGUE/Qaflf7yDKU/eIOzI
 pzF2r3qm+W+vMFDVz33koet/uOE7hwdPECyQn3E9org7JlQE1zFNJa3T+pih3aiQFuHf09TGxcF
 0NX2XU7a+4qRfrLNzLGoDMgqB1BPK6h3kN4RNqKTnCqFn/vrQ+1bowI5K8eeNiGYxP7Gx51yGWe
 G0B0hp/JLJUdslgqFLja6Q1FcfvRTe8ULghlKraUREH9xiZZ3Jx7TieXwNbNu1KDqS/Pf6qPXkm
 d2wDPRYOujmB5Jx+ocw==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: gHp0sdVcfkHY48vdndv-qYXeb2ZWELgw
X-Proofpoint-ORIG-GUID: gHp0sdVcfkHY48vdndv-qYXeb2ZWELgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

