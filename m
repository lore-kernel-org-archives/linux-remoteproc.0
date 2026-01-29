Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC431E515
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645650; cv=none; b=A3utQkWIVAu9+7JxZbw4sjZF008T+PAXUKcY93oc3Lt+6z/b0kp0lQ4Cx+iXx5U6qTwc9bTUZT4JbOEtfhzM2+6SF4EuZJs6rP8VIT9R25Icjrx+dC3npG8aY1evm7DnC8U9pb4wvGbMoamRAcZ4gfhaw0QLynlUPltr92kM00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645650; c=relaxed/simple;
	bh=Yn9GnVFARTtOb+gTPpOPbL5DgHWPTr5fVOvoHLT0PE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E15swx67EXF9lQo3W7UuJzTQ15XQh9wJ9FZLU9RHzM+Jq8g6vnBYLrP/TqnHK2YJDd+zZSpoWM3fc7D75kAoA/aL4t3wApVoqDXn3rc/fbuYYJ2hfmJlQx2FauANKCx3tcuF8PJaX4Eu/8Pqoe99PZgiA0R4vSnfSJBQaIMNHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwNuhMGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTYBI5VE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwNuhMGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTYBI5VE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFYviC3247497
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXo
	q3terDfY=; b=cwNuhMGqGY/GJsGjgp2ZHUINKl8KeinNXvnQVb67zVpri72x46B
	TCTmFQC0JbqzriCBk6ueFwFt7w60rHrbsBPQdT1O6bJKMD+gYbrJ1Y/ziSG/0cv/
	oSrNzg1/DHYH5/cRxj0Vw35CaGocHdUqkRQTt/YZa6CKpo68NQaEpH57Y3MCl/sQ
	GJdVxKMyYNAaTfCzVvFErrS8DAEFJ4W2NhkCCMbGVe6RIJodJunmhhpahoWJXd5P
	nwrSXXPlpY/SE3DLs0Qm3rijeR9njLk42OhQ7oqFJyQ7Ui394qT+UFc3EkFYZin6
	z0k4gC/IuxXFLHM8fF9A5GHqfyotflDvCmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk3er2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7701b6328so8235725ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645647; x=1770250447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXoq3terDfY=;
        b=MTYBI5VEErK/yOMiG61/aReJ0ejzUDRUu7Zhxha3L14aLyYQarxNIIwGvlfcZ9FgIC
         XyDEIzyYETrrOQMtpOpJNJTCPcTwMKnWm0bJ14jiy9Kdrn7SqwEm5fzHiNKE9Z4FfCDE
         0RGsGCWZYAMR3o1BOsy3rKqVI/DDKP6Q2w6WbT8uffu2ZvPO6Erke4yacb0YK9rYb26z
         yi2l8C5+jTkn3c/7hRwXSHkwgV5Jmi4hm71DRDwvW0nzXdejkHR4fgwKJb8eXZZRezn8
         RPGtUPR64P9vkgaGLusVLEzO7kRkF+CTbGL5B82fQcQJtU5dTqGePRz2rw+LOBcl6s7R
         xJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645647; x=1770250447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXoq3terDfY=;
        b=KQspN7RIqrT6+pv64IjPS8B/JXegy0AqoGJCMHv0HwIdWVeNfV66LraXv8fs5bn6mS
         nfGvrW7TCBuv06dBzi9yyu1/8aVLSN5uF4PW+5wF6acpP5aumfhggaD4qDmkjmSTCoaB
         u32MezD9k0lTFmFg6EOlaY5+uf7+bwbz3NECfhjbKmLvsGoPYVf/9qzz7oZajuQafvVI
         yKD/pxZA7TdA5jo4p2Yv2F39BWPC0l8za8wgmaMzvUzhRcZdjdtGmx96SwJDIMQfFukW
         uGd6ugbCfT8VAV8NSbCT/4Ik0YZUwK8eq51m+aXCpwJHRQeqLkQMsMS11dFwtsf0W/2T
         dipQ==
