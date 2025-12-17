Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B532C94C
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954288; cv=none; b=rn02VJW089afmkxEBhYOTPXWCl0rb22cG1PJz1U1ZXesGNJO0LM01fgcaF+rmJv7cxCwpoCj0BzDxUKCOJPNqShKSoJqnVZzuZd0/bAsj9EJu8/4akFSf1uGQeHn2ZOEigHoN6q7rr4W1PjUD5goLiIpB7gvqGRM5cuI+tKo76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954288; c=relaxed/simple;
	bh=xfcrgOE6OJ222SJo7VrJmEsMYDm4kjzaI39zTIlVu0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dTNP6444l1dZgqicCaEn7OT2TUVvBLX75KbVoImW4SDigL5QxfXWFme63bOUOFSw5/NYgO2jBSliuFOU6VBpd9He2Pp8rTvXjwJVo32Gy+Gnu4v1Ona0fzyPNVIUy+BQRxF3B6TU0yyB+JVNI/5VCvLpMIgSiUetMeRv5QNEOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=US/dJB3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yrac8ZJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="US/dJB3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yrac8ZJC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F50J1501259
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9b7TECOmfC/ZprO7FoeHi5
	StqNS5aSU94qGGJSYZB3M=; b=US/dJB3IE853Gd7Qe8IQWIKveRwkxLhq6zz+gS
	PM9Q3KxM6O3ivCnO2Mv5XmNFVMxGhQavYRM61IGrOf8Y5S6g+7vELH+b3RDzkLNq
	iq22z2DcUMArD9IebCD+rKOrQe2TL7ZPdCLD+vAiDP6L+zPhksHDHxFqfCFd2zpx
	lA3VuBOUaFv6nD0kUtASx4bX3kVLfVXM0HK6Fe5NPUAfaiAF4rd2RnKlojEsu9hF
	wobiDGHv+oL42aT43Tu15ASLfCdFXAq84kF4Jp7Lh2jR32IkhokiT9GX22NFXQ07
	ItZLfAsGUNsxLOBI+R4DOrtOPb+vZ3ApFvwuRWhKc1+ze00A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkerq6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso76667065ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954277; x=1766559077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9b7TECOmfC/ZprO7FoeHi5StqNS5aSU94qGGJSYZB3M=;
        b=Yrac8ZJCEpitFoHOBI7q5RNJf/7gw3IFOfQdFj/PhedT2GGY7BV1heORy3Y4Bd7Hi0
         mqpTgk537fdO2aj+P0xvmo8RXOlddc7UM0RKKw3LHpegFPp5kjHjNK4JA/OC2V/7gaIi
         EvYkKfYR+KxdxNcv8fo35bf2w15EmL2i0Vbf4DyBUYx4Kxa9EyTy5mz0m6CksmdqGJm0
         GaP/ALWbJwIFBwqKdiySTvRChm4izLAO41L+b587ZYxnS+WEelIdQmjaH6xrqZ8tuwa/
         362kdl3K1ffeGDwn6ODT5DlKhQDNvMxcjao7bVbN2lvZki6jLjAv1vH6+eOkUFEyjTAB
         IAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954277; x=1766559077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7TECOmfC/ZprO7FoeHi5StqNS5aSU94qGGJSYZB3M=;
        b=LWhIK/21SHcNaBRbwllQ0+e5qqXe/h/OZeebo4vx5j8uNOwrHr2ds1exIfXU+eHBDg
         3vl2g7ekjzoxKyYQ4+saUvmYb4pSI4ZdYwLLP0HecFaQDBeBLxu+8LbAV7KRBbaaWGAm
         lXnZObZLYxPrWQdd3vBq4RN1j+bpDYF7igTUbor3nTGEITp5Mss3sHte1KgtizrYluyj
         s+XIMGESZTCeMlRkSwGzm9vNq1xNnMa3yVbKESQwCd2RC1206f0n+5Qez7tCD4ZgcddM
         vhDbQ3ZbRcotahIHDZMaiSS0kF6XBwxFiwVv3c2O+3r1lS7e5bmKuoJHKOIIKJTrkuqN
         NAvQ==
X-Gm-Message-State: AOJu0YzxxPJb6uZDld5hibV8iHlR2SSsn778s5IwH/VipSXbkxdughO/
	p3f08Lr72wt5jRQk4vmaPQKtFtdnKxgO2FNciDBvAy5q3sm3hxzPPD2PMADmGzSbi+nmy5gW95L
	h8dyXWTuTys3libxkcGFKo4FxQhVWqZ/XUgAnaEfbZYODfj3FFxgACHI1Fi4zytlLN6fNDqcE
