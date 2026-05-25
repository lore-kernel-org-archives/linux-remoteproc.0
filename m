Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B73CF677
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694727; cv=none; b=n8oR76jwSYyz9FLtiMnwmfOvfr66GFJIEV5NWWS0Ce1eZWCcmW3E64sIhD1wTlfhunVZcAuw4wbneYd3/B7IR5ekomlkmOJKpDbGTsR8Hgyb4/1NXwDABxkAORkqOSO8kvf9u1hnfyQkhAL+UI8iis+SA4+8pA+VlYIBrGxoogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694727; c=relaxed/simple;
	bh=6boc4WIzd0JfkKRrJIJ+H7SrTid2KQ0r4H9mW6NvyTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzAsNCdafC0ApjmDYCx4SJdSrUFkhWGvu+xaYMtBLV2aUr0n7FfcvOH/2DfZNoKIAHQuJGFiHAyU/3ukLWnHmnBkq/f6hkXPvMGXNLsYUPhfRBcOFaF1zrOdRMyAon+/Nr0PIy9H2CmPLFu70ce1/NRKU1mRNzYaEGDTDY0lYlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzhOOWa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdLTAb6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzhOOWa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdLTAb6c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P0ZCM01498348
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 07:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyx
	PiX5/aHM=; b=HzhOOWa5lw0+fxNqQrhpEzl6OAUmGK6YhxBYc/MdRe+zoNE8sfU
	WRNLuhaXBkxjl11N/RfrJovXugnBglS+SHPrvhenbCfl1mfNyRlzXCmTCrf8SEp7
	Ilj5rNcQ5iSquY3UtYrnkrpiKTrMMjsgX1WYDoUnJigPNIJ3Boz0cZ0Rm6zVW4pP
	fK808dXkE1oBoO79dKl4W4XND7NOjn9vYF0sx7FCh9gB2Mt6ASrwD5XBZHd8G/rP
	a2UyavRsHFDS5qbZ0D10ZB9AYD0gaunR4cAnRyU39JJc8CWe+1TblzHs4kBrJZwO
	NEINjLRmizpepfomvA31W/ZDaJRDNT87PqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386ntdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 07:38:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso10793773eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779694724; x=1780299524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyxPiX5/aHM=;
        b=VdLTAb6cg5VBZAYX5lAHiW0lNwITzuJ0tp1Kiys8kkkHk1nhJhuuRB9kpZ8Zs+zBTm
         twqTGgV3pw6WF5foK4d8sPiAG4ej0kOd+7lFaS2VDvhkAJCbV4mLAAvk/zyvBOCmRv4l
         p/8ddBATk74yNobQ1X2RZTKWhO6sg6Bth/CMzx8cT84Ry4mMIhhkzDDTPVVMFdeap/KV
         O3OQv1UaxuR3QluAUFtyvl12NChMnlGQsXCXS53DMLynxdA2pU9IzoAy8OIUzcJbQdyt
         9lHdTqVYlJWLn7AJ7InoRXkX6P+bRRdCvAtrlaJZZqPmkDvYxW4LVlbtrZfY1jkHGjcL
         ESPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779694724; x=1780299524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoPYeAAd9cGruMR0s+E8XXpcAyEuOT7yjyxPiX5/aHM=;
        b=CJDjQpbbfJqNnyPbnAaPRHYiqMD6IZN/pmLVz7yfHrCYnFZZbrMiLRAHNakBe/ngQA
         4fYWNKlrbESKIUUQMx5vi3QxkzgjNilalv9Mts4gkA8tTod1R07TXLfqaYVyB2MlauH5
         aKqWd3h/ziM50rh3DOLXTaznSr1JVmRQ79K+KU8TJu91vzAHwn9XsK0pKBTe0uEXVv6Z
         KbzRVLX94GX4inhBlaK2bL3HInmKeSDvE/n5fPMvyOU63kUpnvDrL9VkoNqpTOgcWe7y
         4cTkOpxUxEYCbGAy9oKrVL4EihiNo3SU/nKuVN/AuP6EoA6rNmQaMcSZ1E6EzVXelIAI
         BITg==
