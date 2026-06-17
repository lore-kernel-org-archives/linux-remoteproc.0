Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A41438AC7D
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694444; cv=none; b=pIoQzfeTI+QZnzGIQwN36SCA016sY6S78wwUjHswHSsLULCw4NV4y0Jg7XFUT53nYD3822h/Kk7RyZKnC+GabX/oPezp+htiX3kMhtNx+1JIv0M3RRHVXTtvjM1ZZpFf6vh1dNwI2xU+OlkBkeRmLF/H5r/nDhNRyb36D4/YS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694444; c=relaxed/simple;
	bh=aFCdiu3lE6iqtTzW/LxyPmgEKxVN6MpjkNd0DWaLNzQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ghQTQVs94uDVv26Wdg+mseW39W0yKO/vfXGvze5EW4mMG6MdgR/ynr8l7Nf8+11EyBLiu+zW+j6GiD6z1ts5LSD0XW/48DBHG72rkle39yopHnol0vQ79gWnMhradRShmR8ZBTBQkZ3SI4OCeZUziiv09BwoGR1RV8eO08Vm8ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xqm1LdYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iACnzUjA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xqm1LdYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iACnzUjA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VZHQ2190768
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bg98soEYGpUVZzXvY9pSA3
	tZiVKsw4OWtI68S3Vo+F0=; b=Xqm1LdYIxD1WjlE53utRXeLaJL1a2U/Q5EHI3R
	SgZxfprwu7Pn9ZSfO32AyRUNvCGLA6RqmaMt1VOLnXgzxCgvazpDS9m8jHkLH0Yf
	ja7GYOg10dfbtcAiEGxnugUZYEaxu0jf79vhI3OP6Uf1BgRtusQEK9zMK+Rafddd
	7CmpxoVo5gFtJGsJhERR9ItG3LuVMU7MvFhswLcU5uBzNu2+izNfWIwayUDswk7t
	4JzjBoZmBfjNxtVvUA65GLEcYH6ww0CSH0P1kMRvGyCoj7d2qSzxmD+1S4StkCwP
	276TqmmW+VqFHs6snwhWLoCsQniyEvejmiZeHxfYdNNvsk7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjtss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso5516234a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694440; x=1782299240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg98soEYGpUVZzXvY9pSA3tZiVKsw4OWtI68S3Vo+F0=;
        b=iACnzUjAJBqi+MIXProiSGR91Yat4nZ9EiKqFb3CCdcyXOcDq665GQusPyKJyKPufi
         mp1Tjo+HiVtFu7IEjjR8anm11p0hAKBH9jtAWLA33kZ/z+9gT3Oiaf3CKROcgG8v1PcQ
         MPlu+U5pUqzP+BCcLDXSV+IJUW29WPojfRIASbT3AU8jdbKEu3XSq4wGkoFVyGWJIlmU
         ITnVj0JcLrFdXCBimWp+QNBYX/9eFfSX289/Gt6YfWGeLrhRn0RxI8mHycDbPAGwS9V9
         hKvY5y6RLLEZL5aU/NPK/pbXAXG7TN9shgg0TEJYsMyTs/kGJXMHuwLoMRPMGeZy4htP
         hCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694440; x=1782299240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg98soEYGpUVZzXvY9pSA3tZiVKsw4OWtI68S3Vo+F0=;
        b=R20nzZNulloR3DNdYLz5Ms2trFOZIttj8WntCQfypHACnMReJaJw1hW05C7qsbM8sk
         xpLx9gPSXLj7T24Pg/0S87qO71JGjZzwbK4RHuqxeFjWUnqrebResjby0uMpk7/DxZFC
         HOjnAz2yx4k+7nYL8b4JaQSYnUeUzkcyapuVgjNiLQpK5/2FUkksVHDRxn3fDCLfGfnj
         kknjzIFYQk8mlL/wPxanRTtsiDuoj8jAH6v5okkGg9Kqm2b+fAF0GfemHjEQ9bmYCrs1
         CIFH3Ky/Ek5PHsmPjpR9uZRE2pFlAPt5agrYRNAThqy6Tp/AYEQm9iB9wzZJcm3q9Rvy
         Sz9g==
X-Forwarded-Encrypted: i=1; AFNElJ+GJdFUMoUeAjB1GKs/1Pzy/y+90D5Z+iurPmOT26FFnrPNpSEJfRhSus5QSvJVwmnI4XMNyw5sCIg3YSyp5VFc@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7/yIRc4npd3KTHYNEmEIJ3KvQXXcdSfN6irBv+HvT29ay7Gu
	bsHo4YHyGNR1YrHllv+Nv0iMxskAdMk5zno/Bsb8bZlkSsA8bVm5fstDNA+LcdDV0hYqfRAXjyR
	j5NHJtosGQN0fniw45GQMdbATdqBHdObAxy1K9R/NvwVojaWHRUxoSliCQo5kaucBqO11QI2j
