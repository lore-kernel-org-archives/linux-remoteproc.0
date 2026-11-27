Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771622;
	b=lcBvWqDAGGz3UyZ9BZsV+f4ijcqNP/KwlwRyIDima1/1mIMGyIYwbvtKkCZrCiiXHTYm
	 kgFTOKD49kMCLSy92qxt/MCmdlKEOuwQmDhR1rmbhQqr6KfIezoOyVrY+Ll0fO//vei+N
	 bf0swABBvA5elhipwPI/xZ5+5tj/ZXwnRo+ipadT/GbvdlnnSj1yqWzNuloZzSunvpTBn
	 kfML0gMW7VJlG4WvyXwOsc5rkojqE4K1lJp4LpjZzEU2md/To/WmzTYDTu1VomLfLSpuN
	 1+1dL3Awb7cYp/Gar2gG1mJLdgYGedHx3Rj/TvLfRRqytVARg2f+FsL6fX68QXOhmSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
	b=rRbxlJJznkEq8x1hKhZvsn/LndENg03plGHxaiBp8GCHkmhVxVoHSWfu3jA42vJbbLO7
	 QgW0GABcgzE4zdaydJyOWyRSNKtYw5Wm0MN8P3LCd3fPK0Wrk3TjOXYv29yTdffYGTlai
	 fdKQdBpkirBBR+bBMG4cXYcyNOQSvn9I7/YXxoZyuhOm9vAQ3vV+ipmJj4O937w7/VwC8
	 ib0KF2jJckAL5Po6L5MI6XwZUVqYZqy0p2NQPe6K2U9QoOkGZXrBzKZ7AqhBTQFCTbCyy
	 JD0OJvGpuRMpSkw8iu1Rf5f4arnl4Zyqg1FgpeH3dJOB4N9Mnika2GwLjkgJbGX+0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8zpJfpN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxXWRO7J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E675606A689
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E675606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8zpJfpN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxXWRO7J
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gopr560373
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9
	VWAUDePA=; b=T8zpJfpNH86tsUX9NIQRPoFRQLKjYlPx+9fRvOHs+3s7loj72+N
	5Vsepw7yQJ141cc2i40vJGJqkExf+YJzxaM4uhNy414XmlBxToj0vUGpMf+KaEyD
	Pal5u7OpmjhCl63GrzBHV22nJmX8g9U7qNLpO0zhie+JScv+h+0Kn8XjwTcZXFCe
	OGaJbNv+3YE0ahA/iqwb8MZ55demfXz3VoYsT5IR/4lFs/l7eECrGIJTC2W12L9q
	ZMfIMHCaIoPxWqYg94nFv6qdWfm6PsRi+SS8Xj7308wfwemCr/qv6ke1iPJo4tO9
	3UUU6jSacH9kPUe6m6Ro0/6+XNhtCHZGyAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk80t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:27:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so19779823eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771621; x=1796376421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
        b=RxXWRO7J5fQe3CLoP09Lqw00KW+cscvW7Pziz6zrn6ZMIjyYvBV8vdTiBxl/x/Oy49
         R0zAN03hcVb5R3/Kq9eZ/jmWuavMVZ5r7mLq2/VLdybI5cv65KV3laXu4YhBowdf0CZE
         ESq6rjGvRox0COsqPLw5WSNtYA2rTJWhQnvN3X4zNPP65QnB6QgTf90oxjuEHB7vofOS
         ezID+M5r8oj4F/UvVW5cO/oVsSP1PX+aWds3Sr/QKkvtBBZMajuTfU+xE1a9TbJOOdF3
         A5ZbsPV3Qrdw6/V4n8Gq88cBxU3wG7TLwcLsef9xpALXssqZMASVd3IDWwYWaQZOVZZz
         5E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771621; x=1796376421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
        b=slsToxuQ9su4sKp4hG/aRfiuHr+TirljGRaq1vhEzL5Xqas54mdCAeevWlV7mF7klb
         QJ7E8Xg0aNnFh8LZZmEEOACaUeQeri6NEq/pgXW9UOHVOBo/CWRcYIcw9rKYCJ7/Ej4Z
         bJ9PcoP5AJUhPNuH8DnMvFs8RueJc0VKIG1WE9DHbScMXuUChJD/ji1Wuelce2ixHTOB
         q7GO1jS6w6cuiuhFgYOGJgsrI17cbDwTTXebtye5NJHFdYCWS9bNOHE4UOARD1HFL/Ax
         qkqPFr/90Nu7RVC8jP5NRqedMYClsC029Vs0JKF6uWjWlilx2QJR8+cXhLBZT6iTgnir
         IPvg==
