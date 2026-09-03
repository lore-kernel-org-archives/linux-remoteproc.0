Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADCF4EBAE7
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451646; cv=none; b=mVdQIM0reJ0XkiECcevOayX99KYiE+aNItq9k4N34vTumddz4aWIajabnRcLrZeClsi0Om22YIa/7WJbhmyEoYUzs/gRfTPcCegp4rKzQKFNacAEVwFmBT73YwhFrln+PbZFZIR6zrMUL+7RDVRZ//pKTeaDUG7sZ9PsqV2akwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451646; c=relaxed/simple;
	bh=jXCCj/bQhP5fW7MLDqzm75BnmROw7pKkSIkICqJG7PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bN8jbAL1M6lV5l1ApLtRaNXkgOT0XvUjyy04BlodD2p2COdk36bXV5JLf6a4fl3rnKCHzi0ZdC3Yj9kL56hRnKmucCbTMWLcvMsVOyvMjKFTzpS0ywL/tAFRWtbweiTgyWz5/OM78iXLKmYw61ey8UZmVWPVE6ezn49daENsW4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOE9o1GX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+UoruRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOE9o1GX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+UoruRS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G35rI2088659
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 16:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6zwWKPqIMuJyW8MrQ/3doI
	2w0uf0NXevVdzDlnZBlSA=; b=OOE9o1GXyuEUNr1/67OW/9e6vmLZI7l/cinOc3
	q0IGABvgBBbfBNLULJkjlHJtXVYdXYTyYuJsU/tsmy3r5jQrPxyBlPRO9NTd88nO
	/rPehc9XE5dY5Bz/G/JMZuRYxQ0zoA0wm+M/2n8Vq+Q05D048+Or6dE7f6iQFwsp
	oND6K3SHzyIxFla0C467wsuOGfg3jEefl7l2BJbnXbtl2SM/VCSM4Sng66TAzvRh
	PK2oJiUNQvin7zuSDoydijf1u6k3XFG9Ma+BHvO2sWiKF7eALLb6kGoeJaEMIJmC
	EmtkIFINczm/E/9NyNIM8Risdd8I3VMl8FZkDm4FAjLTvqsg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18wub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 16:07:23 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e99ff505c2so3369588a34.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788451643; x=1789056443; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zwWKPqIMuJyW8MrQ/3doI2w0uf0NXevVdzDlnZBlSA=;
        b=I+UoruRScgUCGDnnoWms5240W3+9FYsB0pteg1UUIy+zasYzHZpc+b6cXp9T4TiF90
         bbLolAY7Hs7pO0PadZtUCQ1mToOgX6AZH+ARpGOFQvhq2ljuQrgzJAU4fXy5vEmkNPgj
         /qucntD2lEeLkRU1DqSy4tbVO7timdeo2qLXNuPOCMuDSHt1hpYCOYswmgMi37aKyM6V
         G9cw/qT19TvXIGKaOlcXsQ1eIYB8F2ZiyRpa2dx4qauIa97dHimCHfcbyy1K8h42oZDJ
         gx5cKDxmASlaYkBE/qGbyhnxcMDbdpUnALDjfj30Eq0YdRZEZCf17kzLDlw6ajLo/RGO
         0+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451643; x=1789056443;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6zwWKPqIMuJyW8MrQ/3doI2w0uf0NXevVdzDlnZBlSA=;
        b=mEYINE29d0pRGY+ypwFd2LOqKC4HEUjYsOMBDfgKVLjoqLQLQyMfBW9P++0Q57pa7h
         i8HxT2Cq3PBn7piKkV/dUNXC72hrtCRYy6XkUCr+MQiNrzHR0TxzwuO4k330zbCLgMJ3
         GxYLBYnomOaTeN8GLt2E6zFu9yLg7D1+gezYDahmWC2F8TYWxudtKLQ6zuMLXluPQTD3
         MWtIMimTlEA5ddDDBUJAma2uXcV5L5z0oETrBdQAnYGdw3HuNnQQil7Wef4GKytAKy/C
         5PEpBxEyl3U2HCGYNlTJb/k1J5/Q+IfoMlFf9639Ruacw3RU3f11BICE9wyK4sLAldEU
         75/w==
X-Forwarded-Encrypted: i=1; AKwUvBxD+/4sfCYX0FrZX2FInfB2NhW3w+uyVi5kBmXa/ezZgh8MOU5I0l2AJFzR8PaoOdwhIUzJK6wwrYUmUvRQ2R4N@vger.kernel.org
X-Gm-Message-State: AFuF++nz/jd+p8lRUCnUuEgDo+l2gTzZASOiW1HGyiEo3w+RWx1uWcWo
	KHnXXjsfTynNYlHfs5onMd2kJhxDosEnvrJVLOrJ2tO/xT/zmL9mrNFxCAT9gXlOSBrvtuvMj3W
	LR3ewQovKTFOH7JPqIN6tIXwPOM3FtSVU65jtso/vtcJZB+THAgUbOAoYHTLlcPcmLLAGdBsB
