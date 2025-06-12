Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217191C07C3
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695986; cv=none; b=XrsYAcQjek8bxgS4SmbYHtxBPYGCKRLA97WkHsY7EokGhpekFyOHB73+5HfWp1zCgI1Nf1D5y3KVbO0X3Z77WyKiXz0m6YR52nY2fxUTSDaizbGzWsoVNokRdXaLpFQMvpwzYA3WbEBY9Yfp+z8oYOJlM3D/7Ghds1yIwJh0Wqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695986; c=relaxed/simple;
	bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W7Bhn6pk65d4pG+hFk5RkuTgHDRLHEkXkPai+ekn13neMOp+WCtFRH63OXzspBCDcq3ZbtigmwMqezy93NnzFHCH4F7Av9j+KR2ZwH6950QKO/J1ZgCq2tOwdkqnX8DD/5xO0i+UV1wdW/YhKyBBMFL+xWvoWZ8MzmEW/Ur4q+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlFIJB8g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlFIJB8g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJqAv0009059
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=37Kwgqn9frADxf9jqKF3ls
	RhO0wSNjzOR8UmDzT4s5A=; b=TlFIJB8g1bNcwzttKbCS244gK8po0jBBFlEtBK
	Sf+DOURH/i5f5WtSFALYkQ2x/SYzIMa4+8FHPVZikLBGdm0UNBaro62Z9nxZuHxQ
	0twsBp+GjshCouSUyW0tRP8KvaJ50YSvV0NOWgiEvvsWAg3b+n4sjTThe8qMqygp
	u8MJxz/DY8ybig5hWyk5Utv/IkG9jJsvnQg4ls1mRwSU5n8JrUo7nlyzE353+8GD
	Ec4eP5SSOgiBDSxTlr12ZUH3vqxKydzUJhBfNxhy2V+U8xD8+ghZSrKESsR5IQ3W
	394Pj6PgaJ3p427fVIcMexulWh3c88q+Z0zK/wZsF4T3Cu1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753bty5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748764d84feso651557b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 19:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695983; x=1750300783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Kwgqn9frADxf9jqKF3lsRhO0wSNjzOR8UmDzT4s5A=;
        b=XwMCWwiER0OCJpEdby5frczGIfy+A8z3W2iE3I0EvYtGvRMjl/lHfFDxLrdRo26G+4
         QbY2iYAC14o3+k+c6bxt7RPBxWDhZaogkOslvIZ9p5FVePq//tzZNitDLNpD9gLoa9kP
         vrcjMMYmEyy6PDDSZ0RnN1JrwQCVcgbBXJahm61uLiaLvqLfio64LaW3kA5LZatqmYYW
         LJLwX77t6mT44Vh8C7LXLxz413EOZlTvqThAaWmjBdmYpOthF6MT+9Zmue+wcBF7F0Qd
         efaMXzcZ4jtdZDgmmDeEOndKxDvUvf5K0arEw9BIN8ND8q0Ky12YJgI85bzVRcHh692l
         Hw3A==
X-Forwarded-Encrypted: i=1; AJvYcCUQbIDBsBtzlTQ82u23v4FWZZnKP04BPibbePFrVo6aK4mJP8pdoM20sENcH9RJQ6ICiXgsbg0OgfuQPf0iXJcl@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW8Wk2HHrRV1Mrk1VxXmCHhrkXdCGoae9x60phPfK+NDluv0F
	Eeuw+JtxKx9R+7oU8my4VPC6BIc53+YIvudRhs5zcTVEJ6vmD6q9YWpCBz6Us9vICM6IOsZXX/V
	6E2jU8pWxU4iqZJy2kNBJjvVRv+lf9m/oGljMcx3qV3uEr8qC4jKkoGEP//GlYpv9Lj6qSl8Q
