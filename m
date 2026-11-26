Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677349;
	b=fx3s++OipXnX8hFVeVrx8YPJjVj5wAzs1C5IbTA2QBRxTzReOlhPI8qq976Dxn4qW6NX
	 qfDEvMVwcxtef4p/mKs6Gu2czEZKtsohJJPwyp4KgXdPjEl/GXNEeUm8MwG4qRBImwOGC
	 A0oMHRS1IQjEKwwzQna/a/QWcRqHiFm6CvHAwQ12Yk7wP581cEjN+E5r/sTP2Nid+MsgX
	 SeOOzr8x91bzTLOLXGYCUpUV55XKqmq2Uvtgr9679zOaAnz+icbh7RpovbMO/BPe3ZHfI
	 7ixTlvrADfexPBNMz5RrS0dnmfGxRI/KXQ3Aj/B9J/QNi4MBXeq3oqjN3SRLNVzyOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
	b=IdRbuc1IGN1visCog+/KRm6Cn3Mv+Cyg4B7I+gdyd1IFHsn7eP9AUVrGD/VpxX2Cw5Fy
	 8gwAtL/CDheKqQiwPSrQK+pBmw/UkiWDdpd348TjpK/I+gcID1fcxkUHyh8Lb/2ILrGlc
	 RiLsGA0AX5CGc8HKbX5qeTQBBtSp+z07vU8szqtaPQpOsPisgmAuB8ktTKg34i1YsyXe6
	 6t5fFJZ+FAHNNMzZQyeG9zS8NaQLEeoGXK6m39PA4AilTFQqDHqotaAWJnYo5odYen5DG
	 psNeqgXCqUBomXdZiLJqf5IaL3D1Z3yeNPln7Pj4gjdyOH6zRCCHplPLO2haPuu5edA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B8606A323
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7xA919515
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u11oCqIyG/ivFyMcZHBSlN
	Bie4mmMzkTAfZjgV/WyKc=; b=Jj0lTIh4XACe/uOSX2TeYKSUr/MyJUXlDu4iGS
	HPo//GpN23LrEkarB39SIBAL/dKQN/dvH9rNj40xkz97gOSUEvNXLnCkMtE8A9ht
	2iObJDblEsFb3VZuCvIhf1p5R8VDmKaBfPXvQpYaLV3Ddlus8kDMDvTGudiWoL32
	JaBlEeFXdVPGr37S57YJe8tv9Apyp8u+FrrMJRn77KVDCmwfkZH7EVXlmMEF1XmU
	UzBcS5aT91le+wn+kH+7MYtn4tcV+l1zcl5GCfUT3QdGM5lBuQbt3wXAA4n/dn+a
	9uVCTDdXv9o4AJ5RPIc2iRWlt71KB7kyj5megYLHHW8NwalA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1vuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:15:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso1605272b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 23:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677347; x=1796282147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=WNnT6vjxBqgauKvXF8MVt624Uq172vLssvDu11Zu71TGm5CUPv/RQhwGDjgezPNQF1
         9OCpapfLy9Qem/Dp4wzaDoXdu2crEpGVguu6ypwTKD/lBCVhgCaeiVtpCb3+skAy4jtN
         7oDgXnb9y4u9oGwi2jT0Yux49nOzILUlmc4rQDea6lM3+1uQ/eforGLv8sJqJ0I5rX/O
         CASnIaqy94vYiqxjBwe3TJBwQufFk/DCW8stXjSQDM6/Ub3jf05awRwKKe2FG7m8O+xQ
         fyZsP2jMHQrFU0TJ7r30TFq/N1jlEeUric+BVwNkA859N+gPODoOqOBmJ9tfZXUvgdf3
         o+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677347; x=1796282147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=d+mEW/vLSnXA9Mvaz83LCnuWZD5JonmT70wLqTnEL8mexONa60wkh9WCMD/vRY+u2j
         PGJpS/k/yRcmRzJaGyh+4s92wWa0Evuf4a2/2OvsnvZCXjLcztwJoDhbtPE10pd9rUlx
         Su/B1DjhDTxdbFmo3jsViri31FoIU4U3kLv8mfCz/wXw1ODv/pxopHZ5iBVhEakUWom9
         O1Z0rz05MxAzFC/8WzLxxfi0NnimDNDG+NQ0DLPxoGQql1h2TDbno37LA3o/UpUDNSR9
         fpnilq4iaPKxwSZ1x8ZClaYwmQnxbre+UBOeK+ZVDjeQH7cxNwGSGBbC2wka4jB8hjOA
         TTwA==
X-Forwarded-Encrypted: i=1; AL+hErFr0Nljj6D2jSQKMzrUT2/vI+ZYfnzNn/JpEnzgFdaFsCXaGshJM5dOsUD62vBQXe3jcnlVlZJpfzNHo5vmt/9t@vger.kernel.org
X-Gm-Message-State: APuU4Z8UrI+59duvtbjIlt6xr3s56OctzBRIe9ZU/B9gzYeVFB9/WQov
	kn6ki+SyNcQd/LBWjX9IToSdlFFBZDAxv7fAqCn5ebb9pMPh8D/FLo/9CY/K5UVtzatGNboGJ35
	lQCw0czQP3L8AHLCZNX6ocU+Fvl3dM8RH2GdVN1/LKmWb9pD1Lk8hvymShIwgFiijIl8lDr2z
