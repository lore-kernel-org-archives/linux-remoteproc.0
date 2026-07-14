Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9103448D07
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031874; cv=none; b=IY2Yct+KUct8r6/hle7Hkt0WlWoDHy/Fje5k0LfOp5tYSGqcGzO3WhapuXcfw7iFM+GqUGiTXhz/q4CqZyXGVjr6PX3OvdbckaGe/LaIN0qSNOLKOgkKPI5LY82dDH1KgXiwbwccO3BmFdWhRGxo/OwOVoQQon+Fj/cWBwWcFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031874; c=relaxed/simple;
	bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzCDEpm3jqrZ2jm/8+JizLV86wvTOMacTYPOn8LG+/CqJv5yZRclWYYVlixt/LgP7Lb9uTiYYXmCSCu+uYkk2mUZKaBkDG2oV7ONuOt4PpqAikaMYgK8fhe+j7K9hG3fYLOAHbcB1CkYAgbiZH92CAx3j2OOe747KbRvvu1EY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh7VEcEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3JzpZQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh7VEcEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3JzpZQO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmkh4473834
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=; b=Zh7VEcEB9kSelHN/
	KO1y1Mxe2GP+Bt5p/our5HjiHVGccZaOqNc/jEXY3sxZE8cPFeY1hJY1pEX6xT1P
	ZfGW85g7wyjSp03lqG4zaypX751QiWaLsk8ACp/QcZSLvjrjK1lWrQexng+5WM8S
	gloJQ9qxo3nz9kAGKFgBj7ktW/PU4G6cSh6ovUwuwdqVc1FXc+3SbNjwMwtqNDdk
	UCFe6hN3JvqmeMIC5sGfzcpEf4Ha34CvJLrmpSemRKJhhEAIlN2yqB5ybVQOOVrV
	Lb/Gq75z6H+C4pGXaH2y/Jr2n4VlsjtQNner41Z35I7jN+dEIGwIq5WiEU4IwPyE
	nMlnfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq041b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so11184571cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031855; x=1784636655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=G3JzpZQOFf9annwldWxOkrR/WMYKes94fjBa4+hElQAkFi9pKK4DIE5jGBnKqCzQOG
         bM/wPNhq5J7/yjmsUmSBZSoZWpQM3GeWgwpHod1dS0ec7VZn8vCEHBtTyBZz2tphIoRU
         Jb7YFZPMYgpWPEgFo4sWZH3U0U47AZE/I7Jm/xKeBWoQWFTxRVqEKmD7qBYxeZQOLBJW
         FEska732qYcCufC/d9kUQ+Hg12teD4/XgZVZ/JE894RkowHKFOIfOhwlwhR57KmFwDnK
         uXhXtpsXhK47+vzBnv4V1sCgeETmDAA/oELnn9HdaNG7IlPyLhaMQzPnijfQcSdyb7ek
         m/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031855; x=1784636655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=kIvcPIPFL/0rPQBSYWk+tzyHGOzZ6THRfiumEMpychoc2IEbstWopjHKYgFArEC+O+
         mioDWPOD1rn94w7hnWCzwFSIbo3wZQQK0ksa1+Wbr8Gh4vR9KCgS0/yOSiPAliw/CkX0
         H9zVgQGSgU1z/zJKBrsl5DvWo2lIFhkjI8hQxajrwMvD+5m3QNSxhqfNpAzt0thZC8Gy
         dij21WTpkC3Z8OHfMcihNUNeUSRtGNCCZlWnpe4ulvJ4TcqDZo/70i0aNGKwbLxL0HHQ
         w6iVm66tg1QcIA4AAbYRSQGV1f6L9Ov/e9OguBnGjaeigFtZEhOxB8qz5uMF+Mv1pxvG
         fk9A==
X-Forwarded-Encrypted: i=1; AHgh+RoUeDJHB917Tu/Px21I6VSM8ZaUUtueb0ZE7RaQaN2yWWYF9O/5WTfLLZE2RhFF9m2mCTqP+PUow8bjeqp2YX0g@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWebSX0iyTpZAv3lBcweDkZMfcDEwD9d0SO4AqkOHSV5Cjur/
	K9Ber7VOMTaAq23RCHkPnIha86h8YcVbsD2NTXFHHsFeP3ReQS0KUJPDs98RWXdIpNnbEBQaBQq
	Lrr2ZLk+WuoZ72noS/niKATVV50QE12QgQ5iGjJ4Ujwih94wrNZjaw/AodnFa3a+JQzlc2wsG