X-Gm-Gg: AY/fxX6A4agoSvl6XIk1RQCD5RrETeqJR1jbASwg4xfcEFIr9y+YsyPvLF9rlLBFlso
	dSHnC6eYBYreCG9+E3kNJC8ATYOtya3iU6o+RETPb1tMvdgZKrUfAd/f54rZLsaRCAxdSCEj0lZ
	dzsTavWJOAUzkzjNgf8p6OzRnzW3uYI1s7AGpA9+AP3/34/J3Gc5GmeRze2uun+pJCFT8rWn7GN
	SLEJ8FNaG89PV0D+UicACRGng6agn0Mu9BaM72qt65QX4Mhwtzaly/YcOin6gE/uCDsudqGstYv
	WP5FvE6G1n6+/DQd2QKTZH9AdNUvnOZQ47S7R084QxmE94Dq+OG8rZp+TjjlnK/+ZwVYAh/5/ug
	9DpoBcposb2Id1KUaGwcINbbXce87mq3AAnG+j6K8jd1H3+7Eq8RXZ6pp59wavNjxQdgJq7TCo+
	U4
X-Received: by 2002:a17:903:2290:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a0d5276892mr122995515ad.41.1765954277224;
        Tue, 16 Dec 2025 22:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdk8SK6mYSXW4tV0n6qDdKnNl9i6F0VGGoJzRwhrvozssJefTBQcBTUemfonzG0lyTKIuUGw==
X-Received: by 2002:a17:903:2290:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a0d5276892mr122995395ad.41.1765954276759;
        Tue, 16 Dec 2025 22:51:16 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:16 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 0/5] rpmsg: Cleanup, fixes, and RX path optimization
Date: Wed, 17 Dec 2025 14:51:07 +0800
Message-ID: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX8JkBzXAIJbny
 8RvsCnWWulwkfxD8lAcI655vJGyPvoKzpHvlKXd1CVNxqBTcXefb4js+BIFK6W0b7wGD9nRfDd5
 9HRnQd5Sq+vJgxJnFGFtEwKoxtfW/T1/zAOVGT58mYonFvXf8RcRjGQ8G4lQGQFaqUbEtIqIOVb
 zxEUgH/Lj+MtpKsNVN2ox3t5ol4utpU5nm1dVeNHrrjwOyR8InsYU3rGaGFL5QgMy9hzBNv7Fk0
 RV4ZMU7cOUsF0ChX1zlP4RmIisPa1kcw3++HmWwfDOxdeZGnSyp/yMKdS38fC6a/UFgTJ+1N80h
 W6uOAqVwVDiPn+zf+vcpSp0GDKtocQK/NMMOen7zuiy0Ped84y6wSIp8HPbF1WLxly61G6fZXmU
 lGE3V7i1FcQ4Nhr7KVotzaygngeYRg==
X-Proofpoint-GUID: pIjDXOypj9wyeprflXZO84vQ7bi1FTQY
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=694252e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JR59mTIcGWyaVAYooGcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: pIjDXOypj9wyeprflXZO84vQ7bi1FTQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

This patch series introduces several improvements to the rpmsg subsystem,
including minor cleanups, correctness fixes and a performance optimization
in the virtio transport layer.

Summary:
- Cleanup and API usage improvements (sysfs_emit, comment fixes)
- Documentation corrections
- Proper error handling for dev_set_name()
- Performance optimization in virtio RX path using RCU

The last patch reduces lock contention in a read-heavy hot path by
replacing mutex-based endpoint lookup with RCU-based lookup. This is a
performance optimization only; no functional change.

Zhongqiu Han (5):
  rpmsg: Replace sprintf() with sysfs_emit() in sysfs show
  rpmsg: core: Fix incorrect return value documentation
  rpmsg: char: Fix typo in comment
  rpmsg: Handle dev_set_name() failures properly
  rpmsg: virtio: Optimize endpoint lookup in RX path with RCU

 Documentation/staging/rpmsg.rst  |  1 -
 drivers/rpmsg/qcom_glink_smem.c  |  8 +++++++-
 drivers/rpmsg/qcom_smd.c         | 10 ++++++++--
 drivers/rpmsg/rpmsg_char.c       | 13 ++++++++-----
 drivers/rpmsg/rpmsg_core.c       | 14 ++++++++------
 drivers/rpmsg/rpmsg_ctrl.c       |  5 ++++-
 drivers/rpmsg/virtio_rpmsg_bus.c | 11 +++++++++--
 7 files changed, 44 insertions(+), 18 deletions(-)


base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
-- 
2.43.0

