Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010063BE167
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097554; cv=none; b=KRLLD+TpmBXTjf+L34QP2GBwTivpRXM0tENpocTq/UPpQigkHhgI44lmDTzJThhEA3qKZjbcDVDXEPSikP362CXKIXlOwoH6cm8NjKIS4Nq2qUdU6iS98U85Mzm3ZduIjGwiftiKNjN9/aZQWqoA3HwjSMTL+r1zXlel1IdQluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097554; c=relaxed/simple;
	bh=QZQdxBzDREz32KOHpC6Wbf0TNGVbGzPhgBMYA+OuF1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZgxtGNaHU/f/OviEjqzwDbNZcKxbZNCUWKKaDUtRKPUF1ZBxkBQRcHdGyRh+Kaej3bFHgyNIYWySxkxsJmDkfM6nQ71o+MArnqMpNsswKfTRgJ/WrpJw6va/L146N764CQ1Usi6qIz/71X7K1WdOBacrvuIe8D+pyRhmTUx+ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdOiles1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWmq9UZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdOiles1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWmq9UZP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBnXn1920910
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03PO2ofFbk0
	Yu5UA0mjka1WF4PLNd178/K38c0flSgc=; b=RdOiles10PVFNTsM+iN8mqyJAEY
	kLhkqbaC7CnBRxLlA4FssYmNKhQNycGzI6juLkAHvRtuzpXLnGxIHAbiBge3mT06
	sdZOjrvEnZTmrxqVJb1x6EdFzDW/nHGtdRFao3ac/Y+g+o24BXIDHBfOLVa7FUk7
	DmpcarEZxqgdUx/EefKsK+iK6bxGgq4Cp3hfOB4FryWGMKcFmYzwKGOjLkWYLj0y
	kBbEGi58WEdg4i42zYqUhKi1FK9+OIvOlu56FnolRdvOEJRAbRcxF4GuHNRhFWN4
	WTxfDFn4JFdQeIFvDYQPvfCFYSh1c9YrbeTgXLlrnN2W3OtoNZKr19o/xOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd85e08fddso1488111185a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097551; x=1773702351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=LWmq9UZPPbcP7ChKoM1E3dGiJn1hDoexA5f5WP/ahCjpT6u4OU1/2pnoWBHN50pHGI
         slAIApOTrSGb2PYnZrBc0MrFaUW+G+CoTl8GS56FMEzXFMHen+gGZVC4Ln4mCxCkG4ih
         icpYw7GHB90PIIWtTZrbxE4dFCj33/558hMpqFiQ7kOm4hEqUpPuXG+ApADKfH+6NS+Q
         1eKLiI+vpzCrdI6xvkQzVv6atqCrxuq9E6ubY4IOspJZEcAjnNSzA2/c2K+XBi4M37ws
         MsnHDJGoYcd0dx0vOK+/g8xgHurkq4XYqwBQ5eBqkxPmDI2TS6hheoUlllDNkRY4YaLg
         uk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097551; x=1773702351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=sZ2FI9gdH8vZwoggNuQ0+DSWIW2uq9qU+eYLKUa6BsHxIu0CP1NJyGmsGt2fhrMy2Y
         zn5HqAMSzieS8df2YLCAQhlzNBUWfVvHLupRQW9C8o1HWLTMcGSsAha2Y+HCcOUXJ3Ns
         2H5esUKvY7sW7cusW61vuGSQ1K2oDIyNeY2UHVeolF8zuiNsnY6lngzIRFsgp2yjPcH5
         TFkPwLTx8juxsPvSbAO72bEq+OTFFijvp5aWU2MDcWGD/PapgUrfCQlnEZjPEGlgPKxv
         R2CI6Rcso2cPNnkJa5e+Cvy2IdOQFngy98GxK6a1liUy8pIhFeFgfa2gT29kvQ8EjRgm
         sHIw==
