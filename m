Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95174313283
	for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868249; cv=none; b=rbZWl7N1komb9qWTdGiLgCAH0JI4S7D5NPOBpdPktL0gt9gfU7kkhCHu/WS0qHgrurthx4Nj4ZyC1JybI1A7Mi7rM8TiuWANQr4837VjeredGzJqZ2rjH7ur2D+wSDtVZOVqr0PZxYoEaOTYU8AnzBzCUU5xJUwU9Vg+3nVOdfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868249; c=relaxed/simple;
	bh=Xam3WnySSyihDDDGxNPmRcmRKrs0uTJ9euwWF3c2V3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdGMzNZIQ2uOxJB8UrcU9NnANbjh/drXLCCCB350hB12RRJgWrYOdMYk6KH1uSOzo7bh+YEk/L9HkJVi7uSq1mwqcBOPAZDMVElMkzNUyiBn4nW/t0XTI9t0dioGFB9ab93HiHP4ABUDY42C/sRxQQCjhcYxKEFtMw+L9iawOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzeYaWQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyE5oe7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzeYaWQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyE5oe7+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZU1p2764742
	for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 14:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/
	bMBeEHG8=; b=ZzeYaWQN41TGzdQrFgh9bvy4DfMIUIpA75j9VXX/0Yjl/pnZ3Th
	CdQ1mrUlwxKTSgt+qVsfVUxb5wnaXuaB/GMQ9W3RzC0KWkVlnsu8JRS3PPJxGyY7
	eCOcd9z53brTPD6mcYsUIxwxrWa9ctWssD2Slgsc4ab04uqqj1GwE79zPY9qXkup
	1BVVxiCD7wJQIycRHLJmiWZW2op9nyKbtrSr8GOywvmsV5gRWU8czj2ZjrSxHNYI
	EBglMnP4lT7PHrNdIXG5bPFDV1r41+OeUBodzbXfz1Dsmanvu1Qpb469BMM1yYoH
	Nb8+SwhpAQRQDjWwpanbbvn9e0vTQ3DVADQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hk0tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 14:57:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so20045121cf.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783868245; x=1784473045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=IyE5oe7+29nwrxPyh2i1tMb7Rk2aomM4tpbGrtHGPLGYK591zmjrXi2sTe3p7QScq+
         Nrzwp9CgIMktfNg0OMmgl7t0Fyh1v96StiOBtfbNC0HkMH5OlghUjhzH4Ncak1pF2fkM
         Q/Rad+jmhAYfBK5zOlW5BhmxdfOcfEsPuGEiq4PlLEeXMD7N8Psh3xTFHa0KYRAho4KS
         UizPUPH4abW9XKndJcVsYUpWRd1BHhrq49lfiofaXqzOEoMKSdX8wTiIT89CEAGPdobF
         9MIumWDvzZ1vqpoEU//1uRrAlQKiM2HfQhZqFhQzeYG+lWcEv+3FOYkiv0zVuREjKe9S
         vZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868245; x=1784473045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=OXTadF2RRyRz6luCW9YE9k82tn5fxqjb+/cdwn1TEnDzeNqEgfBkqDXelSORZrLmf6
         TEX1hNr9uTZR4BgT/Ormwh5rn9BsNNOwPqJ4xUWfLWay6rqeijL0xAIGJyv6pgagnXVi
         QspNcxHpYIsHRPoyHuSMBcTjw7I7vG8sDXEv/W/KINHgSLku8uakHR/nxqzRXhHIFNAD
         OSlxDGEv/5GFV4V7p5t7b+8E3orqScZ3EFT3W88dPuWPAprM5sTxJ9r6DGRVa5/lk2sO
         rVW2KsVBiCkRfIl7A0YFyd4j6FtPTGZWl96M9w/+YXbl4AHZ82QFbqaA2D5ToAfucGLA
         BlUw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+wUi0DIIhh+rZA4i4Mrll7+rx515mnrixMVRebn1ao4RkwLmLYzdfccBFP75ADZlaYW+fSIxc5t6T+Soit6I9@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzKm55bQZHY3lGZ9Df9NYMNtRvgp7aFj1LxdaM34vX//GKw8M
	G3v0TuU26X2N5lqjrXR5I4+5YmuX986cw4cAJz/P3cC86/a8SAYbp13eVpenBKyuKpxgkyPzk+x
	gIzFqP44rZ8+0err0FMqw7Qc8kAycem9PZxwU8l2r5H3KEDL0OtnPQUBfg6mg3eW/Ug86L6s2
