Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72EC36F430
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984348; cv=none; b=GpA94r4P7p560TT4uhyEgj1AGDT3HstC+7xFw6dDktk5WgZ9NmM19og0Qrjt50lkP1Gi+08yECXxljLV5PpkSSrEsMpsm/4RDnVBH94r/4YoxpQKSVz7QujO93QhaCSkH1Ot5y4N8MkaTXvv5O2/6uIhR9dL+L+SZ8NFJ5R6pzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984348; c=relaxed/simple;
	bh=8Mci/N8HrnioiDtPa3az8DywJt6Z/OJbU/G/Orj1cy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omZ5hhFPf/QuA/AxmInq/F3uYcnASIuGxf08ojbvTi0ZKSE23g3eBNbYCD3rHFUixFQsgR2tfeF7rjL3f9p3RouQNOhjOOyfD1tF4TIjw81juIgmev3C3ix8nNPLOWX5okIKczv52a7J0AV1chsvWNYfckTXUe2Ynr+IqACnHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0myJVTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1yuBUxf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0myJVTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1yuBUxf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdUbI3239967
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pE
	B5/zzjWE=; b=e0myJVTp9lEn3t9zJ8MFnnMC2UyP+aYnbSXc/zX86si7OjWfnFa
	TuClVO1XWeGBNClhMmMSJP+V2VdiMH9y0SPKiw5TaN3TaMRJGWrRPZ17JxXVelMr
	WRXOYinFspr0g9vjTswYu4DDpcw5VDtTRO7k1I6O6i2hp0yONUZxQlTYnNY42kLn
	cIFYqDPkbFxEfEJdWveTNE0jqACHb0GGz8Mvl5ntGt/7VJzUqACzl7SE0Xr04mrd
	7Mm0G7xgOt9V+OYz+N+7AUvEJDcnqWrLbuhZA41Jl1suuczJ9CFYNOpcRZbLGFZI
	p4vz8whiLOixyitvGkabVqG5XDAL+Q3CNCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ytr08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0bf2b3879so197007665ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984345; x=1775589145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pEB5/zzjWE=;
        b=A1yuBUxfwHvSnrRNA2P+xSA5l345i1GBvRTNAtvmRv2+byAM1gJvChjVbHicLEz6dE
         X9mjgxHxsMei8RvXOvE/xij6NUnW02AWZWABOBoqft6IwswQedfFigLUEJPGB8Kih20d
         HJkVFP+1rCq0IcgMEydHfN1ftVZKa8plcKLfWiBIVXUazyEcXNsaUXmbiMnyuPdsCdyS
         Ap+P5GN5ddBICdifr3B9fTlGIniBm8pbWMEpDTVNdRzfFpDxfVj34e1Hg+UZnK/od+8r
         50Tlwi1dXORC6H7CeEY/Juq5tMcKDiugmAnjSSAnaY0/npWNQf51guXaSnGC6tn7Ef+W
         LawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984345; x=1775589145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3iaAm0TR8npLcJOk9xa+SDLtG4B1S3n9pEB5/zzjWE=;
        b=nOUPVI5nXFdWhxb4byMrBwBxH4osRMR1SIwlDtC8UvCVZ/3IGfX5qBZXlr3P6ILrtg
         V66STNQoDSSzBFOWovQkmAkI4GXllRlQdwFuEk7mp7xhCib0Ubhv8jjfUsYVlYT0/oou
         JR39TlM6nvldmhBE1Psu5weOoqzt6f/jEV1lIBOUcviXZ0AE2+QeaNFxCoPyjwPFxdox
         uSKT22ck+QQgKbtKCkYQiZC0A59FaigT7lKOn9EXE/DulhkVMSgU4UpqfyqIosQ4Nqo7
         buNTioY0ZN2aXpHHOofNb2N4ZmUnpGKWEGg4w5UcV0HnPkFI+CXkHTgcg2VKFGmXM7WC
         wb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyT9nECfbvUy9E3/+VGAQD086XMbhaEwrSjS1VfJS/agDWdpDSCZnyTE6rA0MAK1lQdn4DNKzF4f1FR1nBOJk0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwu6uTxgYsGaO3dwBXmsuVOnsMw/FwRHpgECdx5lW9hx+68NVN
	MZeLZXHesnwu1bnnb8Spzsx6OuumGR2mKpVEgR/vH2C2wv7vtg1/+1fRcYgtWC/jwgcfwPkobFJ
	6QpB6tqjDLAPPqH6qEu6PorGbeFx5EibR5bl05s51I+akpiOB03ZH9Lb6ppQwXLVlZhxN7ohm
