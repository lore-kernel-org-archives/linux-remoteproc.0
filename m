Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC504E06F7
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351921; cv=none; b=kaqlh1vJE2llMym5wAitDnFfJVvUOvtdVMqe95vsA1vqS8u3/hy/xrhWALd/lcnnWL1FPexId6NXxoTN8of140TqJoi8/ok4mpz+f7aNSa1xCZ1R2Z+Lv9cCcCXtz/SxVqG9vXgS2vg/NhK5OWWuP5YGp6K3uyY6E2CAKsSQbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351921; c=relaxed/simple;
	bh=snaS/I4Hb8yCdgn5ECyoCKvWNHrkWAmTGwXoXARznGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5ZQpz+gFJ68fFgBjy591MdZ0WWAQmgebYjsJfw9JlKAL//tG5opYdSmR0DvnWnbbZ0lglyjmoEvtE50QKRKOkPCJ48ghjnxI8TePCkgU5n8VWzYGagrAn1hwTFmah5Nrtn8pthnMgaDVvgHIIRWMWC9D3r4KeEa+raOr15RCmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxg0wKFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaN456T7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxg0wKFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaN456T7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE5kEK3627535
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ySc0a6RXUPc
	52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=; b=bxg0wKFsHNjDYHIiEqmTvQWvwMV
	5Nifc4KXUahwyZDMhJ/Uuv5GKjp8sFZ8QKLFvqvDfE4Jr6/hNahGwU4YFgOgkcJL
	RmHMUOfwVKkFGKgiVKweDgJ6OGD6x3Wxb/PlEvoB9uEGmlJ7FU/UtNjegP9Bmxu8
	TANC9W6tQ+pigu6YmdqkRDDgAUrCwATF1hLkBu+CeP+CwZ6CmL0bDzxqLJGrAv6b
	teICyY4UVEPGmxSLnAjq/s6PUZ52w/fcExzJie8VlICxt7Vtmiebx+VtmrN1XiPH
	3hYl6njSsDCk4We8i6S+Q1t0x3tzNMkcQ4YvwE0eG0EmKym71sZBEd8euvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3a3r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-881305e5c98so3691b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351910; x=1790956710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySc0a6RXUPc52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=;
        b=GaN456T77RCBmPIgeuN1bJHsC9/SOV2FeP826CMEgZjhUdSoLjNGIJ4hjx/mjSeC9Q
         66zRyaOu1zCNxrKYskMkrmpjnAXy1DDjvIzaQZK8W17OHH850VFzem6g00BdEu4K8cN+
         FYHsPFFxpUfxSVBMbH9oXPeY4u6gpTYwhkx4/hHtDg8qwhsasbsLS2qyn2xOUK59KsOy
         eur0QUgJ7rNVHMBOvvk3MaU46Y5x/VPhgcGvukSzhvkneaBNEJR7Q3ngYRLDVbWgwIG5
         vKahEunchpUjpHNsrwOM8qHjQ3bEtbn3eEz8mJPH5TbDO7Yr/z0vwsxf2+WozmBdFkjU
         IXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351910; x=1790956710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySc0a6RXUPc52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=;
        b=SMP37MP1eDERg60B3ORhUf+/y6S0FjJRs5W6P6SXWiFJPx/SAw3J7VJNYqbucj5Yl2
         lJTJ0tynJJ5ANHtxkvmBDYMrQpe8u1KWYJJbAMhdysCt1sBnXVrefgHP6RdOGo0+yg8y
         BHYpJ3jk0dySsPq1C3iPfgGY0Zh4SD3JJpOZ8xzhQmb1v74dpP0ktWOYKqpjgc8N5ZV3
         KkQUzrP36ybjDwLx1CwWWamdIvrgJ3zBGV3gOrF78hdgOZjK+crGdhs4iaULvtBZhx9J
         n/RkPTJCmdxAcaoUcmbr6KiN/Pf3roI0YWChVBjtRsyLTMEYMRNkihMO1mdbfW7sy1kp
         QwPQ==
X-Forwarded-Encrypted: i=1; AKwUvByXMyHudcf9YnouGl448xm8x8WtgiwI2e+lbw6eDvnhkEMFYvaNl1+PjxK/wAUeeLC79H5epeJk+ysgXILKDJPp@vger.kernel.org
X-Gm-Message-State: AFuF++lyJYJffeNtrAHMiv7CHJbYXEVkGZ89Q5uNB8+IFc2GbOpyTmIC
	QaHwTZ4KmNAVhtIDSQrqqgKYHRwAFuw6j9UO/WydmsZzUPHXoC1+zAR3KeFpGVhlh9xAq+h1lZG
	QnEvP1HjkoxnEQd1SpZIbo+jUB3URGd+gdMzc5/qD0jGKEDISiJlbI62c65M7MD82TUcGHwLq
