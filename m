Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC82FF65F
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442948; cv=none; b=ExgM3ZNoplicC2bE3ZppsszMfmROay9k2wo1Cr18sAorRdkJDauzmX6sIGucPZzAAbNNtu0raLxYY8Sk7ONam/n9pPDOi8AulFxTL1D3eacdspGg0DxHYSl14LsiHmtAQn0xY1ZbuA3P/irwuNXIKNXn3LGyL7mSoZMaD50sexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442948; c=relaxed/simple;
	bh=z3hucJyAwcd0b5RA3iXEwk3VzpNQR5wbKn4VZUVTRq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QQDzoB5JYJFuLVrZD8q8vjSwpotH6owhZTJAKjMCFu+PFNC+iBHP1m3Y8x1pXxzn8RuUmLOWhQ02mk5lJNlhK2GK84GcdjsZDF5aslnSn/yE6COLgBajw2OqbtmplEgIqp5zX0hsFciByEOEsZ0cu8tSicc2nXc5YVyn397nXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCnRQfZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CU/4xHEl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCnRQfZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CU/4xHEl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gV391528628
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 08:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnmLkIHZR/LkIObI09HtDI
	5nHlzTSQXsvEGpE96cDxU=; b=SCnRQfZkigoGCFBTL+HFlKHMZstqiJHS+Uh58D
	Ho/cVPhN19DGTKeLNA8I1kJtXD8wbjcUNhuI4uQJhU6L5r6qWW8D90FhrJEnRZUK
	cEhRkfL00MomKmIOyU5Lpdgg8Vwu6FtYp8CFTfC/O0CivTBOj0/suWRqJrwjDNyw
	Ne5v1oo6vmj18q7VGzHaRY7z7KerTaRKp4f/mKfdptNiPxE1vHg1bkC1D0XPcnBQ
	Db51ZcKGoBRs2RBC4aJJLhM4qJBRloLrwvYksYztUIiy8ItrqaopDB+oS8m4Zbvk
	kBT3rqNvpzIs8QoSCtyP4kVq1IBn6nMm4SEbCtMADt1U710Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayt708434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 08:49:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so6739765ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765442943; x=1766047743; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnmLkIHZR/LkIObI09HtDI5nHlzTSQXsvEGpE96cDxU=;
        b=CU/4xHElUSau0wxdBdd3avoxV5RlGGVKBY3fvkPr9OeMcGh9ltaBLi85JwoJt9d2k/
         RS8/+IxLLck0dksV6UEHeCXKtDF3Qyuo1nsXas0Np9G1tyXC5m7wLDE+7leI7ZV1O/Mw
         S8GWqXcLOPARmq4uK+sq1YE7Nr2zRh7u+cVon15L/EQZ+FiM6mzT+Y4Qms3KQ8yNXrvM
         2ZkMx3lp/FtxeRfUWSAoaE05QiuEQRI1sLn94xXdyLnYnFGRyXTDCrogW2P1nOqIb6/L
         OONblqI+DGNJNvBKitTPevx/03XV0bxt8Qld8AlTTvuodh7DrhKEdYb4G3pdiTKSCk6r
         biAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442943; x=1766047743;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnmLkIHZR/LkIObI09HtDI5nHlzTSQXsvEGpE96cDxU=;
        b=cDJlfGbDjs6O4TH9qAb6nOLe5yctdazAGJi0gevvDPjJf5bXFZ8XwcChFCj+Pw0lKu
         fblRYCAoQ6iirKWse48w+xj2/yuiQN0H4hICQ283TlsbhpOeD04yeWeBtnFYmGC6BSnW
         077M4WGEG4R6s59Nyitf/zMB3ZeAtxt5G3vYr0W48kpeM8HZalHqpj6rvfBl4L2JeaHQ
         YScDtgLYndWP3f/pwhX9B+LsULw8KJeBZaNabFQLAlDA4k+2a4+gLQQl7MFxC5ExASYu
         FGTbG9enxrCiVgMD68YW/GjHezKFwU1kMaqSeU3bGlFdkUDzhVp4j9xApmqQr+NY2TRL
         UiWw==
X-Forwarded-Encrypted: i=1; AJvYcCXYo60uHSybA1p/uDmfu3o/Xsm3k83PMBriSaw/2qFFc2rfDWiw3Pxkl4kAAUlvmy9rxxVAiHE2y4FcZ/zN0kQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YydhfUKZ5pZMuy28Rdak4Fq/Gh5xnTq85kE/dr8DwMvHAITx8il
	jKR9pz1+nBvdMT+60ElKS8mKjRlnE2fWtm0L7p3tla0QU5CKm75TarHogmNptPy2sJVmCbS7+gr
	4S+o5RHXSWRyhBCXhrx69I4nrcShGynnX/tmhfLw2ro6n9s1v/+iFLRhV2S5Cc34MvgTw4W9H
