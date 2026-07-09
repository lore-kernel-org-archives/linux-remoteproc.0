Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9835402420
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587149; cv=none; b=QXIMwMMaXrCkgUIJeuFDS18jCGipsvOmCQGrVPPC31px41e9sSaWxRTFUZRyMmyyoXVGXHcpbLCVxcDAQrYqvDO6vh4GmrPizQobcNyL+sdeZ/gjWp7EmZsnGHPihvJNLXKExApO2nlyahXawwtfiyYZyXvijMZ90iYAkAdx/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587149; c=relaxed/simple;
	bh=Ggf6gG2tQt871VFfdM6zsLoc9sXjGV1cYiDiBXb14ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbm2/LUT85LbA2cpp6IpoWMZJ+uZqL/Qon7v2NhzZrljYOcqs/3Uy4qIqVKSk7E5kj1jXow8G7rvJCLFo7OfmbeZT2kBUPnfOpwnUduI8swXAJObC5YfCa3tIy40qHOcni389rv6Wk1BEG0jdc849j4//ABUAbf1kcNAY7m/K6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekL/tUvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKxtnu4l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekL/tUvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKxtnu4l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618js933300
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/eg0ufxySEh
	mH1BBdl6dlSLKBXD3YOmq78145ChoiRU=; b=ekL/tUvMegmhQqrgFxW5a6+pTab
	bcd2wHlHWlsI7AktLWoRsXPxoNg/YtaRq2n9zpifXQQ8oeDFLcOF2UULQLA4FrVs
	gCQeULVzEjil14PNQ0CAgwe6nL3olNykpTxyrRmbBo6DbJJx2UjyesuZszelApD3
	oQnaJPqLSWmzKbEPZ/OMdfHaW/u4xyLQjx+bpMDURCDG9juPZiRdhOLv8UJ/AiNZ
	DONQ8/DDj919IrnnGSk3d7zvRZPqq0KC9s7K+0lC9iPbdTvhMb8mtAoqZtqub9Nf
	jTckUKzvsw6h+9Nx0Spu5QupYAjMRUwgtOyqRRVNw9OJEdA0gSSKH2ActoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jt3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 08:52:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8952346bb9so1426644a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587146; x=1784191946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=VKxtnu4lNGulkeFiCWy0s+5pqXIgydwt88rV3VUTQfAjRF9opa4P+ngfPMHvttlpNE
         levY+8VoOnyTQLK9wo4EZoZGsXTOl8RhFs3nLC8/Sfl9PJ1tDkLGaPWikKqgbCvf1PiM
         co6OpNh6iMvNAvCs08ZonGTMorNpkoMVbvSV0IBRzl9zSzg9uwWuyfLb9K+xZzOK8291
         W/KIebhNCSmBZ6mN0kxJ6rBbuzSWspwnfRb10MVZV8JRzC5u2rqHjQZRWxEI4FbOxEkh
         IaDuEGTsvI2c+36pG0p/YJnR7K97WKRf+X1t+0D2DZ+wZhKJj345VMOj3pc4h3hFzP4h
         bOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587146; x=1784191946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=BNBVDxtfTEj0VuvMrUU/G/grntFlHJwa33NgATJB5Elx5raXgJOL+OKgFddkobIS3p
         oqsj2zZpfYjE7TlS1m4RbOtv27gKswhgpe30rB4W2dDIhIbivRIxawrNa2kIDS9C+2Jw
         yA4l+xsepDCey6c1D/+emXhe71FVWnNlhKi72NRR8g0R+GVtARqt/+Jun685ZK7v1DQz
         kW0sDov2iUrRYSWSZDGMgFQUqcb5hMYCz/ZmPFFh4oqLjwmUGEvyGfPGqf9r7geehKIZ
         TdzzAYHrNMgDexGiijdN9uKM2TjhrBPdRxRiGpMWT7x+nifyBqVrgKgpTXaKzksobcxH
         310w==
