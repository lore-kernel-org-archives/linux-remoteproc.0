Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497B1DE3CE
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567750; cv=none; b=rRsqTPQG62oUZCkr3e27P5xJGZTwp2cgtvspqmcw/63hm7d75SKdSZZGuEph2tgDKxRJR5dTP7xvnz1LgxIZPrU7Ta5HTDrV+ui25M/zq+vuB+f65UDFUxF0mMN4UnTtXjuanyZZjEpPKHkx+E4yoyiBQACUwl4lRO3y86FG3Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567750; c=relaxed/simple;
	bh=aDoq2cPAFwpjpI+a6z1ZdwU3wKRRjEG838SxvUMy8+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2i4kvGaXQ151ThN/mCV/PfjSQWFrrYoZ3VLuGNdgKV59qtmEz19QopBX4KMSfgSIfpucFfhmgaIeCO+ykX3+gu7SILlVQngcIxQwJRNC0zLu2HaGTIaLOrbf0YFN+EQWeq4nId/hyTWzu3fLCDQssL/7KcT6t2AwfzB21WO2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RU6riQhk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RU6riQhk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so21706325e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567747; x=1743172547; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWwk1F93k2WjXHD1BSOy5Th8h5+cPNdP8aqDclQzOiA=;
        b=RU6riQhkiokRzHfkg4jhxRcbciVUt+PVs9ODgVp+DEr2pJeqNalpK+T6Vk1Ugwv1zz
         nnA6U2OS8ObNklGDlNC/5KyvfyCAxu+YrVU69L2pbnWgHB52+whVYmmIIEhReD52950Z
         stVaH2zPpqqOFAsZ02zV+xcW1eqNGkg/W2ZmgrtNvnHpKq3f4vQFwGpKfwIKHxN9BMm6
         /b0kRq3j0p7HZcm3AUxl8lXgmlxy7gbH4UEULWjuml8i0kxvFg7E/M7OPfkKyn0zQxtv
         /LngvP1POi5wn7OOq8bgVuQ6ZrsU5jK6AoGH6XX+S0PUO/D4LrlPh5mzG5BkfUaHWsKm
         4glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567747; x=1743172547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWwk1F93k2WjXHD1BSOy5Th8h5+cPNdP8aqDclQzOiA=;
        b=ZotEnCwNs9/QShGKTHbuvMzLTWCtvgxce2CDYDrXa1KDAQofJxS/1qXmfrFXNGwD+w
         KQFDwcjQulmmIEW6NImG6pkuN6JyLL9YY+PD7QisH8SgDFzIo0dLRAbMKUV9QNxzS23m
         aNQtkzQHlaj9I04mrK9Pz62q59lLntVEbC1btfGQ2ovwPs7vunvLhEXLtA07NffzsKPd
         qM4XJuynRp+Kkvl3DvqnHHW4DMFpNtmvfrSZiyegRhmOyqzWQQjZ00Ma0LY6D+GjDCRG
         fR2oXVIScLvS8lnArQRTMph1x6P/RpUGkCRl9+GsDuVi/gcZeeNYBsDX8L7+xKOR93Z3
         zNEg==
X-Forwarded-Encrypted: i=1; AJvYcCVgwKEo80JsMH4sFCp+O3ChLWEa0PleGd2IaT5cMjvQl24vmYoW6Ik6a+nyXPhANWySJUXyWssxW+RNLC7ryese@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0V/tCIwPQn5rOBmeUqFvs9t95KRGZG31JU3wae6JHGec0Eku
	KDDV/cN8oGfXO+pvdb6jYgurLwjC72/5eIFFbi3Ken9db9l47KDbnlgQuQKiy4s=
X-Gm-Gg: ASbGncuHB+1vj16KwIANGLH4w4Uyl2scbJDhw0Gd7Gaaa5VnXbaQRhMbCvGJdoRdC7W
	TnEv9adYZC1ABq+pzS41e90ihHGF9u02/Fw9YFi9OsNZPBX2ml4oubUtxR23y1U/SMY7TorCHkI
	+u/jojfLslPtB0sfHZCQvLh3p+cRSxUmK0AkSQgD0GKRK8YKFA+s75yguXeCL+3FshNOBmtViHN
	TceB1IxvxxfzGXg11R3MONLdH7EEa+jW0enNgLes065mx2LVICDQnIiT18275w2QstgiW036U4h
	z6sjAj3ybdHf2uGAwptyjxYz/FXeFCtlesCjzg/TFP/bx0OTYg==
X-Google-Smtp-Source: AGHT+IG3s7EumH1UWJRshfI79DTisR3g0LyyvxiIy+Ix/0bn7lyq2EKXKwqHEpE8LdI5qX5z0nDHwg==
X-Received: by 2002:a05:600c:4512:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-43d509f4581mr36639005e9.17.1742567747224;
        Fri, 21 Mar 2025 07:35:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d3af0f3b4sm53206595e9.2.2025.03.21.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:46 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: sysmon: Update qcom_add_sysmon_subdev() comment
Message-ID: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The comment says the qcom_add_sysmon_subdev() returns NULL on error but
it actually returns error pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index c24e4a882873..660ac6fc4082 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -619,7 +619,7 @@ static irqreturn_t sysmon_shutdown_interrupt(int irq, void *data)
  * @name:	name of this subdev, to use in SSR
  * @ssctl_instance: instance id of the ssctl QMI service
  *
- * Return: A new qcom_sysmon object, or NULL on failure
+ * Return: A new qcom_sysmon object, or an error pointer on failure
  */
 struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
-- 
2.47.2

