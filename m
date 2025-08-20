Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C9322A0D
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705766; cv=none; b=pQu1CiZ+96a3XG47IdMg8TafFE9uJgol124QiclyKl95AgPDlmw0Ghv6gHl/gJDdObqT6hobBP2hN+0urRVLeVVponHcQ4Knuptj6jJuA1pYqGf7LZrCiDoQnHyCNOpp/OarrX9oXIC/yhWurvRy2ShwfNbnuCd1QomgjmrvptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705766; c=relaxed/simple;
	bh=J9tk26b5d9valUn3AJ23BPP4CY9PZS2upYUI2TK7QI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsvqGQKRjbs0z7QlAvqGWqa6d0dWlA9gGLUfxq1I46v7LnbQKs0TQC6BFMph4ued8m51bdGKMfLMHYDoX6bf7PE7ZhuPVH0Y9yeKx6cQeC/GNKT8JudPbdEMfnABMDH9kMrqgreh6Rgyw5Z/KLUQGnfi/8lb1wnDZSQo3RNX1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk2aej5+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk2aej5+"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e4193083so74235f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755705762; x=1756310562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDa/L/vLfvl5Q/JDuMqiafLyaLhOcwaxXf7Kgn9DrQA=;
        b=Nk2aej5+FL3m6VlEtkGxF9S8CjsFj2ivRw3PpaLk6Xot2jdIcq4WShB55LesLwb9F8
         tiPiBHVoaW3hlTs6YHHr57zJLoDTJpppgxywGXTCtRUXNugHu2hD5ZFn1M5xgY+eN4oB
         HQs4+LHbToBJv5cQDX4y4eqszCBG1SxdQBSanGg5iMHwI7QKZwkMFHnlExayYHLLQr7l
         Ccfse6M+iFy9KCU/03dF2+qUNi8ZVhzgSMxqtQb1dx+UH3RltjCKJRiaHhrSPj5CrJZT
         GTsenxk2BFOkTJebB12DqfUgMBCzqmMjHLt3Pw8Zmi4xGeHuU0WBY4mfNlfYI5993mS5
         FBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705762; x=1756310562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDa/L/vLfvl5Q/JDuMqiafLyaLhOcwaxXf7Kgn9DrQA=;
        b=J1rZDGQJhwZSLfVu+/l0W+XzHfR8fMw9lZaMpyuuZ4XxoUSdhKXZq64HoBtZ0rpdam
         CTCChY9sWdn0E8HWu5DBdyVba7Ga7B9POQCTpc5Wpgox4b2dorX6bOwywdt/q4/+yWXm
         lHatk8aR43Lw2xdTbJQBnWCIxjgFWCx+jDLv/TNY8p6jlNo0K/+DD22G6nJ3iJUk3FTP
         0aBGZdt1uEiEmzY2VApe6Yb7lMKRmIYYH1FFKN1/QWo+9WdJP9eUeXEEdKBbKbH/sTh3
         hdZiJDQUlal0hftgg9WGQ/MmoaPBv+brMSZq1REgGh2JlWs6mTspMJ4iuZihSS05Hn7o
         ShKw==
X-Forwarded-Encrypted: i=1; AJvYcCWca/i3HjH1lwmYztH00HbY7d6uu0e7RcIczJ7C30O6CMzOnMc2Sgtt+Nzowf7Y9W2VQWV7yOOVLJkJ0ZLrwDrR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywimr21Acuu0upovBsO/OZmf4JWuriHzXZj+NiTZmUSR10tFUBZ
	fml/72dpm0JzLdv/0qOQFgkNx/+RLNx0iVvAG2571JZuUqM8czw6VLIhN7EUg2eKHyc=
X-Gm-Gg: ASbGncttCPMjC8SMtJQT+2y9g+yl0ASdnQxdEFPDVctMpN8ndJIaJp66ypTFG24PqFX
	sFLdWW+jx0cRU58ceidQV21uXYuPbZoV0LHbTjBhkwaUowxdpM7lZyQyDee1cQ8EcntUOMP/2P/
	HkaELU9TvprvTSIk1rOzIiIiH4go3EFYPS9zDhm/3kGaLjxsrWC2QGnsWtIi3YPKXIcJZDIeby3
	FdzGkWSYFOglw2Y4FIvdioPHdgkfYQ690x42uUgH3s0drq/hB4sDJ9JneraocsKDSr2OhDzcw+M
	r0hAHahxXPUh5KBwkTR+trxgJexm5yOI5qo+lTGuPB61te5zdqcS0Vj7apBRKIs+Os7A1FrPMhr
	mdRkOh00IstKNPi1r4SHcRMwonvnJCbmOip18
X-Google-Smtp-Source: AGHT+IEGtQPDjtGEux8eJN642OMcw5qEtkm8AZN7DXfDDbrt3JlPYakLqgOYzRpBWVMGssyGGPAxFg==
X-Received: by 2002:a5d:62c8:0:b0:3b9:7bea:149e with SMTP id ffacd0b85a97d-3c32c52bb7dmr1711279f8f.8.1755705761522;
        Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43956sm8364628f8f.19.2025.08.20.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 20 Aug 2025 18:02:34 +0200
Subject: [PATCH v2 2/4] remoteproc: qcom_q6v5: Avoid handling handover
 twice
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-rproc-qcom-q6v5-fixes-v2-2-910b1a3aff71@linaro.org>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

A remoteproc could theoretically signal handover twice. This is unexpected
and would break the reference counting for the handover resources (power
domains, clocks, regulators, etc), so add a check to prevent that from
happening.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

