Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC344A409
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545414; cv=none; b=lK9hE3/8f8OpQh+R1Igzl9Or+Vm5oJDKs8vafju+8dC4BjMfSyE8py3qLHmFnTRNvTFaj07+tPe4cUu9hZqGqeIZUHCn+UofqLFjwG3HPwMpaf0PP55W/EFLuVMg/xvQvNClns/eJauLQzJ7zVcU+Ob9XPjBmC0/ba7Y1qU3sjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545414; c=relaxed/simple;
	bh=HbIfItTOo8OE4am6c9ivPQcztfXU6kk/9gwLzj89GuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ToziIc6qZw8HByB0pzZNgMwqLDUy3P6YEpVLZRMfcHAreErG+qUFncJDGSDxWjY0ew8UXkBizo2YM1ZuAGTr76BOm31PY4R2Riv0RDvyyikj5Kfy6q+n4nX2ilK/6+0MJQsyMUaKpCxdEx5M/VTps76kBasgl7MlxTu+tlhhuLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6FiNCSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvIl4Bl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6FiNCSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvIl4Bl4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69Q8v1192580
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NsEV4uVA6aessXGwFZ9cUl
	Nd6oEQR/Eydv18K2tX5rA=; b=k6FiNCSQo8PYZdB1mUws4tI/J6YsjAo8uHO8n5
	yUITh8o7+zc3wdYyWRNoFno9wLja5Vp9DjLUglaKzw1utmXvLovJxTDXO+VW68P4
	M+FktSOmsPMr+BCqDkXP4ztNt1D4rWW7Kio++8x/J9wksKkraoiz3e6IcpFn9/iO
	vBI8JHu1wadL1zdJD8+5/fUxerifpEa/wokOUJx+c+zguxOBV/3OO8FfkVzja9mC
	KoxIvagHRyFvnJjCUs3Nogf6t/gytNEdfbuM5r1XPlCm6LxDsBYlgmmau6gRswtR
	pKlVA9QeIU+mKmk771bFhU8mvdndL1pTh6Azom1kjsWGVlEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagek4yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 07:56:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4320416a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789545404; x=1790150204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NsEV4uVA6aessXGwFZ9cUlNd6oEQR/Eydv18K2tX5rA=;
        b=DvIl4Bl4T2DWjFlJE6AVfE3N4cgLMVtePluJiWQy3HOlRP3dLR2pIpHTRaPXccytn8
         DVuVPcYTHaABZuztfDnsRHecHioXdPZ7N0ajb6sX9vApRO6ywAg90IYc3ljG/YloKJwQ
         V7lFAQFLJKloTXdo4Ulas1Ku3mq/B/51EYYLVmNrDG7K7oWkaR/7HkCH5GP5BxnDadRI
         k15GQ2jNf7eNzFFWSsqFmtJWhI1ycV5v2qs6PW8/EXVAZ3ljUWTX8GRtsVAj/CK/QWZE
         I0mdX4kyat2V7KZNSKIV/ONcVVLjgvXsiR02JNPig/LzFyqI9iRb8dFUXnyB+9rZ3vt1
         pZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545404; x=1790150204;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NsEV4uVA6aessXGwFZ9cUlNd6oEQR/Eydv18K2tX5rA=;
        b=A3JpdHTAB924Gcm2BSaFC8tdw12m2AAvm/4gaFo56ppQU2hVl7g+QdbD844VcNFcdy
         +GUn+aK3/2esUeHN9QMhjgBylS9Z2FpuOe20vqDE5zXkDGEFBKnT8gkg5IIe+3/eReCa
         fgVwAs+IQaEzo9o2jzPghbY5ZOrvm4qLU295Fs6JwSOahtjI2h+13Ublj/NbNPxNV9Ga
         JLPFPESPKBEYGwG/r7MKSCmllELlVwr1OiXKe2X84rVKyib+evU2IGF5kZWopjtHfuXP
         wKF6ymDvFQP1mp+/mXt5J6834XE6O2xOJ/IZs2DwAtk+aaPLt++SJW8vyP9o6OcJ37H4
         G10g==
X-Forwarded-Encrypted: i=1; AKwUvByXr8Ygi0lhPU7Tms8rDNzDjTPvWh0s5t401AVsRhFNvwOTaEd4DyePrqgL3+/LWjZ0DxegMczOm+rPHZfrtEuc@vger.kernel.org
X-Gm-Message-State: AFuF++lXyUQGbtDRYTj1RhQ8zaLxk3kKeh4YGODmOG02r6rVMbRb3S9Z
	4jir8uc4sov9U2MLyN6mZWgFnYLJT9Hk4QxBoUtiQgXslHFCNCa/s/LTAeAz2m8WXlFIm5kJwiE
	BhxSPXlTrX/xXK0tvsNIz+fQP/AAoGbFB2ywvyoHNLpCvPwsGOup/JJ85I7V1iEVV/OwR8Sor