X-Gm-Gg: AfdE7cmGU/NioTnETNL+gnvIz85KfobIhe+tHmVnjAb0FAiKmTPs5N3NNKee8oWhnj7
	vA+o5OCqnv0pbz4tf2DPBcyZboWTc+8RPpgZavTuQzz8MmlIHrVNNeBmTknOFk7TpRcvtzFybFO
	0Ep79VO2q6ihrZ/GKycgpXo4fgizjA+w0q2lGn27IjmqkKRhY/vfuURLfOA/t3VV/wyaAWf48IP
	B8Cg237QTadc6kaBuzolpQVHAwFVutvYHsHZ8dT6DKvwimYsD10JhYX/tsZOub+FxUEtisNwTI9
	hk4OP5klaOli2nAK0IYsMYGcpRc2PsQ/LgvKmN0wWvYGoUH7q4jpuyXDbwAZbi1OhI3pWsVcDvl
	fS5ugfZYrhiIUy/V7gtEELNr0fR0=
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63203171cf.9.1783868245089;
        Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63202981cf.9.1783868244698;
        Sun, 12 Jul 2026 07:57:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm222688675e9.0.2026.07.12.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:57:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 16:57:19 +0200
Message-ID: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Xam3WnySSyihDDDGxNPmRcmRKrs0uTJ9euwWF3c2V3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU6tODyBAdxCv7LttYZ1TljOtnt5RYl8TpHtke
 z5IVF2RgpKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalOrTgAKCRDBN2bmhouD
 15QDD/0S5wV672WNwxOQ+uf/SmXYU0a/71SL7SJCwz5L+Sm2S7Snh+QEnukl/91QB8uvvIKbFUB
 a6ptRx6zWLegA9e76DbjuYkOItsyiiyAsyN7Ps3U14JYWlYNfaVt/a4b9Jfv9ahBrK9G+m4/MbU
 Q/jbnQM9DDxaNwj0nO5vzAM0AtaUskzDcau48XzdTpfTafyulMysq+gTvikJPCMqmc7nggB61RG
 RsYu/KPNeHqXPwktw+my++ko1y90OJVHZ53uSCFwNNaNSXsUozeXUgGTPjZYpYrhevy+KQGB6e8
 o95LTqOeTtt7RE3NiCMIHjfZCLjLKm/noI/SP4AHAKjBh3kg6AuS+2rfQTHLDGXzjWG4/qAyAVa
 O3GHO+MhqnkKqunw2Ci0LoxS7UByrmyFSSIjdMK7+HMJlQ/lzUBcAhTA/3QK5rneCsZPZzWYkL9
 BzpBfXeIPyNoLAJhZ2Sqc7BlsnfvtH3Nugu2i6gEQqZOO6mTKoeIAsDNlnY49RaK+2bQZQZyl/8
 P6R7xJ1+JVIxajvHdYrLCOL4Um9nKvl52uzBQZE0aGud3Debt2OfY3BlD4zG7JksZgf2oA5MJP5
 DfISs4qDlczuoI/rRyNtHXBfTbN5c6XeZusZc8Jyeh6qYe6HS4SqD60Xx+3/pYxBr1gdVtA+TNR RsMLs8SVQsK+bNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qv6a68EHKurJrbOkFqNXSE4quGFmp2oO
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a53ab55 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hJuU4UVuZdPSbFSiBLIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qv6a68EHKurJrbOkFqNXSE4quGFmp2oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX/fRD9Xp3a9eR
 ych6ZqrPXpMvv5oMg40slH5zL15ZnA+OI6QTBgpdZ8rDPp5jh9ys7cM28n83gWwgLigpcPn0m87
 AONeXXQLRXsSaWsf7De0dkqRKln8IVrua/GAOk/UTUINYnO3olpmKp+rWhwAI04BCEvs0aTctRY
 V3nHT47QpXYEbXeaxzBIGMwpD84PKo2ldQXtYRhQ+vX0LfW6ZtzNmzwH7ZRIs1Vqo2R8kuYbSnl
 zgM3k8U6CelLWVHlcOjIuTa4AaXQ7IAFZoUKSg6rbDL983SvZqRSS940T2NUnLjmdzt/EPREkOZ
 rbHEaO+JH010Cccm9xn7An4j5arpCrN4Wf4YQjbgsxZLJrf+MLpexHoZv6IrqW3bhDF5go/fvuo
 kOnpGX1Trs2JtCXqNJhJaHZW4ue4OQdkM9cb9mKltpZTeifox3rAda96oF86BaaAzQSpIEnPqQo
 j/KJ3+d31bq6xWbxObA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX4pewej7VR0dD
 yHqGf5/m5Tsh8r41418fwDlybnrD/Pi1dHrJeZukJHsXY9aQjV6WJniQxjALneH3chf52O72S/p
 n3OIy6YE+sucMzBdPXz950BZhbQO1TE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120158

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
 .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 3f710433e937..4cd5121b9a4e 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -25,7 +25,7 @@ properties:
       - const: amlogic,meson-mx-ao-arc
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       The name of the firmware which should be loaded for this remote
       processor.
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
index 2811334515d1..591471e5f93a 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -30,7 +30,6 @@ properties:
       maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     minItems: 1
     maxItems: 6
     description: |
-- 
2.53.0

