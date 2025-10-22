Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFEA340D87
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134642; cv=none; b=Bmzk/CupT5CiWFygH/1NI9QfsNKu9BenMt7rYaG7K/O6egW4rJF5BU/IOTHfeP4NeaX3qMQ4hLYe9SfAs+4Ajm0d2bB50X7zU9/AJ+k88ZZH5jja2coQrzqeyZVB+KlJrpQf6IIhjBAtmFJrKUQ9zdBv/gguJ/Cc2EMnLILo498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134642; c=relaxed/simple;
	bh=M0R/PwVK/S2JynNC9isNcWEnu3MHAOkI+7d2xOVY6jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jegyDo0nkV4A9fVO9edBIX8Pd3Wqvtz9afV1EeIQbsCidMh7kQ1AKx4mi0V6U2Hco9ERQas6gVhavU+LKbBCuCT4RM8p2EGXKrDCfNjH36V/ss7g7y/ZJpEEs4ccoV22uhIMhjBVTfFxPuVm+S9VHfIh746QD9QBZuDYp6+lbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBF4TwfF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBF4TwfF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711825a02bso45148545e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134639; x=1761739439; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=dBF4TwfFy23l9nZJSovKohhu+yBasyGsSjW/F8VmLBFWwzhYMJVdMNISX6tZnfrK4n
         dVdrgt3YMqiD2BWtXbUeoiYpwB3lsPF8RTet7SeXsqoVVyRZp2VOLD6/InP4x3xWjcbL
         9VaFFnW5EfEg0vsuUxo1gVJE8hgpnPQtK8kK2IuGfcxBzAAH+UoeCUUZzCDwZcP78mSJ
         uHIEugLcC8Hv4E9n9hae9N3A17zVcOEiASuXtzSrjc+2iu5R2GdAbcqWzNUbWWGD+rF/
         een+NC1A5LjcdDMCSj1BHzGCLO/roTHbWP6qR4+VaiEq+n1VB/91ezwYuGxo5gyCV27F
         la6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134639; x=1761739439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=S0wMi6nbDAi0UQmM7kctsjwrmMvm+1hs0kFQZOeIgjG9WOOuCoB17Gq5hh0X0rpowf
         FAllmLAbvCxNaD73iweuNfE4EzwfXqY8HtECjh7PBIlEbweSQ0w3P3+FrKo65pMBveC+
         PjVF7JaMrUCL7l68Sfo0suTLe8k8NBG8dG3orKCnmvnfLm2LwFnAV0ZnvUMNTKnT72D5
         gkTzqo/rJdoLv3v4yZVB756GIuDgDOdUZzv7YFVyL2vCmRRfN2KfrKMjKIJrb1NjPjfv
         BJHHJXHOcg+snkUGbSSGuAEAUKVV2+Stfztxmq7bjJobfbwbAQItX1eehYWB9BfHk69z
         UVlg==
X-Forwarded-Encrypted: i=1; AJvYcCVGzRUmOFsGFtQ6t+r2E4RqdGaiut3nIVEzA9e1b2S6vSR4a8Oxz8E0rzkVoMedvUDB9XEptO3rt+N5ZQuIwZn7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAq2kn1yv2rOvFCGpoVG/LBiLLvSiylqZrNfEwFYS5Jue//hFZ
	TFstUxzeRiaQVDQ/wUNsZ6hJSZsmsq0lvcJuPnTlbJAp0QcLD9AR55TXTNzLCcuX9J8=
X-Gm-Gg: ASbGnct7/T9m916rWyVqjdoxFos+APcAUoObd6hXH6OzB/TFRImTGhmJR1DIp49/SIE
	kkQ5rcLH3S3sSpb5e5dXcNYJj8VUdcBRl83l3qIWttbBKBbvxaWWyggSfbz0SQpMNPMFlv/ShNv
	gpP6ZPd4Kk1ygLYQxSe73Qy2DawrNoLjR4sQUZMqYJyd9K3oWarLnLPsfU+jpu0E4iD/VRNMyos
	Zg7q3yyr27u5AWQFxIpATg7s1SZQYK0NUAl3OxLwYaZIJRMG7FN3hk7VINDp3E/CKV23TFIx3XN
	0DvVwN7Vmqf2ZXFc3Bb8m5UQIbDBrEJB9EAafa9ZjFo/QQhOCxDAQdRvgOhTovi+mm+w9K7fSs6
	E87h8BpVu3QN90oWMPCCyH3RBICKmn/xEdMFA5pKFJ6DvqylLsU0x9F2ZMQoiJoJaNI4G2AhvlO
	uC9yMS3Q==
X-Google-Smtp-Source: AGHT+IGK45Cu7R7RqMblJ0H20sOThyXTHE0mGsTieR9rpgEJC68Mu7KEhV/qc0jaopljgaHcbYAevQ==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id ffacd0b85a97d-4283cd7a3a7mr11330553f8f.63.1761134639094;
        Wed, 22 Oct 2025 05:03:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm25019851f8f.26.2025.10.22.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <aPi6eBlFLH43A4C0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kernel implementation of snprintf() cannot return negative error
codes.  Also these particular calls to snprintf() can't return zero
and the code to handle a zero return is sort of questionable.  Just
delete this impossible code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..9b624948a572 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0

