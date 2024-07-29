Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E3189F25
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282744; cv=none; b=BJQbMxv888ruXiIGz6PmbSVIbyF4asREm6ZDNyuBXp3gSDrwmJaSbVRyDvhedZxxoCe1IHr6J8nru9jVtiqEnHiIEBgEqskQDcS96zMV0aJHfrGYrA2hbgywi64h+4aW9/j9KrQGVlnP7uScuiXC+07D0vQEZaR0t7UG+CpvbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282744; c=relaxed/simple;
	bh=kVkXAl7R2Pvj8xirOh7/6K6Hs00UTZujRWEkyOWu1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StGY+H6o/QT4tm98JWZK5UP8DoBdFSghbMfq4REk3s63hfsjc8VE5BD3e19Q7LFNa/VSE48aOyYyY4bdy0YasNyRT5nHgax03oSZD5w8yAqJFxJatx5tm/rVsIuWkzyoLXSiZyfEz6alwmVBm4PUCdcyrHYkUX9lraH9PI/Km6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stTmEJ5f; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stTmEJ5f"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so6054775e87.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282741; x=1722887541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViqDaruiHXbptx0fiGh8fZJQctF4985Hl86hrFZw7F8=;
        b=stTmEJ5fzNNGxp41qAx7Eg+1CVX2O3wsq4+u2kuOlELNxhizRlSRKhrL4jFqquSY9B
         OwlCD5VW2VE8gGtLtxHPr4wv2iT/dqG14lJKoX9m2s3QbdNA8H0OI4yrKKzS/U9ASF8H
         dk8emSMJVdT15OAoNhoBmE5sLewxTFIQUvL+4zgEqGQ52dNvsWJsSh+L5HsLA2P1+SGf
         V13JTlj2iNjnRu6wEvlheMymIVZWh2TN2ilTWUEQJXBEbx41m16CKAc3+4o1uKaWBrPR
         gSN42fQoD+GJddwvAyVr39Du4jmJ3xjyw+GIRjqaPpNroE6Tv0sDc6UOMIOChl7f1mXN
         Zf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282741; x=1722887541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViqDaruiHXbptx0fiGh8fZJQctF4985Hl86hrFZw7F8=;
        b=VSg+eHmnAmPbeIlJAyo9faGLaDQjyD4CiQ/u5Ym/QHKGqrmhGApHGyT1VRP6znhWVT
         Jk4qw60S+P0cKmetJOgbkv9epeZNzdteA2fVlrqSVgYbxW4/Az9pU1yxDdrBnPYTdhMQ
         tKyXKFc7rPHRWWv90Yrdm7Q5mnrqLx+43AFbR4YOmHu6fl+iyjA9QWtTuAJAao5gViZh
         6TKqd5A4/XTGRiwx5k6WOCY/PCmC6VGoFf9gHYjzPakvWlpjalu23e1uPXGRCAeJROLR
         8nkR8aiV69vwuf+A/MZWeLkDdJFJW9Ca1qnnNYOm2rLbBdef2+lWY+OhB7edQJtz6kij
         dpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwMrpTHji89wEnh82AIO4GBjgLMtOlr/wLWXpu0zFT/uGZnu//66x7P8tzywwSyj/pZSKDy/6F1TbeQNKj4xcFVAmpFNhM/2DyxCcxl/+GOw==
X-Gm-Message-State: AOJu0YwLXtW4rfbk5XXKrn1zR9MJ+RXGlVK+d9/zx7KXlWhLV3OT1f3h
	hnHnatMX3/cKGKAcWU/ebmHtqSRv4toObh3k2S4xEOuNW2eh7Ry7ecNqrzrcAe8=
X-Google-Smtp-Source: AGHT+IFexp3G2I6sO12jbnFOJx1PCXPxzNUWYcCLi2HP8O60fTbn7j08Ddj7eJsW+JD+GP8hUZ+LfQ==
X-Received: by 2002:a05:6512:2c90:b0:52c:8b03:99d6 with SMTP id 2adb3069b0e04-5309b259b94mr6233879e87.6.1722282740717;
        Mon, 29 Jul 2024 12:52:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:16 +0300
Subject: [PATCH v2 3/5] soc: qcom: smd-rpm: add qcom,smd-rpm compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-3-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kVkXAl7R2Pvj8xirOh7/6K6Hs00UTZujRWEkyOWu1QU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/LwMeuRa7T7m3PaZuVgQrlb9LEEscj63nHSc
 1f2nLzUgdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8AAKCRCLPIo+Aiko
 1T5CB/sGGLhSKM634uBrEQH7FxynC8qWlegbofundznghsgVkaO0y6qznIgHHIYV9Unu8SqpKTL
 ga9/+7dxFMTVyZR/uZUmbKpa/TlasxBp/2Ar68yRC2r0LkroxAKWG0hpVow5JPLmQupFpnZzV7Y
 l7x+M/Y/f7ItN4xp46kLOZj44ysyb3XzKXMkF3K12ocJpPQ8/XQnr+fls2hzAOfh+AQ+ohEgZ6Q
 m22wXBp/OtE5YNbfNU6H6DdU1xdC5pC8V3lGC3O1pMaOwUsVMl70s1pgxax31R4iBMj1QCc5p/Q
 Sf2XYrABmnpRfJILqMhadNJkQ+eSeFxsRauooobJ+/VzX+dS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm and qcom,glink-smd-rpm compatibles so that
there is no need to add further compat strings to the list. Existing
strings are intact to keep compatibility with existing DTS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 9d64283d2125..f2b3e02abdf1 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -216,6 +216,12 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 }
 
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
+	{ .compatible = "qcom,glink-smd-rpm" },
+	{ .compatible = "qcom,smd-rpm" },
+	/*
+	 * Don't add any more compatibles to the list, two previous entryes
+	 * should match all defined devices.
+	 */
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-ipq6018" },
 	{ .compatible = "qcom,rpm-ipq9574" },

-- 
2.39.2

