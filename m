Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC337F01D
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292530; cv=none; b=UaoFYrH8v3HYhG2zladqZPbZjZ8BTEf55Cm14ba4CiwtBB3fVxmPI+qL6MQluo/rbVb9xFn+RDER7n0FTZNeHg+AhNU88uG6hbKbj79fWLlRYMNiKwVyuRWlahJ9oqwL2VhJAtPg05QxL8fTJBeQ7g31D5ZApfMjD829+E/+ptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292530; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nD7laj7N7emF3GXA+O/AOQTksNjSCXsez4Jne6iVz2/91jheogZejU9S2MELPwN+J4SxDUJ2S2oPDaU3/kGHONwvFw5dVWrzwjaBsxWvVsA8RV8qt6r+tymtViEKpiJQ/cqjyjJ5xeRuiUtTOSDU0yj4k+QzO7KDTOVc6pmvZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/ptj4gX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPnTv+BG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/ptj4gX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPnTv+BG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Hn0W4025713
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=I/ptj4gXPcChMq/Wb4x/D+rjZyv
	COE85NDSfQvqZ+aA8N3qaFzXNIUroCPK2W4YTplnDHSBjZ0+hOnrkJtd1qtqi/95
	zpyZ/4hsoDlW9L9KvrQL1p+emOhds+1bgKhXuwoIsK1cpri0Ym+KmUVE6o+/2eh3
	riCYEGoObQAyPYBGPq6dJi6c+TJKN3jzMtAaWG6omuavgyARNVEr4ft3VRfZbai4
	5qAvenL8b2goS4MRc/9L8IRAg4qdM7I3Zm60rV1bnyAGW1yV/cK1hEuaMF9auJcp
	HMCrw3+pdsPaDE64KLxRI17eCJdRdv0/RuRCsBCRXnxp13azVz9VgvX960g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0htkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso522050a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 19:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292528; x=1785897328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=DPnTv+BGlYy9smSg6UgfW0BbFmgBkdd9PNAXFqRuzoyn6+5H/0itNh8NzTz5SSE3ek
         P5RUoznY6XuukClGGd+yAl5p3duToSKV0fgaEeQ4s76+jt2GnZsJ68IZj8FXo/CNH75+
         LMzbMOVFidAvvWoMLbGv4lVwL73uEAYIHwm9Z7dIIC85/slWAtEkJSNYZfQP8IICJ80N
         cgbSHeWx3NlECkWf5mFF0aj/b3A4/Je+7SDobKNnSX+gPP3+hFpuPScbSePyXoOKLOa4
         nv6O6BbQJaUhGQ444MldtOEbn3Tos10jVX3NsgN+3EZTtGbIo1Ri4D3UmjYoSVx9wcml
         v2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292528; x=1785897328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=pe4+rjh2vG1cgjLGTmhWVxX2cQMqSg0/dWEg2KZXbcHXr1ef/+rPifmgdkN0mvRSaO
         7eurAn742cxuIZcvJ0vwL6Ux2JhMAqTkr6Si9S/YJ2f6jykoN8w2r30yv0qslq8GSnFx
         EKYFMaWuA5HYwOR01XBkFmQfW9A1a8Mapqwjw2FbJ87/a4fbJGHwcCM6TtHrL2jdcQ4c
         nmO7oi91DeBIbMquC3y8tNOHy/+MRp02DBqUS978YqYOxJRBKp+Dd6pyETc3QtdmKT02
         S1Cy6kDw3OEVHN8mdJZgVDk/NPIhDKc/KN3kDh25/bqEO9/DPtdBEnA2luoERmyCCKBO
         Cc9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrfzoYlpe9JEDlyOeCTtMBh4TXapOpPtxSsRpqRFrvHe3t/LqIWiiMOxc2Kx0xLlPi5QVkzfBEBtFFFTC2fz//n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6c5c1NU3YLM5Iu2FBILf+ihsqdUFdT4FrbsGKUwvcWMl6r5fH
	idC7Jcg1r0ELjeTtFZ7m04sdIAUt2XjvST8Io+06sQfbAC3vsTpG8ef6BIIisIKTHEXr3bdKqbw
	y69mTrAY7FqxqqBVviRpTUn3wFRFw25jvstURNJCqn7ov1R5QUJvNk6WlR2tamS0JlfDkH19T
X-Gm-Gg: AR+sD11uhaqJYCfvQwuVLD7Y9i6hEQA2MJ0PIt25PU0fdx0W7aIjukBm90WQoqmz+Ba
	ub+Dk2v/N1e18zjcszai+7MS23isLRP1AVitLYIx8UJ5UthLQo50gNMQXy503nuTDwhCTAsKr7c
	vdQ3RMWge7MeUSXOMxesyGjSnLonTIbGJCSVfQYOMyn19FmmXDwLmA928IkX4npOR2Gzicrhq68
	80A4Ad/D0oEotJ3dQr6Py4P/WmVUu3haTrLtH1Bo6umGSRSDLTIEl1QoufrqZqDXp7HJd77j71L
	6dni5ph/ojAx3LHBIoeOWuREF5toR3H0JMSou4JvwVIMvvJ7WibM9iELSskYVt6kQn+5dOp1LOr
	roEfEHhPZGDyD50DhZYWzTi7cE8HKnO0CfOw/msTAdWxEpAXCz3QkmUBT6cQZ
X-Received: by 2002:a05:6a21:3a86:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c8aaf7b0ddmr5848083637.8.1785292528098;
        Tue, 28 Jul 2026 19:35:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a86:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c8aaf7b0ddmr5848057637.8.1785292527609;
        Tue, 28 Jul 2026 19:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:27 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Wed, 29 Jul 2026 10:35:06 +0800
Message-ID: <20260729023508.879752-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX3WTb0rpC5Zyv
 r04wVWCb3KoWL3diOX3GDs1TTkggW0sbW1kpPSjJUO1pStc/Wpw3lf2Nz24mGSMqfTdv8qO54kP
 lLYdm9t/t5I/ZSGgXFkeO+svnmerEq/fTf8cTpreQCCEvYM9X20wbLQU1uTIXKBL8jhUS2efzM/
 Nkx1az2PLGvqt9EW8reg7U/r2PDoZwIIFpdJoz14nknY02JI/L9Cl0Nio8OadnvdgLPzY1T2e5e
 VsavI2029dGyCIPgVRRe8ipiqpmY2Qwnc069T1wn70VJqu5hUp7ntKPQiobUWH35epjquNYbVHJ
 GhFksQwA56mnlthu8B/2gJTNLUCUwWXcOiIM/kL+JWFUFccB2q76Gmmq8M8NU84rqw5E8IEneIw
 QwyFe9OxOPauwTQ7vkPqfvSnVrvBmvzgksYmNLXVVa56Mq6bpsEQp2lK9R1PQEKwlKklT3vuosE
 Q2r4fUaSvadb2NsoIuQ==
X-Proofpoint-ORIG-GUID: nfR8GrT3R1BnRTYYpFtK4S0BX_vkujds
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX/HcIxy1i3GBQ
 Tek1st86ZPFdCsA2PlE2B7f0s7Dndycl4u1396JpojNMuiXXMMEeq97lnhITxGtZTttoxUr4Ybk
 //49c+ODGZ39kS0v6YfcAPtN2Fkg80s=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6966f0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: nfR8GrT3R1BnRTYYpFtK4S0BX_vkujds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

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