X-Forwarded-Encrypted: i=1; AL+hErEcNP/j6Pupi1dhfRVO0I+YildhVOVGK64L3UuN5+eem4hYptOb9dP4u7gZezV/9gH7w1IwTVHEZquJQLRQdYoM@vger.kernel.org
X-Gm-Message-State: APuU4Z+F4xY/mYMz0dC98FaNic5sAUn7VOy1vPX+xXCxrgGvcWKawJgb
	zOFXlADXydC2caLQxh57yoHrQA2+kl9WT1liobDc4pdH9UzHQb7uHxNp7Lyl31S9RX0eNXIZwln
	0E64wEoUVvE6etC7RZFNGTlSGUBPeAVjtRGGW5DFlidozqLrhLUHHBc6ZQEfM/EAMABRxSswS
X-Gm-Gg: AZFdTZdPYdKx15qaerllhcH23UsmM0q5NYzughbBIJC5TMCvJ55wGPSsYfLNcNhipR3
	y8TOl3W7fl8+Y/n0YgQnFETKTGnfen8p+fsTCy8p5eTu3Q8djUeuR4I2GpGfS6hdk91kHk8OtHL
	YSHav9396EQtRlc+LpaM7USDppA6f4P9CJZAJhIJ8GaPO3gh3R0bRzGpA58S1UMdZ9RHRK7P9kh
	kVr1uPBXLI34/RbXQXy4/27X8CEkmblLMt9HT7V/JcvgwglZVJv81hCvs4G5g5c8L37IsnOa5mv
	zqklnlDBLQZl4h5xarUQhlRQi8iel7OIK6gmmqCBtoMvgpz93QUtIaSqGcmAojOyg0YxszTx3Fx
	ZnqVSG8FhuPXAXywA2f57AoIXTlRFVs18JOsxUmYKTW8bCLU8MsCgx9HAN1UrPwKbVvUmthpYqg
	dzZBzoHj4qbzYu4nx2H9fiMnT4XqP/guyS6gcs9Q==
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr30315247eec.4.1795771620736;
        Fri, 27 Nov 2026 01:27:00 -0800 (PST)
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr30315215eec.4.1795771620194;
        Fri, 27 Nov 2026 01:27:00 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm70192186eec.23.2026.11.27.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:26:59 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: quic_clew@quicinc.com, quic_rmaina@quicinc.com, konradybcio@kernel.org,
        sibi.sankar@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Don't mask shutdown error with SMEM lock bust
Date: Fri, 27 Nov 2026 01:26:56 -0800
Message-Id: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QCpoF-NOL5Qs4fBLzJ4p3DGyUCPREbBt
X-Proofpoint-ORIG-GUID: QCpoF-NOL5Qs4fBLzJ4p3DGyUCPREbBt
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b094ce5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6raA3mogJySG5YeH4kkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX1RJMFUGc3g7V
 wNp8AfgwHSBig2P5okIj8lHJGIHsIDFqRFPkeu2yklO0mdthTbiFZzajebJ/YvcRhhGqOhuRi2k
 mbOCwu5QFNgMS4l/mT/gqUFgehpJJyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX14lfIAMQlMrK
 tSPCPbOG9PgJNhR6BHdnclnmbvi3wlP25sWI0w9SvUA8DHe1LrjBXyTgx0LwUHoJJ6Qg6t1AnFC
 /ct0GJ2jkwUaLGdwUuCuytIbiRAFkMPoSN7JdK03nIdBKhkzz0y7Rt04Zp+ib7A7j2Gq0I4qWxE
 /pMLhdoIQ5Y6m+GbvWDdmF6O1Ayiqh7GKcbqR+NXsnIQJpniH8FQ2Li1R+auoWs9FH8Cv5qVXja
 D2e7a7jPniXClmzEdvJGxcjsIOX1D7tp1X4n9dJTxoiNvcK5+7+pTNWhKVsvgudtqRMzKDVjFJh
 jR/hp01NGT21uhHo+TldKT8JOQtH8U3eCZrHbs1d5U2syDxmfSAuYCqyP2G8Dcb8YPdfPdBjno5
 Am9xXtsne8jLuHFqrturmmADNVyIk75bQJrUzb+MhgXLTaBjwMMx///Go+191kMqMTub6sAqFaI
 J0/6SVRbUPXr/JL8EiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

In qcom_pas_stop(), the return value of
qcom_smem_bust_hwspin_lock_by_host() is assigned to ret, which discards
the result of qcom_pas_shutdown() (and of the DTB shutdown) collected
above. A failed shutdown is then reported as success whenever the lock
bust works, and the caller carries on as if the remote processor were
safely stopped.

Commit 9db31edf92dd ("remoteproc: qcom_q6v5_pas: Fix error masking in
qcom_pas_stop()") fixed the same problem for the DTB shutdown but missed
this one. Keep the first error and only report the lock bust result if
nothing failed before it.

Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/remoteproc/qcom_q6v5_pas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 232bf9b349cf..80740c1bdb1e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -464,8 +464,13 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
 
-	if (pas->smem_host_id)
-		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+	if (pas->smem_host_id) {
+		int bust_ret;
+
+		bust_ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+		if (!ret)
+			ret = bust_ret;
+	}
 
 	return ret;
 }
-- 
2.34.1