X-Forwarded-Encrypted: i=1; AJvYcCUStT4Q7nzXXXFEWPYuCvukGmF2f7kVH1LLEcOBvWjwjKcCn1vvhebjwCaBPLyOjNTZDHCMT4ZuItzBTsfjRBsz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7ck5jPWe4QI0nchI49N4Whp/xDadNdvIyIer7Vy5B/lEcNs2
	cETr3Q+O4ALVk4cEh1oPDPVzoM42xl+ShpZonObcHqKH+moAeXNQ5jx04Go2ME0LP0x+54u05HN
	eNLFSTsFYjdOfckpmFaTvPJcstNsD2Hp+3lTuCsVvq5uaM9T9GSlS9CN+n/tFDhlb42YIazgq
X-Gm-Gg: AZuq6aLXn0Q4+KdvJkHe9ZuhMskEMm/u87UNCCwbyDOC4SbGfazDYTETikmA3bIyvOt
	kLsx8T/38g95weZ3KGIInvk0jnO0lfe2QSlX1ameVLtgHpeNJaN2e4HAsa815S3aGlpN7bKjuIl
	SUM4XSbOsFyMM4+Z10854Ohad1Eneugojb+cZJ0ls8o7QUep/2DVS0qIHNOy9u6pmi9ieKfIuCb
	8Z+xMkof7zaam3SBfGWkDGSEJHKlS0V/lt+BqYREA3+lNqJ79UxVbhOPXDWNrY/aWGAM30CsZC0
	W0667NamS08ZcOhszyl0OV3mVNOaI2bk0P30UENpefdL0tRr5zcvi5vBa1A65X3e2Azy7eAwuEV
	h41fPAUMfA1tuSHuiw1+UfPhQ9irC7XambpYPjGHP/QOmY68EPCRr31yg1ukcvijpBhI2mJrYPP
	wpwkkVihNcwfACtb4whcLqii2B
X-Received: by 2002:a17:903:388e:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a870d7a04fmr67566575ad.1.1769645647057;
        Wed, 28 Jan 2026 16:14:07 -0800 (PST)
X-Received: by 2002:a17:903:388e:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a870d7a04fmr67566345ad.1.1769645646637;
        Wed, 28 Jan 2026 16:14:06 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:06 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Thu, 29 Jan 2026 05:43:53 +0530
Message-Id: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX1uhiH8UahOuX
 jVzIgR8mJkFqHU7JiHfpeE9rqIEslEJcALq8dGqxrFma1y4zVWnlj6AoPiLVv+IeSr5FrSVs/6O
 JWWarL7nafYw2p0ABsdzHtaexN0VTsS1EuJ8qMnc59stm4c7dMhQiPz33+j1v8Vy/dozDX7Nse7
 EOAszy41O5Jlhf9YPwrFdgq6LGDFOBYU/xb2F+ukKRpMH1vYnKTg61+g1WH7B1res80XMbtiNFm
 DPwNtHxtRgPNY6J8NoWTC0t/6CwXztOxDKYth2G7Z4F29TAusbrudh91ogPrQvLDfM3PesXmXQA
 kLS0oBt4UJ/OTiAjZoq9eIFkNKVXDj5/XaKBSfFeNJ0gx0lkCXivm7rx9Xk0JFNKP/DDMmuuboT
 siFiEY+f/OC1wPe870vAJZ2RTwy78rIJELYqqMs9WV9Tn7wt7JGCQUppluWpdvjzIBrlOSBqA7v
 arEPx5XBlhwgLAT+xcA==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697aa650 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BUIj0kJwqj0R3t6dFBUA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QtgKiJjCiRCzfEeIFgxtbxpn2yeqoEoi
X-Proofpoint-ORIG-GUID: QtgKiJjCiRCzfEeIFgxtbxpn2yeqoEoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200

From: Sibi Sankar <quic_sibis@quicinc.com>

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Dependencies:
dt-bindings:
1. https://lore.kernel.org/all/20260114-knp-remoteproc-v4-1-fcf0b04d01af@oss.qualcomm.com/
2. https://lore.kernel.org/all/20260114-knp-remoteproc-v4-2-fcf0b04d01af@oss.qualcomm.com/

Base-glymur support:
1. https://lore.kernel.org/lkml/20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com/

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |   4 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  14 +
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 286 ++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)

-- 
2.34.1

