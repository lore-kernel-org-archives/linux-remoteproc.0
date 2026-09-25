Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688854E2F15
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351928; cv=none; b=HLp9e3wHY2cqNNIqhFbWH0v+Jaj/lpyv8Eqd1vy9KoqO645CouhChelnz9IZRL73bv6svxdRZfSh5xmPsP9OP9nTI8PkA4/DMmVfS/h718HTGbbHW1qk/kabkwLfGdOHdb4AuVPIEr5FNQbDO2DcySEipLwaqTYbmizErwxpFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351928; c=relaxed/simple;
	bh=Or/odA96EXtI3VIrzDdE2gQFAGxcRWCX0rIBvqgN0kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPdosbmUE7axGc6jOCv+ZDCbBAWsfWsd8qceR/f7bdMO8Ygm57EAjgHTGBO6JFroLGgPiKQuB7xje3UrQ83EqcpCksvfQG+bFnz+nL7Oo/fIBJKuxmficRoVlOLsTVcBoLebex1mwmCw7TPsZERn/sj34FnB+KNZxqHeHr2BdNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIh+/103; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jm2FUYhp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIh+/103";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jm2FUYhp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Niw609372
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YsHFeSAp3CU
	eDC6/pijBcy66HKE+cMN4f7sayTp0/R8=; b=jIh+/103IYUgxoTwAISVwVI9lYA
	8X9dPiweKj3Cj0ivXSMIKmEEEYGRkUWAlt253f8PyQYc5/C5IXZKTsHM/umc7NKA
	2qHjdlZledxNycrIjw0fOBEbnjABaVvwICnn0YA8AvagzVYEbEgDNlPIGtXsrNyp
	jsm/bGVdqYxHfYx7CxYfX6L5j0HxotN3Xxhv15jXbjs9NG6eni44ZN5Na69g4V6i
	y7nAIjsa5GyCEmkP+3JLpXFcMhqq1R7qf8iIV7LFudxHOYebTl9UKNvj0Wf590Zv
	pvNmY0xMfykGXoiZlTQXIYgWC5D+/2MeOiaVPRfK8in7WG24ohov7Ck8oZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns6ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-880fc944631so136396b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351921; x=1790956721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=;
        b=Jm2FUYhp70IgtCToukAN4xk6FJLyPtgUlswTLt41RdUPfWGaLz2LTqTR0dy2b4n6kf
         qRvBoxw2WKJ85iP8TCfO/31nYDUPWFarvYiVYaW/sRF46CRtF/1XZuUdEypxnkKIthdn
         IA2m0QofR8HNHLVYcwUjaxkQ9RHXT4IplckRLNkxNvTaackhDoqnVfese3U5Cn637VHx
         51pis08OTRQjqyIpV7y0RPG0yCPKVrGCYUNtOuqsg6P5KfrIpjXHrxFx59YrNS5uC0K6
         z516ly9Fg+1Nx89dfml+9SW/XB6bx6Zk/E5m3VLPs5xrSL4d5mDO/CHe0STVa6rl+QjN
         yt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351921; x=1790956721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=;
        b=wT0JiEX2i3HzxHBl46d4Ycw1FClKQgT/LsHlJo/H+zEn0OopFJGue+D3KqRQUmP9xL
         l/GEdVktbhbIs0hMUctex7/3BDjpAAO0Cp3cTotJM7MTo1Bu9G8cJLddz/W4RaCxNvjB
         QoWTpnjBREeOyK0Y3hG2V3/SY8imZtiY8Z3ymr1sGtiFxOtD7PSiPeTBDx7gM9uMeIUl
         EfZmJKhXSERwwO5GXp1Ru4AD5r0jqiFr9E/V9Tx8G1OAfpuRNezjWxCiT3uoBa7Bn+0s
         bzbcANuJoAu4hCcyoLnFGrBIoJxy62d/BWT8tkcEujedlNYooWH2i588RZfTN1VihbrU
         /tdw==
X-Forwarded-Encrypted: i=1; AKwUvBx5YglC+JFUb4vW2pkLpKTvOAMmvWFtyLL49KNJz9HTG2FYuEpqwJobmmtxRj9lkhduMWmaQhpfOmaiqcb/kb5E@vger.kernel.org
X-Gm-Message-State: AFuF++kiWaGvKawM7YDsTPETia950dWdyTzhX05sfHIzwlxWEWWoR/Az
	aab5pcQu9sTdgWThpexQU54b2vAkKVW7JlFQytmGAmocT7JSdOxbx/HOw8lGQHX2r04cFvEKD/D
	YiCz0tRypM5SNBwsm2Od8creVM5yLytqs4J62aY3nQ+Lf5kdCPtFicYnvErAPPpGgSLvERO5M