X-Forwarded-Encrypted: i=1; AHgh+RpkbeRUufDgwm7CBfMsWZ6fPpMBppYISUr5Pb3bYOQPwstG+aSMXN+9D/k+YG8dYDjdHp4JP2Koo6Pt9OBaClm2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9foBP+SgWrVHVMPRaDUwjH61t/xHlR/tN1E5rWqdQdoH2c8EY
	1BMHAqE9bNQPboYCj3BobBVo6llpwj/aaeWBrioYwuKDBl4IXXAcywYh3fdfi0GayXrYBRzb1jd
	OmejbEJ9a9kVbM+xHF3MCyd5w+CkRR2jQ1q28b2q4jlIrwyfz5xtDA8bXx1mVBGZKcJx+fsTR
X-Gm-Gg: AfdE7cl7cpODIQn4l65ytpJxn5vQqEsc/R+a0yObkGErvr586YbQb1blNTykwNX9rkH
	FMlTFUKUYDjEldRJ4+B7NaAVkmhxT9bjVQrrhXqtfz4V+38UQMhaekzZfc+pT2VZ5m1pU1NhGcu
	m2jKuiP508E0X/ACNcF8akB7WQ/PP7z3NA2MwCiRfScYuSAzAjeTpGtLMqRVnjBPP/r+bQmzeOR
	oNwUf5Td0wCqy9csu8/zNVkd+ZanxsZC8pb2L5rhWxyplcrcNeNv6ajto2ncrFUtgNtSDMyjt7X
	5pJV6LZMBxQ6i/CPe3IZNyBwvvTiSKhUvd7w3MYoHXWQtx9Hc04Hl3onW8Lo8Ufc/qMkRhwVJzP
	HiPhbXrNElYsbVFHMpZA2FvKWq92KbAQR1VCfpkGjbRVp+/6sGo78dr3Wm3RwkCpOtYfbmqk=
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351572637.67.1783587145861;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351531637.67.1783587145427;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Thu,  9 Jul 2026 16:51:47 +0800
Message-ID: <20260709085149.4072181-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX7exSUrp6Y6dM
 dqS5BN6oyzM1R6sPNENYePEwlM82qpd3HVaVTk2em9jYmx69ormnG6rdD1SAgC+G6Sz6Xboxssp
 RGm8kq9ITdLi4yyDxGDDSAHWuY68q0E=
X-Proofpoint-GUID: PmW-IUEUOmQXDc12FxuuBDP0c1twpjDr
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f614a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=L3lYWtOMLQTLw7epnDkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: PmW-IUEUOmQXDc12FxuuBDP0c1twpjDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXzNsHiwJ1Sm1R
 +0i3FcLI6ysqhfrV0i7svKXx3ScYZYMR3QhxwB29lIhi8XNEmM+4Hb+GOclEjGTanlRA8HhNsWc
 Xbvnxmd4fNDJG1zjFk8nvPM9VKK7Bz9Vin+AzoWunjpyrGnAUzWAfKGcXkwir9ZftQl4/Liwb9f
 7HuQrquFxvy9RP4XxdpYcwzAhyUZvXAeKKgfXYoMqqNMk3emJa5a4lT3eTKTDJhsQFyaSLTwvP+
 PI5wGtH4PPnt10eqf3aT4cNeEiwLba90hZsrkCUbDTH+EDfhbvK+ohjXoBMiALij7w30U9k7NUx
 nyrh4X8BS2EJ0PdMUthTMGXNV/LFm62HF9XYTDOgdkIZAm8yLxvxWkuGYkVacqS+9LquoNSNLF6
 /w+uiubirJKX+Lyj0RKk6iTWLV8/C0VLL43Zzu20siSKWOmWbYtwUCBo2289cinIWb2VSwTrLYi
 IMevX8ZWDf8tXIc7RTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..e778fa3a6c92 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

