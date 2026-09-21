Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7D3AC0E4
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019241; cv=none; b=hGsvyNaYptxLtGuNQ+uGhDHpDNKvFUflP52dTCWjQndSRJaq/7PJBwpLxHxVGZ2sg8sxdgk6idUAmWrILdmBcslS1IDm/AtHuK5D4F6T9s91pk5o1IF7RuJyRGm2sKTkwtotj7PrZanntwODM9KBhKpp5jBzU/+XMFW8mYFD0D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019241; c=relaxed/simple;
	bh=TmUDlhnkn2s/Hh484olVyilhDyDyhy5zBWOH4b/rHxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hDgCLPyg/eqEpiK7oAKQSnjwkka7lzsv73gfmwNfNPJACsNTy8HD6H0qXA7q8aGIS+6B0EdMxdPttQk/qGKcMlqZiEG2FfOOTZiyhXiNaE45KzZDsgatMMQ2evOcskFdvRNWL2I9eWUqwxv5Pmel17lF5yixQ7Q3NSD6BGr/KnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Prfuvugy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1myZVHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Prfuvugy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1myZVHy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFB6Je886453
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7rO5OxIkbscBDwX5Dx3HBq
	sg3q9hM2Mu5ot2WByPj2o=; b=PrfuvugyFyONkxvaqHAvBZQMyIrszMCxslJWeD
	XnVuYzApWkSv4ni6JC/M8m+rVJo30f+J4AYDci3iznUHSgQvRznG6oA1LzmhnPRk
	FoHR7unb+FgHi+6tvmERHtUfL1t2WoA64zcCYvQswzl80fQxhGqgFi8TCFWrujx1
	MSPbdhaHCrgQR99Jecqy6ueSZGwVen9pZMBsSVLazirvRqOyuA+G+khjy4ytK2ES
	1zb7Xo9zSppdIZBK0ZrZkrNxi2KQ655Cl9OyMKY+KqvCcBTeg1QUhVjdLW9nFpcj
	OxSecohE/smYqP3Q4JUcSwdZLkkjc0UtNdrpmhN7wIGb0Y0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj2w2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:33:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5872678b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790019237; x=1790624037; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rO5OxIkbscBDwX5Dx3HBqsg3q9hM2Mu5ot2WByPj2o=;
        b=A1myZVHyWAE+zW2qxGw+roEQVq7/0yan5MIRFwf+6BTtlLWcsPfucFcZfd7Usv53t7
         DVPLmp9ps9ZPuGMJ4NGgQWWsJbRHTZWvUth73Uz1CZICH7UeALOlWJxWQMpekuuDBrV8
         XbY6ssmLNG8cgh6DzVTZcxEVT0zUz2RqLBc3H7NtkyZSfXHMvHrnvCMyXDQdL8Z/62l0
         P1lvVGMFxuK/xj9W5+2SvB0mBbaT66A/gJPDCYWTNRtdk1xkUye1g+TZ3ekCk8keNeCu
         SV5VeaXAqGuOTQuS3lQ7/0uwBiCScljVEcnaSBgjvDUat6C7ohkIlUkp7/YR5cTeJ7qd
         PuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019237; x=1790624037;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7rO5OxIkbscBDwX5Dx3HBqsg3q9hM2Mu5ot2WByPj2o=;
        b=e2yBi9cD5NLwaNot7MDtt1rjGVFJvE9UhaaqA/DLukIEaVOyRBboj8ydI5qA+7FL+2
         44+rwtDWB/LTB1YPyf+aTcQUrL9Kwdy873Z9YlLPt4zDAeoK3lfUvP+SFlnb9zRubiHv
         4qpC9JMbRaeogkgGjDSE/WXsRqevr30dyp7LiR8tP+CBeNTfU7GVmvZ6Q0wFlADxrfyl
         wdfwagoiAfqIsXF7wLbR68VyseM0O3bI2MYyCZvt8aPLsva1ry02KFVs6dcMz62rpG6L
         gzdxUm/fmBIl+jhDxlyGa+76iw7+3wk7liQwVK7rYiX3VyFojh/vN20HVzfHk8uMDoNh
         hO6Q==
X-Forwarded-Encrypted: i=1; AKwUvBybn+CFeUDnnVxTj4eZu0Adj9g80R0zxhVmHJkKxjldw4pdeIW37hpOVz8+94B6BmqfSw//SXTJKrHKVBB0tUwK@vger.kernel.org
X-Gm-Message-State: AFuF++nvDS3xwtOhteRwnq3ShqdMHTfN5UAxkmOXRinMYavbwyRvCUYr
	wocEqJmW6HnPBrzFA534tMGAbgX59cfhYxl6KZXzkRyJEgADknKn2cXmWWautJ+kH431OCggEJR
	1J6B1+GvRSmLyaC1zb5gVEpSgHU2PoBQ7/3meC2ZHVR77YsDLS3jDeix7Og9DPRMYatxbnnii86
	PMc2ir
