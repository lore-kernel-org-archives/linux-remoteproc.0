Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA43491E1
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724400; cv=none; b=TWOQ93zWha59AHmaQX9IFwvl8i0QTtEWgBPkzrPRaq1zE9Ggm56W2ChFLmqsvzwGcTJGyJQCWqf8vySVN4qrPJsSCY4d2G/GPS64FwI4XgEj8x/ujLzGRVws/NrsutH3cevKEQBZNjcJWLoj7Qh6l3WcfOjss4OxCdSk/nKfJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724400; c=relaxed/simple;
	bh=AxNG1SIV7H7xzS5SJWkcy16sFVfw9C5CQd54+0oHFM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=haNnnL0ResNL3b/PlLKD5HQl5f53IJ7V/KRGTWXyclCp/ehDQ98IK4DFQ1Obn5ynNaEBAF2FPfyboj5qRCnlHlReFhyq0nUjenxtVfJDB0fHFWALY5Y9L4++iG38jsaR3ocRKW8IVnkRIwlaRyEBVq8vi6W6Grysr2QUP3fTpt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZkO6wPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXnJjKG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZkO6wPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXnJjKG0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397Tu9j675581
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=301Gg6hMOuIp6rGsJp6fTc
	iwq2YRnt1osADTG3aUyQg=; b=jZkO6wPTH3zG/n3IfY6ZBHHCOh1ckTVf5J0Wq9
	OwjaFwJQgVu6tpXQ9iEGWVSUnoPp13JtAYy5OKTtLYMgYAEiv7BQZNkjBcwvaAjK
	xn7FVNNdI7WWQfrvX7XH4TUY8308VazCxmdTp4BPBDM+R38IUtJfFUkP9AbOqIr9
	ent+Ci+/3FY0eKgPVzL7Vi98nMUHVSH8AOV80tlmxptaH8PuQ51VXhsI/MSlsiB0
	hxPYk2ooA/9d4YBr2sjYUVyOvhyAYnIyT+i3yPqc5yuLxLxFo1s/STUoya78ZzJ5
	Zz1KDvvYg+Kw+XdHljALuLotzcuwRrTJw3Jq5ACX8HItUhUQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmu72m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:46:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c283a1212so3181341c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724396; x=1776329196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=301Gg6hMOuIp6rGsJp6fTciwq2YRnt1osADTG3aUyQg=;
        b=CXnJjKG0jHWpIkEZRRqloujO1yhynj+jT0fM7nhTbLcLe9GuBPijCbYgMuqaQUcFMU
         dobodtkWTUxSEZx3CfHHSyIvI3pQJI5mZW3EOwgcyJ2FYgy6WSsQlTcbZ+iZoHYYune2
         UPPLWkJW7nFT6OJHJ8mnT9ohAgbzZOBmxykG86I2rHFGAS3nwaYcdhSIO8P2OJfBZqO9
         /x2CLrl6tPDA1cznIknYV7UtaitIZkZRzOSYoOGv1ZK6xfyK27gMNi/QZpJ6RI7PEuiO
         ft2SUKg8sl+p1ca2aWLxGzVd608ujLUUm/tyOrdQIMCLKWoNxFR+HT5v9dx3nOlTqNHx
         a0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724396; x=1776329196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=301Gg6hMOuIp6rGsJp6fTciwq2YRnt1osADTG3aUyQg=;
        b=BEto3gGBmx/Y1GkkXAt5I5GN5sCffhlAzNQCLrm9KEpNzgxnC6PlJLjfEK96Q/4HcI
         O3i5EN+CaJ30dJSI7N5aHWnUw8yCjb29jEWnSUtde+js4D+tWI1fLNr2lIoQL05ntEV7
         ebq8jYtzeJ5WDkIH8ggGeKjEwgoAUkbYmVyThbF0TkEqMffIkY3AlHau9yhmGGNmgCy/
         aue0dCjVVqD524zFaBDaNWrubjZwPG/TABatPZU0zliVFZxe5vw3eSvKlanA54pcGH1v
         rvhN/xnQjxdwfUliUROPDeDdShOSgVfTNd9DOedMku5RUP/xZ2sUvb2swxr7fnjeI2Pn
         U7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Jlym76KZnxFeJHu5F0iLH04PgGbiQXX9BFwxmL25OWS+aF5VZfcwN6MiW3JIn7EyMVNhwxAx6gbVz2wGnypI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw525rNbGfuVGNOX+Fiq5pnvdCFrBJzStiIBkHEijzNiIMA3FpK
	6lD7bztoYG9f/ZSgziJIhyzJAhtifPe1cKHgpXGgnzTeUn4eKvGJcEeNLanMXjMWYmNuiVoLewY
	dIeajXdF/aS6QJpQgqFvdSbTepkNWF2LEs2UlJpoGx8O3gQcF8UnctvMAmHf4MjEsYlBY3JFj
