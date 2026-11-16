Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846166;
	b=b9qqtmgIQhtuLfHtNsIUuEQif2yLM4X6k8PL665EsquYVi20bGSTWLL0F5nA1Sjduarw
	 zqh4O6MX5d2DsPYnW5b/qHWmfsrIa7KJpLS0sWUKKy98nQ2qYV1eNJUmcDjyaIH2Pd9s2
	 D3A6mW82SzDDxwYPT6XIcwSqp84UzdlsR/R7oq/zHq3jYj1FFtA0dSZqvb8ziBZEe26Ga
	 ryrdE4f2Xp6SfThErQYclVMG9tqXAEmaG84a/bcig2Fxft3ZFu0i7xfJPdTBYWQ9eFetE
	 bfZjIPiZkVHeCS5okOBRIYwA0RPWgBB/HevBrDVTQPU0yIRpIG7zYzK2bjYaC6GiTNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=04NlyiVOskSVDCzTSexcMUXSlR9kQNoiR9fMif+qWKxd7C86nbG5JpOZhp1HSvVEEyaO
	 D4DTRWIknhNS06wo/MFP2Nc+bAdJ5vUq3WmqUgxx7kBEYOIFF9BwLlXSO0TWoWf+yMkB8
	 JG/D8OV2QggsCYE0QCHNFloJtupTnfUSSdQDuDYSFI79wjqnDGSzvm27X2LtCkfs97Kcu
	 LllyIYG8NxrhXkMMuKVRhXEx6G7f557HTZVe9AttqKlxwt6ar4fK59oDfw8OfpHA8RkMf
	 CAtUqsSQjCeljUyLpds3YVS/uCeNOO5KyzRa+uqaV773EqyA42JKg+9wz1/wyVatwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXIiAeH4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2825606A339
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2825606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXIiAeH4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIO2W1788343
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=ImKUP3XzzkcWGQBIHDld29kSpW1
	3G0uJ7xw4IKj6KnrhZDSfB9JFndd77V8uovcWSGwnRjYp6meXxZoJBI50ayEkCIh
	I330kLlI+/Ar3WA9eAymEYIX5A/kqaKYXMhTce83OnuGUbV62i7e5GZ7CKjqm7aK
	QF8Pn+N1ZojmqzzYyrfv/WTtBipZJUibUu/LVq72U5a0PnScjI1uzPbuh7NmL4o9
	B8ItKnCP9ocyMAghENDK6IwB1R6i4ADTkilLUnXEeH+jN+LYIeIb2Lc6KproX9NV
	2VR/aeYO4AzSy0m95rDre8ROZELsYzIzCRFwC+uWejLqZtliMUhFFFdJEew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy9eg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so1238359c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846164; x=1795450964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=GXIiAeH4pT5S8uS7+eaez0TFEDJmyrXdkKnYDdfFce8rjC1+aWr02YDpgHHI4iQYQN
         xlcArqaDQl3xI1BfYtu8EOy49MM3N4wfjxOWgsu1mE1ToXpSf9VYUNtKQZMIXWeT1TMM
         O+F86OvmE/1KarMTyYqQq86NgmA7cCBBcBGcQRNBm/ccjt5RTbc7cdmuXwCWiGiaCxep
         3pSkB6oY9IONKhGXnt/y+qPMnU3u9kS2tdIlF0Tz1JqhUvejNYmxsHRCyNAsGozq0SsH
         4JHOmI4WVXBi9U/bRWTg25YU2JpEBr4Z4168khymP2uJMaXy+t7h4BCNPPQyu/jswjvr
         UNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846164; x=1795450964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=PuDlO6JbUcI0fSuJyl0fSJ/WT543jeV1SU2X6YRvGDjwx4ARhXYAZ50B39ufwlcdCS
         JZUbJzb/UMt/ZoqNsoBwPBorthCLV4sXepe/jV6IHcyJ0BjVEGbcT2/QlabBCoExjsaJ
         Cx7DbUqNMzQVw8DOzaTz3OILMgT8XBiX+EbBrZDFXhP3xHHOk4x7R7sdfSqnkw8P/uxN
         plNmciFXZYizQr+bGUnbQ7/uqQlEYPl3+ae9m3pw/3NNowZG/jlpEzStkPp9EdzkbOPr
         05v5YPVlFFyoBeOoQFNq2aTfWC+Yr/XJtbGJL6EX8Gx/ftwSebvP1gAZv1034Pwnh99U
         wi+A==
