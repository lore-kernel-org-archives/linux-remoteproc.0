Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5203542848A
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097560; cv=none; b=Pra1NZ6i8eyArf+N4FNSOzNl0w1GgV69o2EkU2hQxBpwdOhDd9qgf3QMwyPlWrk4EiYLtUKhK+gTztbonJiOThhsBVIauy/LoMRZI5okp4hOcr+VOnn0H9Ka7jsHA963yxARj3zg6IY4882vKXb+UFFOomqiArBIxfeqY0FsTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097560; c=relaxed/simple;
	bh=gSGrdfWBD1PJQNA8FSE3vNlGaG4+Xx3EyKe0Xq77gxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcmFvyvo5Kh2c63gAWEeleVwJuO3PWvzr6TKyqVy0CSP8LdjCx0kflGmKfH2+lbZab8L/sRjXj2Ox7nRCoOou6osb5fxHi0DyxM8/p/A6hkj1Azz6MHaFzfDASi47+axLX7d4ukqBaaV/9m9G/fBaD9b6r+DL1oso9QyzfA0W5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifd7yez9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1jsX6D6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifd7yez9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1jsX6D6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC7gl1921704
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPJuWGqmD+8
	ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=ifd7yez9Im1NWd4QlgNWMkyW57W
	tVINyWDwUayU0ofvyVrNXpJlPZbi5BzPstvukcndCx8+sBUFqHybdIZIswuEEhzK
	zmFpSttCgyQIzDo0Uwgdl/0FaMmmN1EjgnaCA4AQmAxAFh50YkxYu49Gn997mxRc
	S575adbLb8WMzcm90Y2nFu6XMVgbx1fF0IPOGRUXNpT3vplyiumkPNTVWF65gXp6
	n/mkmfTxImEfRtoCU5AyWCa8kx51DE8gFX6qwq2zP0hpXCvTgGH+HKqnmqVBKNzL
	PXY/qaHQigjhC7ZOOOfC0z4CflOArbZEHdbza4Mjlv/EpfwKbVd4mpZCysA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1133940885a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097557; x=1773702357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=Y1jsX6D6D+gLOgPuFxjayg+3QDScUD1CtS26lwPEkmuoDWRju3/eG+yepQujaaYkbA
         SKahGwmiLonxF2bQ7PATwaJK19e3T+fazzoiRPThmJ0Y+f4cBgSjiTDp1mntehlQskZg
         i06XNupQTr5Jva01NbnYXbkNU1h+tebSH1FAgnf6hB9CdHzgIrz+gBAbE0bpDbcUrhlf
         xcwIblwVrRA6uFthIKoEsI5+NYTpoQ+hZlNliKiPqD2UuADgTRFXFXnAu+vfAjL5Velw
         nFa+bGAHZfybtW20rQbA3b5TKcCe2qzOWsupZ+PS6oHabzqZtPpo+KUZG5yNcxWKH7w5
         iY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097557; x=1773702357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=WJicoGrA6vSQFsT6tRTw3egT0xp+psghgidjZtZxIgMwfkFdVRgxvFXlLJ87GDtwEB
         e7qaN5y5K0XFKUI+SqVM6PhW6O9VLO775uCH4wpxmhQD9iX+Ce+TvjnBIKOtPpjbNcde
         qejdjjbyudteomVi3O4DXMxrSNXplRKc1LPPwxP3PwZ5h8KtJWrSi4pdhNF6ssmexVf0
         oB+BwfReyH0TFlgRRGtMXgThubWoPioS2PLtMEOfgqzFzuE0NG1p39Tl84vbUCA5lZNR
         DF9KZQm9tce6i+ySDMuTOW4QUY/KuDkAGrWOuQvMvns/AfB+AtrSLzKht6UzE6iZ5ALe
         HjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNLMVzKWMYti4RJna32CYtww7j4lgAUhL/1VLbIcpmIEhuoqpBvhXAIo0cmAyXyld5VMqa6eS6VYZxNOyUwQ9h@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3Kwvr7nMpx0t+CmcOxUWwnaF2O1DToI7jgJ3qaXedX3Vj75Z
	53571qqD1oC2xrY/JtdCiAO3Sc22NS8J6mQ0Lte6vjQL/fgG4YrLCx6HXhPmcwYcvnyfV//lra7
	D5gineLbquyE4Fxf37gzdqNVYOeMAsi0tmz8fl2YPYyMB1I5rYgTRL7p3QlYvbaqUrxiGfk6G
