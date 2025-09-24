Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265441FDD
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739078; cv=none; b=e/GNNvT/xgZTG5SzTWxli1vja+dUnTwn5kOoQFlU6yqsrnUQbUWbFpHOogIFD/zJxQsgG/lWxQO6tJLozqJHSFyuVE2h3b/+e6vFDVn3pPqhJmaH2kHa5jg7x4BA2D8UFheZZlwq2aW4QRY1DtLRnzUuwuENDtBGLIo+g8WX1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739078; c=relaxed/simple;
	bh=mzcBpIew28uM32FyQmevqMPECn+YhIPoaGvu5PHcgPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nPbwZ3uvnJ6cd2ubCJC+8v6KgrV2pUujv3VKz1PVlM7oHKrurCVZ6tiNY12MDLUxtZVCooXqECNSm5IxUW1RtV9t98BM/g3JkmJYURx8Iv3Gqt3uBP46RDMaoDH0xxEwDPZ6Hiu/WAVoxSXFhSJx3kvoL95tIL3zftVYMtAilMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CY1gpxMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CY1gpxMA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCx2XW016659
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2YJp0AJoPJela+qIoEKQr2oyB8xKumCAl4d
	Z3LNuFmg=; b=CY1gpxMA5Wirdr3GLCnE+1AEoi9PX0us9Fyf8LxOeRDJzqekzc6
	PbyyDitdDPaPEv2406hToa/CCclZ/S3erCFVNfad1V6FwSD934rgkJNiyOYgiSiU
	0QiU8DkqEKWOk+QrIHzN7e9SUuiUFC7KZsSIopfxQ/gx8BkSFFkc3WQ10BdDEX6B
	FZzYZ78OWCgmH7eIYfTrEtYxfFuyNDEu3jSAGaqxwbggYgWJe+sxcRxwkLqqcOJZ
	mLtzjWPJ3t+Huo6hBSRTiOXlHR39sC6G2TsfevRNRlFkSiPsbSXUFK834U3UR/kr
	hHt7TrXlufUv9avDC1arHMVk2yHaXDVnreA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyh8bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55443b4110so46846a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739074; x=1759343874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YJp0AJoPJela+qIoEKQr2oyB8xKumCAl4dZ3LNuFmg=;
        b=m7kQDIMoXtld+cWL3Y3Kz4pEXt9+BzlbDgaFyN4by8WqlkvyCKiOFFcyt0lPYBrAnF
         l7aEqpSSMNoB4kprAcjFJU743qJRJrCTbnJMbpS+gN3DQ6pNOBTvq1IW5Otg5euF3MIA
         ikVv0W9px4Xm0Y8yIQPxv8CHkPAR76gr66zfJEKrPL7ihJyNFQp0LxaH3qg50cVHOLfO
         z8I1wNMD01125YAlXGcWoNmiPVq/3l6628Ha1ELUAmDUXHW6wqE9v+1iCiPx0xb6/rxZ
         H0oqPcIg2CUP6No1iVy6bYZ/mwWzul5YLUo46A7w5+5oss8Z8/adWvoMjdWpTK7VGnpV
         Vxqg==
X-Forwarded-Encrypted: i=1; AJvYcCUPjO3aLu+SwcmOMrYWX6khjBP5spnrUCKcZwaTq+k3zOZ0L6vOEdmSiLCQET2EJI9rzmJ0XfGyrW/8zPeqQDcz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7YWvud8ZBWtWqc6baaplOkRzJRpk2TO0ylA3/hJIZYd55+cd
	4L1fkMcK8iUUn1y0JWZeW3FQ9d/PwIR0eoEOksSDSzQ7BuZ3GADdmd/0KGbqoaX4R8p/Z0LjhsT
	+3M1Y9YnPse9dqyBxb/FjJsWjL7CKKdZet2FyuIfuytMoj+hCy/GCwwpr1ryCqHqxprCvFSzo