X-Forwarded-Encrypted: i=1; AL+hErFI42nHObhc5t68qA8NPVhuEUHiibwhinzp+kmkI1oyuIeggY/MbLvPd5FJoBxdg/TnVcbchsgAvGrIrUrHV950@vger.kernel.org
X-Gm-Message-State: APuU4Z/fkmUmrrdsBeaBUPi6Qpoe4uYMmfEAVSZVEbBkrBp1vAT/aCxd
	sPh4tDVL4hzvMtP9kewiHd13oEazsd8fOv17eD2nVhdeFrEClBIC5U1UC9nwuFZ+p/KmjPC0bAg
	UebzncekNIPFmxxck3uPifmU629nghEDcxUBLUv4xjnvDC13YJ8UrvVIZ1fw8Ly+dllngTbTW
X-Gm-Gg: AYBFou0QLpiIlbJSOaVDbZg0KeyRDJK7s3tVwyHaW9RvfccNP27OFwQnmyWYKvGNB4Q
	RJJNFusDqvWZrezI4S3iHBt7wKDZU8maK5a9DbyRTWS64sgcSK3nuwJpkLWaNCnHO8Lh8tWWK6U
	6PACMVSsRcnc1KT8ky0MxjWyK5cs/L56JA/410XOPCPs2imMxrsZzPVpQMaIs626lYHQki8kYZf
	p1dREH9Ep/Q2mabffzFqP5l+Uxp7jH/zqUJz+9kQiEKzxnAEmdiZ94mWyeu8/u8IwBXyizGpJMX
	tU0hF/ERctq2Hlo06YOc9ReZfIEr9CMOOoL1tsddUGpWmorz+N4wKpdEVHdyXQuxuvsT7zJpxJM
	kI8Z1ODx9cBkWMoDmncKkTBGsaFn0eGDFM2ZSMvBpUVmzt0/F9DJhtcsuPAlO5nKXfvazN1Soy+
	re
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473123c88.21.1794846163596;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473081c88.21.1794846163018;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:42 -0800 (PST)
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH v3 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:43 +0530
Message-ID: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6c3QES6kvQsQ
 zwtuCQMMQYqC0bDJu//L1CZ70ifRH0iUMaInxfWbQfDbClX7B6oyIPf+krSBUL8Nu2HrggLRcZe
 pqDxcDGAPGjIgGa16u3hJBVoMiY15To=
X-Proofpoint-GUID: 3ImQJOmMv4jXrjp-FmGzIDKf0nBwULZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXxiz5irnzpd3W
 Y6xCyKVPJ/jIM2oyeYU5vU8OhiojeWosxmIZGA3D6Yd7hbu1lYFiTk/eUW007YGQZ4du8PhRwta
 feESg8z0QhiXtrEZ/uvgmY81AICvh3wRH6aLCDuOZFei6V3BBgFimybpe5oIIeFOp+hqMr0IWt1
 CZ//dHzXsRmpDZPyx3PxzouQCW+vJi0Tk1zSxC0o8a3KkVcBoJJn1MDGAbPxYYY5LhUe0wY/pg1
 AgaUIWb0Oc8MjRZC5kPnD9eCC+XqfDwJJonx+lMMQzDDxgbKQn1VpKPtbu6f9L3tU9wUuFXsW1e
 EsMhoHq/1LYn+Vhlc36qdPdnvw5/4daUlhMbeXd3OHHGxj3kd9PH1s3mf8dJl5/AvHR6o8hElG6
 ZMM3t5lagX87HS5pysDYvZ2Z1ydFVSZMSS+C+hn7GhV7ohImxxM/LEha6A2ScmR5HL3+FNGshgH
 gdBzQaiUwWhxrjyL3nQ==
X-Proofpoint-ORIG-GUID: 3ImQJOmMv4jXrjp-FmGzIDKf0nBwULZr
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afb2dd4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

