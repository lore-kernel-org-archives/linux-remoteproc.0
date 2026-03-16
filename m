Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EDC3CF693
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681283; cv=none; b=kMIQhNgI1Y32kPoMPH+yijjFwsH3sYGJKESnJLWW1LjBF00D+xuSfi8U6LCkQ/p0Bu91kABqFI8fXfPxrTN4/old4nj7xbOP1MgIUvqJ1xCV8XJvmPNf0rp2dEQPVa2SVYlJ8ybo4unQQuAvnj4aG8J6XH28SPX/BNLgZvDDDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681283; c=relaxed/simple;
	bh=vBQ6tTOdMa9PYbW5txamAlvd10vFcBIuxy+lZseqTwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SoBe6Q/Rt58NzAueU0e/Dip0P5ZDoesrwSKuAAQyPoIp6t0ggF8MWw9xzTstFBC1HJFSZhT+cDcZQqjZSXgxu8TClIALrmT/Oq3WLi+8VnMYtaV/QJWsaIb4enKHmuwrfHqKm6QRXJO4HvI7x4OGV40FybiaxsXqCZ4ZyrSPYZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVsSgDcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvDC9HYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVsSgDcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvDC9HYF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6ORu4022233
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fg8sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1453662185a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681280; x=1774286080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=cvDC9HYFa9itb9N4t8ZKRqYhyJSuSSQDSGak0uu0Bw8CgK16aoUwpL3tm/PLKtL0dg
         vgeib2Z+fSgrHi10uZoFsCglEc4C+nxuGUzx9W0eikP/poHS4hkDxXJ04qRgS9ShZ9Si
         g8uiT2YNun+E7Xw4ieayY7kdDaupYco3IMY0fMQoTNM9uUOpKdwL5MtWX5m91f0XWAj5
         /bhbZhri3J9D0TQ4MeobXSe/U1r/hjlM12JWm3LLqgxwMbypWjwHGMerZVLzsE7kX7Zl
         mh4ylxrwAM/+EthqFmBmLixkWB5fArz/WILuGeu72MjTpO4c1f+n2K7ylBi+qYeBlUT+
         1y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681280; x=1774286080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=n5TSvSiAiN5ztc5rgzXQDVwrVw9F1VFX6uN4vZ7Vhxr81qjYTXGVoprB8vjVPoBxRw
         MVg+kvyqNLNmDAE9gsshtHyXxrfOp6NwtIsjqHqH9CzSyKu++qqMpoG+ePIScj8/sDZq
         ayFZWiVd9jJXt0StT4+lgvkXlHHUVGmyk3ls2WOcbKWoOLaYerAu5e/Zk4uZGFBgSexm
         4wcn95C3uU2OFWjDEU7Hfm1q5DBokY9h8U1XOM75c9KyQNYI0pLpkqp/Ye+wNhvxhYxz
         1t7Qwpo6L5xIxarVqxgtbQTSsIOvF5GlV/S09CbO7bW+DchIsKRNNovojFUqQAE9QDsF
         PvYg==
X-Forwarded-Encrypted: i=1; AJvYcCWPiHD53LN48LiXMsOdr2F8+xYWBpZgW58QPaZwXd1t2EiJqWi8VsXXE16vKo3KYQYhPZ8SraFFyGOfwOGaXftZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmpGN3GM7A77Rw/Mkmro8ksIU+Rbm/wWPiOuXxLeNTLCurWylf
	WQr3imjU3qafkLYRyFyHPGDZyplGYdW10GMmQeyopo95JA0TEYEPBU9iLlNVNy/iSP8B+Ca/acA
	85v5FYIa6Yki8l7cvasNaqytwQG5osDBH1n1RmXb7KQDKNAN7Dzl2rImXiJwnCnHDGWkEsAOX
X-Gm-Gg: ATEYQzzVKEP1c1JjQUA6ega+gdWnkQCPe2kl1ywzHCWa/zClNKe11ZvcbiFosp3RerL
	hvHMWdKhszzbAw4L2IKM3jUfaQf4Qx7xpsj+nrbXVvmV1LtCk2pht4MH+dyjQHfzS2SKWXfCd+e
	wBDSuLEysRnZRHKTOo2XcSx6CLWdBGMOFt6EY+TobobJonWFvTRpOAeJIzSkDr3IvwOqEFWNYOZ
	xf1SDch5tFa3fKNASxGSSXx1CWgjPHL6V/vl/VmWIFlAE6B6IZBWqr0kxQQtN7J5COG3HLQAIiO
	tacMZ+aIbBLxtbLTa4bPYv7eOq3/u2ByFgaAIp4Cy6s0x1XIP+peUdS1KGMgh9JBfFvYMbgXGbR
	Lhk/YZNn/PRmh2pfEqp3Za+Z+KG41sLN0yUDijblJAQIGDi30HQ==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859176985a.49.1773681279602;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
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
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VVoBpCpMelC97ivLUPUkLlnb8hXlyt0h
X-Proofpoint-ORIG-GUID: VVoBpCpMelC97ivLUPUkLlnb8hXlyt0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX6ylk9FD+mSLn
 qz58sSbHmZohS5RXZlmvZjdb8OWflnp1Yyuqs4pi06kiaLz2/fIJGvfnGRKjHh/NtyozaMKcVoK
 csLDa+PPXLa2savP/BgWLWv9TYBapbjonXQImG2/GAd5TJQS3iZ8Y7mithiwUs4YlCUZFpqSVe/
 Zegf0NJOIQT/AjZFp1GsQmKvz5kWb7RsuJstxCjF0LcAPh6cn66OzjXpWIgHgDbB4V4ud8TS0SC
 q+durlIBUT3rZhiA3T684iOwsKhxaA17//KOo6iGV6PoraM5mgnT7LdnxD6Yas2DlwqQmM6j9+u
 cB0E9Hj8K3kroFLFN6xFzoi2slP10qQuxO87D4z7F0Hz0WCWTKPaqVKreRM34+nAdZhQT9UJerx
 Znu96zYrucxFCk4sSPcIsFdRPnDeZuSlmZW7TXsg0pKZaQnBNPzBtvT9UwMohycaw7RvTv7czLB
 ZMrm8A6sSIsCwm3Ke1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0

