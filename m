Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9D3D0938
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681285; cv=none; b=DVr5KJx92mJz2V4lxneTWnUAwEjXbFomKFutv6G+b8QWIIElI3iFdzZJaq1WP5mXUOLGXxH1lQVvDmaReQz83WoJXf7NyO4wgN1cDVRIgRwrJafU1UaVRt74R2mmQqTG+hOVqbx7WU/B2LH8ADtjsgUKnN4pLpGUPl1I4jwWTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681285; c=relaxed/simple;
	bh=RitF4X0ydyAtTX/CCYADqtg2SWdZZo+quUkjHBSz16s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGZdDq8pqabU1B926WpSWqEhjwQq4Q987Ual1cpWaIPfi02RB3P2Pp9Ct13df3/PFmOYWqOlkavaMtyghmhUgfd2I2ktHl602piSEBZ4ra2ynqUh02BnSM+Eg9SWdXHt90UO0CYtBzrLCDffeF+JX7mA5BJ1PINgvH0QV39M2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJ6kkfYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFJqYXWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJ6kkfYD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFJqYXWm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECN8k1639254
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sttkd7eb2H2
	60gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=; b=fJ6kkfYDn3KQ6shXEvD5Q3uqQR4
	8GNTg+aD9oSpshc1SUYkQ1DdIXsR0N/fcaeGfyoHV4xKEVFI7iiZXrR4hAPMskMz
	7tHgnRvZ9XXREaK5hpUww3cvqQYCIHWXt1CwDZ9F49eR7RMMwg9rYH2lvcW97zcL
	8HLQOmz75+EwnlkddogWCLGESPZIg8LjcTytuh8Wx0G1rQXbfdw8GAlCP7ZMCGjc
	1huqPLODNZdQdl4PMl8XW1afJqXFOVxIaFnaWoVN/4CJTqLXEQJS0ZYSYX6nBx5a
	6gqVa41jBh2roHre2gqdPlwNyqjeSYWQGddaUwADGLQfVlL2GccNKfDqzCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke08pvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so125973385a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681281; x=1774286081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=;
        b=KFJqYXWmT7GClAyqEnN1E2+zu7F/rC+Wi7R45zJvxkNTuTZ1rcQWfLcNkn5JJ8xhX+
         R/d8fKupRStwKcEehEMct4d9Gp3PFoh9ly9Rl9Yfr8e6q76xqXYvGvrRyNUS/tnpudSg
         rI6yLmdN1w0pJ2NNAhUtGKpOPtrtzo86K3EBeYJABrRF+IvboPz6KIBj5Fwl8TrQ3bfa
         Q3FzFaJtDFP6Kq841s0JZetTM9vJkQZ2VeVv+pIv3YIjXwMiHhQivUdmUFS9+/PQGeVT
         9D73mza6OoLYllRPK4H4pK+TwdTCAp62vaAJGOLWk1lYe3i3e7lBv4RpIQgCmO5NeErb
         kt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681281; x=1774286081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=;
        b=i3nxC+Pmlkm+hJnRHM3qJA3Cd8NL/sGtcWr17g6Ithy+1TnfteXhQe5QEnqZsnx/al
         wIq/SqxPxkXk89qPoko6TaJgJO0iGqjOu2xxTx/2uYQ0+6lJujbob475m4paonHfpLUj
         o7qH+YHeFRfRI6W0Gt2q9y3uo2TZFRGzCj1lHGz0ktnY8MbqornpMxGXH2l1F3tqUOj5
         YnVqnYzSxfUxuYjVcqZflK5pk2X27UMbl6ICK6unOCpyNKgerMl3X9mSPCBAQ2knc8/m
         XirYM6CbwH80uE09co/4UIUvqPvKpt1DeMEwgspPhhUpQwDdtMoDfGozUY1xxVUhbNXm
         wAXg==
X-Forwarded-Encrypted: i=1; AJvYcCWlv8UIW3YauUKn4EtMgwt4X0xlqOCfnX7qK1EGImtmhRecvlY/GWNK74uqnqw/m7Q0/JAYawg9amb+XhRPqK/A@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/44V5Ttr7HZ6zDdRZhbF0c1utxpLay7FSGNb8sZUwqsMcBRK
	3LRT8YJrhA1e9ugqpeuD9ys+q+AncuCzxDRtQZTmixmZtM6PvHJb/z3opGUsDO0us+i6dHNK8+R
	RhbrIXgNwocINR2qM9Uu6ipFTNzd1wF2ZZNA83miIZrgxFYP1Pra7Duej8NpaKxPEAtGudFhF
X-Gm-Gg: ATEYQzwUCk+rWerGvRYfRuwxUqIstFNtBxW+YbqIMBRPNKKh4Twqw8tsj7WR+clRchv
	cjtjswTc69gCs8nP+/xksF5dOoQYlkWYmPECamXsU1h84/T+juKD7RcggcXi5B8kx9IJxe8IP/t
	qIxBqMi3ZB5nzDNP2Lb6EOHNV+bixrpbGi7DOX3OCb06F15GPQ51Q6rC25EKtpvQg35KZaWZ4FE
	DfSdBsqPRoJHBe7pi+XDY/8om7dkBpl03l4NULSz4K+EEGSLwH65gPXspI7jGpCPkPKyAXkql9m
	sjKDV3mHIggtH5MmSKc89ys0AGPver+ezilGET49zc23M7wk9gOZNdtNxQg8I4wNh+Rq0PtIJ7V
	iCQGe2ku5o2ZuEeeyQLTrShkfZtWPqD9vEUS4hhexJTaHiTRkPQ==
X-Received: by 2002:a05:620a:1707:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-8cdb5a0c51bmr1603120885a.10.1773681281495;
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-8cdb5a0c51bmr1603116085a.10.1773681280946;
        Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:12 +0100
Message-ID: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Hw7fGCHJt1cqr5VfnHv8DaV4Qpky5Ljr
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b83a82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=DFXFU3FfpSgEbJi8yTMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX1psIWAaWVhP/
 CPq5vAPxyWHaTj4IJZ/3twvEOOHl6uX+TkpEG7hDAlWpbfQOnbhEXPto8fMe1gO4QiQDpld1M8N
 Sq8Qll5BVcmSuZQXheNOZDWh/XDDOaZqFy5hNpq3VowQl+kVEKXveSdj2GQP0LpwDelG0Hf0J0Q
 k/SuxqFzOy0aar6tezeVEiGGGOtOo92WTrAE3RuQ4Vh62ZE4ePTnOWouDLXP7weUVL10PbmxfPd
 /90sfX1XhgXdxqURFTO6vVj5j6iJ78+r7bmbQDe91A5/bY4s4beQM7HIVmNXBKomB9ScQycoKF2
 LHkw31Ri2azjzk1bY5d1CLENDNjzuRxjEfN0khAgnhu0DuzP/zlfChGFIQ1NVjXG0Jz60BYqd26
 wwmbRujkIGkbjGPMVIsuzMk4R2mS/x1BVSZ55niPgeNeZOUwSgfOfQr3qKwBK3HnUJESVsUBKsc
 m8lqvb+wavvx1IWdBuw==
X-Proofpoint-GUID: Hw7fGCHJt1cqr5VfnHv8DaV4Qpky5Ljr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

