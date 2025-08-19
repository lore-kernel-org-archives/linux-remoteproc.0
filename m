Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BD221F1A
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601705; cv=none; b=DrrGkoFDl1J1ajjzcJb46AYUfv1jp1Q8Y1g6d7kHOWXJC0hJH/8ftRaDfBK8k+V4rI4MV6KJfp1HAgnF3u4EXx5v5S1ZZSF7kONbBhB42z+EAPLOJyIdT+x2QQspRfxFbANsoI3m668JT+AfUR0A0rMi0AnOovQCuFivB7OgaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601705; c=relaxed/simple;
	bh=8kLogn+zROvMNiYZTIrHFCqLRK5ZGsChFJjCJtBpXXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VHqW2flmAw1a4OhRtWxncNOEvZ0XWiy/HuYiU3TH9aJZPRPhKM+lI9ZZv4w0l52FbvkPbSMx8wMuFpgmjoJ08qvu9Id86yLk3xWCTvwncbzO7mtjzucfXjCl00IAnEDxSfabANLAkgz046k3fF1vCQzq+rnuke2aZj14xw6PQ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGUxFZCL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGUxFZCL"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78fb04cso736374166b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601701; x=1756206501; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpYVbUYUqcDwuuSlMJD7l7rhKZ+sIG5CmBcL7Jvhb3w=;
        b=AGUxFZCLvSJcmZ3Ru/CX8HeOwXl96Dl+v+Lfvq0Te5Yz1rQRQ7QKPPmbaHzDnb4c5p
         IxGD9WpP0F3fZUuoud8cpKcexrYOydgsKJVE1rqGEbfJocDMB/4R98S7gKETMaxq2nJB
         f366eiYRTYay+Vz1uP3oV0K8+Q+QZIhqbZRXVGiovdC0bGnmKjjea1ZAccCVTzt8WvRr
         drZgaQR0cMrZRrnXaU1w5nq3SmxLAOMDa9SGc0gpfmID+pt9kBPv1Wwhit7lJeyeTbtp
         ZaVYUWA1ikZC/PYcwov9nMSMWb7dfe670Q+B/2ClRpCwcceKTJdOfKyuob7XRNU7F5+U
         8ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601701; x=1756206501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpYVbUYUqcDwuuSlMJD7l7rhKZ+sIG5CmBcL7Jvhb3w=;
        b=MPpCIjRqAXJVr+Zs/EQ5waHKZaWhN635/NZWQ2g+CzINDJFp8ua21TOocYRH5Uwqe0
         Zbt9kAs8+yAQBFdLQMX7Egm7C2FXkmHwfAFAkiRDBLh7T0K24BIG0c47tjuA4pyXnr+q
         N4BMZqPZTBFoVzl5PURXGs93tolX9Mk1X7dlWOorOgT/E9aTrjrfI+V1131rMW0MnHeQ
         mZDOrK5972pxepsH+s/TOBej9GAIL7rj1uSrQ03tLbIrVCsnXdsTLjhGqD6giA0S66EM
         FDwfWo7WO7OuTlBqpWlIcaHt3FOKBX1iIQtiGRpLjDO3HxWHevW9wCrMnZtZoOk94hU9
         aC1g==
X-Forwarded-Encrypted: i=1; AJvYcCXDbY1ogFq0rtx+A29kQIQsZl7OLA8wQG0xWQdFdpo5yRRBW7DcNPwtk+bvDb8EvwazX+z6hweUPEnMrEneghOP@vger.kernel.org
X-Gm-Message-State: AOJu0YzDqpAv9nkKpLl89L/kAW80lsUKHok+ucGAJgbnWGbqQZutxTsx
	dLic4YDyBm5wWBkdmuKgHKhnfH0+ExVe+y0ksxLqEoR6UPZuH5VgG2NxzC2tHoOJ+Vc=
X-Gm-Gg: ASbGncucJvXHSryn5Kd9l94ZYXlO/hZVnFowQDyiDOnkYHqTit+PI6vYI9WWPRYpCG4
	essvtZPmG3UvEIb/nzIorkgQBSFjjLbAHixAKZIw1RKCLFfolrte7wem1WufRqOF9GHlUjPr23Q
	njoLbpqEWPqfEVrw8VIxOoNyBkWq+PbDdEK2btAxgiFjTkMPOQ8sQrnqp7I1/kPuQUoEDgydgXr
	XCbJ9fhJyUFYZF1IdeFBYdtGpv3nYL4F1/Fs24JTws7Ae8k3v9uPmP4V52ZArAgb5bd7xsK/wYn
	Zh8QCbRtzcibuXbLmSwWWOaGwnGLJd2GAHtZ1ra80eW8dbu1EzUADJ2iT4q+pumqKUxnIugCYVe
	W9x7HaEf9d2EIvqdpHOGRDNEEgdU1cJczICBlH2sWToYDVJuX
X-Google-Smtp-Source: AGHT+IHuAC+MgtHl12YlBZLIPfcn6x8+4lFFpvTHdB+kHzp1vEXmZlY+oQp1EWwCza75NIX5i6Z6gQ==
X-Received: by 2002:a17:907:2d94:b0:af6:2f1d:a73f with SMTP id a640c23a62f3a-afddd243cf6mr200366066b.53.1755601700814;
        Tue, 19 Aug 2025 04:08:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/3] remoteproc: qcom_q6v5: Misc fixes to prepare for
 reusing the "lite" ADSP FW
Date: Tue, 19 Aug 2025 13:08:01 +0200
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABFbpGgC/x3LQQqAIBBA0avErBtQybSuEi3CpppFWiNEEN09a
 fn4/AcyCVOGvnpA6OLMKRbouoKwTXEl5LkYjDJWed2gHJICniHteLaXxYVvyth5b6bZOq06B+U
 9hP5Q1mF83w8c8LnAZwAAAA==
X-Change-ID: 20250814-rproc-qcom-q6v5-fixes-9882ad571097
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

On X1E, the boot firmware already loads a "lite" ADSP firmware that
provides essential functionality such as charging, battery status and USB-C
detection. Only the audio functionality is missing. Since the full ADSP
firmware is device-specific and needs to be manually copied by the user, it
would be useful if we could provide the basic functionality even without
having the full firmware present.

I have a working prototype for this that I will post soon. To keep that
series smaller, this series contains some misc fixes for minor issues
I noticed while working on this feature. The issues are present even
without my additional patches, so the fixes can be picked up independently.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (3):
      remoteproc: qcom_q6v5: Avoid disabling handover IRQ twice
      remoteproc: qcom_q6v5: Avoid handling handover twice
      remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on X1E

 drivers/remoteproc/qcom_q6v5.c     | 8 +++++---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-rproc-qcom-q6v5-fixes-9882ad571097

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