X-Gm-Gg: AYBFou0txC5OmzsLAk31kmBIxH0OEkvGTTcFIcWWxW1l/TKRQxFKGKeYtzkEVwVRCaf
	Bbsqhp8bnZL4y8/sak2j7/73jF8CsUXjakfM3cFesrPVhUf4Y1gNIAidb5vDTBEev10QH/rIPJf
	v7UVT++7976OObprOc98c/m8f2EpAeRRvY8YSDG1CE46lJtqNSZ5PhZH2gOTcbu2ezpEITpWf06
	vxJlx9kDey2pOMBcjYHLx03zvXSnMzs9shhdfwSimRIZXSlCfFhkMBeOaTKOpzD5WK1fFc7qg8u
	ssHur7+rc+vi3ZxQst7J3tgrY8PYCYFWHlD6Vi5udrHDraqABYpJg/Zl31fY5xDT29jd35l91rj
	gpYRdNpn1HRTdmriKtyUjFFYDIdu3iP22b5Kqxg==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4052784a91.21.1789545404280;
        Wed, 16 Sep 2026 00:56:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4052719a91.21.1789545403713;
        Wed, 16 Sep 2026 00:56:43 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13cb7sm4688714c88.7.2026.09.16.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:56:43 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:26:36 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix missing PDM subdev cleanup
 on probe failure
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALNLqmoC/yXNyw7CIBCF4VdpZi0JNC1eXsUYAmXUMQGRKWjS9
 N2LuvwW5z8LMGZChlO3QMZKTM/YoHYdTHcbbyjIN0Mvey2PSgs3iJeuownMJvlguDiP1ZT4puh
 NSTxntEFIZQ9u0HtE5aHFUsYrfX5H58vfbfnAaf7WYV03ysbaT4oAAAA=
X-Change-ID: 20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-01a8b467ee1d
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789545400; l=1514;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=HbIfItTOo8OE4am6c9ivPQcztfXU6kk/9gwLzj89GuA=;
 b=SBvixAsrejmThHZXVm27H8cvkn3KKWNuOT3UtPaGhGtqKB3jJbqpeAu9F0gkf/CTa4bZpNvnK
 oPIn0cNrh+8DhkUUFGzUZVplKa8ccpg9IvO7f4uk9k9MbxdijPmDymv
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwMiBTYWx0ZWRfX/b/dEMNpttCq
 6dpaRLdpFGJAHQa6ye5t+dvtpbW00db0SE+u8GMTdMMrLM2UaEQY5jz0Zv0T1xDgVH1z68UyiqN
 N0mQij6rfBLwoU9vN3l704ymo+r01t8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwMiBTYWx0ZWRfX+ExwH2+NuzKS
 buc2xzaGEXsOBbLxQZbifuDByhvI/Vn4fGXIHSBbkPhX+8gjsNaI+sKP3F/dFTMyowJ17fLC439
 /1y6A6TyrJKQkP6xqIp51eBE5YoZwmjm8wfDr8n80d3bY1Q+oPhq3G69etp9ZepRzNBtDBZzWUL
 GqdFOLJJwugwRc7Te8cBFgfQJlfR4YdySLESsdKK/fv0CDKt1o9j1/UNeEk1XRpRHNlP/0MCWL+
 zIh+ORuvTpwdPDOAKPMbhPSWpBuX1xTtvT5KtgZ/l931cGppG/eNyUnt6QLEP/x6FzuEvtQSZLU
 OmmP0vTNpZn3LnfsfkU5RDoNI6zfhpdc6Hf8SvvWpwpZbJvbuGKPoBZIwA8f0zZCdeKqHdkoAWf
 6SYmNkf7hADZxmVQ8fG0LjaxVTsFaetC8joBnr54kkLj2jgN5EmcPAbSJw0/g2b9HIbmkCumJON
 geB4PqqJrQEERs3+iqQ==
X-Proofpoint-GUID: y-Qe2CGbqLYkhVLJDX3oqQP2eoDPIv-g
X-Proofpoint-ORIG-GUID: y-Qe2CGbqLYkhVLJDX3oqQP2eoDPIv-g
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa4bbd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nKoQMm1Mf4hYkZarmuoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160102

q6v5_probe() calls qcom_add_pdm_subdev() but the remove_subdevs:
error unwind never calls qcom_remove_pdm_subdev(). If
qcom_add_sysmon_subdev() or rproc_add() subsequently fails, the PDM
subdev remains registered in the rproc subdev list.

The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
qcom_q6v5_wcss.c) all correctly call qcom_remove_pdm_subdev() in
their probe error unwind. Add the missing call after
qcom_remove_ssr_subdev(), in reverse order of registration.

Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..1574e26aeaab 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2222,6 +2222,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 remove_subdevs:
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 detach_proxy_pds:

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-01a8b467ee1d

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

