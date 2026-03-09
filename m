Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BE426688
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097565; cv=none; b=I/xGdz20lIwnzMcDp6YrHsur3FKHkeTy7G6Mf/oWAXZZ91uaf94LrtAkmmliOB1gzIMXSWow4/YaEAXrScD9MlZggPYLT0d/McIUVKX3XI9fBPxqA+/Av1pf9D56JTovhYkHmhM8/5HCbOcmyha1fchYMt0fdhKqUxa0QBCRDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097565; c=relaxed/simple;
	bh=Y5kmOc/Td+3kz/MbZfYNPyjwrYkMruVLbGOtRAiAKz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLuulj2KRXGhOBj2FU0/lDPm7hL2Bp1h1MtxaGENSJyPWE4rv1I1Z7ylBNIA1YMCHh5j7/fS0orhM5Mc+Afc9YDqWQMtpbBDFT10/Nulk4DU7yOeUBe47pZHtOxZUqFFtaRwCXPdl3AUYK+xiEEhPzBT1+ydUXr41uQeqQ6kwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnmPJzaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjDTeJsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnmPJzaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjDTeJsz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlQY296205
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+8grnDyx3a
	Y04II25yHs+DhlQHwGyE329UXeTulGfo=; b=EnmPJzaXDKfHbBKit2i6OzOm42b
	lS7sFWuQdyT6nOJsixiASHIu6RV+GBs7xstRQSxbPvjcChqJJ9XpdtxtEefvRUJ0
	/vzUYoWy6seDLrKnbfnBzBZ7VHyqTEwYNlJxSa42KZQ35lhO+qqrwgr0MhgF2v2u
	XIUOlYcxN0l/SiTaVR+/4vyGrXSRUNY4xGr02/UBTsA/bgKRuSiv0R0QaNzhBiq4
	c9maWi3bGH5wkaI4/sbRIvQcfqVK9l5BSHbTV8yOOhJoz5OsXsJifEfv9WwX4F3p
	jdImAMabQQwyG3m/dV4KrPkxvDG2ukxU3wSswURC0mqLM6NZKINavIDuW5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:06:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so1438856885a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097563; x=1773702363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=HjDTeJszeb9Q3Zwb8jX/rHo/6iVYdGgz+RFLTkKOiy9ET/j6T4mtZ3sJjfgYExcHPM
         S0XbQmXwK5M4LXvWbjKxqA2hqVWat/67xWaVKTOBTyLS0jQWg8TAAOTF5v5x+2ZBt73R
         9CCKauRusnnGy5Z1w07WkGCB3G8fnQTlWKO9Jb4Cs2b9/Mii6N3BaDeBCz6MxDz9PknP
         6/BCgC5yEYaht2N+ILHB9Zx14lhnGp+sT5uPNWtqhv/C53/BFgAXKUKp5dJhiMw+vzbV
         XkE0B9dWYgWMIQSf94mvtlHDav+x3sRAoJBiCjlpAMZjjOqHbG64m7naa7GojNECgjs8
         xF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097563; x=1773702363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=tWV0BCzrhHGL0Jb741A2LSnb8HARONsEcdASKYRASOafsG4yXgo63dtsjEjAEJfeZB
         MGvHJY73HtYglgz5XEivBnQlo7HVM0dDl+SDAaTvBpxAF4KjdlGlukwymbMvjL84JCLO
         /Oo1688gzxsDy5XpGDYYRrgEWe4CsuQg8RXXNpqCINx+eap8JnklHrqwEqoca1rZZwU+
         DWJ/p6yAIYeX7SzWFZAJx0orFRr+5OnPEvYMhGjtimGyYRFniQZrOKv//Xp9wgbg8H3F
         P4iI81PzGfBCZSZ2Rwy6Ypt8jJcAaVHg1iU7M4uDTgetqMEZqpTt9rIpEaK6BKJbZlpE
         QpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVXe/BKwE5A07cgCh52GzJnilsKlEZvZWdPa2agR6xPV2bnRPn3U1zlAJKI+Ug5hMw0gvMiU7lEALmMo47Jp1N@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHAsnFxN8C0r8EwBT0GRwZ1B+kNJHCS7ozrCpGDAEuHyuJx0X
	pM/175x0BXDsTcdSWaQPzRfFab/KTDC4cffBJkKLhgSzq//84BeeWkEb/dnzbbYDuZNbqxkKxrt
	ivys56tXAbHxTqRykm+6IOtbDUGddtd4U+pmCkPQ1nikzDzC72JXFsOfGDdLR2NCJuZ0F9j+K
X-Gm-Gg: ATEYQzwztx4FdnPx+oNxSWAftp+2c0y5U4OFk15Sb+x7fvQ0kZ1Dht/sHHjdvcEdYHt
	twtJ2dnCO/rMazbJymkR98ln1g2jJKpfoxlkawQd7Roq8QNIqI0t63MF3gQTbWrvv4rOJQGhzMx
	dPLLPIDFpiqc10XdTy9WEuEXa2AnVMo7G+vhGOVSjw9I3BljxDRWf1RjmpbIj9vLGKdbl+KGEqu
	fjbbENS41vhEyOfDDDOi+cUumAeDeDRVtZuvfijqrgCmqSHYT/f85srsqaA+lQc+uj/co4EcVWd
	fsgkGhSSKcwShAaYtYYvNdHQDaUdg3DnKO+tT/3p+8HkViHSwmcCkQRiUUDXRCkUZtQKfaa3Hkm
	7DZd2Vmhdk5qnYiYwu6tOzemHfIYfRFdMexNk3XeFwlBRAkpLzA==
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568427685a.2.1773097562697;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568423485a.2.1773097562240;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:01 -0700 (PDT)
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
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:36 +0100
Message-ID: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXwaX4c6O5TWPh
 uktP+pfjZUW8SVGMrtUP/uqCxi314Aafn/27JTUC92GvlIOFe5pdQcUhcIcrd2l5AH3O9hP8lVD
 rdd2zEDxZ9P80fy1XylOvU+284OGTs9Cf1+t3Nqg7zbna1tAcdVKp0bbWvGE3yPMngwR+JQFtjB
 D7xkVhMHclmdZyGkToRO8YJcnEOZup/D6rwHwuRdo2cxD04G8tJuYrCvwDaU3nEzP60r0JcJZEI
 1PNeqh3mLAGg1JVvx39/0+FtxpNOh/2m25gG4vmZeaUwHtW2ey/zFCY737BfWajb8D9IQqMMzlm
 osLA40m9ntWcXIziTVNKBa7X8lPHrOCHPq0W+fJqiGQtqgK2H78CS8hHKn0ZxDaPFvNlMUuiNT5
 vEFf1uIS6c88SvOWRweEnXBHP2TD9BXiEUOSJCiEocrOkZvPrBBgnFftndG/V6pdxiRbZ2MBkes
 FGErYpRCfheLnik3n8Q==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af525b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MwQA3G6alh-AUGjKjtWhHB7g09l0Xe_v
X-Proofpoint-ORIG-GUID: MwQA3G6alh-AUGjKjtWhHB7g09l0Xe_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 510b68cced33..bc4e1bdacaa8 100644
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

