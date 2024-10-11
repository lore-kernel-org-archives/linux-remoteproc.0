Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E236215015
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652172; cv=none; b=LFEmMLxa4ZP1TEWQ5WT+Bzzo/93vA8ZptBi5A+Eg5mq9cNBAx83I58CQcpIg2OUDG/sWkfM6GxsKLPhaWEej6foFppJcJfYr2vNcS5KKCt/DJyGLBLiqthxJ96vDbxzxUonTefIYBh6YMm1efYgSBLaVIrq+qzG6Tp85OBfMooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652172; c=relaxed/simple;
	bh=IINtiCQuBnC3ERtaPnZivs6dhELfJlUmCzKFD6pwHmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E4PRvXu/Domgyz13eUlks1ijm4hxg9aWFkxRsVbLz9hRLBrFdCmq9tAV+LzH2wyCi5lOi8I1DIsKuscczhmclAr496sazqP8M8UhMTbj9lJ/KgEyXveYSdujP17DPNz3+fd+MHIXGAY/HaKnL/QdYNHERd3F79vwHg+Ee+sRNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfb9GMRk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfb9GMRk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-430549e65a4so2842465e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652169; x=1729256969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cAHc9EyPzwdvt95iOMDTdqxhraCklYE74dENH+cprBc=;
        b=pfb9GMRkhv+d6NohvRaCrKfbxj86FRUpwW9zab8vVFR6nXrrsPog2udaOv6hzfJOfn
         rNSAq8/k4XjbFkjCfsUmwaJhndy0Q4C2oHmPlyx6oHLQLrDdqn8vtA4IhYTMqmz3TH+U
         EnkGiyd5S90RzcOdNNGyztHmcT6vYsOEjHCXc5vBv4x4uFU4lqCgeRU0YKmzq1bCPSjO
         JbjD+vNu7QS0JM/5L344kZ8F7QS1IBJBMP7E1oX8QaPN2DTgg/aXFti3agNr2zXDMT7l
         OnINGyEvyiGqyBJTIUJ0EW7LCLqFpFb6OtM6hKXa1XeYWLFOybIeZRUKlMoeSAsqW7n1
         9stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652169; x=1729256969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAHc9EyPzwdvt95iOMDTdqxhraCklYE74dENH+cprBc=;
        b=S/YgK1pnuU6WUTl1HQe2nBKXyrNtV4MxWTHoTicj8zDq/bg95G6BPpdfAgjCcyc/Xf
         h1mPBUkTgga94GonfwpDy25aWETB51RsAJknil3ztRPSVaECnkWrr+TW70QyRgH+BEr3
         bO4CUK+AEZpyYsuk1zUF89Xna88n5cL8MIS9Az+hJy4CDu9WnIf/cLvXpzcyaQ1kmRD6
         CAkPvyCZLo6WgEm/YSVbcNFpikVrdfQGlYYAc80/Ki+L3sELlJ/D7RS1Idm/BjHHjq95
         Dih9DZoVh7pjgJhniMwa1xIYs6uLspGtwcyEDnNWIhUT+OVbiKtJPCDnCnsjp/0S2tpc
         W6XQ==
X-Gm-Message-State: AOJu0YyLyuh4+wNng33T6DuE3PYBFhfCOgt22oSkY+INiJuIZC2tneWG
	VUHMO8f0NhA2dprQ45VFLJuUe54ODh6OEBYqWPx/xTL8xhturkjMj9YUvnCwAXw=
X-Google-Smtp-Source: AGHT+IHrBVdm0gi7TtfCYwMdQW2njGEJht7U4s3CcdvIlNx63lzxcJoHlwyt/9pyv9mhx/3bDgyO4g==
X-Received: by 2002:a05:600c:1c29:b0:42c:bab1:b8cc with SMTP id 5b1f17b1804b1-4311df39d6dmr10731295e9.4.1728652169357;
        Fri, 11 Oct 2024 06:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] remoteproc: few dev_err_probe() and other
 cleanups/improvements
