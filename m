Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E13D3D02
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681292; cv=none; b=l2T6KUG3PNtP4Op75XLEMlGTDsT6460F3nHlB+t7uNSDlP/9qwYZTGMR2/2HxeunSoZr2tYchVFikAyorzGRWHMoOXxG3jL8Npu3NIK7KiNO0Y21+ieOoqhdE/6C+FoJnxSFFoOdNb+wqEUoxnHACi0p1eEa0wlTzVB47/htlIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681292; c=relaxed/simple;
	bh=HtFIHBv2fwd3CfESxvQmQ/xugQw0YlUT46/6770djq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unAMUlbWKm6swvk3qXMSlFm/r+qXLtoTZ7oE/DNv/8Rir74vkf65SGF+6ENfNHRZ13vqaGB/IEVHrXcRsg3dpfh0OswjyJ3i7kV63gZqc3tDCybXslrpsmFUxJ7w61XOvEBwMlgP8gN3rMoKE4RtEmszHi2Bqx4owEBmqs8UL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfegwWmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jh4GgiwG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfegwWmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jh4GgiwG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECN8q1639254
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZoAGvqbvmk8
	WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=kfegwWmK+oeYWJpckng+sZks14U
	rsp48Lfzham+N65Zre+9ESiRr5oysAv2RkJYK7Y+U1U3MM/CnD8fkCkDZkAOrGUW
	Hpx6CYpG+On9figKHVPAr45yictYQnhXhAUrutjya7i9Xr31yLY/RKA6S+hzO5ZA
	tVsYisIr+HoXh9INI1/BlXHpPS0mSWQneF1qU4EmtOOvJVzdC5r7dKj1v6MmYSNe
	MiNWiBBVxfLFnBIb40R0DteoqRIwA7azcqxzpQp9Jw3OycFuhBKR6sDy8FoVAiun
	FX7nQKMr8eGtigtM96RpSP4VoX/itwoVqd0fo0XuZ0vROwJT3T3e8omsNSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke08px2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7ea0bb20so2841689585a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681290; x=1774286090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=jh4GgiwGf8Uke8IIttGtwATskHLdxqNDgoxFHi9qWBd5MwT4Ed5gAHI8MkslH3oOOy
         k6bXV7GTEEB4HKKV6dp0TU8o25d9+Oh4c4GqNoqmnPJLqWBRe4R96K8mbHdmvOhRjNJ9
         znXNb/OLw7sF+GEMd3HCr8E5i36PuYVIS4Y96NtbhajZfc+xFAa4xZaxvajocTwHEcSu
         /pLibcIfz38skfK42UEmGYQ1jIkKTK189j2vpr4vA5TYQS8FJH1RUrmvzkAfUNJIOQ2H
         fVH3aRJDj/TTjzjNaxHIaRqygvbfp8RP4uJ9ZdSoHD1aNxK/isKMdUqemMAvUqHdbfkd
         XYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681290; x=1774286090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=QjfnAH2v3StL9nCKkAP6mGdDgwriZmhEhr4gHlJhIA2fdSbcgziqm9T9XZpqff9AnR
         wpCINA6kbtY0ebx0ausBPDu6L/k3oT/XDTWaqr1KVk89lKeNdhFL7phrJsI2P/FWa/52
         QwQzJVezzdp8k50RVgWcROsQCctybWpWu3Qe7rPv8n4r9/0JDMoNEIIL53f4PvXv6hl4
         dj+z1o3ksYyC6CXH2IXFALsMu6Htj3VbCZHt2TV4FD6fxYgGMvgjEQGB2H3CnULJHIUj
         RfZxx+TIya5hSN9okd/K+ox6GfSTsXreSZV3lr2x1dNLDzsjhM0xfOKzr/EK/7eve4CW
         MY7w==
X-Forwarded-Encrypted: i=1; AJvYcCVQrcSSD9zSG5m/v5FAYGv9bBcgwTIOBD/kDjhzNrNOFAzmDEyTpIhaemNlBRLOcvqmD5KXWeJBViTB88E9lyY2@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAfVqYQE/OxCCEPdAVbvLS+olLJHyHMNTPmTX2p++q5h0Fegl
	EJtKKFwXZYBnJAz+RXD7P2aNPEVgGp4+o1r6kpxkdei+HvWM5VPg/C1oVQPPjbBudoWsuno7hVi
	XlcAKOfbOv4IfgOhDtRPe8TpcTzn2BDZ3lhTitTGfLAnSJZlB+bMkrqL4cr5txZcPs9o7brjw
X-Gm-Gg: ATEYQzx9TE+a11ZzBqV0EqUMdinMtgMI7cARiGkhVmUzkpt2tXv3wyay+r9eXZdHVfN
	IlcHcfq/064k2agNyINGQln8aFPyKwITg2T5Q5qZdmU90RK6vld7xR/stfPtlrOvjjMjejTQNJ+
	tnJIlp7/QVELJvrAy/GBMTjLNBfKaqxMIpwY811QF1gRCbNJmbF8G+I8hSsn5WBgCF0bU9z8xaS
	+vzpmT8Y0sjx8MGZIE632Bkep8eY7Lm4rXp58YNvam9GqeDX5tJ8cDRX8VpfQMRyNAa00AZdfPj
	rRyX0jkGKXLmib5wSJFTHB8Dc4Xft90lOW7Zf77did9GuvP3WZ4U/L6aZin4z/VzpmpfVpKS7/I
	h5BzCcZNTnzXQwa1SztSc2TknrkmixugoBEVr4H8oncK5XPTASw==
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1319004385a.46.1773681289324;
        Mon, 16 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1318998385a.46.1773681288653;
        Mon, 16 Mar 2026 10:14:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:47 -0700 (PDT)
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:14 +0100
Message-ID: <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qkLe0uW2VRe2zu3MVVKx2IqAAk5DWDR7
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b83a8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX9Akz1nvkwZrp
 Nj1bKmYl/W+KapiXkN5HqKhBBEIe9/F2hZaPBPLn95paTaO5HzR1+d8j5tiqwiWVrrhkbieP2NO
 KJL/iyrYtt3USfZZmflQM5ROwMx2gjKmTJkngj25OluHqAR5g3WW/ADVv6o8FkWDpSoV0dNnyZ0
 yI8GU0m4SbrKDv1nY9iAP70FL+rC2DLjaX3g514Ux2j0ESsNbjx5o3smleuJbfYvQHwaxI/2v9N
 lhHfInWNOSbbePbqe4duWAelSjB4dlbsHJlCQVns8LrnzsgBzIaHip38xDX9IKbdxIeMYXdQNa/
 1tPWjs1Jw76fof6o6nXDWWGH40hVGyODMB8FRuPV3PBmETzHUTerDFI2HydHrwHJyAo7y0L4R9Q
 n3gvin4nL80lR6E2pSwLZroq5BXks+GzAuwBOrPZyxYy49VCKrFcu7fKYwElpxcSY2pWwgK1yia
 O/5uyEwQrrOQ52Zk8IA==
X-Proofpoint-GUID: qkLe0uW2VRe2zu3MVVKx2IqAAk5DWDR7
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
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 01e6063c2207..38d36397bb40 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0