X-Gm-Gg: AYBFou25AbTG4FwqPIY0w+ba3vY6E3iBpR8l375SIrc9FKq0aF1F/jI4Zm5FepkgA5t
	MagbWGBrxUaLikvpxvL94lh0M2ornk3L/UjLpLDqI8uF4u+V8xpzT/Ro1zyqofBOUj/dMBpNP+j
	kb0AYGh3CGqSTwGQyJgT8C+fm86/V//IlSaygV9B4Hgw344iq83RXm0Q0HRsc/1Bne26ZehaJpw
	Bv4NPL8HAbOjX3r+ij/n+lehyjcvr2yPXqit+cMs12BY+KDWHiRqwMxFo2MuZHbXGrh/bllXqgP
	yVmhdsYX+dgOokXnEqeFFNpEwu0Cy0p++G50nP/Nvpx9NdpvvsEe2YGlDpbViQrB3ShOBrpJAEn
	EPtB2A96dRjl7hEN8x7u/IKWVNFwgCsz/oRax9g==
X-Received: by 2002:a05:6830:6b04:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-7f84ebe297emr9395501a34.4.1788451642826;
        Thu, 03 Sep 2026 09:07:22 -0700 (PDT)
X-Received: by 2002:a05:6830:6b04:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-7f84ebe297emr9395434a34.4.1788451642251;
        Thu, 03 Sep 2026 09:07:22 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6daa20bsm319118a34.14.2026.09.03.09.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:07:21 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 21:37:14 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix qmp reference leak on probe
 failure
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-q6v5_mss_probe_deinit_upstream-v1-1-c40a6d317be4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADGbmWoC/yXNQQ7CIBBA0as0s5YEsWDqVYwhBaY6JqXI0Mak6
 d1Ldfk2/6/AmAkZbs0KGRdimmLF+dSAf/XxiYJCNSipjOzkRbhWfMyi7chsU54c2oAUqdg5ccn
 Yj6JTw9UE1Lr1HmonZRzo+3vcH3/z7N7oyxGGbdsBMTJTLoUAAAA=
X-Change-ID: 20260903-b4-q6v5_mss_probe_deinit_upstream-92f76de554cc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788451638; l=1712;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=jXCCj/bQhP5fW7MLDqzm75BnmROw7pKkSIkICqJG7PU=;
 b=8f7qDFqEYaOd0T11ptNz5B4pDq6p6HS81mlDguz8t3ODm2LGHeUmpBWH6vvcRsERQwvVIXGEM
 IVVKiHXPdDKA0rCKBsgV9uBlnpYSCehvxt6FwU/E0uUusMonPlsCm8x
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: 3iqoGH5qhdFW5tLTxS2-UXF6WRaKuJaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0MCBTYWx0ZWRfXxnyPwSgvftZz
 2tKdgmmaAfsCk5Nmd/MJPRTVo3cIaGPTJpOUfjZK9jusxPx+Le1kwk8lPf4bD0ic4A3hF6OI2fI
 FpQDSwbgz7l7kyW7OjJZmDyVEXkCooY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0MCBTYWx0ZWRfXzUEz4ikuuGkE
 7X7EuOU30yAqmeM1GBsNRBrS4Bjt1wWs3/u2HFOBtRlhWZ2H4dZGDWIefwWeCycTjFAiJw66gx7
 +VBbBnqb3KVjIqR8M2AUZcuuoqIrBdTJR/D6HKl0uFqJ5ArD6K2l5ym/D102KJ2T0tYMlEKSwXV
 0fTe50mAZq/qMKOFUsdkswE4j37iz0ZPksepC8gP03nZI5rlk+DBi1s3HyQzaiT7C6IUuf3FgaN
 d8CRM0SsEasg/GrIIslT1qWxCJDMh1PwksOfh/fc+mXuzZKcSpxAfjPtVp+oz12TWIHSoDsZkQ8
 gqz+HTdmVTBV8C2v/Pb6OL9hnuzwH5N0GOM2DVS8/vNJlo9fK448FRsczXY2nBJgoF2ijiETkBv
 jOUgfBtfErO63SJjQUQDWz+zHg0T6NHhcDBNSFHcmsfhvL+ll1ieZcNAZ7X5sIni+my4S0XAZD5
 FReGJlY+4ztWNeq8OTw==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a999b3b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_IghOn1l7u8uKlrmoJ0A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 3iqoGH5qhdFW5tLTxS2-UXF6WRaKuJaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030140

q6v5_probe() calls qcom_q6v5_init(), which acquires a qmp device
reference via qmp_get(). If qcom_add_sysmon_subdev() or rproc_add()
subsequently fails, the error unwind falls through remove_subdevs:
without ever calling qcom_q6v5_deinit(), leaking the reference.

The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
qcom_q6v5_wcss.c) all correctly call qcom_q6v5_deinit() in their
probe error unwind. Add the missing call at the end of
remove_subdevs:, right before detach_proxy_pds:, so
qcom_q6v5_init()'s own failure path (which jumps directly to
detach_proxy_pds:) still correctly skips it.

Fixes: c1fe10d238c0 ("remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..387538ead2df 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2224,6 +2224,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
+	qcom_q6v5_deinit(&qproc->q6v5);
 detach_proxy_pds:
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-b4-q6v5_mss_probe_deinit_upstream-92f76de554cc

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

