Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BD3E0C76
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138399; cv=none; b=gkiavimdqJHd8dUbQFcHIqNBpcfhNRavN8A18HQCWaRgwYNMkKygADBOHW3sp0IeCaiIfCSA23+za6ZNkGLwxNoUQu6vKhb50iT0oc+SgZnBmlEIod/JZti9Chq29h5TiLNWLCR8G/NpOw4Mmm2sA6gppnOMtKPEIAtNlpW/p/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138399; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuVoHzB1IdXFk+1BWdOEhGVyWMcXHx5igqsi6ANZAD6Lwe3o84y7Us0J0UNlWc4VhQ9rPm3F4bqv4T9bCbpEJmlQD5LyttG2V+KIU/ThNkzPeCll76QT/aj7nLFsaMNCKFjl91KW9N7YcUmYVTlqXkDeeR3blCgzf0fkkvcnp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z40wigdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggzW1kXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z40wigdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggzW1kXA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RcGV3180841
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=Z40wigdIT3sUyAvTSzE8owg18o0
	SayNxRNdUkeufjNfQY2L2PBPA2HKSbzokl/gjTl40VEfx4HIxfLXyZMT76fGYO5p
	a3Bqf/s+3tqqP84+ec1XLgDM7X/3AAnKTaOeTrNgQjNgKy0bbuO0XrSJVGh39Eud
	Gpl3X1XRdlkuqlLrvmoTixpYM66yYHlahu6MrUR55ngHe7S6J0D7RZV3S21hotjJ
	YnbXKUGJTNFZcNrhuEmPyhuyQUGe31oXOtVMFhJOVA2ffToi976XFTTC4LAUqVfM
	0Jm6Q0gcvmLzaH+IBwEtLDKkRN2jcCF1/pvp5kApr0zQpLgR2YvbiLtcwzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngyst9bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so4033401b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138396; x=1785743196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=ggzW1kXAQcwacdZ9ZCpL46RUzM9UQJZheGsCEog2Tl+oRzpzp0Gs5Egs1eR874REDd
         Y80Y1AvjYu7Gju6slmQ64CgUdUhSJLJKuJC+iHDtiJ2B2yAwXUwsA7kzSOmIxNUezSI/
         QtO0+5PIfQvg39VvaCdV3q/2+kGJ4LqfC4FntRX8FAdZA3PxQ1A+tH8IyMde4vCAiD77
         kpkmHQ76Qudqf4Bgvjtp7xeqatlPNGopZlTPTzgk3P/wE3tw7duwRzQS7LmNTZNNbHOc
         U+b+dxy2SbbGhmRyiyWHCxNGzEcmNYEj2/HA90y5Ky0qsuFwZxC3A/lGkKYuLfnea7VD
         qrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138396; x=1785743196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=bUk4vkNQIkh1esfpCppMfrk1Bioi9ZxZPphhwn1WjzrKOZV426qvQrRseeQ33ttKav
         9DvVCB9BuSeUyyHWM6QAiGit7dBp0p2rH831d9CIrHMOtBGwPBrEG2xZzgJAfdHFkker
         o0yZAXGEXB9LRyfNJ8HM5dA7NNhh5YkwSD4e+fRWN4Sg7aQcwUB2JdBoy/SQuWUMTaiV
         cDU0e5c7kyV72PhHXAb2MYAU5LiToJF/DjJStO4rxeOlSQJ6cbiIexCREtKa4HCoUQdW
         HjOWXbIhUsdnTQnxhFNCYB0C1IbEP+IfH2SZyz1c5wU9Jlry19WmnZxDYahzOJkOPu9N
         hjBA==
X-Forwarded-Encrypted: i=1; AHgh+RrojviNbaMw3gjw46P5yubDi8IQ7wRoBV//1nsRaqEs8VTMWuz+CDBN6jB7O+r/2E5QYhnVclHsIiXRtrezpsy2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDt34LQJfsWQdfKR2mEwfhIK7raDwjsA86cZP1PPaprsaAlKaR
	NhYKOkAQAKmYzRiLNGvwBXGiWdtoPkg/794JIUVb++QKN4jnJ/J0oFyri+9bi+oY2wcpH8CcOWA
	qBZMF8fWW1gm/M6NsfaHXWnDYJUJULMuWC4lfHMNBiVsq8t62GXwJoH+QEaHOI2h0ueGkCcdtr4
	zPdyhcarM=
X-Gm-Gg: AR+sD119j/p9sAYKBI/QhHKkwsdhhoJaqDG7xSB5hEl6B2bk7sMrUuV4j96sj5tOETP
	WX0Ag9EgJRK/rRd4ChmgVeZTXmxd76MLMpNHa0d+2OnRB0lHkHnH0bqGIva38KSs+8WbAcUdTmo
	/jY/C5mIRVSBzTKAEhEqIhwnCo8PgJzyhrvygm94dfvz6o0iKQREIkHn7x689bECbEG1/nW6Abk
	HaIxhfpm8IzOgZgzSl4g+DF3qoLglgxSsEzcPf98IQJK4H8Mlh+J01dzQTInf+lTYi6L1u2lPdf
	HODwkfyzhS7Aj7kr9IVTRe/cCGl2aiq4C5O2hp8lj0cLf0EsjWEWjW+o7pRiDEBY/9ouwXvbrj5
	zcyGLuRNjzjqVdr8lkQTGFpCuEF9STZGS0SzvzzeRmtO/qZqTr1CwEytqNqAU
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978619b3a.14.1785138396275;
        Mon, 27 Jul 2026 00:46:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978597b3a.14.1785138395810;
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Mon, 27 Jul 2026 15:46:19 +0800
Message-ID: <20260727074621.561661-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX2aUf1mmw+oi+
 nGzv8hFf6Bx2gl/D2XZZpJxX+0qIp/pdnK6Io2x/uC9Kx5Vb9qFX2mTFiWHW7nHChJfZbgO4N6Z
 7rChB46sc5Nk7Mt/o6nygdsdm2aIu3cNLdltwiZytxt5e1J5CWw27Al4MGNCq/TX5sXZdq8Ji7g
 qL2Q9NnfbDmWUZ7RCf5dGmaUkwkvmR+3nLckXTTUCenztVTZ00yGlCMsHCw8VA9zFWfUBJRJ4rY
 EPKES81kXfA65rpDLOvCOUR2cfF8qUlgH7axvKuE+edBhDxdhDiFPYbZoNWLXY02LmBukRXV0pe
 yYMVMg6tCrNBX2FbdfyMHiyJTicuTK4yvEEadFRdkQYl/Y75ScytUa3okRLtWgBcnsIn3lz5tXV
 yG1cmTD1n/6qGxv/B81ywDY54lADP/bhOfr0bngA8/s3tfhnFgi2t6fYxIq9ABvJie0PDPBac1s
 EZzeo9F9VYD8nEyRhEw==
X-Proofpoint-GUID: 7Uoj5dLZPD52-F4hU3KN7aWT_kBP6tuc
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a670cdd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX7IbeXHvsweyT
 VgOyyVg4ooixHAXYX3A2JSF4RJIIom6TnAkzXFHQ6x3lQHFUeKD2RyiOLnX05PDMpPD+bTAHh2C
 AYdYtbZsmA7S7aMfjpOvujTldjeNh08=
X-Proofpoint-ORIG-GUID: 7Uoj5dLZPD52-F4hU3KN7aWT_kBP6tuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270075

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

