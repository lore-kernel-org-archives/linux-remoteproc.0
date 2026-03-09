Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601EC427A14
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097562; cv=none; b=EZs9JHRzwLAmBiubSOW1Bn/RFsq/nv5aQGAOwjYGITjIZgDrC0ZldgytbhlmZZHOoZjzETzHjbAAjEwbqQsON2TIw8B+/1Ru6gkog7FMMQs6W6vgqSlDJIEdIUZjsc+6Hd1wfdd6qCCaLliGgTQGa8/8iLqxTqnekLfI9aCaC4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097562; c=relaxed/simple;
	bh=ulxSsa7188EBz+8PhYCrmatbVk0Sh+N5SiDD0XnhX7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ce9bf0Vr5NhNLlUaAObBHwiiI2jGwNjGD5wLeLIXVp35GsvA7nHC8EHuJYkGK8TAuHszD6d+9dq98tty8sRD589Hyzh0Xw3TzGZThfqgkebn6GG4/8wFxFWqvVyVweNN7YIaYtCd97BHw+r3CSgOZP9AY2umrBlhx5TJPPERtaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaYhT6ey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heE5DFLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaYhT6ey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heE5DFLZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC6Ci3280654
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/gz4Ge3MHwk
	UDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=; b=PaYhT6eylqd83bpMQFYbYaV0W5S
	mkzH1MgbfuAvBJ/7ojSkvwmB2brtv9Dy0UGX8UfrUnxTxvdkTdNan6OUS2+NvZ3e
	sF4nS+5Yv9L3QfuMDCsD6Y+UAuJmb43YTmwqFS/Gys81rzF0MMxK7v08rJZhdA1b
	WV2fQRVJm2zf+akHmBl5+inla5z3FhhzRUmrUlgsAKzOM7bgrX6B1OO3v2UxpUMA
	AYOSjkMi2Tv+TU2zS8pwaDgeJpYWAu2pVQBaPXzhjOTfhZ+VLz3I6w89RDpVfuLp
	GxB1r5AI7dmq8fbxWWH/M/nZkJFhPG1GwJ7GLHTCooGJvaSAAf/y037ZHYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcybgn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd900cd3a7so454438585a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097555; x=1773702355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=heE5DFLZZBFfzHQy57r9wHCcM5YyZkfzpeXU2HCzt/OvFiUW/GmmCMHNUKMFHibU9c
         yP4bGFgz/mapyRq735LKe9UDNwcX1Sm3nJhW8scXKUSJvK+xYC6O1p2h/Sh746jQfc9f
         8dU9JpiWIOplw9CKZL4pUEe4UWJ1vC1lMybwsRSMqBQqCMFgU6f9IGs+f6urSWiIYHzu
         yi/zvoGtPs+CGXb6QOZDdISu7Bt9YXMJ1EgEhNevR+KEvdK/S72EbScaUAZYCWCbyfUN
         U3J3ya5ezlxjBm5Y6GZ1D9s4eVEZrJBI9YDE7oP7FprjG9WvTGPmjW85bODcPm/CXPem
         OjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097555; x=1773702355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=W3zG292Wx+KKdTFBg/jbMAMoAd9e0vhUXMZPT9QjyLOcntNVLpStaukk4a6zCvzTWF
         O5MvgiHaYvMSPh+TlTH1FrmJwZabm8v6yXojv39b5ui4uU34WkonpuGKDvWzNFJr38cU
         IUgTUPsny8B7h1VU1KFrOwZ3j5rVTAiqRjKGl7GbtqsTAA+6bz9MJqFK86uO+Y7jXhJg
         yCUADpcn009t2/ICHomgJ0GNP7YbHtySJN09tyMCMxqsSAIGnB85sUI1rfnGsln1GnKO
         XooNj2Z820Qo3C9iMLyreaflfklYGGTG+UbeCg3MOi6UVgnZTIHVdYbgBrabaNH06bMZ
         hf5w==
X-Forwarded-Encrypted: i=1; AJvYcCU8+b94DH3ju+3ajDkitKHU3TRGfNF/nWro0LzbSKwbqN34CPOxxNECXHeVkUOMAO0ZaAHwXc+YHf5VnE2XjGs8@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAiY7w683iwzaznomQS+kEoglKXgkI2bYo06u35T112kh4tp8
	+gB5sMZ91tmizInT/qwDDNH1hqwNiayK+n2WGmZ3Ckfi9LncT59HGIhTuxRYf0c26N3J0z1viwV
	kO5sdKcq5U2lxpVEPzhS1Lq4Hh0YSzAq6dVHVQi34FuBorV4PKyOLFbjlI4rJcP5fCa7HruIP
X-Gm-Gg: ATEYQzwP+fL2rSeNiUttc2C05r2NeBQdOFzzxt+s/xEOXzaDf/Wefrh6U38cJ9L1UlO
	+My6blpyQqYlwBHd8qLmWtRdFdTIgqUPd/2NqpJx06YxdGtTK2RgFDkXJMxZAkaMc8xgSyTO2DB
	MFHEOQ+ScGmgExySVUHpf1EOUqRHeTzImQI69W445EiNsIZp1eZRGlUaMj+YIu2k6MtrcPMM/BP
	RyqzKZiWQq4ugZjS3yonDz85kaHGQfr1hDKPXAFJNQ/utQylB7mPmLfyrfn8rj7X0Qtuow2TJEX
	jlA9YpDRDQc/hxXpIxcxxEiDniymiFBYqoJPRUnd+jbzxZDznKP+OCEuOsbJuBTP7vLAuk6p0qR
	yoUS9+7OA2KzL8qz5LdTRanaVY+jU7MYTjcdao1vTAKZqas2dHw==
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439791285a.77.1773097554751;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439783485a.77.1773097554104;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
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
Subject: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:34 +0100
Message-ID: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXzZhr7k0qQi5C
 qjuz5ksXMvYrz047hjPnRxW5kHuQVa34cFJFnup/YI6Z0m2Zl++T0Eb1OfDtykGh6WOvfI5Pf7P
 z+vnlA5bJzLryUh6dKLmfBWiHg+dd+bhOh7Ey8NjhPmCpXESfhu6nG+IdZI2NRnGoNIm5a8wYwJ
 kZaS5oCBhXWn58AGH6gXhAcZVlpOZAPEd38FotdqhoP734KXwnIOYpZjhZIyeDqAVPujvJhXnra
 uahcipmB2JwjV+HNv58XKgGZkRQz2naBmdNLMmKDZuwrQMUde9AxOSeeSyU+RzG0zHVII3wQZ/7
 6eDB9mItZRhQnDu3SIaTe3Nheb1fG1fZAW+IYVL/P+HWUmHVc5A+mhfTcVSx5x7bqcmndVFcYFn
 TQ/VMBf+BUcmdWRIINrZOLKwilPqfDwNOAJlgp98MAC8QRBdGl21bJ/ON98wQK8o3FoFlPvqBnv
 Bz6pWWcaQOpe1oebmDQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af5253 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HP_2WdUSa-eZPEcmlFO_LdvlFVYUU2OO
X-Proofpoint-GUID: HP_2WdUSa-eZPEcmlFO_LdvlFVYUU2OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0