X-Gm-Gg: AfdE7clWAyyhA7kJN+oUU2xzkAeEpXLDb+GkFypJhGcx+iaxjQdTNsryWLW7kRVfFt5
	ugxaTH2yQMc/BxiQn1EsMfvjD/S6JmISt98jLvwhACVniRGTDUC3oObdRAIX0VhRkz2WUHW+hLE
	2+GlbAeB2cJpGz7FcQzoEPaq2tcpiOweA1X/ZkEeUhGsyMezUDCefKxL69FGAevzg9I/avPthRR
	CPrx6+sKq2WQm/Adu+yn+Tpsrehx6eIFIuThqiPC3T3tLvuMXDardAnnARlGE8XD3v1ZCOWLeeW
	f8lteBH7i3PXAWc0Vy46nlJu/IIiltWnuv2cXX0QeheCnaxMwSP+lAsdSDwLxboJj47iK66VeRN
	fdn4augMk4Ubc7iBt5CPOm6392J7A23Z5/MnG/ieK0iVK6gKf3RIwY0IP+7EqnCHnEBgKllEL5X
	JwK/1KFg==
X-Received: by 2002:a17:90b:2e0b:b0:369:971:4888 with SMTP id 98e67ed59e1d1-37c9366b933mr3395043a91.15.1781694440261;
        Wed, 17 Jun 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:369:971:4888 with SMTP id 98e67ed59e1d1-37c9366b933mr3395013a91.15.1781694439776;
        Wed, 17 Jun 2026 04:07:19 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm5577639a91.12.2026.06.17.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:19 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/2] rpmsg: glink: smem: robustness and debuggability
 fixes
Date: Wed, 17 Jun 2026 19:07:12 +0800
Message-Id: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOB/MmoC/22Nyw6CMBREf4V0bUkfpkZX/odhgeUWrrEUeqHRE
 P7dgnHnZpKTzMxZGEFEIHYpFhYhIWHoM6hDwWxX9y1wbDIzJZQRRkgeB08tRz/EkMBDPxE3R10
 bkFo7Y1geDhEcvvbTW/Vlmu8PsNP2tDU6pCnE925Ncuv9BPqfIEkueGOdVQoac3anayAqx7l+2
 uB9mYNV67p+AEy/8JfNAAAA
X-Change-ID: 20260601-rpmsg-improvements-643a6e133f66
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781694436; l=1910;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=aFCdiu3lE6iqtTzW/LxyPmgEKxVN6MpjkNd0DWaLNzQ=;
 b=mSx7kXRauC9GCN+NXuDAlCe0wsy8OHvjSkdn3zXVhplASnSJiMHoq+9oFdnph7/8mNvrNsqku
 huW1inFogmvAsb7XFSp1LeGA0fj3aeuvOKNg7avayiMnez33x6OmUjY
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX6sztGXezNWo4
 W07mxChQhIXdGN9U2ktoyYGZ0lzDtMtPilRT+kXz7rjbTiXv9P5qY3Ts1X256Wehs99OSNKPjuj
 V+zrIx34P1M7KQ29ve+KrCe/QYYnvuGrMGZdqn4WpaK9ze9f5msLJK05xw0+mzApo4jWXhzv8ur
 919b+9uuyt1TyjHg7kflkTsan7MHfJzVq9ho0NW3VTQ+bo1N7Uc2t+AtkwK3u0FW9yaRGU+pDK+
 8YJV1kymw8FiVtBIuwP3Tx+a5cYtH49Rlp20CiPUt8JzrIzKmuX51HnHfdN3Mra9lzpoxrsBfEt
 wKN4tB3EXqHJswk9pYKVhcrXslz/39jy/KrqWBL3OCAyBvM3XeZ6SjEGjeliEluyL1v9Xa8+COK
 EQqbWYLbdyvkjqXcdVdzt31PGlS6U2klQm1OZp22XgF2gMl9kPKdMlPW7Uc+mxM98y4M5UGbDu+
 zze6b8qUcqEtRmRyc2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX9oakKJ8k5r26
 iW20DqlX7rBB2Ro3gE1tdCg2q5PRX9eInY7G4PzydMs+7R868/RwT/LOdbcStk/FqPZKdYoCw+E
 5brHcpN6j8QUxo+vHz84YwRAagYElcY=
X-Proofpoint-ORIG-GUID: kwis_s0RgLyPSGhVTvPlB8iPDFu1N8FV
X-Proofpoint-GUID: kwis_s0RgLyPSGhVTvPlB8iPDFu1N8FV
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a327fe9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4AVfmZjCmJ7tvFRkCBYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104

This series makes two small improvements to the SMEM GLINK transport:

1. Add WARN_ON_ONCE checks in the FIFO read/write helpers to catch
   and report broken index invariants early, rather than proceeding
   with an out-of-bounds offset into the FIFO.

2. Pass dev_name(&smem->dev) as the IRQ name instead of the static
   string "glink-smem".  On platforms with multiple remoteprocs each
   SMEM GLINK instance registers its own IRQ, and the unique device
   name makes each entry in /proc/interrupts identifiable without
   adding a new struct field.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
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
      rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants

 drivers/rpmsg/qcom_glink_smem.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-rpmsg-improvements-643a6e133f66

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

