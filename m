Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CA322DB7
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601706; cv=none; b=PluNZXuERlQNlZ5FK4ZdBIgk300PDlmsBsTT+DPsEn0Jp7iEf352uGSEtHRKI85OE+r2m+blqjNBrAP/VnR71eQvX0KcheiBt8PefEFuraHCFYG9eopXcURLJepJjonTaYrIilwJq1m8EOGRHIlUw75WTbyY0vGpL4zF+CIVwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601706; c=relaxed/simple;
	bh=0w0CuPn0yfyNdJFO/DLj+EuySobfFEPa4DzmsNTze8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZs4HcllQfC+SV350d2EkO6Km1E+AnpsmKEc1xdW4u3I5UYRoLjQCdtQeWLIBZKJcnMgL75tyRMjSNkbMdZBtUIL1vkzh3Dw8j54Agm0WF3Lyq4fc6Q/Zu2yepEsFm83z0ricdiJbvhjSov71vj2w4QRvBm8EcW52Q1uQ9xPV9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwAD6NEX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwAD6NEX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7af30a5so851223266b.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601703; x=1756206503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DSpWN8OMgg5aukYOIuUOKMDZaZ5r7LsWnQ8r2e+ggQ=;
        b=TwAD6NEXB/zNnSmCMK9bQJ06Z6iyVa+JrLamVq3bpnTAhSOzG9W1G1/h5jSsjgVCyf
         564+tRYd3eXK949BEmDnMh4Xo2LZZIhHDz1XYL23isP3L78+K6WmfheDW+sPBybmuxje
         7HGyWGdnbU3unitKFWt3tZesr1kDHOUXM95leuBS9nt0k3Ti0mDUCpY7k823QTfPUz8T
         gzYCfcqsiq4r0rKh83ZQqgbc37BHVI/fv9cq8LYjp/03fJq1mYFbahtaJW8Sq7Vgw4+Y
         rcfNiHGZ5Wpa8DjX0gLpaV7YOgfapt4nbHLx61rQzwmgI2yd9kOE8AihNn0Qv34yApnA
         b96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601703; x=1756206503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DSpWN8OMgg5aukYOIuUOKMDZaZ5r7LsWnQ8r2e+ggQ=;
        b=QD8V8nexSvB+CGuzFTcBWtWwk9ydS/hZLZILFZW6fB5C3wX2CURx0APZanLmBeTHn4
         VJHMt340kN8kcgwlTET7M7VWPGF2mMlte1VmigFA/43G1oDAKvwGgpAWyRUK3eBPzFH0
         UfICqCua6NBgTGo1gecwfX58E3PgMe2BU9uKpFCqaGFUPRfgXH4z6kHA2DeENG4Vkrb5
         b2QFfFvJx2wqFFMPU+H0KDpbbAF4UWNJ8ryaFIGPWjYxEEMTPRUd8S8iXbxd5CxOSx2i
         1BoAyt7LkF00uqf0sEM4qCz/DFReMscAgjsziTEa2O621bm0oyHEVni+35YCpRvcIo4C
         lcJg==
X-Forwarded-Encrypted: i=1; AJvYcCV0RINWZ9x49hJ2zuNlaEPn6J5VM3FwU4W8o1hQfVJHgwU2ZfYoIErbnKYoLoof0Icj0cFuX5Qh3GrqkmGC7sE7@vger.kernel.org
X-Gm-Message-State: AOJu0YwLimSCa4PM0juc3PPBJQuVUXiHF6cKQSGiDx03fJZJ7gol0Ash
	YeMasOUrR2+RfsdJVgCwBo8FIgAqQlZVVaD5Fg3oXLuDs5GQGOrsFvKc1w8xilKqGvE=
X-Gm-Gg: ASbGnctyF5epca3b+YjtPi0tKtKQL9qIB/nJXfDoCyb2ut7ZjgGHe06CG27pKoBXXZu
	pnE6/3Sk6DCJzUjOlk/BYZyq9Ykud9JXWx0c5wAkrGXab5M0zyOkCmMLbm9Pk3caLjC9jNY9AOw
	yEbbjlAhOZKGmJs7h5cIFWbEw3gRB/cu+OcM0gN3NWJVJQDRGvpQjcKq8tsGipiS/5IFoVcRbsZ
	H89mGkCqvtgL7Q8g5b0XcyimNZ2+aaruPQotGCjkgGsl/eoLLUlSBEknbsir60QQCgRDzzwWYQQ
	8j9JR8oEL1Lmr6vqpOCfZdIgIAHuVQSE86su7QpEeg4xzIx0k8eKsxoQgEQhgKOthx29+D3q84g
	BflU5aSbYT2SFLok3FIeQ0uGatBxNcborDHMC5w==
X-Google-Smtp-Source: AGHT+IECl0cPw3fTPlc5egfFSmrwnH5Fyz6ruNQGTUWPpOhUq/wfqgJHAYEv1N8zjeHkzfhsBG16ew==
X-Received: by 2002:a17:906:6a28:b0:ade:4339:9367 with SMTP id a640c23a62f3a-afddccd8545mr198163666b.26.1755601702631;
        Tue, 19 Aug 2025 04:08:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 13:08:03 +0200
Subject: [PATCH 2/3] remoteproc: qcom_q6v5: Avoid handling handover twice
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

A remoteproc could theoretically signal handover twice. This is unexpected
and would break the reference counting for the handover resources (power
domains, clocks, regulators, etc), so add a check to prevent that from
happening.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 769c6d6d6a731672eca9f960b05c68f6d4d77af2..58d5b85e58cdadabdd3e23d39c06a39196c3a194 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -164,6 +164,11 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
+	if (q6v5->handover_issued) {
+		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
+		return IRQ_HANDLED;
+	}
+
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 

-- 
2.50.1