X-Gm-Gg: ASbGncvLWr9vOyGgoxxMCOVWU5BgNqXCpOXJwWJ5M8DHErSPa4PV7Xf+Q+P91uLcSI0
	MbNfiX9XShSFO0d6qfrf/6nGPmtjd/3yocYXdO/S8563BEGz178OCU3+vojQPLHXA0UGMtg/c5a
	3MiPTSDyID7TT9x3QjQI+rfrDm8ToxmQMnJGobVAUT4q4WaSQJhpIINQPyGU1Vdz2cv67r5ReFG
	vthuYE89kUWHmG720s95jt/tsN02v+HmUDmbC4E4p26lvdnSGK4sHME1LVh3Dn6fsRs4J/EBUVV
	H0WwoKTvOFhWHvVtsZumXbHLhwiyw8OUit44s/dFDmsrLVXxWUUEL7UdrSYdm6fvZGeSkYS2kou
	Rst0n8h3t2fVvbwGnxDX+oa0dNlJdzjjO4zmykVxBfch9GA0F0Ktg8wA=
X-Received: by 2002:a05:6a20:7348:b0:245:fc8e:ef5b with SMTP id adf61e73a8af0-2e78f003672mr806187637.5.1758739074409;
        Wed, 24 Sep 2025 11:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJgBc1x8MlTWvXGM1116gCob5y5IWdsvIyBP1B7OfN0lEnpPv4P9NKMSOaFxcOpNFSOkokkA==
X-Received: by 2002:a05:6a20:7348:b0:245:fc8e:ef5b with SMTP id adf61e73a8af0-2e78f003672mr806160637.5.1758739073966;
        Wed, 24 Sep 2025 11:37:53 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:37:53 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/5] dt-bindings: remoteproc: Document Glymur ADSP/CDSP PAS
Date: Thu, 25 Sep 2025 00:07:21 +0530
Message-Id: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d43a83 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_X9-DzOTpKYA3bgxq-AA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yMHqjfLiiky0rz6VYgvlt9U2iE4smv9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX471cXpdyIPPY
 dYjDOsJtEdcRKYQgywYX/ceAkGB+deMhcjXJ5Ol1mX7ugJ9+Db/y4dAQrYFR34+Uua35noGvylL
 CfDUOhYiNEEg06SfwrBxN8NifQnHJcMNW103VvAxma/MRIkyudPRaZg7EDfXNhhqkj/N5aWH7bu
 ptgTWlU/QafHQ6f33vwMogSzmYVCr85Ygi7n8Y8Cu3YT6KQVNoZbGsXXb5RlTYWFqmCv2mCDupo
 IFRrYtT4c0KUTx3wXaLXvgvPu+/pUSqYMtEuq3a0YL06w1WkqoqDmt6biaNa6rvgvtOv2G81rDg
 E1ePTdZuS1p4nYuGqI18gexCSMz0G60WgwjOocJkgfgX6Z8dYyt17uNOWAnYQY4tqjkcpjYWNBK
 +J3E3slU
X-Proofpoint-ORIG-GUID: yMHqjfLiiky0rz6VYgvlt9U2iE4smv9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

The series documents the AOSS, IPCC and ADSP/CDSP remoteproc bindings
required to add initial support for ADSP/CDSP remoteprocs on Glymur SoCs.

Dependencies:
Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
Patches 4/5 have a dependency on the iommu binding added in ^^ series.

Sibi Sankar (5):
  dt-bindings: mailbox: qcom-ipcc: Document the Glymur IPCC
  dt-bindings: mailbox: qcom-ipcc: Document Glymur physical client IDs
  dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur CDSP

 .../bindings/mailbox/qcom-ipcc.yaml           |  1 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 22 ++++++-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  1 +
 include/dt-bindings/mailbox/qcom-ipcc.h       | 61 +++++++++++++++++++
 4 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.34.1