X-Gm-Gg: AZFdTZeO0Sy4LxgYcWyJyLT5nM/IntzIZzu+Vi4i7nNC7eFUILyZnbiY9VsmlkbTPjT
	MRvKOwckX+1xutfZE6EKc+a8YlFqHqQ6eBA2mdjd7Bj3xFvDcus22oDwIs6FXB6hKnAmrE7jne6
	a3UtOusRjUFI8a8qu6zmXjVc52Wj7Yl5WmBIklX2ZFDvv5RXeMCAdESDOlbFN9X2H3K57Lh69Zb
	VaQ/i84OJ7M42PLSJ6xgQR029fBTkS6RkijgwJ5Ook2TCcny5VXH8BQIkG6EGzdztjLwZzEcObw
	6oG4eirOiccbLHThCZl8PIvYvjE0YwXmkohOyZIJUUc79JdF0gp4o2y1nFnuLeWAMio5y/qMrZZ
	8GMq8fIkH3NdKwriRtbOeb64wD6WGsAur2bhjNe5cQgBXETEBzDkobBPSBaJ6krzXAWswihGhQN
	LNny95dlj+Udk/0EKq4V35KeBylWNe/dldH2iRDSq/18JNQXZarlrGMsfeyR0C
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843482b3a.21.1795677346839;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843458b3a.21.1795677346410;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:45 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add Glymur OOBMSS support
Date: Thu, 26 Nov 2026 12:43:53 +0530
Message-Id: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADHcB2sC/3XNQQ6CMBAF0KuYri1ppxSpK+9hXMC01Rqx2ALRE
 O5uwYUucDPJT/68P5JogjOR7DcjCWZw0fl7Cvl2Q/BS3c+GOp0yAQYFUyCo9zWNfdv60NHz7dX
 0gVZK5bKSAsoaSXpsg7HuuaDH0yfHvr4a7GZpblxc7Hx4LasDn3vLAGdMrQ0MnDKqCsTSWkSjx
 cHHmD366oa+abJ0yLwzwI/E5aoESdpxmQtpJWi9+yOJr8R5uSqJJAHW2hpgpZbFijRN0xsSuX3
 uYQEAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=4254;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=0hayMi2ePz5Wnp8iOQqLdAIxXv7N34pLc8cg8te4NU0=;
 b=VMApR360+JhZW2V9+I3VI4uFr3dKZCCHnDfD2nM7xCwCKNx4U5MorfbKwsKEDzPKUvMC9hk7h
 tZ2aFIYwxOpB3qrgwmi77ICbrUpLob7k94Q01VGrZUtROjnWZJAKMyA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXzOccGogFyVAu
 91Uo9JiWQRqLVYz2lPdEqSXq/VGGH8+2Q5Xjghuk2cihi0FBJzf8ZOe3qWSPZK9U9H9cCOnwTGE
 1DEDvOjWRfKnxr7Df4ic4jn9OntfXfPND50NBnJcTy6cSl1gFKQJTsAHdyTNEPsw/HDKKn8X2EY
 2D/BZB1v4Jz3w5rlW/n9XyG0a9F85J00j4LyIAeDuOzjXO/Kz2OnnUYA3bezS0heeLi17MoZbgT
 eRXGvQs8UXqVF1MiL0teTTA37Ft9qjqAixAUHTC3Ea1T1dJ6N8h+/ZAK5P5mpmbyjHe2LH7Qf9b
 0VGP8AmWgqqcpnfjRzi/MSm7E52fKuKy8j0pAeGv7ViCHNovRwlO+ez5vuL6coYsIlOmCvHGHJJ
 aNGuz7SWlXhG0EPeLiK4oS1B1LEoKTYoah5HIE6Y3Gh3SVvqzTdJskVNYSb1uO96hAGxVkI9S7j
 auoMDypRce71L4aIAdw==
X-Proofpoint-GUID: 20ZS8N_FzWGJUWX6KgL_wqajA2f3QklB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXyFjtDOxeuCet
 WeQD2mXlF2lczmhxt1l+HLHhXkHWf0/Y6VHW/ZrNl6g1f2scQ87Zb3tw3ZjRYXr89ulX6iTcEFE
 9F0XXXsYbZagp2uE3Kkou1/vlnzrpGc=
X-Proofpoint-ORIG-GUID: 20ZS8N_FzWGJUWX6KgL_wqajA2f3QklB
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07dca3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v4:
- Shut down previously authenticated PASes before unmapping their carveouts.
  skip the image that failed authentication.
- Register secondary dump segments during firmware parsing to prevent
  duplicates on crash recovery, with cleanup on failure.
- Link to v3: https://patch.msgid.link/20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com

Changes in v3:
- Release auxiliary firmware after loading and on start failure paths.
- Shut down the secondary firmware and DTB before the primary firmware and DTB.
- Allocate DTB and secondary PAS contexts independently.
- Continue primary coredump collection if secondary mapping fails.
- Register dump segments from firmware images instead of whole
  carveouts.
- Move secondary dump-segment registration from probe to firmware loading.
- Map PAS regions only during collection and unmap them afterward.
- Place the Glymur OOBMSS PAS entry before the Glymur SOCCP entry.
- Add Reviewed-by tags.
- Rebase on v7.4-rc3
- Link to v2: https://patch.msgid.link/20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com

Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 370 +++++++++++++++++++--
 2 files changed, 489 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

