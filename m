Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC534B1A7
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542330; cv=none; b=UP6iiDgPUjfXDinnlCHjlUulgAXPq8fo3trULCBQg1+yGVB01oEu2qsClGTXwUXhHHaNPUYiJSpdqevMVriiHmqDs1JcdYMopnsxLKmGUbqYfElltBbXPWMoenPUZV3XW4uEHZ5gA+1S2M6MPXQAM0aUnhmglND97oAb9D8Mnfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542330; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImVzP6F3k74qCBgWJWRkQWtPgy/IiK3OssagmfpsCCXRWqXZJNr5wlugm+x3LFIW0cnAXuzbYo5e1AbPaXpG3u+zL3V7ahU9YTV2oNSlny3NoFb3nxHbOGvk0ITPo75wZPoForK2ZDn9+jRrbBsOpQCd+5fiPVfbp3L/+Vc41do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhuSz7nJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAXpu1FS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhuSz7nJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAXpu1FS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7ZkkQ088528
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=QhuSz7nJq1/8/kZF
	8M6T3pbxeRFBbpm684o1jf3/6WZcJQ+FgNGAhxFXVs5xu7TU01S2ANj8idUPTUtx
	MiPjxtel1RsLktjnkjxNn92X2Du8EZXa7Es6j9x5Y8tC6SDCTcrrB0PIP6c1I3Eg
	DpfBjju5HSdNWBYyP8SJEhfCwKEBVXP7Iap96pRAewnySenXPOQzyQKDGhvFqyid
	23u/y8WXnEmFZIhcs5StOGF03p5Tbn/ftn6JeSpACDQJ+UCZO7XwpRgDf2/cBAnC
	SZu/2pOP674KGT9pcXpgjPFPIXm0VyE2qJQTLpjUOejQx+SLYWUjVnnc55GXQPlx
	TVQMfA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u40grd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso641417b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542328; x=1778147128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=bAXpu1FSdZUj3n78x8KLFM/KyF6yDKvCwjkRjdLQmatyBkEawrkUl32ByHHv/GU7Q7
         u1NV/7eAOdxSvZWOraEjnReTsHldgbzxY1xTqxUlgr9eEXg9zHNJjKV9WgOgCYa9NNX/
         WzkwVdDFeri65rHkP/m8kuil0UxPw8Av45l8q9zm6SHnp6Q+TRm25+gPR1fGi3tlYIaY
         2eojgtTfjUhlHSUjhutqCmHE2eK0VwZvX9jEpQVjy8wT+cXIwSAwuluU6OYVMqpaegMc
         8Rv2/3JAuz0EsAOMHd5k5RZ6K0s5PnvNuishxfz3as5Y5lMoJJNdGJnDWzV9Tv30ZK1D
         72GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542328; x=1778147128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=pnWC3XI9/FtMh4ZdbBuoej7822Sh+WiQ63g73p1ImSvRBrqHrzOGarpFJ3KIcBBARy
         OK9/EODglJTA0CPegeW9Dm2SHLcGmnDbmsQjJ4Afu8V0uoUZiXwspc2+33dy19rxMuqk
         3pkPFk7lGymWZzBgDMhSOUv3+4lK9qR+75Ha88J+nP+Fy3HG+NBW8eVhVqjAU0JYKw8F
         ip5MLpnWdtPLOTUDKfE5g6my7Ca2xjOvogaZTB4bBExwhLvCUvmSF9cR8PN3A4Dj89Tk
         mzIfXpnjH6+afaASJHnJoMT/d2CNNYf6dDWslNpD9lQCoMwUVfvnEtL+UrBfeGLYdbgV
         sPMw==
X-Forwarded-Encrypted: i=1; AFNElJ8xGRJgA9hF/6tYcnIdWTDyUQq+AcBZ2051yW1tePDXqo1SIrzANw5rFr+YaTukEGGcjwskf6T/fPEHRQeyF345@vger.kernel.org
X-Gm-Message-State: AOJu0YzO16iQDjikdKMIUANyrx7F9Lo3LNChKl13RErO9E6KmmpgcJZG
	8gexsbmondGQ9Od7twitcFbRxfnSIQc/R2tsTDdT73lzvgJFYneZaea/dzq7DV64puRcJ2NZbL9
	foFgFUhjBFUNHHq8W1DtlEb8YU26lXf7neG+c3vlLxZWTTHOyl8Y8cdhrWlZVCCnXxNxRvND5
X-Gm-Gg: AeBDieve/Bt8YMgEE3rLv35DW7NkV8QfBCC1PESATfcg5lHnkTgAaKIZaEHXeQViYyw
	vwGc4BBj1k2IdXva7LRjRKwcdPQVM1JzOw2EyZ9dKbCed5d7VmTTNI8dbLf6nj0dIPlSsbBKRIi
	I/SbMJIEwM0jse8qkEg5Yj8XPR6V+P32ltncz4MiJO/UVf4FGZhui5VNeSkiNAkMO2j8/zhP0KU
	U7xhLZyfra5U1pS997WTJ2LhuSE9O9WBZuMffUfDg9LL5XSBO9QLLYKMP//DakhrfZ5zBX4dGE0
	evGQIscw0yuO2iEKePac+25OS6iy47Kzz39/xU1GSsOETOOtwPKFOJfLqdy4tOu9VlKHNYQl0jr
	d85FO5u9Zp9S2VUrKsy+AhyrJhxL3D4wdswFpJSDwe2+a6J9PH4Qs+KafC5hFtg==
X-Received: by 2002:a05:6a00:90a9:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834fdcb93b7mr2542993b3a.37.1777542327737;
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834fdcb93b7mr2542954b3a.37.1777542327293;
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:57 +0530
Subject: [PATCH 2/4] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-2-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=27W/Z2UdW0YDQFgKsxIdINiG+aZwf4yB2XLE43xdXAkye8TFtIT/pdcLRTm/BlTqcM0boivtL
 XA9YeAR0nwsCKG5i0QA/eOy4foCPFgeo1isf8FY/1Jgn0DU30yY+Egv
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f324b8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: WfM1-YsMMWqGMvX3JoAKISwvBzxifKpf
X-Proofpoint-GUID: WfM1-YsMMWqGMvX3JoAKISwvBzxifKpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfXwMaOUgSEAfsQ
 WaI4+aH/eRnJ8YoHKmM8KdIof/GTGA37utxvTY80s/a9+kzjIosblAo9+DnpWTRG+9hsHQ35psA
 RcuTvQbHEu63wttkZedddJ9TcydixY6EpUcuzZd8k6p+8dUwom8yhS7Wje7IMo7VW/Io988ZB8u
 v0icfDvsWigoR6DfZ6RcFWPHX2oxVAHNAHA3D/GKfYQYcMFhH2wO/8rKwdsq8YRGNl5JuwM//4Q
 iKV8++dJsjcW2O+vosonZsbUbwXnyMyeyo+FkbKcUlaYzjUye+6jgzqqGE6w8CKFqxuwyAFAn+n
 ahL/nXdc3VTMdIQiJoKkA8yFTfaixzWk9DWFwfpOJ0RV9eUDfyt2d+bi1u6u44rGbVd2Ui345hX
 nj98M0mAEGelZJuFomOAtYIxaeS/9qJo+k36oT/udtfr1tT+1BBV3d18x3SmjSNsR91Q8Lpc3DD
 c69XdzojmHE3YgtrbgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300096

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1

