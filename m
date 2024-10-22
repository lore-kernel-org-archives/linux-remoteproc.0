Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01F4433BB
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570646; cv=none; b=POcimswt+5NJm3ZOpWVDUyH0KXujvT1yOp8jd8xm75SqiWzs+CWrVm+tbaYrx43zKuX1ooZD/bo1vf58se1QpP2o0yl3GeT3lyCdqIIi9UpCo5SmhRg97yhq6hV67HHVCf3R7vFrAtsNiHM25mym0lUxEn3qcax/nlz2RyBDL6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570646; c=relaxed/simple;
	bh=/58otU+mAPd8jrtLUJ/LEJCMOq0Y8R9ln/E00PBpe04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nm3ghrVkVFsBNZczZSQfVg2o10/L8Ai2P5VtAr20K8Dummva1X0CNOicI7CcsNBWVUESJY0PkBlkYEB8ipkDP3+D/KjbnZjxzGPjm+D3on2D2kUvXmqf8xqbQG+/1Yfp9WIBDZqoZFAoLFHpia/Tb4k7KUFOpdCRBnMcz4tv4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEi3ogLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEi3ogLg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJ909j028248
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xKskZvo1JH0YHB5j6L+rhDgLQp1E+PifEVPToIxcdA=; b=EEi3ogLgfHlwN63T
	VT9zPpmvs/eMMScMDC1s6w7FZbw7TjuaxyCv6Hs+9h6M5W94fJQQKEVEsV5YkeoM
	5Ku7HTj+ysjru28cDGzDaltVe38MXi70JKeoY9uYofwacqJqyTR8FgmjhkusvmCo
	vqjiIfDaLQYS5k5DiBHBdSrfv+yuE3xrjl03UiVBLVzxmvwdlN40iHZfx7HwZLaa
	SDdAvu93MEF81/yA+sLbGLK2iJHqYeqmF2QITvBnXvNXyZzmXQzEfC0qLBavsAl1
	xaUi9+ocIaPmY9+sUXTiwIJ7rKH7LSEhPPd114rZ8xGxeGI+dxBnT0BORRZ9/d35
	qq/nzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc6wm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7db9418552fso4548227a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 21:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570637; x=1730175437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xKskZvo1JH0YHB5j6L+rhDgLQp1E+PifEVPToIxcdA=;
        b=aolbcV9BmuGhYHEsGmM0yft7vOAgIUArVoAIYiqTRnanF7o/9Jjedj8682mvtcsdE+
         ZaEfx5JbLzZyoip6vpuq4c8RHRl6coh19ecHXFE5Lkn5bNgsRx87pDq6dkvw7jbp+EYj
         /HHwpTEWwuS3qLGniQPzRfAC0Z+QAfzra0KOUeALM/VK6Q/ngaUJkkzfSg1u+wGFmHLC
         NOF8Xi//RG72JrvnYr1a5Ip7t8PlWISu1rER5ypNuno3B1fuEIV0JpxDhSzxp7Ibofvh
         B5XkQVCo8/MkwOEJH4EM+5h+dNkZUWpm99eoKybb/3eX+keD0cnfDKrlPT23v1L5tzBh
         jRcw==
X-Forwarded-Encrypted: i=1; AJvYcCUHhuztdDcdmJBiepLmcY5cLlibylOTDWtj8OWI7wU2fMBj9UwUVE6qjVLxGclh2I6SVpj982pJXfCUdWxLDcys@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPPwvkuU8tQdL8qKvE5O1DwRB32wy275Gx48iLBVNyqMSN5oc
	mPp8tP0wBXrIruhxc/upkJBNZu6r/hy3Qj4qOjuvh3+fVAfOLxcPgUIC4i/smbLyF5bPbnTGYdY
	NWRy853o06oPKGHOOqs+UuukC1li9wpW8fdtYeNHUTHrON1gSLhB5hzeu6DCHZnKbHUod
X-Received: by 2002:a05:6a21:78d:b0:1d9:9b2:8c2a with SMTP id adf61e73a8af0-1d92c56dd3dmr17885245637.34.1729570636734;
        Mon, 21 Oct 2024 21:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78YH2hf1L82uustEvCpYYzLIPYCc25WObHjaFYC7/91IoiTJYQGN3QBS8OiZQL2iTOE4O9A==
X-Received: by 2002:a05:6a21:78d:b0:1d9:9b2:8c2a with SMTP id adf61e73a8af0-1d92c56dd3dmr17885224637.34.1729570636406;
        Mon, 21 Oct 2024 21:17:16 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb6dsm4836169a91.1.2024.10.21.21.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 22 Oct 2024 04:17:12 +0000
Subject: [PATCH 2/2] soc: qcom: pmic_glink: Handle GLINK intent allocation
 rejections
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-pmic-glink-ecancelled-v1-2-9e26fc74e0a3@oss.qualcomm.com>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
In-Reply-To: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570634; l=2629;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=/58otU+mAPd8jrtLUJ/LEJCMOq0Y8R9ln/E00PBpe04=;
 b=M6z9243vFSnt4Z0ApB6ZfscKtvvptNe5YFen5SppKT1aQOu4RImpegyQ4k25IyQz4rf6KNRxa
 /ZYKK2MuDGuBQtLSHVdzPZBR1b3v+3HaMrrStXFySAM+BSkjyplaLIP
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: A5CvwV-GzhKgDUuIGDbHCrjewImNbrwC
X-Proofpoint-ORIG-GUID: A5CvwV-GzhKgDUuIGDbHCrjewImNbrwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220027

Some versions of the pmic_glink firmware does not allow dynamic GLINK
intent allocations, attempting to send a message before the firmware has
allocated its receive buffers and announced these intent allocations
will fail. When this happens something like this showns up in the log:

	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
	[    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
	[    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

GLINK has been updated to distinguish between the cases where the remote
is going down (-ECANCELLED) and the intent allocation being rejected
(-EAGAIN).

Retry the send until intent buffers becomes available, or an actual
error occur.

To avoid infinitely waiting for the firmware in the event that this
misbehaves and no intents arrive, an arbitrary 10 second timeout is
used.

This patch was developed with input from Chris Lew.

Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9606222993fd78e80d776ea299cad024a0197e91..221639f3da149da1f967dbc769a97d327ffd6c63 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -13,6 +13,8 @@
 #include <linux/soc/qcom/pmic_glink.h>
 #include <linux/spinlock.h>
 
+#define PMIC_GLINK_SEND_TIMEOUT (10*HZ)
+
 enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
@@ -112,13 +114,23 @@ EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
 	struct pmic_glink *pg = client->pg;
+	unsigned long start;
+	bool timeout_reached = false;
 	int ret;
 
 	mutex_lock(&pg->state_lock);
-	if (!pg->ept)
+	if (!pg->ept) {
 		ret = -ECONNRESET;
-	else
-		ret = rpmsg_send(pg->ept, data, len);
+	} else {
+		start = jiffies;
+		do {
+			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
+			ret = rpmsg_send(pg->ept, data, len);
+		} while (ret == -EAGAIN && !timeout_reached);
+
+		if (ret == -EAGAIN && timeout_reached)
+			ret = -ETIMEDOUT;
+	}
 	mutex_unlock(&pg->state_lock);
 
 	return ret;

-- 
2.43.0