X-Gm-Gg: AfdE7cneLMVSlOPJtZ3RXwkTopU9ZwaVBjRk1r/HitO+xMP/EyXjamzfmnx25Buhmu+
	BrH0FdfppNObmE3ZK6fosX3sBkorFv7ED64s65piWgunF0PzgWZxzhijNtdiBrr4wKYAMe5vmsM
	yvZDPGJXlIOzeRa4yZFLdXFHwofMIXDZUD6RaLgYWkhkyFe1nJn4XuM60fgH1J24UvPa8vYexAV
	HSrOwe5boGFBDtRmgAbRvv9Lp0CANpSxLGPPe5OuNkolLDpaWVx194MY9FkRPNKgime3pYZYUF1
	auv6hKf8eoeRkqIEgGL7RTErD1KpU3tinJFrDvdgxtdFadRyZKcwI3eKrxDkHTDK87aCmtIqxn+
	Cr3lOmSu67ulgg9U=
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478451cf.2.1784031854818;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478181cf.2.1784031854211;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:01 +0300
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipmFdYPKxz1A1D4NFolDf7IZKtdP5k2OQYEV
 Z8OsiItDeeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqZgAKCRAbX0TJAJUV
 Vsf+D/92ynZJnUcD+pno4i0uTqx4G7QwwUJkksE8yQwXxgTik41O+Gp0PpWJDJeWD4WrPo963N9
 HvcV3uVG99u5g5hBkM2cqDH+iBR49+C5w7J8cggwN6aJTaQIbo4j6U5Bva3qvrrW/LhPg6nfz0r
 +HZiUvK8+/HQ2dUyb+fqHwVdKHMb23rqQFhZZ91a/BlrywNsAVReaBaq8AHYxFqfsgFF+eVDsZV
 /pkCUffCiWV4nAqlilaMWN18xs+3QRWPWov4Fe4kDWytTQNLEW1X38xf7jx172Y1XK475ukqbjW
 V+ihkUN+0t/XgJv4PRhS9tuipmEZYT9GTmlAB2s9UKpLDjhkbQkMj1TakuLKVCCvIL7J+cy+Cx5
 4w54xIUbRsap5fMYCNtl7BGgmSRMzwkB6Z59EiSzaPFMR0mzX6eDf0/907py84I391on9JyWaCv
 OJCNSLjM42Fnc1j6c4VN1SUyUoZzxQS/L3runTnLZeq3X01xVmGZoIirThY/+13fzvLEKSQEUwt
 QUlC5rWxTnKt45ENUxO4Fzo/ggEETAMNRlbwySdRssfFU3Yrovc9oK4SO09d9PG8jCuRcXsxFlv
 dn27dCtrVVdhnuLyQE94jW51LlhScO6cFTb2xMZADEEtjhZwS9hEOfAGhtttQXsDmJ/Dbvg+QFx
 Rwtu64OZVJI7ZMg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a562a6f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rtpznyeJ5wwxryUDUUoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1jXPW9Pdw4UETLqZ9JBDNdUKcE8A5bEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX4P7dL8WIe7OQ
 OCke4o49+XZuT4h7Esk8jQUuecLdYlxqF2/SBE1yszkYy7Nh6/9JG0/mDSrd9aamk6HyMyuaZrL
 19WJ5adIupMu+PfIp3vNTDhhH6+tU9nfY5/7H4f9+n/FL1j8b+aved5PZyz3IK/jB33Rh5jUSCU
 OuHPXjaTt9/87c0Yex4RLb22NWyT7PyFPvuep9oWs2ExlJAA9ZCZ77I5vobQnXFXxXoLpZGSEN6
 FKJzdXDV+5JB4Gya+z3llqCdvWSf0uUvCFBpUNAW4eFVhhv0lvBkVTGnZ+tDZ3MDu9j1nRfnOsq
 VGHfMyOi9RkoJR3qoWlg2HJhx6cK3E3SISPpZieQ+K9/b5/xTVQU9MdyLn7N+4hv5jrGr8GJYbG
 Mm2mGdAx1ZMqz0qJgD1ZecZLRmzDSBfoT9liQoh4y16SgdapMvwAmyj+7/G5N4lgN9f+Oycwe5F
 L7pUbiNDcdjzAXRkuvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX/FSe3OSDLyJF
 bYR0GD7RJ+PlG2SMocqISAjXZOrYgZRu+R7kxCWdWX0VtmLB2f2CtETQ5SbqxY8LzWLFzIYUxvP
 KuvhKtfsycPLUSNCSbHFjpF22mwOJ2M=
X-Proofpoint-ORIG-GUID: 1jXPW9Pdw4UETLqZ9JBDNdUKcE8A5bEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129

Document compatible string for the CDSP Peripheral Authentication
Service on the Eliza SoC. It needs a third memory region (DSM) and
the NSP power domain. Rework the schema to accommodate these.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 41 +++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index 99d7337e58ec..3ee7be3304c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,eliza-adsp-pas
+      - qcom,eliza-cdsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -68,6 +69,7 @@ properties:
     items:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
+      - description: DSM Memory region
 
   qcom,smem-states:
     maxItems: 1
@@ -97,7 +99,26 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        memory-region:
+          minItems: 3
+        firmware-name:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-mpss-pas
+            - qcom,milos-wpss-pas
+    then:
       properties:
         memory-region:
           maxItems: 1
@@ -122,6 +143,24 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
   - if:
       properties:
         compatible:

-- 
2.54.0

