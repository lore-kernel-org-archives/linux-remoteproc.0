Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD6835F189
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205552; cv=none; b=tsxSdmWb09R0FJ+O0PTzS/h8Wc3cjmF3AiD4IUJxTZ77TV67R+0fpFwQptvEUVwZczC5waHgSuIDzt7V95lbfeqD5306Blp5RJjncw/xkolH8lAgWI5QAxboLh3vsqxiBxpH8Empc6jVNXEgF7zdhWZTqi8cpyo1ju1hiGkEpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205552; c=relaxed/simple;
	bh=4zraT7CC6EN+bGQODjtV6ZifYWiE0anAhrLQwhBKLBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJvyplbuB76ZCqZBleLjHrIxBaBTtA3xC3QwMJ8z4nvuIZhbB8Rscw97luYEofFa+uGFNcVKW2vIkRljkW7RVAtJvQ8cMxIB1maNb9NG4uuGcceqSeXEdjfdgSILJNFtYXblNjUtzKje4MDO+XHn+UQGSvaG1sTKx5W/9B3YNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps2r7nCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsI9AfEl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps2r7nCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsI9AfEl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8Ut6W3243184
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CE8klnNfmiQMHcUZgP80frOuN8UU/IWTyTQkre0op6Q=; b=Ps2r7nCbGKc+LVI+
	lh6dI0mdTb/1vXTu7jpBs1p2QDWsjlNP501XAYT5e5zoBRZdYZCSGgsQmvdCwo9W
	dOFmZST1jfeBBPAPQI1taSS/bhOkAw6oUqkin4mjHZcFYGpBpIL/YcwJ8VVL1Z7Q
	bUbzPS7frLwe9+Ek3CJA0sXY2mMcFt4As2Y/4e4U4fYz6bea6+VeWHqPhwG8bzmR
	hbN5TUhicFNjjRvPGnPU0/936E+PvFz9jI9/nkohMrpjhFraDmpJ4+C4VDnjghr9
	3EAX7px4rkV/dkIS8sbm39QHzwu69iXIFDATFZ+32RVaGojRAiObVO6vnhqdT1+Y
	gOxJWQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyg458-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ba395b047so4947046eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205545; x=1782810345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE8klnNfmiQMHcUZgP80frOuN8UU/IWTyTQkre0op6Q=;
        b=GsI9AfElrOB1vFkrKFpgpROQRkLjPUQwSeMpvcDzqta+P9iu5zljxDYXWbqX1p5wcp
         owT6bnJHxMQPRUsGe3oqKBYkOp4e9AiU05kf6S8qga7Q++r54F5gEyA0v7Kp3vNXeFaw
         bVmD7IWKoMAUg3r42OtYRV7P5Dfsxws6sSa8Hjg98umRj0dk40sxAD0VFCmDwqzDbgVf
         3kzPUVw3o+Y4u0t/ZZRQgLWfyGPLbaJJ3IVNgeUkMnaEreQy+6F+EeIIrl0B+oimGmlR
         OsIoDYbFYHBDNe4EqbjJSCyhsDBMLNomh0AmqqKNP+NvF67SSEkX2iDCDWWuhP+u9yMO
         nBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205545; x=1782810345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CE8klnNfmiQMHcUZgP80frOuN8UU/IWTyTQkre0op6Q=;
        b=F2BOrKZhRVJKHyCBnOMN/J+pl1jo1TorgVsK1c68sT863EhUgGEpbOd6Vn0tIu6yR2
         FsCpZXH6d54PpEK6lW6fBQUsx0rUAseTc600xlbtoyp7TGLc3RvaIsHgwRCtKh2khkLW
         rKPhc0pdCkTV330uOTTJQ5GkkDQWHFq3/6vZx84yFa3PsW8/Fm+h4w6oZ0IbDj1V//x5
         JJHfz05/L6tNruQ4Z+IkBSH/h9U9wlu37+6WZS9DN9dHHD3BYFr9GnMu009ym3TvP05M
         9kxdGgX5u1Q2VLuywV7ShI/ocT0fmmBfpHOh5US/HRjagaS6OMCrpQZCvd4V18Ka1IXH
         DXgg==
X-Forwarded-Encrypted: i=1; AHgh+RpXizGTYL29jBctKBia8AhbdUB0NXE+Ivi8eDKvDpJgXJqBDV9c3qeewYOk2VUi7BN065q0qok/MZQMWEKvjz1e@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvVLLRluUwGKgvmUaOnrQOs9XNfIw+msONVOe9yIOjtk6t0jU
	h5C7roXhbyeRZtG7EclqOHnBOWf9+3Xin3TQOOeXu6UQtDLx88Dk/hV7G6xEdO8Ye364cHxgRG6
	5QfSuUHJabps4QhuH/tkZzTLOikJb3IojSl7AvIxbmzgbh7wR3fL5MLLi0fXNw5Td2OWbmSQ8O+
	0z8Z0dXvPfGA==
