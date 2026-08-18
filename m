Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF83C0610
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042117; cv=none; b=lhc+L3s7WLd4YC4jt6gHWDsvwAaVrADLdqhdxA2jCsqPPNxGZhFGUrja7jT6K+VGxRY/tqdbqu7yUpDDqruMjDLzrnJFCoaxOB/1X7+D6rAViLLOUZQveswtIIxU3mfVRx7LEna3g9FmltjtTGgvr1llZzTeMVVxNiIU9TR9Z74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042117; c=relaxed/simple;
	bh=Iz66LCZo5fXFALDvKKx2Nhqu8/6To4QgfSJrxKaluhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNix5oJVU0EKpH7nlADHtIGDxU8vMEMFpvSna6K+DnffRu2e7szjLGcuqQ4VOKs1D4/kqCFCvl8wmxQnhvotpvyBeXruOcGkrpH6p/lAPcJ/RPwHMLeM3HeCkorM1h46JfQ0x+IjQCL471C2bkKb5sOkKeI7uwAAsQaboRRSgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+plavQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaUugGNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+plavQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaUugGNS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BavE645670
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 08:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCi
	rU5Wancs=; b=W+plavQQoWT96rna1+z1ima+9SWS7KhF+sRghvJb5qZMF15nXKE
	M4XFv9ZY2rJ7D2m8Nx5dsK5p3SxJCo6tmdedj49PgbwCdDbHrcJU/3sxL/7Z7wyR
	+sJshxfDAX8IjAslKMNV2WfbFpKxNIa1XlgldQ87GZJaLWoK3YKnaF/bapY3izKz
	tb8q3d7tZ1UiE3oWhtUjxePV600lE7yTolWmWLCrDPaCeFo5L/36kGHTK+uXBZxj
	wAdq+wIJ1naEcgn4hNEW9yiTSBdqXYw3o5Kxo8MnBRqKKZSToqESis3EGxF3cx6l
	DWDIWlkzjylTm6a6dYo39WBNjASW9DveeKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bkdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 08:35:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d9cef8d15so923951cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 01:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787042114; x=1787646914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCirU5Wancs=;
        b=VaUugGNSup5jdBVnjJwNwojxtv3H/KhVpycV3FYG7G2F08Uwubbi2rCvrPD+NrTZ3a
         cluqoegwbuKu3JsAOQZ+ZMlLvbDsVN5EKQM9Do2aqaN3Mjp7xNzt9qd0GJnAcz+kxFC7
         eFfH/2Qpy1tkq3Fjfz4UuPhzTJ0aXdrSk/O8+0LoayrDBFJK6eOLwh2534X/1/Sc+Qpv
         ypfz1sI7o3qqt/gcywn55jkq7lBVT9j73/QNbStkEGYt7Oad1s7E2OKutAlT/6tnqTBy
         vj3t4awZXpy7FclY28hmHB12Nu6jwXUAy/EiXL0lNXBCPVsehYIeXmYtsuddjpce3UUQ
         aLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042114; x=1787646914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCirU5Wancs=;
        b=tHT+DkUDSgGJMkHOE3mzyWKxMgNiOSxrpj7fPXrbuGE0XQW3EC+ek3PmPT0tUV8BI5
         waOENX4I09jBfZKQIiW3w9A30NKhxk/h6kx7AMvngngiYQTHkWXYfNIMmzWrK0Wu4X47
         bRWLxbGAvlSNmfSO+vC5cYR5Dyk0DQLqb/6lzvKcnwpGW3/AGIzfm3MV0syj/W5vXrPp
         a17/Dign7JANiwu7bkeMyRQS8wLBld1t0vG10HOBLnkh8N3mgdn4+vMNoWZtbO2SKETn
         9JWSL3k/YB3HtxKvOvfIGRZKPRgKpmHPqKttMQdQN52kF6eMjqycUuAD4s9xK+0jyHDP
         Foqw==
X-Forwarded-Encrypted: i=1; AHgh+RpvJG4s87KpVorrGa69FdY9oob0HRfdPQ90jpHjKNmAbiXhCM2lTAYF54NT3fPCmfoLmIbM1BlXJ3bHJloLgc7D@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHlrXUVp9poGSDDU3m78mMsvyUtztDvtnQ85neXBhu2HJ5of7
	JJXiElXZ1vszSE7HMsqgk407g5Xy707whd1++7TCxqZ7x3T3AmHMvm1ZxD/IhSf1xjRwmWZ73uA
	zrKjthq2rSK+3ZrLNwxovuZWp1aenROKPA2ITlbVt30rxSIPUqMQxw5iSTkeSq2Rgvy6WCg62
X-Gm-Gg: AR+sD10huxZoufoidACq+QwRTarbE0ZmubnnBsx9s2G8VBNZF71O6UKCrL8VgMh0Mf4
	UCEekW/U1rHjGmLJxduwK7C+PjYC3dDeV6RxsbA5p4/IG3aguFYP9/m0EFQ0BeZG8R9uIDixKBx
	0ct6R958lbkDFX6CVUoEDAKhduR2pZGECvCZ9zeiyETK6C6QB9Fa8HiMJcOSOStjg+q9OdQh1EX
	7LG1E96k/H/jhakMXLQ325jiKiZ2IAK0vePYj+D2h/qgLvYVjSgcT6M7ejrKBO12GoMTXJ0KUCr
	GDJPAWBERNX+w/T7NQQ06cx4msV3qBhhW7IAxxi5vd49WaDjblG174NFXLNJtiV8p96YVTeLAGe
	c1anShQqJLZFJIiA=
