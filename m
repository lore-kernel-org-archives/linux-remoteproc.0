Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F6345348D
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481691; cv=none; b=qcLDIAe31yNTsaJifz8YjRpr0HrHQXKrKJrgEABcys8B45ZRR45L0VqfECZcwjB5jAT4JtN3wGNvqMjFxqph/ag7OdIPxynLaJ/g3hDorxV4byrqQxSlTr3X6q8i80Ae+ms0+3U1ldmQ4tB1YdgVO/D//XrgE78HpeNs3hmxeF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481691; c=relaxed/simple;
	bh=xryvc3WEeX6Eg2MpUAaAvXQdss2b3pJzRlW6dcfR2XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsOOMO8NBZqzvHs8y8cLZL15bX3B47u76EZ0SN6DHh41HmcnOa6mcKKEHAIKmhHgoX70xATqv0KN0hyMfW/9+FivfPPQWnWsLnxkamTMUc9AUsc+7S4sCOcr2k30Hy//+oCK2JUd5Q8yWQI0xwjIhNp4G+T0j1jfX+g3s8ksjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMpnQS5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZZoQxkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMpnQS5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZZoQxkf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536ROsv873796
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 10:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=; b=iMpnQS5DgUZjEs2D
	Qgu9qR7UF2Fet8Wx3iS7N+ZwF2u6viHKrCKoOJ9mLvJAQ/RNHsma3t507XLh/itQ
	cCAYaw+mNFdVnSZLBvHNk1jBdDneBXKf9Yu3NmjZcL5RraHaDauaMTSYi9QNhhIv
	ifXSPv9oY+LWjBsoyQL36x8+0xGt9Rm4i8RphoVaVnFUFq6n6+uh5LKV7dyVDgNV
	sprZHNOFk/O6F/AyB/LoagTfhBOjd1Z+fa99WfeKqpNtGsfTZxBRNxtfdgGnHMn4
	kqqnkYd2W2eirzMbttwhp85H3J2UKdAcXrpPV60xHFXIuhndttKz7JAegzPb0AJm
	tORYdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jxcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 10:14:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2530614b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481689; x=1781086489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=;
        b=MZZoQxkffj9yO4isAIS6XvrMDS22zvD64YU4bFLmDcetS8eu9oREmkYhVwj+QPKu8Q
         M8aryS+8Tx7hNsK6BIMmmdREtiyrQn3i5NFoXtZb1jkBVhYOTunPIP5ErOJ+nWXcL24+
         LKieJoyN1k6RvbEFQLqD3NAt0PmjD6eyzT7kHuhajtZBAIjXb+KT94bmYOLhwfcGYa+B
         oLC6g4KJ4OmoFRp0rHszBIwV4P4IQMADLZ5BDETfo8zNCNecJ+aNqXIgBOX4KBSXduZ7
         LSYZ5Jedy+lqDE4jBtHu46e8aFmheGnqYVOnyuu/4We0P8Fy9WC21Lxylxe8RV9ZEvtE
         aMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481689; x=1781086489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=;
        b=Q6QZyOuXCS6o1IJsI3gBW7TBgCCVnw+lwiEcF47LB31RQX9FRigItfwxqbgIraHEE1
         7XncqhH9JvpXD8PYQHt8BDUxKNpekdNebIEH84VmT3gKiNtdM5RiWhZ0zDrRXuvaRdyJ
         vjX0oByq9vA+oKVDOnW1ZcmXyFKnEh7qCtz0FVqjNmRXombuoGAzMJ9AoScvABVa78cU
         uY3OVxfgpl/GKcNedWAFsBkxSn8ABlisNQCF/3v1JrpIjXThvis5Aw6vu0UUMCw5effF
         O0rLL0Hc5+DT1x7otLBBc6Dihj8+ezTW9/8urmpdhbx7JOTreQAjQgiZIM0y1vBP4S+4
         /Dvw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZxPAYretWzQbp3BySfLz6HSEyAa1iEOQ+DVPkZ1Y/KtqOxApBtvDSNYbFhOsx+ip+gRKYBTPH6mYqvCFesqzO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KWfzyvQMT0JKl+LhPV4vLZqgHBe01a8cMLEfPiRdmwc8Z9Dl
	gKR2tZvMgHstqcCcZF4QzoJWioujYVlZPv9JKRWO4Cnvg95ARb1/hs2zPkRWE8TxJOlQ0xjXsTY
	1tMgHP9/tOPL1HHRtoKCW1r1Q9gmJcEPVlNYGgIh0PegG4bHk3uh/mRFviE7XYuLaZvaVMZ/u
