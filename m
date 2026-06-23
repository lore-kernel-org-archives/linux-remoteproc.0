Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980240D596
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205545; cv=none; b=mIPkmNzFAF2RbCplvMeSdt9rQ/u7WIWaF6T5g8p1gCLGsXA0KBvD1NbRW8p+GHO+vKzRWZJaUY+bp/IqHlMgZCckngk+qRmCiBsb3IT9RIDuU0wTprOau4DgFisK70ABS8X2zTFOShsxo8YHMCn1jLNRJnQPH2k+lUMNqrKE5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205545; c=relaxed/simple;
	bh=tJ/lhsd06ekkim7NuWPjso8G4mEd5kfe/sEuS+RJYUk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VOk+0XgNO7lW7aRBW1h75LE6ZndLHhbvBm30HDE05jk2dNk8bmRpuPR6ahc1WfC7sSHjaZDnXwlnFdlSXf9bRifyCFJ0r0DgWXvzrhT/O5xkixoHTMo3uelTGnmj/kuj/2w0F8BoaXPMCQ53jDIV9g7Z5e+b9kawzVB/dffHR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2n0UOx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBA7+Eod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2n0UOx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBA7+Eod"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jHeE1778233
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gEjSX4RAO8IgOrvx6tsw4d
	OpUHRVql3aBZzMOZKH1aA=; b=e2n0UOx93tYBQxtyNWmMGtfcX61PmMMwLPuhWT
	jF5DTmsp99xxVzjgDFGdgNTf9LPR0Ca0Fn3tQ1jGFzO7mDZpvwh0kRi6UQtXPDhF
	Fk4fMoRUMzosteD0dv1U1WdHadSo2qsmEEL0OKkciU56xoHhX+tV0dWhE9W+t8m6
	/OHndnKO8d9IwEnu5L3rVwiNaopgsX+P3I90Dm1at0gSN9CT3sFZhynDvJQtw5pW
	8rp/uv9biCo2524hqxZb6sFq0Bi5iWQgqvBCDe5G+OyTWvgj23LupsWFlE8fPvef
	RZtqCtR5pMgH0pC/Xomb0qsxsJSTBgcNlET00B6agSXcGZgg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gr9xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so7428018eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205543; x=1782810343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEjSX4RAO8IgOrvx6tsw4dOpUHRVql3aBZzMOZKH1aA=;
        b=JBA7+Eodz3TC6HA7cUF5F1HFOj/MGI5V/mjAD52f0s2cm7Tlbetb6O1hte5qlCboMb
         n8G9mz+JHT71nMxGdnc51VC18+purZGXGQedCpR2YKeOm2fywkOvZPjTcpogvFYuqHYG
         my+KetMQ0Jnqb31b5Po9PsSQLa5VsLjq47ZHX0ms1Yf08AVuvfAD86vvFFrluYsLl75o
         xIs2drPZhOTEoQI4Bha3BH5eHRyShrgmAkwySV881qA3XKeQ5Ai8Vgrznehr2CP8woy6
         RvXcvfRDEXYTzUfmS071KQVvms1pHXmGmsBFIqiWk6q3wjYbwYYkwKLU0P+RBZ/IKRd5
         1yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205543; x=1782810343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEjSX4RAO8IgOrvx6tsw4dOpUHRVql3aBZzMOZKH1aA=;
        b=VmQcMVfxEmAfGSxJua1qZeAICvkXldzs/pv32sAcdJkPWWBId21EjHJlB8qiZFNUG7
         0z4mVxuWY2MXKBiGQrAIuhLxzraKwj01WITdIGkP/3cqLAScIYiYq+Mdwijkp5KYteke
         vA2n+vCiRONsWoPlXNtNuGZ3dmZ4+7LMsM1XNGajbVn/p3Pt4JkKLoBhSgOJcmGQVgQZ
         JGRRJe+msGvDPJFaW/xSGizK9G4vxUw9vhqMWaS3ehIpFxXXIMxfKSPZkjc18bziv+Pe
         fkDazCViHk3KFJnJ/TTJdy485yZzeULwHb3SzRIiM5GAOSPz7vDOLyLf/I7WK8y9J0bG
         s8yA==
X-Forwarded-Encrypted: i=1; AHgh+RodFkZ08sZjg2V4q96EUFjmCBR49mda8PG6fXItClh29tMRZ9kCOO1fGsci+nJ+cA9RQX4bgkYubrACqN+RMjQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YznomdMSR/BX4J23rtKfVnKCC3PdrTtTo57KlM9ZFJbKvT+DUk+
	SIkpMAiuK/x4/eZIvnZU4gqbmVn9PqQGMNg9L7HW/cWICxTH4ftblkInZLmc1XvmBfPnFgFyDED
	iewnCU6jbHy325Mn0ITqjqcshH5MaBQTlrP1r+M0H+2FQ88ylyj5iCna/ypI60eT55Wc2dr4dat
	KbHTndeCQ=