X-Gm-Gg: AY/fxX6x+VI7vMjOmOlEkcxmy4DnAY4HD5MTbEHru3j8Zp6sXEE89Py6CCtH7TWaPCA
	6SAJSTT30Pxfooo1K2R1OmNNs/7g3Z6W8iCdD1nHEkL7iBq7eOtccuGjBEdEk6JunvP1f92dqjF
	ZI39HgKlWoYNnNdnzojrGZPVwMSfNoziQGvUau5PAf6nsR1MNvnkZssxvQpZSyn5w4Z8HeIchsW
	J5j9EeWdfcUfoo66MC8EezSYp/clh8oU93165y7a1bLTQ2TblIUR1SKVEi6jeeopKr0vJDx8lDB
	KUYpY3OeIl7WKFuAcrP2cLpTMyzcYrW2bNqBTOyQFCYCVSvzhuAefAuCXaOgSPslAteSJICbxKU
	HSRru4izCpIjUbDo7BsH0YtjLCkzxTDWC1wuJiVPKUZpetw==
X-Received: by 2002:a17:902:f645:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29ec22ded8emr47046775ad.1.1765442942725;
        Thu, 11 Dec 2025 00:49:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI/Om8zPyYWKFmg8pJaR2rOo7vZE0qt3jh1MPG30LvUNIED2jO130f+9FuGnanY0oaruk0mQ==
X-Received: by 2002:a17:902:f645:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29ec22ded8emr47046625ad.1.1765442942296;
        Thu, 11 Dec 2025 00:49:02 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b3733dsm17270415ad.7.2025.12.11.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:49:01 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:18:34 +0530
Subject: [PATCH] rpmsg: glink: Replace strcpy() with strscpy()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGGFOmkC/42NTQ6CMBBGr0K6dkh/VIgr7mFY1DLARKC1g0RCu
 LuVE7j5kvct3tsEYyRkccs2EXEhJj8lUKdMuN5OHQI1iYWW+qK0NBDDyB10A01P4Dm6sELEMFi
 HUJjSPq76LAvViiQIEVv6HPJ7nbgnnn1cj9aif+9f2kWDgqa0pURjC2Nk5Znz19sOzo9jnkbU+
 75/AZSGMyPLAAAA
X-Change-ID: 20251203-rpmsg-glink-strcpy-replace-738ab624071f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        deepak.singh@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sudeepgoud Patil <quic_sudeepgo@quicinc.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765442939; l=1354;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=cQcwIpREPKC01gttjQVeWpuDO234a5rHvIsX5JPf6i4=;
 b=oI4VaezqnR+ZE7cA+/Rxr1PMP6bkDLtc3T5Eq58ymcaZMG2hbKfTD2FbsMUeyr5HcxnvGwJws
 D87OHmRDaoADAp8Fsq+wjMttyDWw/qN9WucNzxDt3ZCiTjRzfSyrj5D
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NCBTYWx0ZWRfX4oEd/HFgAa6a
 rnpL/72TMKTm1C5NyT7OMvNiuqd1CEaMbAZ3dtw/V+emu+keyGOrUn0CsEz6dfkz+2ooJWLmCD2
 3Sc8FPA5SXzKUe9I1VpeGfIzDGB5+H3gnZ7QBIevXqrURefdMtFekb5QcOysiyjPK14NftEYRNp
 ca8v1ErGOcp8NOaOZ11DRMTZioga2khuq9x7K3OGGnOoTF0Uyy/8MIphLmlk1hlS6tNSq+ZzhbZ
 9IsFin9Vn/j5i1CtSEbi92tUYPwEpdnfrfFSRTBj7CVzGu0jxzdNvzbB/jkpAe7d23w1n8Y0pKI
 mVRGuwGHmWxR88gFHs+2E0CIbfaT0YAT1UmGL8+0lRZOv6x99teaTOgQribUvUgcE3VBj1TC16I
 gIprzz+/QY/j+6pgTPtGIscz2wpMAw==
X-Authority-Analysis: v=2.4 cv=WYIBqkhX c=1 sm=1 tr=0 ts=693a857f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=alfphgrJRk1D4v5-QsoA:9 a=QEXdDO2ut3YA:10 a=1F1461vogZIA:10
 a=5kKzt1m56AEA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lW6Hk0l-NGKSR3qBXIIEtCVFUzXjS5ov
X-Proofpoint-ORIG-GUID: lW6Hk0l-NGKSR3qBXIIEtCVFUzXjS5ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110064

From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>

Replace strcpy() with the safer strscpy() to address unsafe API
usage warnings[1] from static analysis tools, as strcpy() performs
no bounds checking on the destination buffer.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5ea096acc8581b1aff106f4c0e2f9aee9d56e25b..37b2255495d53270521466a05a5eb97eca98ec0e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -501,7 +501,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
 	req->param1 = cpu_to_le16(channel->lcid);
 	req->param2 = cpu_to_le32(name_len);
-	strcpy(req->data, channel->name);
+	strscpy(req->data, channel->name, GLINK_NAME_SIZE);
 
 	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
 				     channel->lcid, channel->rcid);

---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251203-rpmsg-glink-strcpy-replace-738ab624071f

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

