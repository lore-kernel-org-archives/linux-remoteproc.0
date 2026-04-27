Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B63EF0B0
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316787; cv=none; b=Lk//BnElo0QpXl42I2S3F5YwsGj2bmNLLvGr6SHUQKXr2eI85/VFLEqBKOvZLrrzXcbY6OcLvnmMu30iI4TRG0iABU2e4cz0qVzK54ORb0F3dza8sl0pOX3y91xLzOlFL3kHvCTWeo4z02u6cGYz5jkPhAMnqVn1h8yc4Q++Fkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316787; c=relaxed/simple;
	bh=QKU4OfXa0TOEBsC5JX3T4fZUwzwDcxMp3Mj/5ntsANk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9Bjk8in26motxqa8NzuAhceMNb5KZBJJKtYsm4th2INtnbm2ki0I273AjVgy74DnjzTf6dJaEn2TQf+MDPkvUdPzWsWQGdbYpZmRq7bNmrMDT2U8iSNPM8OOAXjF/slA0slk79t/Rxifm3ccwo12Os2JvW7KT7JQUUPLGjbvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkXOJC3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cao7hLRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkXOJC3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cao7hLRS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtfPf241204
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2
	pqDdD6Vk=; b=CkXOJC3ScnF1b6LvFD42qEMRXarm4bMQiX1VBn3nxTl13qlBk/c
	7gHn5nB/HzOA0ZAk2J6coKiWslajHQRFBN31gNhiLFRUc4a8W+S9nybpBQg/p1TD
	dxjALWh1APriYDwW0kbD8E7vBFBQ6Wfkxv3vtXqCN2zXIfOPo34jCG5OydGLCmY4
	RQXA/9by5lQdoUerMegcna/AYFCiXY0yEvNy6BcTnum61ozqEUhg4Fu6E/77a27d
	cLSDnhDKYMdm4wfUvWvntV+9J9nkmORta4L7VL0b+tMC18afYj2OUL2yNvwKJP+C
	2E0XvIFYbRDPOcSjo/L6fqc1tpZJlBMtKZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946s69b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so110321555ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316784; x=1777921584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=cao7hLRSFIq9WFBOwOaoGeb2HgL2rMuTcV8m46IBj6FhvdFJQPrQ2s7WOn83l/DKCF
         0dvsgM6GALYCTN2BudKuna4qJnQvwD2ETBt2HUu4o797oCYQPfrZLLeL6yAw3FmkeEMV
         mHsgewTE0iJ2KTzT+LzNgkeSKW0eBaHYIZ+TC2nl8LPWZkI4biVxa+JG5KTDWdAg4Jr4
         vICOtdNVOtzGXluR8gKqpe1YMLYzzKTtjcdPHvxu6Rm4Tox7GLHlz3/LkzdHtoVIgtd/
         +HFPd/oNBVP+vfvwzCZ5W75z86v2CkeU8C4Nf9a61xdfLkzukXsLGwvPckKJlG1wWOCN
         aAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316784; x=1777921584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=Cc1CzS0Vtid8i397I1tcfBvYMZj505LKYaH0OTz/fNGjSSfOkhR4QtV2pffi0icuuM
         it3sV9pMb5fHRWKMMGBwjUsZwWTjbQxKkyfIoGiHZ82uSIhhQLJV4anIOrMASot6jq7i
         llbCl4ufMBNzQpLFRTVQU6oyYaSc5j4DWjmgN27zusa2FQtXPaCNvOp66nTahBZ3tLb1
         J/sWwDmkldfHtPF21vd0wjc93FTJP0izLoKB99sLv6s7HL3Gi61RvN/rpIJKjOOfzt1U
         cMYo+/IQ5RI4hUKRzKtGoFDe8iO5Lh3IiIPeTwSYzzkrsr2NEsSfvIAn7OmPlBWiQCn0
         nl3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2Rew6qCDmldDK4VPLzk156xGJKhXYIRYAVZlphAROQ68sBIdxxUBFR69dAKeRwype9PU65mkm4a4As6EKaeAN@vger.kernel.org
X-Gm-Message-State: AOJu0YzTq7rcAOYAOSHDRPrujowWxHrUQkejvX5TaiR22ab3LGXkM0VY
	SJFE5E20+vBLk+oDg2DqhFXZMTGnj7uqkUpT5kkRQ4CTz63SlMiSDgJd1tx6ETo/T93khJDg+Jw
	hpprNblgPnQsGjdPlwzkiHjDb+vNnCZhxZ5zTvTQ45gfY5rxg3hPz+hciPWm1MCexEqAkJ9DT
X-Gm-Gg: AeBDiev0OP7dG1NAcEHDGcywzDchhssti2L6tyHqiOz4Y5rpWgPLC1QEdpeAZx3YWCO
	7Sw8qX7cmonipkkYT5ty2+ZCxqrl4NZnQer7UD+4VvniH7EcMvIGlIDvD4jt4wD19kH3bVaT0v+
	76cDVUvAjVChPdcNpiLreF8xioem3uBJ0HHNw+S85loOrdZMEFqBDS8qaO+LaQ4qEq9WVFRAzmP
	MDDk5Zlu07/9wF30SW+qiDsiP43G4STCW8EYLOy5vp08Xy68SPIA/KPC2/9JruD5q7/FrgzzX3T
	CQXEebhHuxR0NOaBjquIMhxLzuOmbRdalhiKF2PpDlKTI+HQn2iKN9Ri4HjMFko75LnTjDGW8go
	Uym2lsm6wcvHkO6S3wZ+QqmV0uSWWnUJuabjmJhe9m1yMPK2Dz/xPKNg+Oz4=
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291110a91.15.1777316784147;
        Mon, 27 Apr 2026 12:06:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291071a91.15.1777316783547;
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
Date: Tue, 28 Apr 2026 00:36:13 +0530
Message-ID: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efb3b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: y_65rXAPyBBJKhqwebSk8u4U4kJNDUjm
X-Proofpoint-ORIG-GUID: y_65rXAPyBBJKhqwebSk8u4U4kJNDUjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfXxVK/5g7eOkzT
 S58oJd0Wv6iUlV7mNHOOlj+jY9mr736n4kUJN7heJQgo8505h8TGl6DAiZhVNrowU4f8FCdj22E
 cTYkkqkxUswAtoIB0aqjPzTjiRi//QEiyfFMEAvh9EGMlKBRdfBIcYNKfogoOJEWf96jIUokFRv
 iy+NZqSaRPXzhhBGMwu8lStz6StdDgj+f9gRjoiZfRZ1kaWSfF1PMUZV42j1YZGCNcPvVHkloj1
 Yqm/NUfowLbdwyaebySUT6uxExZDuivWr/5SYcz7Z4xy7UvR7hU+7H6bu0hapW8NfXQg9xWFO01
 U5WqeJtiOFdhugXH76hqn4DNHmZ2H/WgsiyZswefukjGcp7A64MdVaGx7g+bBNmT8IN+hTqN9OJ
 K3zouIppYe9G0myaZL2CkJqUWa+s52GdOrg3xxEDB9V90bngj8BhJseOjjkUWJh/vLpr+IycvdY
 GdQr73Gam/0B1MfRutw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270204

Document compatible string for the ADSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
ADSP PAS and can fallback to SM8550 except for the one additional
interrupt ("shutdown-ack").

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..161e9b55cb3e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-adsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -104,6 +105,7 @@ allOf:
             enum:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0

