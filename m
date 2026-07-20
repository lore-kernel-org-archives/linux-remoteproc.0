Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFE423EB6
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554139; cv=none; b=ZfG/LGSa6mnbalfBX6k4xqPauPjN/AW1HvAycF8UdpimIO/wor5Xrx31szF1HZZov5dr4eMa6axb9BuH9G2pBSXwRk+loPkAr1OgcqSDFAlriHB60HJ7y3Q9IR01fhROfkMxBhJ9vxF/GbGx4UMU3f7Kk4xUndMqw7Qz1ZyIX+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554139; c=relaxed/simple;
	bh=XkxFWuQQ5V2sV7Tw/WjkG0JWZhzkjp5XxiJlpuhC+0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ig3oyMI0yYBTkU9D0fWWiZB2wOmBcWtQ8m/wpjkw478Im1OKAHy1omCgwNSwE773mXoqmypDy4T4MKKzCvb5NsJYT19CyginWiG7aMTuEEzyXMZqn6IyJtprtxc65IK/+A60LmneBusYWJe+xDGPRaHqVDVJigXOI1PGu2bRaF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOlyxlWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqfKtkzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOlyxlWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqfKtkzz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBhxTN2449948
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ob5bFJIQvqU9MZgy8RIBbh
	d3R+SixTO9CYZhiPFmy/4=; b=IOlyxlWJjUK7qfGfG51+4NYwenlo4g58ObDyks
	LGdxdHVzltcxTefFPdfT+Ex+asWFBEH5J/hLWh5Aw44Njj1hf/WBsCREjIbN4tD1
	9YI59CHYfXq+SM8raGMQQiwqwbEf36Oww5gicxdz2ivBummAbJsFhiffBluV+MCs
	9d1B4dMhOJl//zL+WpVmFMRFxVe0x48FL1zuiP2n/Zmqs+t50rH5eAjPUTr2I2nc
	X9fVmq2j7SEmJa9xRNrh998vYagCjiBh5tmPLfQk1UXnzE3r83qfGmLTZZBrcaG+
	MhPe9gr6lIOtsHIunATARo4o6posjH3up3zhyfHFgTwv2P3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8da5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:28:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso7348227b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784554136; x=1785158936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ob5bFJIQvqU9MZgy8RIBbhd3R+SixTO9CYZhiPFmy/4=;
        b=bqfKtkzzRxJ2MDafCndxB2O0nnJXza0TTmTFSgq3VGpCVJaI/LvdYa9xajhrXXu9JK
         1QaArcbu6M9aBjkUlShtk4sxkoDvEvZxGb+tnnRUJNdBH1yZuH/h6vjLOd5X401M0SDn
         qeP8qYUaMxG5X19KfyqXXzsfTFAbwpEQOUKiqfWDMHwAhdLIttQtrZUQ9Nx1Ki4odqyV
         s/MBmS0NBQANLTfKbaseG5t7h71F2FTzWmP/5SePwzI4Xk47N/x23sZmiaJKxwhEWRbR
         QQJuRiUEduzBHZANld3zCtNtvKyjp/TzlIGvSTZbDjuHh/HMm1UCufsCskpbPACamtCl
         4ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554136; x=1785158936;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ob5bFJIQvqU9MZgy8RIBbhd3R+SixTO9CYZhiPFmy/4=;
        b=p1C4h8sU+KFVIm9sfiix+vpy30Jfh8TWIB72e3bYhDCp0ubLnWlOGDRvqBFl5mJrtq
         BkB4MYWCBqd2QJmUlw9wSTGU5MnGp52QChZtrFHosS8UodVyGBcCUtxnjqm3922ocuFs
         OeK1bUZMxG5BBIUmlgxRbO84+/89Cxc4i/Ezz8gYfGidnjJhHgdW+/AsC9X8h9Xp2fd+
         0YBjlT+tETq9uKo+Pihi46PqHRbdiCI2llpos9PiGOfA2gXGqZwn6UVMjm9FQ9UkhHUP
         LtO6fEXfQQ41Ws43nBTF46jO+1mVkSRa+YLD94gxHYNvI+m3UWBxgIdc3vhEHryUVSqC
         kT6A==
X-Forwarded-Encrypted: i=1; AHgh+Ro1U3NJxRoLxYBjw1PF3cvDBFNHtDle2n9nLUOZCcPkICouiSoW/obUS23hY192flapdDitYp/2Uwv0CRQnO3y+@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxQh7HPfATjBLCyK8xskKk72/5T/eKdHVExrHiY7uH8L/hx69
	SJdysDR/tWOX++SUtPAKJSXKEwqOa/lvJEMzLnKDMmFjwSTra5AEeb9yft1Eb5+13n7h8VbEe0d
	1NQW0G4YkbNidgR0yEynOOIIDqQaKHNU65dnA/6lZEx0Sjx5VbUw00q8SetCMq3KOxmNHdy2fAU
	+bYh74
X-Gm-Gg: AfdE7ckMQsqbr1F7i6Nxcc+oXbxixoIkhY4R9UlgaHo+JP00Vs6gSWdBZ1lCltu3zHt
	dzNAzyhvgU2XTr7H6pwSpUOC25ccawOsT3hd48UUcg39Y9Jf+RcWeswTVTiVasdayzlMZXNf2zk
	0jIArHOdDhrH2Z2TybBB7AlUazlzcnaIvSrjcawsYiRCx27Jbw1icK6b+JWxasKl3CDVFK6i/LN
	aRZmo7tfx842K61knOZ8bYefbZ34URIQL6ltqsePWCltBh7Hgf1ZdBvJ335/cUUwpZM1bAxCVIr
	vuTtaGcLhlL++3ce1qH08XIYPccKPkJm4va2gKaomTpclaNs9t6HeOBcQW8mHwP3+uz1hEDWdMJ
	iNbXwXH2j4XZY2WP/lneAxsPaPHDeCekP+YYxj7+EJR7kafqX0pxhf004Z9qetqEx0ObJKek=