X-Gm-Gg: AfdE7cneLSMAfncps75Yntac+NomkLg6/JoLWUraGT2LOPOe+Efxzu7mw4ZrWPHoyW2
	v5jEa/rEi/cBzQTfgYAG1Nw4uW0VbWPpHTwUHCOVbQyDXpuEbn9dD+4RRlXnvN5QaUOg8xBps12
	S/at+U0/TOS6bAsYCuI4H5Fb0T2AvNFG6Cz54TR/osSaQ+lbVSne/rWACXoyeeXu7Dzl8fX/Ho7
	0gTscZkIdF0hH9QBw+06rEKcdxBE70pCd3zfMESs2unWWgucts//MujRpppui5fBiY0VSuy+v6O
	cO5UC6GQH6f2WJ/ZPkj+jIWDgf6OhGPLiDRpj6dLVBKfzGeXRUwtR3Bt2Y+9dCbF4XFJHmcA9p3
	tVhvkzCOybtv2wb2pVCuyKwPSiqHcLgaccEbtE5s8NyTzhBYxTuWrdlqHVGzv+w==
X-Received: by 2002:a05:7300:3b2b:b0:30b:c40f:de0c with SMTP id 5a478bee46e88-30c5b774099mr1237250eec.10.1782205545166;
        Tue, 23 Jun 2026 02:05:45 -0700 (PDT)
X-Received: by 2002:a05:7300:3b2b:b0:30b:c40f:de0c with SMTP id 5a478bee46e88-30c5b774099mr1237224eec.10.1782205544582;
        Tue, 23 Jun 2026 02:05:44 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be5c5desm15202122eec.28.2026.06.23.02.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:05:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 02:05:36 -0700
Subject: [PATCH v3 3/3] remoteproc: core: cancel crash_handler work in
 rproc_add() error path
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-rproc-attach-issue-v3-3-8e24310707ce@oss.qualcomm.com>
References: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
In-Reply-To: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782205541; l=703;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4zraT7CC6EN+bGQODjtV6ZifYWiE0anAhrLQwhBKLBA=;
 b=LeJEQceLCn/IKxdZny8csHhDo53GXgO8hlOPYDWFqSJOQvb3feCqBGvuyJTwlH6g/EzwPkyRV
 0+GYzeN48ViDk9QaitNYGInjXfPuMEpjlLqljQzEA70CSzo2rTBm2SW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX61amWTOyvSL4
 0XnG3QM8eWEY/N0c5qvLFwC25WlFo5AOabfCoDtXGAIJ1+CqmTxVOOIItyXlreflDHMqKGl89YJ
 MHoKZdbUi6TMPDpl4C9IbH0PEDmCgaA4hUhiON+eV0/U9XSHaLF3lXic33PtSbPMff6McvsjnYL
 YfoyEVf1ovmFWyj+tPxiFd/QOwmmqCo8K3XPNDikaGjt1PIJinzg7k+f8CRCDIQfc0UBEtP91bV
 j6W4Pu1OWHEbfsLQt3XmQlwgYAvtEXKGYCcJlU7RlpnwPnZeaROy1H6+DiKS7aWsRKQrKFlYpO8
 s7yIeO7RdPb/ZZvkUqlg6UI1Ytt7YfkvM2LvRbsAU5r+YS7ij9xOyiXqpO2575piIsyp4oa69qE
 LLMnQ9Ext+jSah5CD+Y/tLG8fyivkQ==
X-Proofpoint-GUID: lyGluv1bPML6DS3k2t9mwQXnX9IyBUwJ
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a4c69 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VRyQhUk9NtpfCekB4XAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX2k4Y4sCNYi8p
 7pzILRhMjFfCyz6Hc09KhZU2oDExDlift/ppLHjjeSgFxT+VU7PoM3co677PijTmPkPyrNNmnrI
 cZ3k9KF3VcQeXsjYkk1Qql1Sxj/FvhI=
X-Proofpoint-ORIG-GUID: lyGluv1bPML6DS3k2t9mwQXnX9IyBUwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072

Ensure crash_handler work is cancelled before tearing down rproc resources
to avoid accessing freed memory.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 71a7be7c1e9f..ae885afc618d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2327,6 +2327,7 @@ int rproc_add(struct rproc *rproc)
 	return 0;
 
 rproc_remove_dev:
+	cancel_work_sync(&rproc->crash_handler);
 	rproc_delete_debug_dir(rproc);
 	device_del(dev);
 rproc_remove_cdev:

-- 
2.34.1

