Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA37325FA0E
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705764; cv=none; b=GYkzeGkz064bTqteVWe9TJmAtrhe55rf/3VuqqGJUwV8ZlZ1J1D82NSVYYjD4yqOou+GwRTAHJYjOo9/tOKxTOif7IT2QWCVi+K82sfUsokO2NEzJjkxl7WQAhEcEUls1/8FPDRip7tOy816uiovsWzu54Ai+R8gazvnJnmRff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705764; c=relaxed/simple;
	bh=GIQsyqAA7KbSio7V6MwXo7AkPyVrGnF06m/u06KzO4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uuS2Mc1J/tYW2RGI8q5DKunv3t9nv3B/YQv6tLy80IidWxu6kvdD/MgTXXCHOLHH2mkKKov5fxJFHcHBY0L5wbXmZWla3G8/6y2z9b1hYwJcs6xNTFjgtjQ2XgmKc8voJNNewIHAv6zqWy3iPihiL55o/P+o8BO5i0juNALuHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihpJ2PAR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihpJ2PAR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso164225e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755705760; x=1756310560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFrQIxLngvx6cPoyl+3HiPXkKAcRKG4at7HfM1T1v04=;
        b=ihpJ2PARCf+Vrvw+DcLCA+cBrSf8ECPo8AX08OXI4x9OdfUWG8VxXDYew3qaO3fZyC
         YgkDK6Jqs7oOihZU/WAbqLyDU8YzQwFp8Pptld3gsW+1V6rzabZzKlnyikhGiI76c9BS
         roz8dfQ7xYW/q5Y+uFmd7JYFs2AEWjNvg3MP29yayW4WHcKc2qM2RctZ353J4QiFXUC1
         /8RGMFr5jlnozPjKIItI9cz7cBzV+26BnM4Z/fQHiZtjxsWkILNAcjLi/T8BeLB0QVr2
         CCGBXCLaGUiGsfZeFG+XlPjdSaIxfj5F2lTcm8ETufJCqSuMZnuP11TgtAfcXUUZQYSM
         3heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705760; x=1756310560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFrQIxLngvx6cPoyl+3HiPXkKAcRKG4at7HfM1T1v04=;
        b=I8OItZxXE5cRwibGp9SIYZH7h5yydgZP5q9N20dJFAy50MVvYplB+2vMiFcRyI07Ic
         qy+CawHNpD40+jUzkQ+++8VzhcWeWUujiM7OPXt0j7TmcEmS4jZdjOfmeYFpHA3GqfC+
         A7hBKQtsdOxyRrymHXnKmDHxzeOVDRfIOHvdvFDUBK+04JHrww7GiI2tmd2ZWvbcW9Ei
         gZuYXlqo9CkfFzU6ZbzS8v1+i/r1/gPV6dTR90HMmMJNpmsck7EyvDBIUoyZkhy1Bc+p
         VEGHi7zoB2ZuAPrvCuLQK9Zq5BSD0Nmjzo9jpUtTi41nxKQpFi+PX06D4NqNej+bgSzE
         XdJw==
X-Forwarded-Encrypted: i=1; AJvYcCWyTVAZq5sRcl8XVGjK+3l9ztzwZxQnriStpSJguP/qnUCPScXwxQ5+iPPxooFU8WIkRKGDYyBiw4/xIGa8SjMU@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgTzfXXQF2rL/4J5rTQ9h+uNoeZdHg5e3knouTXEd6+v+rDKy
	8K5/rv70ZZzU82zoIEzCdptDkd73a0X7DOs28MqFGG4IZEv/erdbUcZb8IKyALdppZQ=
X-Gm-Gg: ASbGncv21awISXgkPD4sU4T6xET5paXiwI/fPMggscH9wAlCSxSOX2mYJWvSlJyvwCJ
	RFILnu0TCeCwoeM+BEPD8I5KVoeuZ/aFNLroChKxr3Mejfm47uPZQBK/ftWTVnAYNX+qzcmQp/Q
	xpUXrR5rqaMUL7fBCqbd6k+Jd8E5ptfCP4ZR0vaKReo7JBJWzEJ3oVfHAIzShK9PlawrF/d1MKS
	YMf/vjGGHMtQUfhbEJjHrJF08oIH/0e1R5N5YIFGD/diltSlPwek8t6b/Q8prYWfz0gn3vFPamj
	XIoRCkC9XSjsoOHMzeOQ5J/BbenGghc/ECI6SU6MFjdfj0GCYpOE94C15zZJOUMwlnPuxAOHHc2
	iL+lyseUklzNOWTvaWojDHvIoGS/wa6KWutiWujpYkAqu+Ps=
X-Google-Smtp-Source: AGHT+IGANc4/e9vgpi4rR0BoyZfY8fpTBcggyerY3hNWLCE2/SXzKZymk+WZAYmHYykbkMkpQOVu4A==
X-Received: by 2002:a05:600c:c8a:b0:458:bbed:a812 with SMTP id 5b1f17b1804b1-45b47a029c0mr31757095e9.17.1755705759825;
        Wed, 20 Aug 2025 09:02:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43956sm8364628f8f.19.2025.08.20.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:02:39 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] remoteproc: qcom_q6v5: Misc fixes to prepare for
 reusing the "lite" ADSP FW
Date: Wed, 20 Aug 2025 18:02:32 +0200
Message-Id: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjxpWgC/3WNwQ6CMBBEf4Xs2TVtFWk5+R+GAykLbKIUtqbRE
 P7dSuLR45vJm1khkjBFqIsVhBJHDlMGcyjAj+00EHKXGYwypbL6jDJL8Lj48MDlkkrs+UURnbW
 m7cpKK1dBdmehvcjqrck8cnwGee83SX/T36L7s5g0KuzIGe1sb06+ut55aiUcgwzQbNv2AVAVl
 8a7AAAA
X-Change-ID: 20250814-rproc-qcom-q6v5-fixes-9882ad571097
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Changes in v2:
- Split up PATCH 3/3 and remove the redundant assignment to "ret" in a
  separate patch (Dmitry)
- Add review tags from Dmitry
- Link to v1: https://lore.kernel.org/r/20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org

---
Stephan Gerhold (4):
      remoteproc: qcom_q6v5: Avoid disabling handover IRQ twice
      remoteproc: qcom_q6v5: Avoid handling handover twice
      remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on X1E
      remoteproc: qcom_q6v5_pas: Drop redundant assignment to ret

 drivers/remoteproc/qcom_q6v5.c     | 8 +++++---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-rproc-qcom-q6v5-fixes-9882ad571097

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