X-Gm-Gg: AYBFou0Tntfnaaycge+9HDhg3y+d1yOeo3yERECX3DtIck5JN4GPUgpBTjpm0TyoFik
	LTQ9zT+BQwxrajJyKp/bn5IoZDJwtPLSo7v0ykpi+EGQjnGkUgzpY+7w/cMBk8HYbiycQsb0asb
	TncprOmQ8GrgfkvPpw8kIWvQaxj/S6mmweU5fl10WMQHuy0n1WJDbLuBoSap6QZomnavZrSdbxz
	xf9+EHA5ip7/Vr1I1CiksicAq50jXTOKmn8agboFGQMZLI1eZrYdP1JDY0Zb5pyXVHJEaOpvn+6
	u31Xed80EKyvAQnKQ7A71qeTAm6R6MieXSVIw/+24PWSXJF6QYz5YnUUjEBNzddnL4gwLMqka1e
	my2jRsQpdH41sVHZMruwR01jpsK8=
X-Received: by 2002:a05:6a00:301a:b0:874:708d:b631 with SMTP id d2e1a72fcca58-87e9d8da4dcmr5253174b3a.29.1790351921247;
        Fri, 25 Sep 2026 08:58:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:874:708d:b631 with SMTP id d2e1a72fcca58-87e9d8da4dcmr5253154b3a.29.1790351920637;
        Fri, 25 Sep 2026 08:58:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/8] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:33 +0530
Message-ID: <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ObdtCsgzwXtKEDYi54sBBt6SyAD8QtWd
X-Proofpoint-GUID: ObdtCsgzwXtKEDYi54sBBt6SyAD8QtWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXzlC6Vo8lAyW4
 z/OWmuNFBZqfcUYfJ6ik5znUWb5d5nK163mrQnNNWTo62G7b1sUrdHGp8XTTNfsTvUGLTt/GTgr
 oxZLw0HcJltDw6ioGWuH1YZo+PGUpp4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX+7peAVigTFov
 9ztUnPCawYTvwNv/BxKYMPvevgPFXJEvUElfue2akipdatOqB+4GEzY4p2YsUMMbnqSJT6K57Ez
 RSgeDMZXRPwQQjPURj70NxJmsy6zW0aY6gTIg3ch0CT2ss3PjbXKFba3hEv4903+gNYmn9jBtSO
 XChre26O423ZR02cWPgI1PiTRvySwLRDBhMf6/2ff7WPhf019chI33DNCS459OwJTvqTgUjcseL
 ITj4EBUeaPug14gZ1SJSZvq+PrtB9KjoFfLDMsfO4VgW9QE1DxeuSnctQkBHR3Td8LBkvc4SFX0
 ajs3P09GaSpUNuu9s6hBTj9zaYQHyKCytm97gApQSYXEijXdmSnAPk30jPHJbDlg/7YFg4huEzp
 u8dkOST642984XJI/MmLigA2mYrMpnJIUrH1MVP8YVzr7jTlRBv546pkIs9gwYnf9Owtiz9q6AR
 V24ld5ctX71HE2h7IsQ==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab69a32 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KXBF9D8WR1mqcvW3O5AA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

venus_load_fw() uses qcom_mdt_load() for the TZ path and a bare
memremap()/qcom_mdt_load_no_init()/memunmap() sequence for the non-TZ
path.  venus_boot() then calls qcom_pas_auth_and_reset() which skips the
shmbridge prepare step required before TrustZone authentication.

For the TZ path, add a pas_ctx pointer to struct video_firmware so the
context can be threaded from venus_load_fw() where it is allocated to
venus_boot() where authentication happens.  Replace qcom_mdt_load() with
devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), storing the
context in core->fw.pas_ctx, then pass it to
qcom_pas_prepare_and_auth_reset() in venus_boot().

For the non-TZ path, pass NULL to qcom_mdt_load_no_init() directly,
removing the explicit memremap()/memunmap() since qcom_mdt_load_no_init()
handles the mapping internally when mem_region is NULL.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 +++++++++-----------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a666776..adcf67043bf6 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -9,6 +9,7 @@
 
 #include <linux/bitops.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -223,6 +224,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context *pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..4ea4c7769ac3 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -86,7 +86,6 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 	struct resource res;
 	struct device *dev;
 	ssize_t fw_size;
-	void *mem_va;
 	int ret;
 
 	*mem_phys = 0;
@@ -117,21 +116,19 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+	if (core->use_tz) {
+		core->fw.pas_ctx = devm_qcom_pas_context_alloc(dev, VENUS_PAS_ID,
+							       *mem_phys, *mem_size);
+		if (IS_ERR(core->fw.pas_ctx)) {
+			ret = PTR_ERR(core->fw.pas_ctx);
+			core->fw.pas_ctx = NULL;
+			goto err_release_fw;
+		}
+		ret = qcom_mdt_pas_load(core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, NULL,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +234,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

