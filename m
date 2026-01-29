Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03512A1BF
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645663; cv=none; b=WWg0orELyjFOYEBNfqrIbH5VzXw5rTgn3c9sSueuKsrtrc7xWc5rlk/ees/uR1/mzQmfsZSF18vUd888aYDfx9vFBewpWN9/QQqPV7lb01xcVLCrRDBx+ic61VPYzsi/XnIoI3Ky6O7jlueLigo7LsrMh11UCfbsjb1+kD5Q5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645663; c=relaxed/simple;
	bh=McOFs17KMBE80Kx1yQ7dtWDsgmcWE2xvIe4QDqWpGkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caO5GLm7PacjcCG2NVIszj6+O0X4p6lt5kcckqRl9PbXIiFG93Pv7y/pg4k+PkOV6RSp3MsShQ+2BgXI6iv4Ek9sMic3+dWyXJR+etHNoL2LHdhXgIennUM9gC/69e3qoyYjj9dbj3qeCtoxrqOboAKflll/cYlVZ7z5cYLtnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDK1j6AZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg0F+2BB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDK1j6AZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bg0F+2BB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SK9osY1814823
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bjsGqclSC5A
	+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=; b=lDK1j6AZAfcF+jPtTCC8DHVIBey
	oPUMg9iJ+feo3ZUUK5Y2q+4TMe20kg4C9h6iPAZY13621rQYAGNuUoloXm21EQzm
	oJXIfEIvNQJ6XB971/aXhmIEIyhm7F900QNUG8ZDSTrpun3kFPSxTKX/8dKqPydf
	9M0SK8xvaepfDt/aPGIR5hn5iwWcJeZ3qtI4BKH0tqDGUVYXgl6NWZXh2GEiRc9R
	86m5deWZ44jmUM/m2b3jgj9G9zsEy8LRIDYRefAK5L8elmmPM7tKW32sZ076SC3l
	IxO2dAKU5ZHp61jC7N6096+msNfhbsRqoR6NrlNexGHOsyHQqa9hE0bDF/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgh52a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so4667125ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 16:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645660; x=1770250460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=Bg0F+2BByyWaF9tWwSYWBKOX6E/Bg2Y7j45IEwNKW7Php8XNDDBrXrCdii8l7S2tzG
         zP+dgGxvWxBaMxayyQF3oYVSNU18xTm09nYiouFVXj1xYefAJewIFVz8TCfads+UWjnw
         VdTnl2nJlSPuvVagdyoCVh2GfNwSje7Ahv6TOwjCDbvpq8mVyYbP5uCJmOQBwvI14RG7
         1YPPXtSm4Zj+eiOZ2VD4NPxReivFVlrB+Sa5h2CNho5L87/q8Wc/8nkNJv9KQMBTs+48
         CNhx5ErSxsmRE+YHaQkWdUR05Jb7vSAc/9lOCaf0biC/wqLwSGSR6b67erOtWRpGsXKA
         3esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645660; x=1770250460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=EJgKXwClvAEXaz+4ucgCJt8RxUtOFxCIHBv0GrETe6TckHnG5vrkIyB+LvAMUrkQAZ
         H5ZTuoUve7wYimizy5DASA4U/8kfVdRYt07Q5/iQDi8w76np5EAfmwTDa+GS5NFmsU18
         opQVlfrhaxMAwQyB+C58ebU5oeFTnCVVTvgmVKaLGdEJ3tfPwH+YT5Axv8CXvbnQvzYy
         1V12Yy8iF+UyNcrp6IJdUUq5TWx+qvXSY6BV/nENyoKlNvkq9gWY6PhInslSbLvAhWK2
         Eta0zRRPcqei36gtaJlnNUPfddeEt3ASWaWt2R9bQcdC7/OhR2OzyERYj78zrg1fDuu4
         IfDw==
X-Forwarded-Encrypted: i=1; AJvYcCXNEza7T7hKx1eie5rHA5uBB2kn8GL8LGRlSoNGgmjcPRsS2zAMpnmmZPtwvzlu9ZuZj3OsrLoglFRl1L9JobdL@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3C0Sj3lS4gYPdgnIfrc1lkMOx+CaES2bk68u36+UtRlXWP1n
	/HgTNoqw0Rrzx6gn2PN48npeluvxwJyISNlzM6NLYbDH7EFJe/UqP1SdRQb1HMFoaXehLvBsAF7
	YldkZNZ36huLlwuzvJDLBkCUJmzwDWyHRg0ZOslA4I4ZXjpmO9dZpQ95HFWSADlIAsgCRrz/u
X-Gm-Gg: AZuq6aI6bYdETTUGmK7h0a/vmvFGTbBo90+JPHzaY+NqMaMbLu75lbPhBf1q39F0RQr
	WN/k8KOGYsBO93z0V8ZRMLEQnN1TOKpImux0NoBbv7sSC7RQIZvlqVJ0q41VoBH8HnkBype3gs+
	PGyRMAfzZbYJQH9Xc9/NrntyHZYmzt8+zxpXx/iG4WTH1P8EAslgOtxPcBUCG9YVMKV1h6jCV0u
	CwBC9gK9zr5TnSDI206iWCcGsgjyg1kXHo8K13czSFG2qt6wdnp3UincEGufmPz9SEVu/fnX5uR
	CDrXQphpMXJOWSaakrkOMXCRUEA7qxawyx2MBN7uxDABlMlIFM7rkjpasXpgmtOCYDR+scnRSYa
	9MZcIsB50vjcK3beQ0Znw2UaJI6SjgcjnU9TN7cDuRq9P5A8j9N5/EmBlJdQgato82v9am1iYPE
	luvWB8dJftOuThnB/2tBHGQdZZ
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2a870d2a07dmr71197395ad.5.1769645659952;
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2a870d2a07dmr71197145ad.5.1769645659464;
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:19 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Thu, 29 Jan 2026 05:43:56 +0530
Message-Id: <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KArglx6Qe0AqsBplV8ce0fIgiygwXnKo
X-Proofpoint-GUID: KArglx6Qe0AqsBplV8ce0fIgiygwXnKo
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aa65c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eu9c2-cO-uz-pbzhnSkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX0SLqrJwlh8/d
 Fs/ebXBCbAmzA4nswAit7mm5/ZM6n15VQNa7KY7hsbTb5tO4yr6Y6IHxidDMHACJ25zIEVw+X4m
 Ms93ReqaIHhTiE1zysX6ZLG33MvkxriZwM1CHCxVCY2qaRYiu+qdN5qMC3mKvJF+OIdWfKQM71R
 sDLh7EhNsIeTT0L6P2QUoNYpReCr7OaGxtQu/HD1D0SYFHl5slwmAizbUW2NGjI1dfsEUyFkRdm
 HVeI1j5UIwegp2tac1JNWOZrXCi9UBz06ld5oVA9KjBWsv/NaeKCFuGeBSX63yE/t1GqbRQgNtp
 X9Nh+l64zCRGTdZEonoboj3NoNPEaNQN1SelU/fuJ0EzeEwbXxRKcq5TqwVc7ffNm7udmdlghCa
 KPRsgif4oKDh1LgFXL8y36WZ4PusXa36SqQmsnT204fdsO0F1gFBWVCybtRVtBiNnO37zy7Q5Gs
 aR5TmCPVmWutOxWfYsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1

