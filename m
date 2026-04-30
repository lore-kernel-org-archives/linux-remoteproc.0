Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8843FBEA4
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542340; cv=none; b=KeMF7AUzmi7LjP6xA5Xek+Ryxeo6bCUuJJVgZAeG96kcIvlYHu0zSXaVAEqcg3et9fYYGp2r9vr6hpzMAvmgqYSY0YV8+mimwuRHOErwi9W+WjreI+DQMt+kHmi/q4j2liaiT2/b/EDxjAM0H31vA+u5LB9VAC+p4gAnlRM6088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542340; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+zIO02fvO5PwFXnIuN/tyqarM88mpf//Yfvb2hNR/VFI7wLaCiBW5q0qTY44TRPFFZdPGO/6h0am1jvQyW/rknpwP0SrF7kC8I2V7efE0h8h9reg3vMCPwd72JrwWW4h5xDaLyQN6Vz+4i6MNQo4so+8rgW1ER/nvpCQ+/R6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cupf8YAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq0QSOvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cupf8YAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq0QSOvG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3HYRp3730096
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=cupf8YAgOKOePClH
	8c7dK5mQvmjcxfWxCE//0zxHTCh4u1qdO6dqXRVwAk11ZeExUaBIMRnG/jvlD7lE
	mqEI7QaNBCTbZIv8OzSjsQrEtGaLq8CilTt/KwN4ovaZRFtOrIJQpfNiIkUzO5wy
	4KTRiCv3Nx0W/Gzf3mtkn9N5JVUCGriiVYv0cJ4xlfFMFhtP3fSrEtHLzl4jTGp8
	kj17Isly+JSvFjnrshd96MRjENf8IWe+jvggdVYKWwkjtl56w13VfnZR9rpHHDnm
	CYUyNZtZdqQ7gFBTnl+PV9SgfqJMexQyotpowsfwinHV4Ntmi/Wp1HA07wZ+Bq+w
	imFnqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w99q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7973e22399so263565a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542338; x=1778147138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=Qq0QSOvGJZ0nVLCUOHs6UZWE89lGBj0wm5hhJ8Rd6KG2igvPOq9iMKok+OX1XnciK9
         vyuAS8erSAkHjUWih48Nd+/hahPdjip5C76SuDXvF2A69+ZjIh83JrIGO46DghROSmyx
         diykMMUs/niDJJiGQrLHENmS80o5nm8n0oJj0qUS4u8vlQscahqQea5hE5/xcMPmL5no
         q9quKuNxT+f/EX7LQLHhtLKWjecF6ks/aI10wW9AQnRtx4vMMpP5wkMkSC2/l29EP1C/
         YQNhaLSryiHYzWoKumW8oEt6MMHTBjPbCXNorrMZM+0Oq8P3jNTqFo5yHTNgKwnpnmVa
         4w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542338; x=1778147138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=otc1razeca43mx+ijCskd9HzwkORp2lVCVWvzNa4yDiOTMvuFVltrppakJGu9+JDI4
         CHNQFWaBcI0uKm33ctqjPADDVUaOuTH80FrZDEtIQhxV7XmK7RXYUfNlTEGhCz5OKt1v
         X1syW2GAB/Sg9RQuEDnYZXEaUHkcmzZcBLxoOuWj201lJH5E1tko7CsXFOGF3ns9Nhv0
         cIDDxKjWOQIvkPlaG+YdY1dNdJCdaieJb0P5aiSaYnNR0iKEuAEAkLHJP+tZWKCidmL0
         CKvKj2g2OCFJyQQavFKme7x3zLesot0qrafjPgGBs5JgDZUPLjwdy8tyIDbCuwCPUVpw
         8XQg==
X-Forwarded-Encrypted: i=1; AFNElJ+32L8RqU6MyVkMw0hA11VJujSEsgfVNO/ePXUkttTrGDCq8PvlqRmhorM/JrhE/0HDfDtYZjIBfEBHM93XrdLv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx519J7HxyAgHdg4Ms9AV1i8vawkzJEEzY5XsyNlkgSLJ6mHn5V
	Blq4WtmLYHRiibQOjg3zFTvPEtMPTLSkvvN9H+2dTv3nK1YjGfVXBZbWJoOpqI/huYgmJT007kI
	aieF2wBu3zVvYNsNVD40/eRd2fR3LtIcP/grqFb6E1+YPaPuGO95CZ4iO+hrY3S5ANKZ7e7HE
X-Gm-Gg: AeBDiesMMAUMu+4ngT9+uokUL3kQU8H9peF/LdiASk61sbcDUhxnKrDLeh+QLzmAqu3
	Gns2qKGra41OYMGXg055/mj+/njHxykAr4ZscJgIKPkNJlmmTxldOcagw/VmuEccjdaE2VuOwgS
	OWJoImyCYs17ZPVkVNhpUvTPB/XBWvVGbC3/ZkjEh46p5iCXFlxsKRwkMP0WCuGoXqZvzpdLW5m
	fwybPQDSLqyJhlmLl5RxZhAIiy+sW61/cWQLPkDpWy2pDmQjAdpzambjji1Y3JPTdWk25fUQ8VY
	Ykzq9gEQ5GEtpIHkPGVgGCp3MnkGUj5VYPGsCKGIKdWf2X1EGJ05C/mZZa6yGT8nsP3kHwnVQF8
	SViObXWdMb98GqRV8JedldGkeC+miPAv4FqJwxGUq7xwgsUTWzsZYMR923Jm5ZQ==
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596486b3a.3.1777542337725;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596438b3a.3.1777542337108;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:36 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:59 +0530
Subject: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=mq2VuzLxRAGP9zg5b7p4sZnxYqzSs0QHgyWzhLlX2DOzHvOMgBxvjykHYlMoWtnFwY4cTgUkF
 8B9sCbEtFThBlWzoY7kS6dOIHJvWbMBxxPEznqr3jUev3FowOQTZBy4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: D1xGYcudfmC9Dk6W9dAvsY15wvQ6q92T
X-Proofpoint-ORIG-GUID: D1xGYcudfmC9Dk6W9dAvsY15wvQ6q92T
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f324c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX6SNolWz1LC4t
 2PNLDqu89HKA8739rKzJUw3BEKIrtcxTfbgiAFENvuB90oPCzcMZk2m9qppb4TWDwJlZKepBBwp
 Q0XXXfULEMcThz84g9Tep7AxRnIhq7nMQOn/JKs1Nv092uuJ/HPtCB3dNCVK6C2QRQmoGMR3FC5
 8RuZvkqxF5Yvidn3iICFq3YrzOkJxS/7nudP1j/3FtJCowCmzPC6nGdyg9SRmyXI30hJkbpdZ99
 caWzFw2E4FoVJHGOBaJ0RkvGa8mVs0MqdalVr8xKJme0xyfDzU3THdfmNO3XvSY9u9R/fNDZoGi
 tFPKd/RirfZv6dWf9Z2F4vErIPf2MLi8t63d6pVawHcJ5HQKEE0J/jlGihjrk2JfDo4KkoH2UWd
 eJosrIr+ccDu14CtfEWNYlVDjq1bY22H6/G2iix3++6qi9tG687NouJwTBYmwbNqAkxn+9Wy1ss
 K6AVD6/DWFu/FWMrkWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1