X-Gm-Gg: AYBFou2HEEOZbSPc4gkOD5QtXiSwQyQzTzJMjlURI7ImE5ttkyIWLC8+n7y6B+Y2gr+
	dL0TZMW45OFxwepvrgWRo+39215ZZkEqNFTjtr3eujoQadejtqvwAUbwGrTYvrIa10V41eWYMeG
	NUNoBp/OuoPB123fLT2gCeETCrRX2oZp/bXX2xqSWvfmzmF2TslOaQBktozSTE7MIX7G2tEWhc6
	0i6MxrXd15Qzr0FylPqbmGfZg19Mtjc2lj/EqwHuqa7NA9Rp2Ft+eF5zCN1Ljil3tUrRqJBMdti
	ziAYlOyODkmCV50aByuBBup/oLC961h1VdMaSsz9fP8gtkdoKtlqPUzpirDJ1EQtn0bCe2QLquY
	YZeAYhPn0CXTO7lfAvccAPtj9eIzzFRmpOkP0Pg==
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a196:53a0 with SMTP id adf61e73a8af0-3dda19654a4mr12414793637.66.1790019237066;
        Mon, 21 Sep 2026 12:33:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a196:53a0 with SMTP id adf61e73a8af0-3dda19654a4mr12414769637.66.1790019236662;
        Mon, 21 Sep 2026 12:33:56 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba1febsm165775eec.5.2026.09.21.12.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:33:56 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:03:52 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Preserve shutdown error in
 qcom_pas_stop()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+GsWoC/yXNQQ7CIBCF4as0s5akBUXrVYyZlHa0uACcoWjS9
 O6iLr/k5X8rCLEngXOzAlPx4mOo6HYNjPMQ7qT8VA261bbttVZur562HDANgpJjwsRUG4VQ5iV
 P8RWQmCMr0zs60qkzhizUXN3d/Pt3dbn+LYt70Ji/fdi2D/rxsK6MAAAA
X-Change-ID: 20260922-b4-q6v5_pas_stop_preserve_shutdown_error-39be7e8133e6
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790019233; l=1677;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TmUDlhnkn2s/Hh484olVyilhDyDyhy5zBWOH4b/rHxQ=;
 b=80XGy6AlAsyCO+RLESdK/NExg5IIPe05pY5q6Xtpna2LaO3piw9iSkAh478gUOAiAtwDQFBDS
 D55mObdrvSZChIM9H0denEvtscYYkQtw67Q8M+Kjvyyab2y2MIo1pQP
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI4NSBTYWx0ZWRfX0doFoR2kbKdp
 6vNQvnNeyVfoyo1j4ybXHWqTWA8gJ+5g0sHxk0rNYdRYZSxvNKYlg+Xx36AC7c1txC0TQkldT06
 rwTK9OrgpgOMhaTDhihJn+lfDJiyDmY=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab186a6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cnCWFBqf1hCtONYA2ocA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: WqKqTGTIE_Veuu7os5GYPWnPiAW_0TXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI4NSBTYWx0ZWRfXxZHvQVd2mxWJ
 /f9NxMxznr5Zsn5Qu76ulEjze6MsoeXqg3Jr93JglEPi+AQC0Q3VZM8Vir4SfDK1P7KoDmHe77g
 3OWbjBQhi4/t+lpxH1aGZwgiMBmNi/nQ5NRdvb4onvNUnbFWA9id+3xV+97EbX0ypxnv2wB9yP9
 9Dz+hawU+4LKz+hpcElSev//DSLA4ZeJgMSY0DN8q18nopMLlA3/heoth4DDm+522CEikJ2/IDD
 hrs50e8/3wCsuzrcnaiWzqHcsGiBOUkmFeGPmfhw6gQOH+zpwkVue+9BnLxJWoq9J4b3UuRjqDK
 VU0Dkm9Jzx69sgHdvfB1us18wQ5FajdMhBN2Z5jm9x83tzuNW4f01bHtbxJkrY35lXaGLKDdAoo
 nrgh/NGldVDrXdSNGYKlMF/CNomop8/pDLYcCWpgT3wY+/2Hi2mzA02GYba327DZlzhIxQK5Tsh
 uuVcFbW58kmb5sL4k0Q==
X-Proofpoint-ORIG-GUID: WqKqTGTIE_Veuu7os5GYPWnPiAW_0TXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210285

qcom_pas_stop() unconditionally overwrites ret with the return value of
qcom_smem_bust_hwspin_lock_by_host(), discarding any earlier shutdown
error from qcom_pas_shutdown(). If the primary shutdown fails but the
hwspin_lock bust succeeds, the function returns 0, silently masking the
failure from the remoteproc core.

Use a separate local variable for the hwspin_lock result and only update
ret if it is currently 0, consistent with how the DTB shutdown error is
already handled in the same function.

Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..845aed000a1b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -436,8 +436,15 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
 
-	if (pas->smem_host_id)
-		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+	if (pas->smem_host_id) {
+		int lock_ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+
+		if (lock_ret) {
+			dev_err(pas->dev, "failed to bust hwspin_lock: %d\n", lock_ret);
+			if (!ret)
+				ret = lock_ret;
+		}
+	}
 
 	return ret;
 }

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-b4-q6v5_pas_stop_preserve_shutdown_error-39be7e8133e6

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

