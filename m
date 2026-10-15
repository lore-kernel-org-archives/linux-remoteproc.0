Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5063C345D
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043792; cv=none; b=osbuS2rbwrBaloaYuJS3TufusVMAxeytjQUNXqbSAgzNEPZ8cJp/pergDKFGMSmmR5J27U/zrChY66l+Ql2tDt1jyGMgWc7jZisPc6Fsok3jrZAd6BZjsx5R4ODxbm/ZCzqLGFgF1JFD08ovkeWHaJvqBqQQYlp1/sEa4pDkVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043792; c=relaxed/simple;
	bh=lumv/JLyOvQtH/70SPzhAgF0+nivbzfXBXXhMfIRVF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oe+JRxgxQz2v1JMcS/39aEF0IoZCchorCrOhwMYhWZ2yDjTFNFoNbYkXTN0CxR5l890YT94anxPGOtr8zEaM+C/2JNMfb7E5E87f8j476AlApFeN/8nDe5gi4MWzg7nt4WBMrMMPSynfM3HpKK4VejRXRxsXVjdwUHEftUq2/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4s/9+K1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcgK558M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4s/9+K1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcgK558M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xJCv1640657
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A2hCyIQQPN6QAg3xSllRwV
	oRnMo15TmgFA8Mhq86Oms=; b=W4s/9+K13Lzs0vvvEl07xGX1x3T44G1s16/4c5
	BI9FHjU9Yj1DtCtt0YJHiBdBo7cH46OP/bPjHd84KqtWcRRBbhGrdrvUMyd2g2/K
	q0ZaWRQq2LpL2Mkk8quJt7C8FrETMFUhlCiCJbqv5Ggvfxbl+3xjc2fOl1vK/O2D
	frvRoVjsxDxcCn6QGA4kuAujDqty2dyDP1q9YfLC15eXWUAqbg+4Ik5oAdiPlLv1
	85XMCimwSZsXzeKOMNFF8UvBu8oXuutzKtCtcXPjMPay4ISGvKdGfNFszEGGRzhG
	CySch/5fDQMnauCsfONgt6JK9S77Sxq9puU557MABxq95/DA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhgck1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7424756eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043790; x=1792648590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2hCyIQQPN6QAg3xSllRwVoRnMo15TmgFA8Mhq86Oms=;
        b=XcgK558MHK7Vrq6XBNu2YEsUjYMWiRXQ6tmoTqhKm1S5CVrNsHF3MzCa0xGYM1ZAXm
         GQmX2tJtcH/e0YL1Ahj848TvnghjgQJG31mOVa7YFohoqgWD9+f1cX3dyRkQs8OQ+q4x
         vWD2OqhFlLYyKvOGe7eQnDDQzn10MySngfQkAYzcTC2SfnuNgUqIZO8T2qhZrhOD4KHw
         2uS/xkGwf3r3FcCFV2K7N72CjIdrfni7m4Fs/Vpfa20PMdIJ7Exu/yvV+ZTHGCkZY7rS
         IgsMCJaGyRWVuU24ZYtUidFZeMUsv/lxWFpK+FImEP0XstUoW47GkRmIwQ6gUPz3MbUm
         uVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043790; x=1792648590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2hCyIQQPN6QAg3xSllRwVoRnMo15TmgFA8Mhq86Oms=;
        b=Gj2z+cXioR8RS/eRyP824kRelZyQvozloc2Ni9StdEucH606AL6NI9i9yTVoM3Kh2+
         vmt3VuKKXWwRl0RtWMkBYEKFOtp3UgIApMgSEx1a+4U4KlFiuTHdCM5rE0l5Q0Rv53Xo
         pzxww8UCAcIWXulu3WQwbJ26xhuaOVeZETYgkevTr8B/L0yj3+JL+JQSgpdSxvI+XaHH
         Q5scfRUWLpn9hq7ICMAWokMuUgjkvhewM2QF93f6GHsKFrriqBvYLvKJU0tanf8xu13O
         OipjHZYwGaWNdD4KBTDqXAJqiCWoYQldq88wCBELjB2mRzHoDqrTQjPuE05BnBzIj0uS
         tVmg==
X-Forwarded-Encrypted: i=1; AKwUvBzZhMRYKd3yKDw1xjNwiElpLzBJQ35VBSa1a89dM4AWrmBkQV/kYjURwbGnjQXxrYlUPs0zIoV3dtc837Eu/0Cg@vger.kernel.org
X-Gm-Message-State: AFq9FYI+YkmiEw449wVLLXJrh5gt+m9Y9RRHcqjrcuNuxVejtfccaqQJ
	PXFRxclIai2C+P3YEAHIxiv4hQ4rswcPBV1BXUA4NFy7rhxR0qVf6jpqgUw58N/q9dE9TbVH3Lf
	SkE5AfTeRIy2V1+dmDn3fpjm49YZoDHOCtjy3CNicfGoBlK41Sufd/rdZh4VjX3AimFHN2IKl
