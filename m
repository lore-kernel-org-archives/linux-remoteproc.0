Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684243;
	b=omomVWpqVknsFgkJZtTHlzwobGzVkGOosSXZGX2JSeDgdHrO145hytUwuH6CgjOaDsuO
	 SwFjSffLpKvsTfwiK1FeGC1/F6W//ru6YwBdtKLPSSi1ISCHxNyeGndzy0sib8t8N8Lq8
	 ckh/8cyh+qj4oQITCQvJuP32mZ3ayQC7W20DzSTJfaFh4WRhL9cxse6bnX9M9zyx7JdaC
	 i1hUIaV0eUtQp8bEsoLNHtStjsgdHGy3wvOG46QdZaRd75dNXlu43B1H/GpimG7ru5hCb
	 dymExyhMYet+ccJ+6jXOlNmAUH9y9U2wGMJiBbKWfwe+ZnAE42JULMqgOkxo1sx3MPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684243;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7jbEGZeidZJayPzVb8cgVCKGwXSKmya8atRr5m/cVTE=;
	b=pN2zQQ8UXgUU3N32N+JN0lOOjyU/EJFGYbDkweTtlLelQde+dPCa3lvdTNxV6UH+Jmus
	 xsBCg0JMTECE5Ng9lZNv4FSVPwG2smp3iVTeyOTMtvUGpOc28D79wDEgbVldbVvNAqMi4
	 quDkJwVW7jBPtGTN9rAk1/P9sVGQgSplqn8EnfeSBPSRrskDbgr9qeBNP5FdsFgeIc9s0
	 ibUFRPWohqbn+ixRN5Nhns/Zebfg3DnFa4ArJ0izPvg7sgqQmmFW+6Qu82Q7XVf5y/24G
	 /p7/cENk/u5dV9+4fFgPst9Tlnp7y6euZNuMLIIX+XLo3FQJdWsTObnvf8wwRCU4Iyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XK0eTG2l;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=UncPx57m;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433C606A332;
	Sat, 14 Nov 2026 19:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5433C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XK0eTG2l;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=UncPx57m
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1794684227; bh=7jbEGZeidZJayPzVb8cgVCK
	GwXSKmya8atRr5m/cVTE=; b=XK0eTG2l8Hk6HWpUNVLWjRE2wN0Qy+4MXLbXDw/NKtZ6zmVEbJ
	u+nMj/m/IVq6S7oe3otzkJR00RoPkMqLXA3E+Q968PPKh60qaJ0CvbA7wZrGugyMALjVVl3sfdR
	tLYAKpmQKj9wxOrosFn7/TKudPajyzgBs56+SwQHAp2hJyuawEQbcvwKizFrQ47LI16/H3Uyllp
	Mp5xF1DhZ0tHOHZxXHNwAlfXpd4YodrxEmkSQDDlXBG1ZtmjWkmal4Q2OFp6LV/KcImgjD4Lbof
	t1Tj7QR5j9uKIZfezWBTAuL6AkgdXEQh1RJYRk7CjuOsFUE0rJ3X5Oc+zUUMQf/zSQg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1794684227; bh=7jbEGZeidZJayPzVb8cgVCK
	GwXSKmya8atRr5m/cVTE=; b=UncPx57m/O77Gt9rDxsl8UClg7Tk4tsqBiclKJkYCfGZDRq6D2
	iZ1RFr89Eju7UBg5qlUF55t596tvNOQO6KAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/2] Support for sdm660 remoteproc power domains
Date: Sat, 14 Nov 2026 22:23:44 +0300
Message-Id: <20261114-qcom-sdm660-rproc-pmdomain-v1-0-980f956e5154@mainlining.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCMBAA0KuUWTuQ1BKoVxEX+Ux1hHycqSKU3
 t2oy7d5GygJk8Jp2EDoxcq1dNjDAPHmy5WQUzeMZnTW2gkfsWbUlJ0zKE1qxJZTzZ4LBnv0NId
 pmZOBHjShhd+//Hz5W5/hTnH9jrDvH9qxXVV+AAAA
X-Change-ID: 20261114-qcom-sdm660-rproc-pmdomain-b13ae9b4f9d0
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794684226; l=744;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=Ig7Kj/PnDw03Go+srFikAloVhbvcN9sGanZPQPOJjvM=;
 b=SZaEmCQE+GBe1HiIYPcuJXVOz18M4+RD6wPFrN5am/MdZiUQOQTGGmm5ZfCeXU2w5WQxlnQZ9
 ExzBfrJ6q+iAhHl/cYWR70bOIGCC1ttuMN8mGU9TG3aFpp2xRMsFKDr
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for powerdomains for sdm660 remoteprocs.
Currently in debugfs the cx power domain marked as unsupported for 
adsp and cdsp although it is assigned to them in the dtsi.
Add support on the driver side.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (2):
      remoteproc: qcom: change resource descriptor for sdm660 adsp
      remoteproc: qcom: Add sdm660 cdsp resource descriptor

 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcom-sdm660-rproc-pmdomain-b13ae9b4f9d0

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>