X-Forwarded-Encrypted: i=1; AFNElJ9y3/duYfAug5vkVIgCjc1jEfLsO23ASrwAqrKaJ8JwnWWp8lCTTEdsWLt9axduik8EtUFTuzSiEVt1XIsbQl5K@vger.kernel.org
X-Gm-Message-State: AOJu0YwrIj7O2rWUmOTbX0kPR8kQ9O4BYiDbBmxZ/QL9IOGR9cseSaql
	AdA0AKKaHvhfToxkYdVRwQEE9Oj9g8yzh1nuHe2vbhwGr1XNhW7KFFiZfzmQB4BRXrIVuz9tPoN
	hHLJRyN8mqZ/E19q2DwE5nOFAcAm5Tp/PJhSjTnwbhg8+eBoMD4xyiG/Z2velOQHUNROa0SNIDf
	n0IEg1M4M=
X-Gm-Gg: Acq92OHBUmTa4cwlDAFPzma6Y9x/2PM+l7SA/Qw9SYWrBqJOELXMFHezHua33jpErj5
	hcizpqP7w79W47//40V9A6H1W0NWRrwvEDDQ7u2v/buTlJZ+WBPAUNxz9sFu+QC1I2+kIBNwM++
	cu6dhdZjEq3/V51KvzNT1VqL3ZE6Dgl9pCslDFKVN12r48/ngLU/Uw9jZmOdqFFRgYtjb8pMg7c
	UGZ7qaqmfMhK1Gosmdz6fnUcx8E+vv5M5N253Ath7KvP9Z4VF0ffeY9I7MVn3+gHU9aWM9hqOxM
	sX+BRBYU/gy60dTw9XJXTe8CxpLtRz31xiL7l8tvj9jCmFYWZd+FGHIN4OAds7/wjqtbAymyIvL
	vsBoXuOtw9T3fH7lsVBKVnbsqwEsZDYH2hL0XrNeIPzB2MDNw+SgD3NtwRsorImHGbR6JhFyROs
	+lqrhgRQ==
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id 5a478bee46e88-3048361afcdmr1525665eec.33.1779694724143;
        Mon, 25 May 2026 00:38:44 -0700 (PDT)
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id 5a478bee46e88-3048361afcdmr1525653eec.33.1779694723660;
        Mon, 25 May 2026 00:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef5492sm7113853eec.6.2026.05.25.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:38:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
Date: Mon, 25 May 2026 15:38:36 +0800
Message-ID: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dAAZQ5v2oxfOvX-PPJxLuSRoNUidv0if
X-Proofpoint-GUID: dAAZQ5v2oxfOvX-PPJxLuSRoNUidv0if
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3NSBTYWx0ZWRfX9UCIZ/7tM8qQ
 UD9Jv/W3Ce6fAMu4sGHVdqM66ckFkI+XE+m2CllJrWXTxXlOxjZLriuq/5KMwbRkFX+tEM6rN3d
 qsOSmRl9vJ2vZJYLGQK+Nlb0N+bFwCPfJ/9dNlKT0ROMWZgcrLSZ2yOW5Y/Y96Eq3t9ob1yPrFH
 cEiXRh1VKwNbDSTKrWxzn2AymtYb6gOVmtufZn2HuoNIJeIoEePLuoe8shi7wOkugXZWIZmVGbc
 tTA2FL+qj4leLMbfgzwBSDlNfl8okmqBdn/gpQhciCbBW+mxuQUiTBQ35Rz1l5+9C33k6WEgsNk
 GZPW1Aa9YLiUN2pVRmVvXLl4e2YI0YeoCmKTrN1L2IJZjs4rg/ULKQLjnRsiehwTv3TaOKWzjAO
 M9WZmNnDZ1Mf5Ahl+Aq0zEFa5Z6FViwvv7GQCCt+wev17C4/xLVmVy3BNpt4O3FMb7pDeGn2z9F
 tXfLtSDI7QJDslR1hXQ==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a13fc85 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=awQiEI349jCaSHzWWtgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250075

The completion start_done and stop_done are leftover from commit
6103b1a616ab ("remoteproc: qcom: adsp: Use common q6v5 helpers").
Clean them up.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..dfb9c58b67c8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -92,9 +92,6 @@ struct qcom_pas {
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
 
-	struct completion start_done;
-	struct completion stop_done;
-
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
 	phys_addr_t mem_reloc;
-- 
2.43.0

