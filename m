Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102AF37BE62
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224827; cv=none; b=ci71mv03dh9i42gAOZWkncO2HdL/bu62RtfH9UNhSBFShHlrProQVK+lBSsW1STirOdTSMLHpEm1i3F98/1VspBdvrfqzLKRpgH464kKYAgbJZ/l+DZTFGER+WbsoCLA/cUO8hL/rkEiS+b/Duu5Cx1+kEFB6FtZQhtIMJEKX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224827; c=relaxed/simple;
	bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cmpEr1kjlyq/iD0Y5k4L4EgeuSfvJxTlSUPEiS3BzhAxlpFRqeNj8RncVLoM2ajrJAjfgbQcUDLjHVfrhKlcRUXeNtb4RJCW0Qy0NSAYjs3NqNW/RPkPOtei9ZL5ixv0al7s/CwEBLGipbnAIGZagPQ6W9cqmQcJ96TgSn7+p+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBSzj8iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqvFME7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBSzj8iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqvFME7e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485Rw3U2198948
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VZTVQNI8Fg2HrJNibJiJpT
	ZcKrWapAljoowoTqLwyVk=; b=bBSzj8iMgjXW0EiHkfKXmsopCqKSKKaZIX2OGg
	Rg7nYLlnH+TVsakOd2a+Kgs+Aw7xtertW29xwi2IJbA4jHI14tS6ivxWbcD8u9+A
	PPmT/nuJwH3alcNpo1C6Jaq48i3QMsHRu03llGr5UXSVwM1kju1mFIZPE6TyX0dT
	Szrteqi4rf4SMXsg7a0O1hTMWUAqta+XdSE871ekhIBzi0xuUujhcFXoXlrZ58YB
	RuA8UdovTVe5N1CXzX6y6Yl6jz/aAn3KtB3IQH5V+zr4ljlkRMaMUYFAHaMXltGI
	CD7GBz3mis1kAc8PGJLpxNlbL1Sa9ofE5eCWAEkyngkKf53w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sj3sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:20:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83536dc3be5so1750595b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224821; x=1778829621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=aqvFME7eOFYaHOrFIPEbZUYbjjwB9J6qP+KKlLugfuJfcHKZX2HB29GtZ3LDj9+/K7
         kMbbSHIKVm3Vh89IjhEpacb7hTqKcGXaNjDsExrrXW9IxsP8Ox8/vOCAEFccPyC4gwwP
         VMe0mtx+sCqDsWxF1pQKolCllncQw6UOkbggUvAgceJ11/1382QKrrf6tyz9R6gkMNpq
         WjtqB8zOdDrRj54Lvy/wqHXG2TAOehiVhkVLOXA+uatlAk6zzEn94wXbvVitOCK0HW5r
         XkJqNuwrVi0ryk6qZNsUP2DIa285H0A861E9xoDZXxQZZ04ZiECnL2yx9tNkDOpEu2gW
         WY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224821; x=1778829621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=gDSVPrgwKIDg5npjuRKoX8KU4qL2xO6bdt9Sm7XlBMkBDLD+i7UVoKNl0js5qZi+Uw
         bBKQNHhwfoEeY8vBxAmiHMHMYu1w5R76ESPbmRoQ8P/0SWfDVnoG/54i9q4WZWktC++h
         OBtMb0deXE3HIiDmDqUG2r0uMDtcgsNrSWKLrdTPAQIfrOK1TPy8X2J8JKIQYC+7JkqK
         +OkAikMgRBgJMvRZZLON9IrrJPd0mlAJzwr1TR6Z/QwKI3ZNbDb5aZVIZ0WDqLG+3v9G
         07H5h3OKuTUFAuUPiYntfC0+WhMjyjNM/k0zbS2PyqTviamWeecuffHEdzoNzE/bBAWD
         FnQw==