X-Gm-Gg: Acq92OGSNzWux0zpQfFpjmkd/f4K0nY/9L8zuEqE8BG2ExxpiWWOmKWyBf38NlBeNWG
	wi4F2qyowPwHPx+MFhZsrHphCgDftde6+VNBA4inawCfF8P0KgKT4V9ejYppIeoF/O1ZqVy6ZHf
	eDfQE+ngbDdKnz7juDe2kxvOfCn1A0hwhZr3mmSZQ8Kf7eCdLhkAQT8a+NeyNY27HybYCSif1sB
	5IveBAmLMca16TRsO4c8qXzj9/hCqowrnvH16cz+KVd45vd8Olc7dDPzaNnNxSsSetRmP6BV1mE
	uQqah96IOojZIzOE5UYNcqNGE9PHHIbfLTKHHqOWRH37ibxNwyl88x9qUCxE7vutDN/yY0ERs/N
	OiKPBiyJ2gDkW7ruLcuxbpvMLNfv4g1xgfvWx7+0EImswgea4BWNHcQSFLAE=
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr2733733b3a.23.1780481689013;
        Wed, 03 Jun 2026 03:14:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr2733703b3a.23.1780481688493;
        Wed, 03 Jun 2026 03:14:48 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:48 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:29 +0800
Subject: [PATCH 2/3] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index
 invariants
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=2183;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=xryvc3WEeX6Eg2MpUAaAvXQdss2b3pJzRlW6dcfR2XM=;
 b=W7rrhdR9oZq9h/xeDM4l2ttYCLekP4r8zRmTb3sRZ/mfXd4ngOI4iO9OkHkxPf/p+rkR2SjVn
 02lc2TjGcE1D/VPblg/3GjpaHaLnOLH2k7yM4w7TbSYwiMofUxiDXGW
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-GUID: bGBHGJF-p3tx4QC3PSzBC2oaprn4qTgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX6nA42c0mYMyr
 JD1zQRM7E4DvInOPptIgQgvH5uk3paZQGEaWDiablBKAU53pvcnQRZz1DiKPB+dRNzpZtxizN3T
 RYs2xwLiu8rZQHb+zWUsLW4OhOf/mX7vY7Sy7EhXMKBu6E34+BBnONNv6WOy3oh4loB0TW9DxtQ
 yxCa9bzF6NHyI9heqnQnPf9Nce1yh1nIo9j5RlxKRcjXUMHlRrjWJ3qEW9JAqNuyu//Wu+4AjnS
 rrlMo9P2s8cyKlUtqv2Uty3S161wF8z2d/xZTnHUPj+8dbBf3mElKW32UuWgmWaUiuc5Jfvemlh
 YaETdvzpRLfU/wDRuwVKTYZfZ/0vZY96eqU+DMqMvUmQXhYX+qDkvbvFjsiNGttuZGXyrgT+CBl
 PHFf7lZNa1NGYsUUoAMiUuw2rt8uKYgBGUAI8nQBIgRfmbRzDPFuuoWyf/S9MZzUmTCfM5SeesB
 Cix3lGmCqVS0BCKftVw==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1ffe99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: bGBHGJF-p3tx4QC3PSzBC2oaprn4qTgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

The FIFO read/write helpers assume the head and tail indices stay within
[0, pipe->native.length) and use them directly as offsets into the
mapped FIFO region. If that invariant is ever broken, the subsequent
memcpy or memcpy_fromio would access memory outside the FIFO.

Add WARN_ON_ONCE checks in these helpers so a broken invariant is
caught and reported once, and the out-of-bounds access is skipped,
instead of proceeding silently.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index edab912557ac..42ad315d7910 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	tail = le32_to_cpu(*pipe->tail);
 
 	if (head < tail)
-		return pipe->native.length - tail + head;
+		len = pipe->native.length - tail + head;
 	else
-		return head - tail;
+		len = head - tail;
+
+	if (WARN_ON_ONCE(len > pipe->native.length))
+		len = 0;
+
+	return len;
 }
 
 static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
@@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
 
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return;
+
 	len = min_t(size_t, count, pipe->native.length - tail);
 	if (len)
 		memcpy_fromio(data, pipe->fifo + tail, len);
@@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	else
 		avail = tail - head;
 
+	if (WARN_ON_ONCE(avail > pipe->native.length))
+		avail = 0;
+
 	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
 		avail = 0;
 	else
@@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
 {
 	size_t len;
 
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return head;
+
 	len = min_t(size_t, count, pipe->native.length - head);
 	if (len)
 		memcpy(pipe->fifo + head, data, len);

-- 
2.34.1