X-Gm-Gg: ASbGncur7AuSg4+ALDEgodZtYeAlg/plUK6g8ltAup9IwXQ73sIKu5dC85stIomWUtO
	z6TVOyD16ilYU1i9bYR9znMHXwv2a/Q7FjUfgGytz2O+QgtYK/pLikFVkJT65buZPTLsfIp5Ogo
	dkmhe07WTEeTSwvUFGcfsTqx2jF0tcvpT9grha+JRFTsSumrLWNGatGwHlCi5QPikGK0KuBKRb1
	Desn6+tG4g8+B9HlnaZF53QiiCbxdhLJqWtMnAlU2+jxevhGA8Q2dB8+PZD/B+fQgxnFPWKxRRn
	Q+dDLOUTp4JQJvvxr7aSFWAjWUu3FzOwwamUKYWPbbP8RvP+Ih9FluBVTUrmZ1eApjVYD1Wmi9I
	TIBlocwOT0HEmHZkf
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011240b3a.24.1749695982565;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+cjNHG1R9uaj3OBg4rjmsuHSMyNj3HTY+Ag2Wxhe+xd/5rSdTccqkaFHSysWPfWveqUu1xA==
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011200b3a.24.1749695982053;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
Received: from lijuang3-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm315835b3a.4.2025.06.11.19.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:39:41 -0700 (PDT)
From: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Subject: [PATCH 0/2] Correct the ready and handover interrupt number for
 sa8775p remoteproc
Date: Thu, 12 Jun 2025 10:39:31 +0800
Message-Id: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOM9SmgC/x3NQQrCMBBG4auUWRtICir1KiIhjhOdhZnwJxWh9
 O4Gl9/mvY2aQKXRZdoI8tGmVgbCYSJ+pfIUp49hmv189KcQHBsg3KOWLsBae8yGCHlblwpjtzC
 HlBef7vlMI1MhWb//xfW27z+WLWOKcgAAAA==
X-Change-ID: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lijuan Gao <lijuan.gao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695977; l=875;
 i=lijuan.gao@oss.qualcomm.com; s=20240827; h=from:subject:message-id;
 bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
 b=YV/XoaWSZifa98T4aXdK1ntUQShLDBiXKzEGqLvcjgXM5oPl8x+5rVFcHrIjIBkG8up6fdRfR
 jaOidyRDM7pCbgtGp8p/1mNthZKo1qr7ixNCzFAm68Up5Hj4r0bJSu+
X-Developer-Key: i=lijuan.gao@oss.qualcomm.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyMCBTYWx0ZWRfX8ZNYocIT4KQq
 MXhCJbXyQFCQMkqkCdUcTcEaBGfh1eZ2xIqOoPo1X/YQbbdCAns2BwqCqOXoxckf8Exr9qfq4Xt
 uLGLNdZrKuXp4BORAeRLA2cbsBx85KCLqibaLBHgWvNH6zizDLILXa8eBS6mWkCm3BgYMX+JFah
 P35EIxxx9RDxFK0apCbTr8F1ZZuNrRzJAsKSkr86+caN1nfqmhR0BBCmhnWWba6rzuS1QzMzrMf
 dYroqoJsY0E5QBElcHvuS2MLPXFCGfXWHy+dhfq/yOUw21Q1O/5C1O7wsJlMu6E9kdUi7VvfsWw
 il5VPG9I+4tPcfRJDxaM8ApjJSZPIeLHgq4NXierDFB/T43uhooyPSqzd8gB7O7iRd5ZuK+v43i
 jbDbEENlyrkfEartc4Sp3q3l8qAhFfXvjM/8cOLh1bZHjseA00CnW5p2mva/n7yYydprgydM
X-Proofpoint-GUID: ettuaAB8lzMG0S8KLm0Nr07LJNfPwWOA
X-Proofpoint-ORIG-GUID: ettuaAB8lzMG0S8KLm0Nr07LJNfPwWOA
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684a3def cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6xOPiwoKqXypAXGmrmYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=697 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120020

The Ready and Handover interrupt numbers for sa8775p are incorrect. The
correct interrupt numbers are as follows. So they need to be corrected.

Fatal interrupt - 0
Ready interrupt - 1
Handover interrupt - 2
Stop acknowledge interrupt - 3

Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
---
Lijuan Gao (2):
      dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the interrupt number
      arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc

 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml       |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7

Best regards,
-- 
Lijuan Gao <lijuan.gao@oss.qualcomm.com>