X-Gm-Gg: ATEYQzxUtu3yZAulLKMBawCdYxSVPLMZ8MFOCJ1yRD84w2XJeD0LoVdkj2YlxFQsFov
	UKJFGBOqIIwoBxGA9RqMwU1aNToUuONEffVXWvWENMAl1d9shQQPd3l9ym2d/I3sB8LL1aSMvKF
	fBOKSME/rHGTh0kSlTsd8vhuNV85j7CGEgjDiHc5PHwrcNRmpwlRJdWhoWT43QIvov7PSe4/iuo
	LQmycBFNsobBKaEEbaR3vBWGdlFIeim0jCkss49NoKIu6HIf2Xi5o7cvqOm8PAJgEHFNhwsDSo9
	2nSUDABPEHXh7TMeFhDuQfmtoARaZyPxb+SFmNQrDasKqV+5EEKYXZomMGpH6yf0LZJklJIhTbv
	CI6t2y5knOsij2JxGl67kgMgqiziobS0soHpSCbFOv5qwUW4U
X-Received: by 2002:a17:902:e948:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b269d7ba31mr3604215ad.43.1774984344696;
        Tue, 31 Mar 2026 12:12:24 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b269d7ba31mr3603855ad.43.1774984344202;
        Tue, 31 Mar 2026 12:12:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/5] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
Date: Wed,  1 Apr 2026 00:42:07 +0530
Message-ID: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XiHAoBzE5FLSXqXbOXs1T-jN1NVzSlsm
X-Proofpoint-ORIG-GUID: XiHAoBzE5FLSXqXbOXs1T-jN1NVzSlsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfXyhIR5QoUL6V5
 0NE07ff46rWU2BP9gBTY+zvi7XpIdpIUd3U2TDBvkdgLyNmcA9VYI8S+PHSHtD2IdYI0b3gJ0gX
 J3Pa2tnOsZfu+/XDeUbUiq65lR0eChvHHuENSu09ySRCDMVUO7CrRw+0vuSv6g3e9g0Fi2dosOx
 gzYnZtiHNxc4NQdTMV86vHywuCTaBkvgpkccU/8xMwkuuUE3S8hdArBsexYOTNL8XFqjFLEgByG
 ON5N+EIPlsSdLm7G35XSZl65xiBNm57JsSJyuSlTMhvFqdSIgtz52E02h6ZdzfcfSSU0WD4v/YV
 BXgy1PYeRnumCsOmgkWjXQ22LY2e0NPdlXeTHF9CGDV3wZ+7ASiZGSJ4Fkrbj10bBHa0cp0HUBf
 t2cSuVIy6c8ykuJHMK+Vfj4vLkm/fExGPbAg/a1gqkZCX0DBPZZSoot2a1QYt0LvWsA/gZwAt48
 wo5k589NarIXR/ewfEw==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc1c99 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YY_etid4knfRxI3WhhMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310184

All other call sites of qcom_scm_pas_metadata_release() for the DTB
context are guarded by a check on pas->dtb_pas_id, but the call inside
qcom_pas_load() was not. Fix this by moving the call to the guarded
block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: lore.kernel.org/lkml/20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com/
 - Added R-b tag and split the changes into 2.

Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
 - No change.

 drivers/remoteproc/qcom_q6v5_pas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index fb22f699c571..b957bfc86cda 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -243,14 +243,15 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
-		if (ret)
+		if (ret) {
+			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 			goto release_dtb_metadata;
+		}
 	}
 
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
-- 
2.53.0

