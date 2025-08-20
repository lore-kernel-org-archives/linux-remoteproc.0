Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881C1DDC33
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705767; cv=none; b=GKA8CKFx4NA8RfkxbDKxYOL2jzsiKKkW1Cgi3O1NmV/3OBpwvAVDZr+QCzgm70URLY4P017YLqY6/tKo97Fr7VBPoHz2TC/Jixo8Mv3C9qdbZJx5o7X/U5IDBYHHUicX5sMywoZsQPxwMHBILIUGPB6M2GfRtjvyJNUA3VbcCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705767; c=relaxed/simple;
	bh=ceYKT3vSfgejeLJSxkGS10wrJuDMf2QLAgi1+YybTuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAPKVvEsOghZn/Bvp+pVN47gsS4z7oH4gvVXg5PwAeL1xgy4bWqf0+mVa8ukBbrRv7r8UOzSrlP239i78oiuUBmWlnANxGNvtkI/rvlnLNCrxu9Tk2+lZDj0Eb/h7SXSmYsBzBmcGl0Cfl1ChHeo3e+BB7ot6hmcgsh9Jj7mLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXICg8kl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXICg8kl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so74022f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755705764; x=1756310564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjfVhv9eLkbIqBEE7fXFjARPFm2eJB57FpMUozSdD4M=;
        b=AXICg8klDQtptdu2WXQUS6lLMhl+jfNMcldtF2JtnPfZM1OCRCFGgQJRJCh+AnlqGP
         demvMr8uOMpO0nQklbriS+DltyQ0d6iVFIj3TKp072qU1aeKy5C51UwL71nSjALFs7Ts
         noJXVVraYsEnwo++CDDyAr1urdle8Mb1QxQPzBIMqTkNxhdURCrCL9+epjFYVpSx2iHa
         mQKwS9ujO9ujFf8+pE5yuR1I3R8L0/ZdJ0BqP0kKBzfpLCAvrM64nMu34J1V2dJhYTYX
         CKt5DtIpk2PNUru/IrrEsfzu8YQNYPiKZhgsKfMcVOstiwpKhOhJGnliVDLXHaXGHRU5
         AAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705764; x=1756310564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjfVhv9eLkbIqBEE7fXFjARPFm2eJB57FpMUozSdD4M=;
        b=W5KoP2ZHNlVZnHy8lsq+D2K9CuP4sXWVyf8CLWpAJOVbxqa3j857hzVwvrmZJtv2Te
         G/mm3lFi/b4nrHshd940Ef2v/fr0NPa/aNai38xrWq5XXSIBUrlHCSws/9lgxSagYH0u
         PF5pXJPdLjJHTOOmD2rrKwIOdrj7Bp2fy/zqwQtjvmgA4HaRc3Xl8QWnK+DkGikNO0QJ
         eWuYQKRQoAcPhnYrGpd0yAHNT4OphixLABabzGJTux4NoOBRshkpRK/KHzfISG7qXPp7
         oadZxzd6qoVzbfVqCVzFkzkriG9HJ3DYoVEYlCSw05omqX1/jqwX32+Loce5PWasQoSV
         a/lg==
X-Forwarded-Encrypted: i=1; AJvYcCUVyMG3//MXOxyCh50gg21HpVOCfXp/g2HiBfFAYWiRmBQaHG6Su+/aG9etlFsatOep7BDFviIjMfvRBLiel5m7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qGSGSeQijRPlF81bSDIn915PiGRlTvozXtHxkAwtTqLxBWdb
	bJqpppgQej80BR5mllw2owWMzzsNPAbaXz7FcM0ul77abmtkcF5WWnWIE14AxIQChpA=
X-Gm-Gg: ASbGnctGErvKqQfulTUWQ2qXCGwSGpuWgs3DFEQQP46o+R8YWoQzaQqp0VrMw5JRGN2
	PfEs+nRCd4wM7ockB+t+THQAjk1I+S8d3xTBFUWYvI9NsydazRtaSRk/YcT9tRwskED3E7Ksx0x
	tA4DSSf7t6xN1o1E7+0QsxxqMgsiFzGEZQOKjRBOSxC3tAfvZWM2W8YtjFiP4q7i8q1u/ePdN6N
	JDS8rZpeWZgCtIuWTOa9a7OvyDUigscQViOGsWaw3zr6vfSzCdeuEX1x53fvxECaKGNnJUUHrJL
	jW07mZTx3KyCbBmfduAA+TP2K3xS0lfTvM/tjU1J5tCo4m4fxgwE3jLHDXVM/Wokipae7QAwMhR
	eiQ9+rhi2jjsdpFmhGKsiJzvDmndhM3JGlbsn
X-Google-Smtp-Source: AGHT+IFhMcKbAMu0PvVDiGeVBMEhgCK2n9Gg7XUc2NrwrVFxoYM9mheSAsCoD/kyMWNfHdDuo2ptCA==
X-Received: by 2002:a05:6000:4313:b0:3b7:8fcd:d145 with SMTP id ffacd0b85a97d-3c32be67bdbmr2961716f8f.5.1755705763407;
        Wed, 20 Aug 2025 09:02:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43956sm8364628f8f.19.2025.08.20.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:02:43 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 20 Aug 2025 18:02:36 +0200
Subject: [PATCH v2 4/4] remoteproc: qcom_q6v5_pas: Drop redundant
 assignment to ret
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-rproc-qcom-q6v5-fixes-v2-4-910b1a3aff71@linaro.org>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

We don't have a way to detect if the lite firmware is actually running yet,
so we should ignore the return status of qcom_scm_pas_shutdown() for now.
The assignment to "ret" is not used anywhere, so just drop it.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f3ec5b06261e8bafe8a8d2378b60285d0855674a..6faedae8d32ef6c3c2071975f2f1e37a9ffd8abe 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -227,7 +227,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	pas->firmware = fw;
 
 	if (pas->lite_pas_id)
-		ret = qcom_scm_pas_shutdown(pas->lite_pas_id);
+		qcom_scm_pas_shutdown(pas->lite_pas_id);
 	if (pas->lite_dtb_pas_id)
 		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 

-- 
2.50.1