X-Gm-Gg: AfdE7cm8o9fnrgs/yUD/N14RwBAYii8DX3IZpJstAoW9FW8SzLihs22n2E82Wo4VCXN
	2XoEwilpK1yVeD86PGN57JXnP1Wcl4AlfSSiHkHNNAVFhen3TuRoMYC9p0/iXRBmpFISw1i4LCc
	4jO5Rmr2GAQNVeIhkMwboNJf2BfOFVJxAE4l7X9RkOC6tiu4N+pXf3Q32PT2IQf0v93CaXR8RoC
	/haUdBeL4+5J/ODC1nZam+fz4GeyDXWXoiDW7g+GhGvUEjPiiniPNrLQRqwfeYLpmBiIBG9lMmk
	hcjXSVnR+LRM40ONNSbA0rJ2Q4DJ7qs8k6mPVnrQBJ1azgLk84AN0WpGjq6WfzXMWCxXIgDCOYt
	Kqwjo5tasOhuP/nClmBvT+m61KgTnMDa+Mm4OrOtrkrttTvx2pUvRYtmdlcS9Fw==
X-Received: by 2002:a05:7300:1341:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-30c06e0e40bmr11902135eec.2.1782205542640;
        Tue, 23 Jun 2026 02:05:42 -0700 (PDT)
X-Received: by 2002:a05:7300:1341:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-30c06e0e40bmr11902121eec.2.1782205542115;
        Tue, 23 Jun 2026 02:05:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be5c5desm15202122eec.28.2026.06.23.02.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:05:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/3] remoteproc: improve robustness for rproc_attach
 fail cases
Date: Tue, 23 Jun 2026 02:05:33 -0700
Message-Id: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1MOmoC/22NwQ6CMBBEf4X07JK2hIqe/A/DYSmLbSIUu0A0h
 H+34NXLJC+ZmbcKpuiJxTVbRaTFsw9DguKUCetweBD4NrHQUhtpdAFxjMECThNaB555JkCJLXa
 oZdFUIg3HSJ1/H6f3OnGDTNBEHKzbr6RRZq85z1OIn0O9qL38s5Tq8s+yaJBgERVhdy5lpW6BO
 X/N+LSh7/MUot627Qtryisg0gAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782205541; l=1316;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=tJ/lhsd06ekkim7NuWPjso8G4mEd5kfe/sEuS+RJYUk=;
 b=Sgx10XD+tppToJkDvfASwTn7BlAFut76Dp8fDmEU1SzLMhj6xulm3q5Ww1OXUbBbCb5hW3+n+
 xwP5GEulA7FDMNlZeCpc6ulJcmSCE/d7DXMYKkMhT9W8AnE8L7d1voi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: W-qViwGdC9J4Ya--te0h7jgN9sk8UB-Q
X-Proofpoint-GUID: W-qViwGdC9J4Ya--te0h7jgN9sk8UB-Q
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a4c67 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-wlysWeROCUhhefnZiMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX6LvUF0R/dNJ7
 nSgZYdcFWuMZ7mm3eK+2getgqd3S8bDhygtFbJC9xJNYV8Fi7MXwuMD4XwqIjmn6nwknYGvNuW2
 GuhmrgaqbIK/jCm9d4F/SNQVDVYNuo4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX7vim4fZGYlp5
 hq+mUpzLX/BJLN6kyeketF3C1D018AbLdam21KJfKOy0OMvJApCl5KqIUtlGvX/TT3EeUayOSzW
 9G5Jg9w6JF5rQi++i/qWLm2am6M7+ZMgYEjJHPRiLl+76DA5bp77srPbpvbAU0Gbr+fzhw59eNo
 72QaDKkoIv/AZ8Xq5cpeSBiv4fQ3SFGltIph/MgIbBZ4HsP8bjrPGi/7HHcaQqwpqOw2s1QmaMY
 pwMabF1sKYq/c8z94Gu/Jfq2h28I8JplRm/Fu0GobidzCFiRpv0nMdV+UxXIuzIVU0rZQlH/JoJ
 i8iIV9O54q1VT/kILyN9Sl/qBRxmImem7Pq7HyQhqsHhMauPRmR7zZ/Hm14uW8jA2ECVDthzHDO
 PojU8nVrYkL+BdRuXLICRXv0GGb055PI8OyAI44jbbHfMR9dZoq1ED17vDr1CCyfe3Brat9RwJW
 u5ETJtgpIi08zTlwXHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072

Failure in rproc_attach() path can cause issues like NULL pointer
dereference when doing recovery and rproc_add() fail, improve the
robustness for rproc_attach fail cases.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- update and check subdevs_started flag in rproc_start_subdevices()/rproc_stop_subdevices()
- Link to v2: https://lore.kernel.org/r/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com

Changes in v2:
- commit msg update
- Introduce subdevs_started flag instead of check nullptr
- Add change to cancel crash_handler work
- Link to v1: https://lore.kernel.org/r/20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com

---
Jingyi Wang (3):
      remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
      remoteproc: qcom: Check subdev start status in rproc_stop()
      remoteproc: core: cancel crash_handler work in rproc_add() error path

 drivers/remoteproc/remoteproc_core.c | 28 ++++++++++++++++++++--------
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260623-rproc-attach-issue-a0adafa203b8

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