X-Received: by 2002:a05:622a:903:b0:52d:6de2:906c with SMTP id d75a77b69052e-52d85347cd2mr352959371cf.14.1787042114173;
        Tue, 18 Aug 2026 01:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:52d:6de2:906c with SMTP id d75a77b69052e-52d85347cd2mr352959081cf.14.1787042113827;
        Tue, 18 Aug 2026 01:35:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0788dasm97850305e9.4.2026.08.18.01.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:35:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Bhargav Joshi <j.bhargav.u@gmail.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: ti,am3352-wkup-m3: Drop redundant reset-names dependency
Date: Tue, 18 Aug 2026 10:35:07 +0200
Message-ID: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Iz66LCZo5fXFALDvKKx2Nhqu8/6To4QgfSJrxKaluhQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqhBk6Dcet3CpFINyjckBxL+eikCTu5L6LngX+R
 +z3/g0fWzuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaoQZOgAKCRDBN2bmhouD
 1z9KD/wMxwFpvwqGnaTS/Y8R1ixVFa9rPTLHXVwRnMHwdjxg1PSnaNG7eqoGTgc3JfjHyTRC4dc
 d4U1coWqUIKHDDd+qvN9N+XLBgnVwAmN+irkZESl2RVvsaXfZIuukZJRRLXaIzYP3ti2LIP1n1Y
 mKKzqPD0H3mgT35SF5bsS8DmlCFT0eX1fd9MotX3xr0gclnTyNDba8z/WxaQoOTP20O4n6UchwM
 PUh9zLZyyqdmwdv9gezYMorZSQabKpryaGz04ddnR+26VmgVVmggfw1GCikjaQ6EiMARSTSuVSN
 rZ05Qud+9VCeUcC/3dflbOU4OpQlJ75dcJGBV5BMhWvRrHrHFufjVXnDf+h7UV7QRWYIoP8MXTl
 PR5cJEX6wBAbyeqgO1k0TQv2+oy4ggRgnQxj7LiSIRr/DQtzuxJBf/8EHI8gdEGTIZHqaxrSTIC
 HKnu9aWU9umkISy5Ecoc5Dl+Shzq8dvm194TnVkyk3GDTriRdBW4jGkxrUJB0nxUjnQuplmnihb
 XSClUds+RprEqBGK+gzaMb7TuHCwN0BrjLSJouwKJVHzPCvh6PSwQ2MDGPUm55z0MJq5E3u3779
 THcydpnW9+fw7YjWITUjYhWrujr/wWrzvftI9Vj4ZGma7mvIU9Mc0dbHMhTCHBOgW5TNQcLzqGs vOCrrkKj37hkw/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X90RxQuwnXrC8tWgiw-DFkxBERyl3Omp
X-Proofpoint-ORIG-GUID: X90RxQuwnXrC8tWgiw-DFkxBERyl3Omp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MiBTYWx0ZWRfX8eZBNtkQdhTH
 L4QULUEVP35WoN7deTEisXMSgXbzhEpu7Z7qhGoU5QHooXVtpLnvhH5T8RJmRYRxDCYE7omfxNy
 s6eGOOoEjnY+sujKRmY/E7J3HZ4FfpQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MiBTYWx0ZWRfX1o8kTEfC0QDR
 OTr/PKkfJ6C00BWOtJ4HLzWQJC847+tfb5AjBfQqMDca3q3h8nnBUftCcLRA2axjI1Zw5hO3mvD
 Tj4X7/798gb6w/i/TGkkDvIyKYm951g7pqbh0KnSTO0todWRgaTGzQJlWRTIHQG1kFaUIUrW/DQ
 GnGx9zztukAXEOIWf9IsNAMRvjl3sELOiksqN49u1Lsl1lOr2z3fbWscccsfCaR1tU2+h+2b27q
 pvk86qzA1+jvQ1Q0ZpPi3vzYpRf0n9+JTzk8W9IlqHGgVj4mhwVegf8xrr7oq7lh/bjROgjaZiL
 M3TxmsE41HLsB6hpoOuG/qHoKBQEdZzcVH2BJeF3n0AeXTNBK419Db2bNL7xCZR3SVTZ8MX5Lg2
 a06v5y1B957YfudjXqCjv7vE2JVWOoKBogyNzcDheOg1xrEZyOQ1ExSnKZ/co50IZWNuwqmPau+
 AjHOsSEqvI7QwqUassA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841942 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=J0PaZF-mWyMKA4pKr4wA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180062

Core schema already defines dependency of reset-names on resets, thus
code here is duplicated.  The only meaningful new dependency is reversed
one - resets depending on presence of reset-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
index 9e8a03acdec4..997be06ceeb1 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
@@ -62,7 +62,6 @@ required:
 
 dependencies:
   resets: [reset-names]
-  reset-names: [resets]
 
 additionalProperties: false
 
-- 
2.53.0