X-Forwarded-Encrypted: i=1; AFNElJ9a0zsRt5ptb5kGLO08P36DDjDu1nGT1SHN6lY+uKcjRye4kx8+K08NtteEHXFfiW85IsnmMKUi+meFDYbVm6y3@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9Vthvf3B+XnIt8a887vG1saGTcEouCSa6rQ+pocs06N7523P
	VhJGIk/pYh/uyzxfNcq7wG0XxgbUqk10AAo6ZlDRUyOaahRu/44IxnsT3SOlhAft7grr/3itVD4
	u9wzjlPAkfvnq5e7HtBAoSOH1is4TFK3OSI6zcwQOv5gdHEVLtAH2VHx2nQPv2N1gdLOHSDWA
X-Gm-Gg: AeBDietZvPY89Z9J+iZ63bAikMQLsz32eJoOW+4rHeaLvXDoM6vaUW5t+biPHoA//1D
	TmmbWF6vtw7stoMp4PSbws9769tCUgawrGDK4HKeGMj3m/CCBiuQ/YNQ9PIhjaXGfGwU8XKvW9Q
	pxVdK4BkDknhD89rsv7tSScgBkJim92+ZzEd0VQSLLqotQe4NkqzFXmcJepzANohhddyZdqlCMh
	pV+8h1Ayvb+TwcSWpQoo0WhVZeYevGm4WfnOFlUzGgCu1Nja+kOYNhXRQBjc4K/ZnAX7mO6jsuX
	loEScl5EUT9WyrWhDU83iZ/0A8ZYNoYR7vIxVNGgS24L4T5zNzQRVkLZbqYQszQBn1X3GhRf1wi
	7+lXIVFzhpy/CvzTbP41gvAyWUL9jMe/QeVSPa1mEApTz/ZWnwdU=
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326789b3a.43.1778224821035;
        Fri, 08 May 2026 00:20:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326746b3a.43.1778224820457;
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 12:49:46 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOO/WkC/42NQQ6CMBREr0K6tqRUpMrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYnW2sAgTEoYhgdxlrO3McAOONjGTQlai3AtOHd6j0d5gfw2zNoPVcfT
 6NyYuLSgHRzhVpWNJMkZwOG8HlyZxh/QM8b39TcW3/Vs9FVzwqjBWtQcFTqpzIMofL9O3wfs8B
 WvWdf0Ab1Z6EtMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
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
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1285;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
 b=K9WKiTtZFiHq8TsZcfqkDVqbEkZW6uvWJd24SY8hC+qHmgJ/eMcYQYEzqBfOv3ZKZ5L6SPYBT
 xYP8e7pHLmsCiYrOa1yVvhpnWI0ThUEGSsqgDY29T8oYWbGcTuoiy8S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfXzpxtjkkiCW5y
 sN23X+ml4W8sIt0bUL1LgwXNlaUcWe+2Vnmvz31vJB+2ZCSSC25PFQ+pGO4Me+XkB2DSizOkUCw
 wOeRA+OqqEycH4f3AVa6gLJUnvMlgJUaY+SvMk9ji49sesOhl6SmAU9Q4/Z/vFuLFvl0P+RfFwB
 3VHaTZArJj95e8k/33wg8Mie9V3fAblxfB+6VcqC2CDgYJ83i3RW7Cn+rmc3XH2NLJGr354VYqH
 mBtW63LEvtVGNeoNxTYx570Wd0O+kaePN0PAfWlnBlbYLLH3ls34Mcnb7pIQAFErlF5gzpeA1S5
 muJrOdRlSKCHPKbVcOfxf8hLryBHkPcpWEUR2t9F/o/oOidzOp7ybIjTCXs0V83flgXE7xqzvRA
 BFt+o309u6I1ZepHrA+VCIKmEGSv7bwzzx53MBK7ryJbX67YwNCSyC5exdgabet60LVCv9ElEOq
 Xa0l6cnV57dZBdlrt5g==
X-Proofpoint-ORIG-GUID: xaThj7UJpd9QchKIis7dclG1fqIJKnGv
X-Proofpoint-GUID: xaThj7UJpd9QchKIis7dclG1fqIJKnGv
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd8eb6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080071

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 4 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