Date: Fri, 11 Oct 2024 15:09:08 +0200
Message-Id: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQjCWcC/x3MQQqDMBBG4avIrDuQpCLGq5QubPKrs9CESZFC8
 O5Nu/wW71UqUEGhqaukOKVIOhrsraOwzccKlthMzrjeGmtZsac3OGsKHHEyVH94gYMfhwgPf4+
 g1mfFIp//+/G8ri//OT+yawAAAA==
X-Change-ID: 20241011-remote-proc-dev-err-probe-c986de9e93de
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IINtiCQuBnC3ERtaPnZivs6dhELfJlUmCzKFD6pwHmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSN7zoHs/RRI9qYt8BiRVsuLmw+KkQ632vSeS
 F48/rV/F7WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjewAKCRDBN2bmhouD
 11t5EACXQUilzbhXu4xt90q4Dv6kMyp1sX5a0ZW1Fo098s1rqTHOuNPmHRDvTDxtdmvmGuhjPmD
 aIFwgRZsNXrIQpLFCEa3XM+KiVIEzlkDoKgprgAMOms9yY7u3oie+5bhlMdA59jPHgGWHaPbnVI
 mRCrs333XbYrSdD7RBFNJvm43huYjkahS3tFuJ/5VzMGNs04emml/BHCvHSa3oFJTIA6QQKOJ54
 4s+Kb6SUPspyqhbKDkvprDwvPV6DfNAVQ76MpwGIn9D7Iqjhl4hnPldgB3mCDvbxwhgqyFESNdE
 wLCsIysn0z0O6Rwi7IgdUiOlKzX0Nh7jZ6wv3OJmH4HSxI0FM30O35KXNGq/u4nyG6uGb3En//H
 Ywdo2bl2Q6uWcgNR7BGv97tEuUm828XQy7Y9SaR/rcxpFqGk1Mf3cMNfG7ID27FfrqQOuMh6IMc
 /sW5TYpZE6H2k3jXlN/QNNpimJlWM5hwKir7lQ7a2LkMVhxDft1PXooi21B3qRA5KnziircmT+D
 TvlBBvkbndlREjn8ZqhDlT+I34jXeDHnTtjhX5BDcDvLv4HOxxZFwmNFHphJV/KjB9B5QChIPBU
 lNGg0mp5dcLMXPdk1mrt8XnNcFFnDcegpfpsggHO4QF05VCgP8jJpzrghmdxxlZe3XOkcLwTD1K
 gYPUpjp36jsJFOA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify drivers in few places around probe function.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      remoteproc: da8xx: Handle deferred probe
      remoteproc: da8xx: Simplify with dev_err_probe()
      remoteproc: ti_k3_r5: Simplify with dev_err_probe()
      remoteproc: ti_k3_r5: Simplify with scoped for each OF child loop
      remoteproc: qcom_q6v5_adsp: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_mss: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_mss: Drop redundant error printks in probe
      remoteproc: qcom_q6v5_pas: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_wcss: Simplify with dev_err_probe()
      remoteproc: qcom_wcnss_iris: Simplify with dev_err_probe()

 drivers/remoteproc/da8xx_remoteproc.c    | 29 +++-------
 drivers/remoteproc/qcom_q6v5_adsp.c      | 17 +++---
 drivers/remoteproc/qcom_q6v5_mss.c       | 48 +++++------------
 drivers/remoteproc/qcom_q6v5_pas.c       | 22 +++-----
 drivers/remoteproc/qcom_q6v5_wcss.c      | 92 +++++++++++---------------------
 drivers/remoteproc/qcom_wcnss_iris.c     |  5 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 74 +++++++++----------------
 7 files changed, 92 insertions(+), 195 deletions(-)
---
base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
change-id: 20241011-remote-proc-dev-err-probe-c986de9e93de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