X-Gm-Gg: AYBFou3VVD17TevgrRFA3bkBVkqmFQbAhUiZw8K5mJAF3ls//RA7wVB+95jbWpzt66M
	//puJmL1qhRxrNLLQKkTMuodmi3zRaP/wELBZVjPdUZzHnkcBLMhOcleIfuVeyDPyr2UJXb/p6e
	HdCHfgw9rWs9Ari7wwgpwqmQe/jHXeYnXVta/jgo8CgEeUhU4Ktlx5dvOA9xATLyn/weyqfhPmG
	YSknIArX8ZH5Z7PHV+auZj97+SLo9p6GBLa2siGxieF/wHdq+hxU3i6Oi9GmSRpVUVk63m9H2f/
	Oi1B3APF9vwR9GphjnHL8SlCCD5qmSVcjJPJvbHr/Ov+SfD4qzlA4ZRms/5gN/kVXqe/lwFFUqY
	avmQAV3sZTbCIz+X0O9dqh4X23Li8cV5sgBKmGuOxMoJB6cgMwwDRU5jNsKli34nAyY+cnBV+w2
	8mkisSgMFJFb8=
X-Received: by 2002:a05:7300:e9cb:20b0:358:c707:4c3d with SMTP id 5a478bee46e88-358c7075049mr20219199eec.4.1792043789741;
        Wed, 14 Oct 2026 22:56:29 -0700 (PDT)
X-Received: by 2002:a05:7300:e9cb:20b0:358:c707:4c3d with SMTP id 5a478bee46e88-358c7075049mr20219177eec.4.1792043789181;
        Wed, 14 Oct 2026 22:56:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add Glymur OOBMSS support
Date: Thu, 15 Oct 2026 11:25:48 +0530
Message-Id: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAORq0GoC/22NQQqDMBREryJZNxJjFdOV9ygu4jdqivptvpGKe
 PdGu+1m4MHMvJ2RcdYQe0Q7c2a1ZHEKIG8Rg15PneG2CcykkLlQMuWINSc/z+gW3g3b6B3XSt0
 znaWyqIGF4exMaz/X6bP6Mfn6ZWA5n85Gb2lBt13WNTl7lyARQv0TrAkXXOUARdsCmCYtkSh+e
 z0AjmMcglXHcXwB40pH/80AAAA=
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=3143;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=lumv/JLyOvQtH/70SPzhAgF0+nivbzfXBXXhMfIRVF0=;
 b=k6uFWDZZaxoO+16SXFvC0IFayik6ugC7lYRub5Yh4FCQ4MN18+Ly7v/NgSGTd+5H3Nl9yLBox
 PELKREMpEPFDLgxAW8Xgcwqf7xRG9X4f5a1rpaxL57F5v9pKe7bU4i2
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX4SVNaLO5CZUj
 qtcK6lUtmEpb/65ptUbCrWGJa3QUNjHxfCQlgrBnbf0+V0q0TDFYgx2iBq1JQZDnZzbBOtzC++k
 WB2wZkd3iHp7ZSVKi4q72g2o450/tlTjIZnKloPs6MhShaXbJS8hbRB8XVB+tIEqyM1GVyNvRDc
 nSpMfHeLsvXZmsm4u76XzT0CydX6ThY3NlAAVtoTxLPXAlATlf9IGTvShMpt06SPn+VHJTb0uQG
 Hb/YHmeY3+oXUIHnGfwbK3W+vdNAadmfIp78GRpEzjxvp2+r6VJ3w8HIPviI+/vdc4AcHzIRY6i
 gAHNf2MJhkruTx+T9ngh1jfdlsCK7Fu0Npi92UAuazQ43QsKLopW1Ctn67w2PNY0VliIGKxR9a3
 sI6DybAcOOu2738MmMlDYSeJ4gnmpu61JkmkQkNP8FxPPQmXOn3dsDRj3ab2xB7JMpdfTM9Yu1s
 VcRrkjVswZju+qGb3lw==
X-Proofpoint-GUID: ETMHviCvSPkjBco8slWRN1ZQJgf-8EGs
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad06b0e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YuCc8ovvcE5DR3EE8bcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXxC6/L6Rko3eZ
 kRY/OfYx5YCSPSypm6L/zj7s9zw57v3Pl8hiExOL3MLgzT2q0nHqvGIxKH8L1kWVjeTFwtW1wCa
 nAN/NmDS1FdHaxGt7Kx5A87A+JAC+90=
X-Proofpoint-ORIG-GUID: ETMHviCvSPkjBco8slWRN1ZQJgf-8EGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

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
 drivers/remoteproc/qcom_q6v5_pas.c                 | 367 +++++++++++++++++++--
 2 files changed, 492 insertions(+), 29 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

