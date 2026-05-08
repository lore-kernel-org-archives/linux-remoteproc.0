Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D3E3CCFD0
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236868; cv=none; b=QI46fWyItnMb/qkK5oLQJV07geUT+6ZAJ6zdJNqmzfy+gzkai+FOcIF2BZPqmCwWLuFfk0YgByIngdhHghqTiu3RXyQmiDn+GJkj9wJugtTgy+1FbeoQ/4C95DSDibpcUk0yqwTQ5LzyGfn8CEt7iWkC3/MnJfc5d0n66lh6lbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236868; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCfujDlaYczAf8zKmYNPwv4sfsIz1T623pwMOQXNoRGIvwgd36bv9SIhVqVPzBjQe/XZpbOH/4S/G9kCAOXn+Hp60XWZwWA7s/vkZ/OWTQMc9pQsNP+hEWINX3v3UEM4PuXe0NbvKD96W+lDNRShYxWLKmjmV+cGfB13NEWGWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDASKGiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QCRXz84R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDASKGiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCRXz84R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486GbQc1174218
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 10:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=CDASKGiH/yTIM4Rd
	uI6BKBUjExTo43GrD2J0i70eQWpX4dbhYzqnUdntXXFeYSGA37MuQAb7qcI8ol1K
	jvp/9/AkISc8eCtLQogfZjDMwK2rQm1PeTlwTijjkG1BfKzMYGBD7XGWIIvapY3u
	gfo7j5KYs6bCOwBq7A9Mshh2oSnn3/+UpSvWISb9cMuSDNmXAsHKS8qC4t9MFAxu
	6EB3CUGp4liYgwnPx3Je3ssWUHH5MoMt9mBhpgm069StUooZkoYaK/g2Db1huyS+
	vyx5IYlRMZFI5k/ho3xdmQ/Stxr1KRF15A51ulFZv0N+oqfrtvURfsYR5N4KGg/y
	sYhZtg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hafrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 10:41:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so24934215ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236865; x=1778841665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=QCRXz84R1tRJ3QoaawiRHSxraYDXnBjpvpSnUhYqRkCtLHRgjbARtlMZ0GxxCQMMSY
         cT+Mvi4hFcyxJJ8JFDoUzdKaSuifGeBsdeVGZiRl5VS4YWUMgosCQ/rNwEX9IHSpSD4m
         EGLNKfLKzY5szRCEaFPox6rS4oH9l1MrFqip/1nTuFgkiKv6WH6exw+Uq0jZ+zTPCNmx
         H401wI+7cuG219q9TOTOD4euUu5Rk4GRvPsW/kivNT/nLXe0Pv3ZW46NZXukgPGBvag4
         km1g6bn1rEYP5p3zg7j4sI2H9NRejbjb6/1ovWqlkYNmhkTYNnLGzoejtgE8sohz3X3L
         bprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236865; x=1778841665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=NCIYP9QFIjpeXrQmIGuIPeoG6AFicqewNI53O1THt6KS4Z4f2DZCM0hr8rWqT1zVMy
         SWQjAgrIOHkaGBOoeoEEiuwWnERqHQCXJVsqAhZH1BAV0udzrLvXsRO+5PmjIlIPc1Az
         U9ZOsgPJd5Z9EaoJWPkYn0jkKzGrO6+TKmLGw+XhSYnm/EtL+eklxb2mLjmlvSYtRxpj
         K3FbHqzoAFO5jhDdfJqz16ns+sZgjmBEWCPv8gZ55vYmLRm8QKCE/fN/jLVSJ/5TGPuf
         m05XeRNmo1fuKjZR7w1oBK5vAP3/eG40ogOBZGcprbqHHzEPQfYar/98PfORjyTCcMSg
         EYXA==
X-Forwarded-Encrypted: i=1; AFNElJ/rS+BgeubixSqgVNjDOAnRIN2WmQJD4v2SEDsxTLF43Fr98Xl17SQKHy5lYfWFxjeeAAUWD20SPuRKbZI/T12Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxYS1cb6cy6Vj3Ln4Sqb+/oNNqUKjvHvKmP6znbd+W4iAR0gooI
	TpSd5hefZkRiNR3cFRHMy76t8arlTm+VGmayKLITzf8a93PGT8pZXRn/D8HZbzmYE/BgyJBJrEX
	ENh140WCLxey8EwfK4pSclbH6guQu6fdkSIhs74jyZFFkOjTdYSNuVCGCUOTym+Wc326thqICQV
	58KZ2i
X-Gm-Gg: Acq92OECFosqb5AKouvJtQ+61Guu0SBtpBQDONSKudxmpN1gdhj9Itc8EI84L48ekn0
	N7E6teZ9LC1zcff0vTBJnepcHuStARBxAAvkS2juW/ek9OrIxpaGB8hCWjjmD8A0UpFDKdbpGpd
	eOFNoFwCH9CKXBedngYUNckh/mvWd2wHiI5KtUgrWsadDYc4Io7ybL10aJ9sTB5j3Nxr9r6coq8
	yA7QFczYGaOumZZmdtgpWak884pYvN2KWGPTkxThwyO0TVpluK4VvjgKS7IZpAoCIYC6iZ4O+yh
	iXFCTpdGI+4MlNNctTPsJw0JjuMDLsqbFUJlf4rdhCBRdROJoBg8ds1pPfdJ8AvoRFGeGpvcuIx
	LLRA2OFxPaXZvrKE1FzexY1TpP7tyhdUdkrZNDX21gotWhg2krNw=
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr125284735ad.37.1778236865189;
        Fri, 08 May 2026 03:41:05 -0700 (PDT)
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr125284505ad.37.1778236864680;
        Fri, 08 May 2026 03:41:04 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:04 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:46 +0530
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=U2a4dLYSXAvarX/C8jN5yEh68RcqOmZMofFLwdvwHMuR2pcZ1nNq7RGk/EUN7ufyXvH1cI6Yj
 CuQHzWAzmFmAICmEUJTE3JEiNw9R5AYIldY147y1lf+xfpMO4j+j9Z1
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfXw+we08AykMFs
 Pcwvglif9VctzBhGrIYfFe7qWIStnELwy4cAD7qf1YGfyG3W7DhOwFZVfvB16iGXC56Oeot/hQr
 atj8Iu2//VYjh3C697xcC1N70tlNaLttpgSPSyXn10+FyLkbMi51soZ05iYsvp1thYqFIhuPK7r
 2zwLHlM/sLTb3KKlDD0Clhtd47zVsi8qaEg2owiD1lCyeCH6qtqUniuwm62pbjN7/1UN62y620A
 w+uKouj74UooMS1rErbNO2rqaJFePwd9xC0WYzS38AYnfbjMWU+sJcQ3cKNwbNw2lxo8cuJSeJO
 PzXl1Gz1wq5WAzEFDArBmn3NQTi5Ox9prZ+tUGbY9cjEh2wi/SoQF6FTSgnrCWfnkOl3D4CXjBL
 pq3aPzG8KhbCySmrhCbAJsshoAP2KCqhPYhK+Vc4gVONtyxGr00LQcOtV0Oc7OpcgWCQplr3VVL
 GoHIWFBP4Hhwm5j7jqA==
X-Proofpoint-ORIG-GUID: uNGxKxbThoMvmDrl1o2NtN29v_0K8-8y
X-Proofpoint-GUID: uNGxKxbThoMvmDrl1o2NtN29v_0K8-8y
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdbdc2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080110

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1