X-Gm-Gg: AYBFou3jpjUuu6DQ/e04Nd74dw/uMMHTD6tsUnIbjvgtk/rkZCdOnFo0+8PFtHWAxev
	+Vr3S09N2fv3thdBypRoBS5FzUp9l0Rqe9rQWkBxY2HC/EzaPEzUU7ia9IlF9yuBuGIDB/ZiHUs
	SG3smpXwK99JVsAYUaNVOqQxUzG5ZrVKVuxtiyo8dOVUj4dQe4gTeNvRDqLf7/+jdwT4giXmffC
	lj6mlLHdHh65fPDZZspivFbfi3OBYZk8NWldi/bWnadw9GsefhQLHgjLexAc+ugl2r3etyfN3T/
	V2XQvZZJ/7C6t72Si10oN9LoxVoxA0Q9nS9xWkFpROGOxm6IHwWceyhf3oOIItZkPm9ry7HxPeS
	ipwvZwB8mhpaNkRPAn60/RE/+FNA=
X-Received: by 2002:a05:6a00:3d4c:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-87e99568559mr5209952b3a.23.1790351909906;
        Fri, 25 Sep 2026 08:58:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4c:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-87e99568559mr5209932b3a.23.1790351909300;
        Fri, 25 Sep 2026 08:58:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:28 -0700 (PDT)
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
Subject: [PATCH 3/8] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:32 +0530
Message-ID: <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX3BRISERr+WyH
 NLig79eF5QMPxZ/jwCd/XWDR9ijLOrfJegX2sk1MmsE2H1XzDuXrpWe6+t387zAWL9uRt/A/K8z
 QyvZzJgLqtxN2nTeSVWCQOkVSHJHhrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXwZYcE86hLqz9
 rRz+2W/NbtePUGbsLAC61dp+5Kj3mjskFwDO/zExHCuZ9MFA/CLe1pDlAdfrPYPklmwIvxnEtWH
 tiYfbrE6dF6UMbbfQH6/fCjRShRwG6f1aRw8WI9SBm1gTfWZW5hSNNnnNySVcBVQns+nStvgShI
 FeAqdPU1YjSO49fdJYfZEesb8fk+CwD6b/C1mfq9wSW5a8HpD5fhCDwPFzpZG3NA5g48PiDxdnQ
 +0QO8eXmmoVo5UHsPsOwfcVo/QnyAgrNBpRqgyVDa4fEFb/1RUs05g//IwumMlFQTnN0UZxkFGr
 dDAIpQWBp8fYDTGFmbDxr8YZEZQUfZW/DcdRTHaeXrsRwprAHx13S6ttp5nrBigwK0DATyJkRXG
 o+zxZRUMB8Jh5qhy2kQ6QomqijMRq9Fh1mnnpjHdsaUfTdxSgyrCjyek4wLyanZiT501Pz5stgR
 JalYcg5RPwIW2vo/3cg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab69a27 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Wu4PtPgZBy_53pNpwMMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jiqIJaayf_CUGQ5zcYWZR5REv6JOGCBc
X-Proofpoint-ORIG-GUID: jiqIJaayf_CUGQ5zcYWZR5REv6JOGCBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
init, memory setup, and segment loading with no PAS context, and
iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
prepare step required before TrustZone authentication.

Since the auth call is in a different function from where the PAS context
is allocated, add a pas_ctx pointer to struct iris_core so it can be
threaded between the two call sites.  Replace qcom_mdt_load() with
devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..68e6adcc1dfd 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -123,6 +124,7 @@ struct iris_core {
 	/* encoder and decoder have overlapping caps, so two different arrays are required */
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
+	struct qcom_pas_context			*pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..e73a5dd98b88 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	struct resource res;
 	phys_addr_t mem_phys;
 	const char *fw_name;
-	size_t res_size;
 	ssize_t fw_size;
-	void *mem_virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		return ret;
 
 	mem_phys = res.start;
-	res_size = resource_size(&res);
 
 	firmware = iris_detect_firmware(core, &fw_name);
 	if (IS_ERR(firmware))
@@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
-	if (fw_size < 0 || res_size < (size_t)fw_size) {
+	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
 		ret = -EINVAL;
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
+	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
+						    resource_size(&res));
+	if (IS_ERR(core->pas_ctx)) {
+		ret = PTR_ERR(core->pas_ctx);
+		core->pas_ctx = NULL;
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
-
-	memunmap(mem_virt);
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
 err_release_fw:
 	release_firmware(firmware);
 
@@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