X-Gm-Gg: AeBDieviGwg7A7RTlmnPX01i9CBWUH8fohRrvKvB29PwofwcMnkjAxc24lwTrDFT3YB
	0ILBl6PCpWIm1QJyom3Z1eHBRdhJ4+l35fe7clsHifeaSZMuUYu2f3FJmJdQJQ9L0Z8Zy8r5SUZ
	hCNXx8Bal+Ihww1BnO9evmP1VTp4FOGsT+qI3Zu4YfGB7ULk9f6n4NBey9gDF9T/v2Ba0TGvve5
	qgP3r4HxCk2EAZvn/1m2PSyHE+5hHM4DAezA+RWJN+PcWv4eZGpGMv0ZsTVizDOMCWJ/jwaMfFC
	1A44ZkjrpGnb/Y6PjiUMHudTWLBqOjkDC71U2HY0tHvgEgXCs7HtubI+EgaAX3+VjLODZ3Mrzsf
	tmwOAGUechIN+e6Nt8+DFoLdTyzeKZmaBcGTVrGZsQG11stBXI8+/wfG/5zdTWHR+hK1pyZtS
X-Received: by 2002:a05:7022:ea28:b0:12a:713b:896a with SMTP id a92af1059eb24-12c28bfa04cmr1674734c88.17.1775724396062;
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
X-Received: by 2002:a05:7022:ea28:b0:12a:713b:896a with SMTP id a92af1059eb24-12c28bfa04cmr1674726c88.17.1775724395450;
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: improve robustness for rproc_attach fail
 cases
Date: Thu, 09 Apr 2026 01:46:20 -0700
Message-Id: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxn12kC/x3MQQrCQAxA0auUrA2kUynWq4iLdCY62UxLUkUov
 bvR5Vv8v4OLqThcux1M3uq6tEB/6iBXbk9BLWFIlEY604S22pKRt41zRXV/CSYZ0kRlLNQPEOF
 q8tDPf3q7h2d2wdm45fpbxeYCx/EFcj1lxHsAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=898;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=AxNG1SIV7H7xzS5SJWkcy16sFVfw9C5CQd54+0oHFM8=;
 b=W82ysG/fLw5x67VsUNOLWoVhK9yS4LWwmdrxpu0R5Nu4a2CFpVFLTfBItA6+n6sLqzmXUPGkJ
 ycxe+9PT41jATvo1I6E2Yi9QAByupWGP1Qrr4deV7w+KTahlgRGfsDG
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: quzOVpV_H3RJ8RUyufDYr6l5lHQrOEm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NyBTYWx0ZWRfX/UrOo36zYz5P
 Kw8rK5INC1J2vI9o4EKvOQzEFg+N/saGGpjSv0hDt0wDf70Qxc7krJEiexmkMoxwXGvX8+ZzH8S
 gCNf2sAhCih6/D86Ik5p2nQ6s54c8icnLs8PziYj0Ix6Op6RIR9VJ06Rsi1zXICJRkCTlkX3JXV
 Yl5/XbTzCEMGpUESQWUgjBmRM9bUjO3Z3XrS3M0zdLGl6ngwstZP/hGZ9jHK0/lnNAmmXFnZEw+
 pNojTGbc348YfpOV6Q6GAlabaXU6SAKsk1xfAOfzHoedKVxgckdgbaLVALcATpiI3Atd+p3dhSU
 6WD0Ec83Lg3KKegbGFuMaLCMgBlSFV+tzL18RvsW6RIoP0jlh5i2bEQ4BgmHdZHuqES+Ox6oKd1
 g7Q6z/w+MXJg8iB+CW/b2QPRznD7QPB2H9zPnMhKnRuTZnGxPYl/+UCIHdVO761nERhioA4CNFg
 ZMzmQ1fxEkqp3TUxrTA==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d7676d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tP0EvHTfAmNnroA1R7sA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: quzOVpV_H3RJ8RUyufDYr6l5lHQrOEm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090077

Failure in rproc_attach() path can cause issues like NULL pointer
dereference when doing recovery and rproc_add() fail, improve the
robustness for rproc_attach fail cases.

Previous discussion:
https://lore.kernel.org/all/9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      remoteproc: core: Attach rproc asynchronously in rproc_add() path
      remoteproc: qcom: Check glink->edge in glink_subdev_stop()

 drivers/remoteproc/qcom_common.c     |  3 +++
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
 include/linux/remoteproc.h           |  1 +
 3 files changed, 16 insertions(+), 8 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-rproc-attach-issue-2e3290d6d013

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