X-Received: by 2002:a05:6a00:4f85:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84c29263340mr13371264b3a.4.1784554135650;
        Mon, 20 Jul 2026 06:28:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f85:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84c29263340mr13371234b3a.4.1784554135098;
        Mon, 20 Jul 2026 06:28:55 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm5628822b3a.43.2026.07.20.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:28:54 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH v3 0/2] rpmsg: glink: smem: robustness and debuggability
 fixes
Date: Mon, 20 Jul 2026 21:25:51 +0800
Message-Id: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8hXmoC/22NQQ6CMBBFr0K6toS2WKIr72FcQDtAjaXYgUZDu
 LstxsQFm0le8ue9hSB4A0jO2UI8BIPGDRHEISOqr4cOqNGRCS+4LGTBqB8tdtTY0bsAFoYJqSx
 FLYEJ0UpJ4uPooTWvTXq9fRnn5g5qSqa06A1Ozr+3amBp9wuIvUBgtKBatYpz0PLUVheHmD/n+
 qGctXk8JHUC/zOxatfEo6msKl1Cc5QnrXZM67p+ABK2Ab0XAQAA
X-Change-ID: 20260601-rpmsg-improvements-643a6e133f66
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784554132; l=2496;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=XkxFWuQQ5V2sV7Tw/WjkG0JWZhzkjp5XxiJlpuhC+0o=;
 b=ZrXjY3Cmg7ZedvMheA51kknxcE6QEHXsihs7uE3i0McVnJpr68NpunZzWyVqznI3GbMgJbYIa
 V9lIh1aZ9FlDeuNqkvNVoeF/LiKSBo8VeXKi9eeaMNorORUDVylv1Rd
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: cNYOUDQfC5NE9xe9rLGEHqxJIoJvN9Yp
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e2298 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4IQXiXoV75r9DZKdYggA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX5ZOdVDVttfmn
 4UJNGu1RWwMS5DNyPZXKd/f60l6gTvzh6ymSQ8gtsSp6hTK8P4D1q557zNtH6Li63AHkI7hU6aK
 Ve+jPl9EeUfN/YqRWfxQD16I/uiGdJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfXyEf/aIJNM9Uc
 JQTSLMdRMjLv6jK5pgGPdBEz2FNQAz1T9p5IAlMgzJfKRnwVJCaVRWdZU9mr+2hPGX7g/VTEVXd
 cvV8qJIMKNVRApBBEMPiANivjlOdPIZc4wWiMaFeL2gTI9jWyWWVRG8sIJLmgwZxP3rJ4hnv3oE
 dkXd8c6GGcWs+7cX3+bXxoCrLJTbC1OPdZ0zOyj6IOiOjzvs1wUyg2Zxs7sAitTNWj/xzPJPnBB
 bCEhKmv+n97PxJW6uzAMO1P2k/bCitzTTp7I3o/1mMuoHQVPbjeVIOcdGelI8MfoxosS1UYl49D
 obeBuf5iDeZI9zwUHRCGpd9RkgF39yzhGttwy784CVDQBmC7FuLQ+In6KZxVLRxEb/600E8a73x
 cOFDqrEH5Qw64HfX4y/9BUGm/eRdjhEVARCvCAg1dwxQp72QjwUZzu8y50z94NN4Kx1+Szg4Rzd
 gyN8la26kjrcuaE0N9g==
X-Proofpoint-GUID: cNYOUDQfC5NE9xe9rLGEHqxJIoJvN9Yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200150

This series makes two small improvements to the SMEM GLINK transport:

1. Validate the raw FIFO head/tail indices (and caller-supplied
   offset/count) against the FIFO length in the read/write helpers,
   so a broken index is rejected before it turns into an
   out-of-bounds access into the FIFO.

2. Pass dev_name(&smem->dev) as the IRQ name instead of the static
   string "glink-smem".  On platforms with multiple remoteprocs each
   SMEM GLINK instance registers its own IRQ, and the unique device
   name makes each entry in /proc/interrupts identifiable without
   adding a new struct field.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
Changes in v3:
- Rework the FIFO-index patch per review: validate the raw head/tail
  values (not a derived length or post-normalized index), use
  dev_warn_ratelimited() for remote-written indices and WARN_ON_ONCE()
  for local ones, and bounds-check offset/count and hlen/dlen.
  Retitled to "rpmsg: glink: smem: Validate FIFO indices before use".
- No changes to the IRQ-name patch; carrying Dmitry's Reviewed-by.
- Link to v2: https://patch.msgid.link/20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com

Changes in v2:
- Drop the modulo patch ("rpmsg: glink: smem: Use modulo for FIFO
  tail wrap-around in rx_advance"); per review, it papers over an
  unreachable scenario without restoring a valid protocol state.
  Proper RX-side validation of chunk_size against rx_pipe->length
  will be sent as a separate patch.
- "rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants":
  - Drop the trailing comma after "skipped" in the commit message
    body (per review).
  - Add Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem
    based transport") and Cc: stable@vger.kernel.org (per review).
- Carry Dmitry's Reviewed-by on "rpmsg: glink: smem: Use device
  name as IRQ name" (no code changes since v1).
- Link to v1: https://patch.msgid.link/20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com

---
Chunkai Deng (2):
      rpmsg: glink: smem: Use device name as IRQ name
      rpmsg: glink: smem: Validate FIFO indices before use

 drivers/rpmsg/qcom_glink_smem.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-rpmsg-improvements-643a6e133f66

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