X-Forwarded-Encrypted: i=1; AJvYcCV8XPDnnT8gsDRyT8b+ZWQ6lFvddaiZ0kswxG8YMcy1aTDVn0uT5shanywS+PX4Av4l9hQS4IeA+eJiyX4ATrdA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//cDKKCAZVu4Mj1TqS6YO7ChHu/SQobBVExcbyVvhbFgy/42v
	fM0Qm31/rHNnUX5c1Z0UOvwbl2kQJcxO3w0wTVjJbaF2UtUYzhwr8PEmcHHcEOuF1HMqlNEkrYX
	lWB+z0lCHgiSd/NNVgC1oaqJMqy71MYlZab03bhSFWZPZ5tOCjt9M20n3t+KlDUlq4kO7eoFS
X-Gm-Gg: ATEYQzyYUgB+90vOmv9tICc6L9IazyTjLplhd4CFeNiTYFMviB9q979WnpciSTkha1S
	OK6hoaTuw2+npXRWezMX1Uf5F+aenQ/sgMCjnHjmWfa4DiHq70LDMijBsi93X/zLkjnRYhHFtbq
	2E0NufwtPTER8b+XzC+NH/I5EmLrIwI7xCHsPqLTxhEJoMoVHL9s6Yim9oOl8fL/ql5FMmXX0+0
	OL6qDDWMtclyalR7zk0W9tFeLqhZTu/6gJDjdtiFHIynrEHMLQOpIwpb2o8C4FGb08j+tq62QWp
	j7w+mc+EfNt4TMfenQc4/GliIJDXyFHI71yAmrAR4930Nj4X1Bb/GAAO42BP01XCtays533j8co
	PpLxvMLrrBTwmSJfEr5OV2fOly1mauXn3u+BOYObj5xUzHc9LWQ==
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41475685a.77.1773097551409;
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41472385a.77.1773097550949;
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:32 +0100
Message-ID: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af5250 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=DFXFU3FfpSgEbJi8yTMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BFKmgbiVBT6mtQ8PS0xwRsObIhxDO8vx
X-Proofpoint-ORIG-GUID: BFKmgbiVBT6mtQ8PS0xwRsObIhxDO8vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX9w/xcmylHWDU
 Sq+iK8e52Jcr8nmIewmTd+Cvaqaor/g/IZO4G+3mDZ5LjUYEu70CGfd+hxZ0FI0NsmFNscSTpXb
 0E3dq7Cpu/pCKn5B7s8bYT5cX8bvHMAFaKd1BEw2iP2gyRooS8bAhf3SOwQZyhvH2YNbGcn8gO+
 rM4rour6JNiInfMeK9sFj/CEKMiFY7jgnvrPjvmuEaB2TX30P288F9cOR+Qd8vwS2/MNq8JCzJO
 CzO/Ytou/3asV5OVQI2dxr7mhiOvpeuYr/P+2owCPEV2/9YXT02EudZGS2A0fJv1mkC/JMoblUs
 +xEdJ+56l/4NWU2EIcZJydgMBzkoXtFyz5Sf54vOwxecvGC64d9MNqbFU9+Qc42dDuLnZ3WbtXn
 4feirjV734u2grUpeQeJjf6GiNyMSdl5pub4u3CreFVXx3TQcgUuy3M2/OaCPCvly/Ad+12W9/P
 bopz6lAZSVHd5RC0bgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eebd78e7ff6b..4fdd0af415d5 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1105,7 +1105,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	spin_lock_init(&qmi->event_lock);
 	INIT_WORK(&qmi->event_work, ath10k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&qmi->qmi_hdl, WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&qmi->qmi_hdl, QMI_SERVICE_ID_WLFW,
 			     WLFW_SERVICE_VERS_V01, 0);
 	if (ret)
 		goto err_qmi_lookup;
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 9f311f3bc9e7..88d58f78989d 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -7,7 +7,6 @@
 #ifndef WCN3990_QMI_SVC_V01_H
 #define WCN3990_QMI_SVC_V01_H
 
-#define WLFW_SERVICE_ID_V01 0x45
 #define WLFW_SERVICE_VERS_V01 0x01
 
 #define QMI_WLFW_BDF_DOWNLOAD_REQ_V01 0x0025
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index feebbc30f3df..1397756d6251 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3337,7 +3337,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7968ab122b65..eae416db8b52 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index c11b84b56f8f..f31cba7af722 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4061,7 +4061,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath12k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH12K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH12K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index b5a4a01391cb..2a63e214eb42 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH12K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH12K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH12K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH12K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
-- 
2.43.0