X-Gm-Gg: ATEYQzxJl6HzBSn448IBGFSNv0ObdqFeEzFe0/6mwHUoWX+5wrDRcNlIEPGPxn0072b
	cS/D7rNxbEJGdAbwag/7rRmVY0g1A+KXTa34r9ywm4+J7BVU19IM/9WSbtf4ChDSKlRTInBgZlT
	sLURW71lkK+uDIPhyKwZQl0Ga8hnOK7WCT/WWARLBCAc1feGXi5x2juvnnU7vcFDqWffvmnbIkf
	FUSPJAJPJktNvN5wjbNvsQ2HBAKFQzYQ1cgqoEmUJrWXm1IT46jXPxgmfJ9bOa5P2eyzzWB+QXd
	TLpRG2To/1sEbUD7jNT1jjt2DcEHrNdgC2YYjQFc7NhxD0yWzLyPg8RN3FXCZK+ADtPwYExm0FW
	ozhlaEl/hyub5dCK87W/219rnXapeqfIbRubVEQr7QVEUIk3qxg==
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673415385a.58.1773097556820;
        Mon, 09 Mar 2026 16:05:56 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673408485a.58.1773097555998;
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
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
Subject: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:35 +0100
Message-ID: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af5255 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=P-X4VuwvMnWJEdMca_IA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ALVcxS_etgpKFKvFPxULPbiVBNrV9rpw
X-Proofpoint-ORIG-GUID: ALVcxS_etgpKFKvFPxULPbiVBNrV9rpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX+tzOXCDrc9Ml
 YegroBT0ioimzOPxohw40vZKoLrBBhzLp9wrJsJuo3A8g3W+ibHrT0W34PNortTnDVhxoYCNxFm
 7gZcY4p52pG/7H+d2irDPgPI1PcjnmAp/sDUo6585okjiTMtLkdDfHyl6Rg4z67oML/NimBtCRP
 zaujQ1SCa4vpCMx0We4hhT00vv8UWcAtPAW9jtDnN2Kj/fscpBDFoCwETjmJWI4x07RHu7bKSPC
 +ny/SNLtdvWdcdtp7LKgSCigbSH4JiIq8hCSvJxT2MMj0e1HLV1wmySOY1RbYbqsTnBkiDgLc1N
 xcuWAX6RnJBjDTMPQ7xcGNSmTkd3SuN5NHBafAMDoiG5Ydnys7PA3WcfuEIKlSUEoVFrK6uecus
 tcztQAuDvGZsMuRwJIhVslsQx3vwGesk7+eb7DF3PsOxuHO5wOAtEtsPWeSgt0H1tbJo5OZpczp
 xeQgB3VT3pvqsK+3DYQ==
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
 drivers/soc/qcom/pdr_interface.c  | 4 ++--
 drivers/soc/qcom/pdr_internal.h   | 3 ---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 72259f489075..6d879e1540b0 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -523,7 +523,7 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
 	if (!pds)
 		return ERR_PTR(-ENOMEM);
 
-	pds->service = SERVREG_NOTIFIER_SERVICE;
+	pds->service = QMI_SERVICE_ID_SERVREG_NOTIF;
 	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
 	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup = true;
@@ -678,7 +678,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	if (ret < 0)
 		goto destroy_indack;
 
-	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	ret = qmi_add_lookup(&pdr->locator_hdl, QMI_SERVICE_ID_SERVREG_LOC, 1, 1);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..6cd8cbe26822 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -4,9 +4,6 @@
 
 #include <linux/soc/qcom/pdr.h>
 
-#define SERVREG_LOCATOR_SERVICE				0x40
-#define SERVREG_NOTIFIER_SERVICE			0x42
-
 #define SERVREG_REGISTER_LISTENER_REQ			0x20
 #define SERVREG_GET_DOMAIN_LIST_REQ			0x21
 #define SERVREG_STATE_UPDATED_IND_ID			0x22
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index dc10bc859ff4..bb60b5c40554 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -656,7 +656,7 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 			goto err_stop;
 	}
 
-	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+	ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
 			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
 	if (ret) {
 		pr_err("PDM: error adding server %d\n", ret);
-- 
2.43.0

